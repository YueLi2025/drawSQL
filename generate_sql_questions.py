#!/usr/bin/env python3
"""
Generate natural language SQL questions from schema files.
Questions are phrased as non-technical people would ask when exploring data.
Creates 24 questions per schema: 8 easy, 8 medium, 8 hard.

When a question involves a specific value, the placeholder uses the column's
type from all_databases_schema.csv:
  id=num, name=string, created_at=date, active=boolean, data=binary
"""

import csv
import re
from pathlib import Path
from collections import defaultdict


def load_column_types(schema_csv: Path) -> dict:
    """Load {database_name: {(table, col): column_class}} from all_databases_schema.csv."""
    db_col_types = defaultdict(dict)
    if not schema_csv.exists():
        return {}
    with open(schema_csv, encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            db = row["database_name"]
            tbl = row["table_name"]
            col = row["column_name"]
            cclass = row.get("column_class", "string")
            db_col_types[db][(tbl, col)] = cclass
            db_col_types[db][(None, col)] = cclass
    return dict(db_col_types)


def col_type(col_types: dict, table: str, col: str) -> str:
    """Return placeholder type for a column: num, string, date, boolean, binary."""
    t = col_types.get((table, col)) or col_types.get((None, col))
    if t:
        return t
    cl = col.lower()
    if cl == "id" or cl.endswith("_id") or cl in ("count", "amount", "price", "total", "quantity", "salary", "rating", "value", "order", "status", "enabled", "active", "visible"):
        return "num"
    if any(x in cl for x in ["date", "created", "updated", "at", "time"]):
        return "date"
    if cl in ("is_active", "is_admin", "is_deleted", "is_verified"):
        return "boolean"
    return "string"


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


def _get_date_col(cols):
    for c in cols:
        if c in ("created_at", "occurred_at", "scheduled_at", "start_date", "updated_at", "created"):
            return c
    for c in cols:
        if "date" in c.lower() or "at" in c.lower():
            return c
    return None


def _get_status_col(cols):
    for c in cols:
        if c in ("status", "active", "enabled", "visible"):
            return c
    return None


def _get_numeric_col(cols):
    for c in cols:
        if c in ("price", "amount", "total", "rating", "value", "salary", "quantity"):
            return c
    return None


def _get_group_col(cols):
    for c in cols:
        if "group" in c.lower() or "type" in c.lower() or "category" in c.lower():
            return c
    return None


def _get_name_col(cols):
    for c in cols:
        if any(x in c.lower() for x in ["email", "name", "title", "username"]):
            return c
    return None


def natural_easy_questions(table, cols, entity, col_types):
    """Generate easy questions for a table."""
    qs = []
    singular = singularize(entity)
    date_col = _get_date_col(cols)
    status_col = _get_status_col(cols)
    name_col = _get_name_col(cols)
    numeric_col = _get_numeric_col(cols)

    qs.append(f"How many {entity} do we have in total?")
    qs.append(f"Show me all of our {entity}.")
    qs.append(f"Can you look up the {singular} with id=num?")

    if name_col:
        ct = col_type(col_types, table, name_col)
        qs.append(f"Find the {singular} where {name_col}={ct}.")

    if status_col:
        ct = col_type(col_types, table, status_col)
        qs.append(f"Which {entity} have {status_col}={ct}?")

    if date_col:
        qs.append(f"How many {entity} were created since {date_col}=date?")

    if numeric_col:
        ct = col_type(col_types, table, numeric_col)
        qs.append(f"What {entity} have {numeric_col} between num and num?")

    for c in cols:
        if c not in ("id", "created_at", "updated_at") and len(c) > 2:
            qs.append(f"What are the most recent {entity} ordered by {c}?")
            break

    return qs


def natural_medium_questions(table, cols, entity, has_fk, col_types):
    """Generate medium questions."""
    qs = []
    singular = singularize(entity)
    date_col = _get_date_col(cols)
    numeric_col = _get_numeric_col(cols)
    group_col = _get_group_col(cols)
    name_col = _get_name_col(cols)

    if has_fk:
        qs.append(f"Show me each {singular} along with its related details from other tables.")

    if numeric_col:
        qs.append(f"What's our total and average {numeric_col} across all {entity}?")
        qs.append(f"Which {singular} has the highest {numeric_col}?")

    if date_col:
        qs.append(f"How many {entity} were added since {date_col}=date?")

    if group_col:
        qs.append(f"Break down the {entity} by {group_col} — how many in each?")
    else:
        for c in cols:
            if c not in ("id", "created_at", "updated_at"):
                qs.append(f"Break down the {entity} by {c} — how many in each?")
                break

    qs.append(f"Are there any {entity} that don't have a match in related tables?")
    qs.append(f"For each group, what are the top 3 {entity}?")

    if date_col:
        qs.append(f"How did the number of {entity} change month over month?")

    qs.append(f"Which {entity} have duplicate or repeated values?")

    return qs


def natural_hard_questions(table, cols, entity, has_fk, col_types, all_tables):
    """Generate hard questions."""
    qs = []
    singular = singularize(entity)
    numeric_col = _get_numeric_col(cols)
    group_col = _get_group_col(cols)
    date_col = _get_date_col(cols)

    qs.append(f"Pull together a report on {entity} joining all related tables.")

    if group_col and numeric_col:
        qs.append(f"Which {singular} has the best {numeric_col} in each {group_col}?")
    else:
        qs.append(f"Who or what is the best in each group of {entity}?")

    if numeric_col:
        qs.append(f"Which {entity} have {numeric_col} above average compared to others in their group?")
    else:
        qs.append(f"Which {entity} are above average compared to others in their group?")

    qs.append(f"Do a multi-step analysis: group {entity}, filter, then rank the results.")

    if date_col:
        qs.append(f"Show the running total of {entity} over time based on {date_col}.")

    qs.append(f"Find {entity} that exist in one table but not in a related table.")

    if len(all_tables) >= 3:
        other_tables = [t for t in all_tables if t != table][:2]
        qs.append(f"Combine data from {table}, {other_tables[0]}, and {other_tables[1] if len(other_tables) > 1 else other_tables[0]} in a single report.")

    if numeric_col and group_col:
        qs.append(f"Rank all {entity} by {numeric_col} within each {group_col} and show percentiles.")
    else:
        qs.append(f"Rank all {entity} within their groups and show the top performers.")

    return qs


def schema_specific_questions(schema_name, tables, col_types):
    """Return domain-specific natural questions (question, difficulty)."""
    name = schema_name.lower()
    qs = []

    if "cachet" in name or "staytus" in name or "servermonitor" in name:
        if "incident" in str(tables).lower():
            qs.append(("How many incidents did we have since occurred_at=date?", "easy"))
            qs.append(("What's the latest update on each incident?", "medium"))
        if "component" in str(tables).lower():
            qs.append(("Which components have status=num indicating they are down?", "easy"))
            qs.append(("How many components do we have in each group?", "medium"))
        if "subscriber" in str(tables).lower():
            qs.append(("How many people are subscribed to get status updates?", "easy"))
        if "schedule" in str(tables).lower():
            qs.append(("What maintenance is scheduled between scheduled_at=date and scheduled_at=date?", "easy"))

    if "airbnb" in name or "room" in str(tables).lower():
        if "room" in str(tables).lower():
            qs.append(("What rooms have price between num and num?", "easy"))
        if "reservation" in str(tables).lower():
            qs.append(("How much total revenue from reservations since created_at=date?", "medium"))
        if "review" in str(tables).lower():
            qs.append(("Which rooms have the best average rating?", "medium"))

    if "stripe" in name or "cashier" in name or "pay" in name or "paddle" in name:
        if "payment" in str(tables).lower() or "subscription" in str(tables).lower():
            qs.append(("How much revenue since created_at=date?", "medium"))
            qs.append(("Which customers have status=string for their subscription?", "easy"))

    if "ticket" in name or "handesk" in name or "freescout" in name:
        qs.append(("How many tickets have status=num indicating open?", "easy"))
        qs.append(("Which tickets were created since created_at=date?", "easy"))
        qs.append(("What's the average resolution time for tickets?", "medium"))

    if "user" in str(tables).lower():
        qs.append(("How many users signed up since created_at=date?", "easy"))
        qs.append(("Who are the most active users based on activity count?", "medium"))

    if "team" in str(tables).lower() or "invitation" in str(tables).lower():
        qs.append(("How many members are on each team?", "easy"))

    return qs


def generate_natural_questions(schema, schema_name, col_types):
    """Generate 24 natural-language questions: 8 easy, 8 medium, 8 hard."""
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

    def add(diff, q):
        if q not in seen:
            seen.add(q)
            questions.append({"question": q, "difficulty": diff})

    def count_diff(d):
        return len([x for x in questions if x["difficulty"] == d])

    for q, diff in schema_specific_questions(schema_name, tables, col_types):
        if count_diff(diff) < 8:
            add(diff, q)

    # --- EASY (8) ---
    for table in main_tables:
        if count_diff("easy") >= 8:
            break
        cols = tables.get(table, [])
        entity = human_entity(table)
        if not cols:
            continue
        for q in natural_easy_questions(table, cols, entity, col_types):
            if count_diff("easy") >= 8:
                break
            add("easy", q)

    idx = 0
    while count_diff("easy") < 8 and main_tables:
        t = main_tables[idx % len(main_tables)]
        cols = tables.get(t, [])
        entity = human_entity(t)
        add("easy", f"Show me the first few {entity} from the {t} table.")
        idx += 1
        if idx > 20:
            break

    # --- MEDIUM (8) ---
    for table in main_tables:
        if count_diff("medium") >= 8:
            break
        cols = tables.get(table, [])
        entity = human_entity(table)
        has_fk = any(fk["to_table"] == table for fk in fks)
        for q in natural_medium_questions(table, cols, entity, has_fk, col_types):
            if count_diff("medium") >= 8:
                break
            add("medium", q)

    medium_fallback = [
        "Are there any records that exist in one table but not in a related one?",
        "How did the numbers change compared to the previous period?",
        "What are the top entries in each category?",
    ]
    for q in medium_fallback:
        if count_diff("medium") >= 8:
            break
        add("medium", q)

    # --- HARD (8) ---
    for table in main_tables:
        if count_diff("hard") >= 8:
            break
        cols = tables.get(table, [])
        entity = human_entity(table)
        has_fk = any(fk["to_table"] == table for fk in fks)
        for q in natural_hard_questions(table, cols, entity, has_fk, col_types, main_tables):
            if count_diff("hard") >= 8:
                break
            add("hard", q)

    hard_fallback = [
        "Build a comprehensive report pulling data from multiple tables.",
        "Do a multi-step analysis: group, filter, then rank the results.",
        "Find which records are above average within their group.",
        "Calculate cumulative totals or running averages over time.",
    ]
    for q in hard_fallback:
        if count_diff("hard") >= 8:
            break
        add("hard", q)

    easy = [q for q in questions if q["difficulty"] == "easy"][:8]
    medium = [q for q in questions if q["difficulty"] == "medium"][:8]
    hard = [q for q in questions if q["difficulty"] == "hard"][:8]

    return easy + medium + hard


def main():
    base_dir = Path(__file__).parent
    sql_dir = Path("/Users/liyue/Desktop/drawSQL_sql")
    output_dir = base_dir / "generated_questions"
    output_dir.mkdir(exist_ok=True)

    schema_csv = base_dir / "all_databases_schema.csv"
    all_col_types = load_column_types(schema_csv)

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
            db_col_types = all_col_types.get(schema_name, {})
            questions = generate_natural_questions(schema, schema_name, db_col_types)

            output_file = output_dir / f"{schema_name}_questions.txt"
            with open(output_file, "w", encoding="utf-8") as f:
                f.write(f"# Natural Language SQL Questions: {schema_name}\n")
                f.write(f"# 24 questions (8 easy, 8 medium, 8 hard)\n")
                f.write("=" * 60 + "\n\n")

                for i, q in enumerate(questions, 1):
                    f.write(f"{i}. [{q['difficulty'].upper()}] {q['question']}\n")

            easy_c = len([q for q in questions if q["difficulty"] == "easy"])
            med_c = len([q for q in questions if q["difficulty"] == "medium"])
            hard_c = len([q for q in questions if q["difficulty"] == "hard"])
            print(f"  OK: {output_file.name} ({easy_c}E/{med_c}M/{hard_c}H)")

        except Exception as e:
            print(f"  Error {sql_file.name}: {e}")

    print(f"\nDone! Output in {output_dir}")


if __name__ == "__main__":
    main()
