#!/usr/bin/env python3
"""
Generate natural language SQL questions from schema files.
Questions are phrased as non-technical people would ask when exploring data.
Creates 20 questions per schema: 8 easy, 8 medium, 4 hard.
"""

import re
from pathlib import Path


def parse_sql_schema(content: str) -> dict:
    """Parse SQL file and extract tables, columns, and relationships."""
    schema = {"tables": {}, "foreign_keys": [], "table_names": []}

    create_pattern = re.compile(
        r'CREATE\s+TABLE\s+(?:`|")?(\w+)(?:`|")?\s*\((.*?)\)\s*;',
        re.DOTALL | re.IGNORECASE
    )
    col_pattern = re.compile(
        r'(?:`|")?(\w+)(?:`|")?\s+(?:INT|BIGINT|TINYINT|VARCHAR|TEXT|CHAR|BOOLEAN|DECIMAL|FLOAT|REAL|TIMESTAMP|DATETIME|DATE|UUID|SMALLINT|LONGTEXT|MEDIUMTEXT|JSON|NUMERIC)',
        re.IGNORECASE
    )
    skip_cols = {'PRIMARY', 'KEY', 'FOREIGN', 'CONSTRAINT', 'UNIQUE', 'INDEX', 'CHECK'}
    fk_pattern = re.compile(
        r'FOREIGN\s+KEY\s*\([`"]?(\w+)[`"]?\)\s+REFERENCES\s+[`"]?(\w+)[`"]?\s*\([`"]?(\w+)[`"]?\)',
        re.IGNORECASE
    )

    for match in create_pattern.finditer(content):
        table_name = match.group(1)
        table_body = match.group(2)
        columns = []
        for col_match in col_pattern.finditer(table_body):
            col_name = col_match.group(1)
            if col_name.upper() not in skip_cols:
                columns.append(col_name)
        if table_name not in schema["tables"]:
            schema["tables"][table_name] = columns
            schema["table_names"].append(table_name)

    for fk_match in fk_pattern.finditer(content):
        schema["foreign_keys"].append({
            "from_col": fk_match.group(1),
            "to_table": fk_match.group(2),
            "to_col": fk_match.group(3),
        })

    return schema


def human_entity(table: str) -> str:
    """Map table name to human-friendly entity for natural questions."""
    t = table.lower()
    mapping = {
        "users": "users", "user": "users", "customuser": "users",
        "components": "components", "component_groups": "component groups",
        "incidents": "incidents", "incident_updates": "incident updates",
        "incident_templates": "incident templates", "incident_components": "incident-affected components",
        "subscribers": "subscribers", "subscriptions": "subscriptions",
        "schedules": "scheduled maintenance", "schedule_components": "scheduled maintenance items",
        "metrics": "metrics", "metric_points": "metric data points",
        "actions": "activity log entries", "invites": "invitations",
        "rooms": "rooms", "reservations": "reservations", "bookings": "bookings",
        "reviews": "reviews", "ratings": "ratings",
        "orders": "orders", "products": "products", "items": "items",
        "payments": "payments", "transactions": "transactions",
        "customers": "customers", "subscription": "subscriptions",
        "posts": "posts", "articles": "articles", "comments": "comments",
        "tickets": "tickets", "issues": "issues",
        "tags": "tags", "categories": "categories",
        "teams": "teams", "members": "team members", "membership": "memberships",
        "employees": "employees", "departments": "departments",
        "settings": "settings", "meta": "metadata",
    }
    for key, val in mapping.items():
        if key in t or t in key:
            return val
    return table.replace("_", " ")


def singularize(entity: str) -> str:
    """Simple singular form for natural language."""
    if not entity.endswith("s"):
        return entity
    if entity.endswith("ies"):
        return entity[:-3] + "y"
    if entity.endswith("ses") or entity.endswith("xes"):
        return entity[:-2]
    return entity[:-1]


def natural_easy_questions(table: str, cols: list, entity: str) -> list[str]:
    """Generate natural easy questions for a table."""
    qs = []
    singular = singularize(entity)

    qs.append(f"How many {entity} do we have?")
    qs.append(f"Show me all of our {entity}.")
    qs.append(f"Can you look up a specific {singular}?")
    for col in cols:
        if any(x in col.lower() for x in ["email", "name", "title"]):
            qs.append(f"Find the {singular} with a certain name or email.")
            break
    for col in cols:
        if any(x in col.lower() for x in ["status", "active", "enabled", "visible"]):
            qs.append(f"Which {entity} are currently active or turned on?")
            break
    for col in cols:
        if "date" in col.lower() or col in ("created_at", "updated_at", "occurred_at"):
            qs.append(f"What {entity} were added or changed recently?")
            break
    for col in cols:
        if col in ("price", "amount", "total"):
            qs.append(f"What {entity} fall within a certain price range?")
            break
    for col in cols:
        if col not in ("id", "created_at", "updated_at") and len(col) > 3:
            qs.append(f"What are the different {col.replace('_', ' ')} values we have?")
            break
    return qs


def natural_medium_questions(table: str, cols: list, entity: str, has_fk: bool) -> list[str]:
    """Generate natural medium questions."""
    qs = []
    singular = singularize(entity)

    if has_fk:
        qs.append(f"Show me each {singular} along with its related details.")
    for col in cols:
        if col in ("price", "amount", "salary", "total", "value", "quantity"):
            qs.append(f"What's our total or average {col} across all {entity}?")
            break
    for col in cols:
        if "date" in col.lower() or col in ("created_at", "occurred_at", "start_date"):
            qs.append(f"How many {entity} did we have last month?")
            break
    qs.append(f"Break it down by type or category—how many {entity} in each?")
    for col in cols:
        if col in ("price", "amount", "rating", "value"):
            qs.append(f"Which {singular} has the highest or lowest {col}?")
            break
    qs.append(f"Are there any {entity} that don't have a match somewhere else?")
    qs.append(f"For each group, what's in the top 3?")
    return qs


def schema_specific_questions(schema_name: str, tables: dict) -> list[tuple[str, str]]:
    """Return domain-specific natural questions (question, difficulty)."""
    name = schema_name.lower()
    qs = []

    # Status page / Cachet / Staytus
    if "cachet" in name or "staytus" in name or "servermonitor" in name:
        if "incident" in str(tables).lower():
            qs.append(("How many incidents did we have this month?", "easy"))
            qs.append(("What's the latest update on each incident?", "medium"))
        if "component" in str(tables).lower():
            qs.append(("Which components are currently down or having issues?", "easy"))
            qs.append(("How many components do we have in each group?", "medium"))
        if "subscriber" in str(tables).lower():
            qs.append(("How many people are subscribed to get status updates?", "easy"))
        if "schedule" in str(tables).lower():
            qs.append(("What maintenance is scheduled for the next week?", "easy"))

    # Airbnb / Rooms / Reservations
    if "airbnb" in name or "room" in str(tables).lower():
        if "room" in str(tables).lower():
            qs.append(("What rooms are available in a certain price range?", "easy"))
            qs.append(("Which rooms have the most bedrooms or bathrooms?", "easy"))
        if "reservation" in str(tables).lower():
            qs.append(("What reservations do we have coming up?", "easy"))
            qs.append(("How much revenue did we make from reservations last month?", "medium"))
        if "review" in str(tables).lower():
            qs.append(("What do guests think of our rooms? What are the ratings?", "easy"))
            qs.append(("Which rooms have the best reviews?", "medium"))

    # E-commerce / Stripe / Payments
    if "stripe" in name or "cashier" in name or "pay" in name or "paddle" in name:
        if "payment" in str(tables).lower() or "subscription" in str(tables).lower():
            qs.append(("How much money did we make this month?", "medium"))
            qs.append(("Which customers have an active subscription?", "easy"))
        if "order" in str(tables).lower():
            qs.append(("What are our best-selling products?", "medium"))

    # Support / Tickets
    if "ticket" in name or "handesk" in name or "freescout" in name:
        qs.append(("How many tickets are still open?", "easy"))
        qs.append(("Which tickets were created this week?", "easy"))
        qs.append(("How long does it take us to resolve tickets on average?", "medium"))

    # Users / Auth
    if "user" in str(tables).lower():
        qs.append(("How many people signed up last month?", "easy"))
        qs.append(("Who are our most active users?", "medium"))

    # Teams / Collaboration
    if "team" in str(tables).lower() or "invitation" in str(tables).lower():
        qs.append(("How many people are on each team?", "easy"))
        qs.append(("Which invitations haven't been accepted yet?", "easy"))

    return qs


def generate_natural_questions(schema: dict, schema_name: str) -> list[dict]:
    """Generate 20 natural-language questions: 8 easy, 8 medium, 4 hard."""
    tables = schema["tables"]
    table_names = schema["table_names"]
    fks = schema["foreign_keys"]

    skip = {"migrations", "failed_jobs", "jobs", "cache", "sessions", "django_migrations",
            "django_session", "django_content_type", "django_admin_log", "django_site"}
    main_tables = [t for t in table_names if not any(s in t.lower() for s in skip)]
    if not main_tables:
        main_tables = table_names[:8]

    questions = []
    seen = set()

    def add(diff: str, q: str):
        if q not in seen:
            seen.add(q)
            questions.append({"question": q, "difficulty": diff})

    # --- Schema-specific natural questions (prioritized) ---
    for q, diff in schema_specific_questions(schema_name, tables):
        if diff == "easy" and len([x for x in questions if x["difficulty"] == "easy"]) < 8:
            add("easy", q)
        elif diff == "medium" and len([x for x in questions if x["difficulty"] == "medium"]) < 8:
            add("medium", q)

    # --- EASY (8): Questions non-technical people ask ---
    for table in main_tables:
        if len([q for q in questions if q["difficulty"] == "easy"]) >= 8:
            break
        cols = tables.get(table, [])
        entity = human_entity(table)
        if not cols:
            continue
        for q in natural_easy_questions(table, cols, entity):
            if len([x for x in questions if x["difficulty"] == "easy"]) >= 8:
                break
            add("easy", q)

    while len([q for q in questions if q["difficulty"] == "easy"]) < 8:
        t = main_tables[len(questions) % len(main_tables)]
        add("easy", f"Give me a list of all {human_entity(t)}.")

    # --- MEDIUM (8): Cross-table, totals, breakdowns ---
    for table in main_tables:
        if len([q for q in questions if q["difficulty"] == "medium"]) >= 8:
            break
        cols = tables.get(table, [])
        entity = human_entity(table)
        has_fk = any(fk["to_table"] == table for fk in fks)
        for q in natural_medium_questions(table, cols, entity, has_fk):
            if len([x for x in questions if x["difficulty"] == "medium"]) >= 8:
                break
            add("medium", q)

    medium_fallback = [
        "Are there any that exist in one list but not the other?",
        "How did the numbers change compared to last month?",
        "What are the top few in each category?",
    ]
    for q in medium_fallback:
        if len([x for x in questions if x["difficulty"] == "medium"]) >= 8:
            break
        add("medium", q)

    # --- HARD (4): Complex reports and analysis ---
    hard_natural = [
        "I need a report that pulls together info from several different places.",
        "Can you do a multi-step analysis: group things, filter, then rank the results?",
        "Who or what is the best in each group?",
        "Which ones are above average compared to others in their group?",
    ]
    for q in hard_natural:
        add("hard", q)

    easy = [q for q in questions if q["difficulty"] == "easy"][:8]
    medium = [q for q in questions if q["difficulty"] == "medium"][:8]
    hard = [q for q in questions if q["difficulty"] == "hard"][:4]

    return easy + medium + hard


def main():
    sql_dir = Path(__file__).parent
    output_dir = sql_dir / "generated_questions"
    output_dir.mkdir(exist_ok=True)

    sql_files = sorted(sql_dir.glob("*.sql"))
    print(f"Processing {len(sql_files)} SQL files...")

    for sql_file in sql_files:
        try:
            content = sql_file.read_text(encoding="utf-8", errors="ignore")
            schema = parse_sql_schema(content)

            if not schema["tables"]:
                print(f"  Skipped {sql_file.name}: No tables found")
                continue

            schema_name = sql_file.stem
            questions = generate_natural_questions(schema, schema_name)

            output_file = output_dir / f"{schema_name}_questions.txt"
            with open(output_file, "w", encoding="utf-8") as f:
                f.write(f"# Natural Language SQL Questions: {schema_name}\n")
                f.write(f"# Questions a non-technical person might ask about this data\n")
                f.write("=" * 60 + "\n\n")

                for i, q in enumerate(questions, 1):
                    f.write(f"{i}. [{q['difficulty'].upper()}] {q['question']}\n")

            print(f"  OK: {output_file.name}")

        except Exception as e:
            print(f"  Error {sql_file.name}: {e}")

    print(f"\nDone! Output in {output_dir}")


if __name__ == "__main__":
    main()
