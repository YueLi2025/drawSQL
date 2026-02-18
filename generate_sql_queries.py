#!/usr/bin/env python3
"""
Generate SQLite queries for each natural language question.
Uses the schema from each database to produce valid SQLite SQL.
"""

import re
from pathlib import Path
from typing import Optional

# Import schema parser from generate_sql_questions
from generate_sql_questions import parse_sql_schema, human_entity


def entity_to_tables(question: str, schema: dict) -> list[str]:
    """Map question text to relevant table names from schema."""
    q = question.lower()
    tables = schema["tables"]
    table_names = list(tables.keys())

    # Entity keywords -> table name patterns
    entity_map = [
        ("incidents", ["incidents"]),
        ("incident update", ["incident_updates"]),
        ("components", ["components"]),
        ("component group", ["component_groups"]),
        ("subscribers", ["subscribers"]),
        ("subscriptions", ["subscriptions"]),
        ("scheduled maintenance", ["schedules", "schedule_components"]),
        ("maintenance", ["schedules"]),
        ("activity log", ["actions"]),
        ("users", ["users", "customuser"]),
        ("people signed up", ["users"]),
        ("rooms", ["rooms"]),
        ("reservations", ["reservations"]),
        ("reviews", ["reviews"]),
        ("ratings", ["reviews"]),
        ("revenue", ["reservations", "payments", "orders"]),
        ("invitations", ["invites", "teams_invitation"]),
        ("tickets", ["tickets"]),
        ("each group", ["component_groups", "components", "categories"]),
        ("top 3", ["components", "rooms", "products"]),
    ]

    for entity, table_candidates in entity_map:
        if entity in q:
            return [t for t in table_candidates if t in tables]
    return table_names[:3]  # fallback


def get_date_column(table: str, cols: list) -> Optional[str]:
    """Get best date column for time-based queries."""
    for c in cols:
        if c in ("created_at", "occurred_at", "scheduled_at", "start_date", "updated_at", "created"):
            return c
    for c in cols:
        if "date" in c.lower() or "at" in c.lower():
            return c
    return None


def get_status_column(table: str, cols: list) -> Optional[str]:
    """Get status/active column."""
    for c in cols:
        if c in ("status", "active", "enabled", "visible"):
            return c
    return None


def get_numeric_column(table: str, cols: list) -> Optional[str]:
    """Get price/amount/rating column."""
    for c in cols:
        if c in ("price", "amount", "total", "rating", "value", "salary", "quantity"):
            return c
    return None


def get_group_column(table: str, cols: list) -> Optional[str]:
    """Get group/category column."""
    for c in cols:
        if "group" in c.lower() or "type" in c.lower() or "category" in c.lower():
            return c
    return None


def get_fk_for_join(schema: dict, from_table: str) -> list[dict]:
    """Get foreign keys where from_table is the parent."""
    return [fk for fk in schema["foreign_keys"] if fk["to_table"] == from_table]


def question_to_sql(question: str, difficulty: str, schema: dict, schema_name: str) -> str:
    """Generate SQLite query for a natural language question."""
    q = question.lower()
    tables = schema["tables"]
    fks = schema["foreign_keys"]

    # Find relevant tables
    target_tables = entity_to_tables(question, schema)
    if not target_tables:
        target_tables = [t for t in schema["table_names"] if t in tables][:3]

    # --- EASY ---
    if "how many" in q and "in each group" in q and "components" in str(tables).lower():
        if "components" in tables and "component_groups" in tables:
            return """SELECT cg.name as group_name, COUNT(c.id) as component_count
FROM component_groups cg
LEFT JOIN components c ON c.group_id = cg.id
GROUP BY cg.id, cg.name;"""

    if "how many" in q and ("do we have" in q or "are there" in q):
        for t in target_tables:
            if t in tables:
                return f"SELECT COUNT(*) FROM {t};"

    if "how many" in q and ("this month" in q or "last month" in q):
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                date_col = get_date_column(t, cols)
                if date_col:
                    if "this month" in q:
                        return f"""SELECT COUNT(*) FROM {t}
WHERE strftime('%Y-%m', {date_col}) = strftime('%Y-%m', 'now');"""
                    return f"""SELECT COUNT(*) FROM {t}
WHERE {date_col} >= date('now', '-1 month');"""
        t = target_tables[0] if target_tables else list(tables.keys())[0]
        date_col = get_date_column(t, tables.get(t, []))
        if date_col:
            return f"""SELECT COUNT(*) FROM {t}
WHERE {date_col} >= date('now', '-1 month');"""
        return f"SELECT COUNT(*) FROM {t};"

    if "how many people" in q and "subscribed" in q:
        if "subscribers" in tables:
            return "SELECT COUNT(*) FROM subscribers;"
        if "subscriptions" in tables:
            return "SELECT COUNT(DISTINCT subscriber_id) FROM subscriptions;"

    if "how many people signed up" in q:
        for t in ["users", "customuser"]:
            if t in tables:
                cols = tables[t]
                date_col = get_date_column(t, cols)
                if date_col:
                    return f"""SELECT COUNT(*) FROM {t}
WHERE {date_col} >= date('now', '-1 month');"""
                return f"SELECT COUNT(*) FROM {t};"

    if "which components are currently down" in q or "having issues" in q:
        if "components" in tables:
            cols = tables["components"]
            status_col = get_status_column("components", cols)
            if status_col:
                return f"SELECT * FROM components WHERE {status_col} != 1 AND enabled = 1;"
            return "SELECT * FROM components WHERE status != 1;"

    if "what maintenance is scheduled" in q or "next week" in q:
        if "schedules" in tables:
            return """SELECT * FROM schedules
WHERE scheduled_at BETWEEN date('now') AND date('now', '+7 days')
AND (completed_at IS NULL OR completed_at > datetime('now'));"""

    if "show me all" in q or "give me a list of all" in q:
        for t in target_tables:
            if t in tables:
                return f"SELECT * FROM {t};"
        t = list(tables.keys())[0]
        return f"SELECT * FROM {t};"

    if "look up a specific" in q or "by id" in q:
        for t in target_tables:
            if t in tables and "id" in tables[t]:
                return f"SELECT * FROM {t} WHERE id = ?;"

    if "find the" in q and ("name" in q or "email" in q):
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                for c in cols:
                    if "email" in c or "name" in c:
                        return f"SELECT * FROM {t} WHERE {c} = ?;"

    if "which" in q and ("active" in q or "turned on" in q):
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                status_col = get_status_column(t, cols)
                if status_col:
                    return f"SELECT * FROM {t} WHERE {status_col} = 1;"

    if "what" in q and "recently" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                date_col = get_date_column(t, cols)
                if date_col:
                    return f"SELECT * FROM {t} ORDER BY {date_col} DESC LIMIT 50;"

    if "price range" in q or "certain price" in q:
        if "rooms" in tables:
            return "SELECT * FROM rooms WHERE price BETWEEN ? AND ? ORDER BY price;"
        if "reservations" in tables:
            return "SELECT * FROM reservations WHERE total BETWEEN ? AND ?;"

    if "most bedrooms" in q or "most bathrooms" in q:
        if "rooms" in tables:
            cols = tables["rooms"]
            if "total_bedrooms" in cols:
                return "SELECT * FROM rooms ORDER BY total_bedrooms DESC, total_bathrooms DESC LIMIT 10;"
            return "SELECT * FROM rooms ORDER BY total_bathrooms DESC LIMIT 10;"

    if "reservations" in q and "coming up" in q:
        if "reservations" in tables:
            return """SELECT * FROM reservations
WHERE start_date >= date('now')
ORDER BY start_date ASC;"""

    if "ratings" in q or "guests think" in q:
        if "reviews" in tables:
            return "SELECT r.*, AVG(r.rating) as avg_rating FROM reviews r GROUP BY r.reservation_id;"
        if "reviews" in tables:
            return "SELECT * FROM reviews ORDER BY rating DESC;"

    if "how many tickets" in q and "open" in q:
        if "tickets" in tables:
            cols = tables["tickets"]
            status_col = get_status_column("tickets", cols)
            if status_col:
                return f"SELECT COUNT(*) FROM tickets WHERE {status_col} IN ('open', 'pending', 0);"
            return "SELECT COUNT(*) FROM tickets;"

    if "tickets were created this week" in q:
        if "tickets" in tables:
            cols = tables["tickets"]
            date_col = get_date_column("tickets", cols)
            if date_col:
                return f"""SELECT * FROM tickets
WHERE {date_col} >= date('now', '-7 days');"""
            return "SELECT * FROM tickets;"

    if "invitations haven't been accepted" in q:
        if "teams_invitation" in tables:
            return "SELECT * FROM teams_invitation WHERE is_accepted = 0;"
        if "invites" in tables:
            return "SELECT * FROM invites WHERE claimed_at IS NULL;"

    if "how many people are on each team" in q:
        if "teams_membership" in tables:
            return "SELECT team_id, COUNT(*) as member_count FROM teams_membership GROUP BY team_id;"

    # --- MEDIUM ---
    if "latest update on each incident" in q:
        if "incident_updates" in tables and "incidents" in tables:
            return """SELECT i.*, iu.message, iu.status, iu.created_at as update_at
FROM incidents i
LEFT JOIN (
  SELECT iu1.* FROM incident_updates iu1
  INNER JOIN (
    SELECT incident_id, MAX(created_at) as max_at
    FROM incident_updates GROUP BY incident_id
  ) iu2 ON iu1.incident_id = iu2.incident_id AND iu1.created_at = iu2.max_at
) iu ON iu.incident_id = i.id;"""
        if "incident_updates" in tables:
            return """SELECT * FROM incident_updates iu1
WHERE created_at = (SELECT MAX(created_at) FROM incident_updates iu2 WHERE iu2.incident_id = iu1.incident_id);"""

    if "how many components do we have in each group" in q:
        if "components" in tables and "component_groups" in tables:
            return """SELECT cg.name as group_name, COUNT(c.id) as component_count
FROM component_groups cg
LEFT JOIN components c ON c.group_id = cg.id
GROUP BY cg.id, cg.name;"""

    if "how much revenue" in q or "revenue did we make" in q:
        if "reservations" in tables:
            return """SELECT SUM(total) as total_revenue FROM reservations
WHERE created_at >= date('now', '-1 month');"""
        if "payments" in tables:
            return """SELECT SUM(amount) FROM payments
WHERE created_at >= date('now', '-1 month');"""
        if "orders" in tables:
            return """SELECT SUM(total) FROM orders
WHERE created_at >= date('now', '-1 month');"""

    if "which rooms have the best reviews" in q:
        if "reviews" in tables and "rooms" in tables:
            return """SELECT r.*, AVG(rev.rating) as avg_rating
FROM rooms r
JOIN reservations res ON res.room_id = r.id
JOIN reviews rev ON rev.reservation_id = res.id
GROUP BY r.id
ORDER BY avg_rating DESC;"""

    if "most active users" in q:
        for t in ["users", "customuser"]:
            if t in tables:
                fk_refs = [fk for fk in fks if fk["to_table"] == t]
                if fk_refs:
                    ref_table = fk_refs[0]
                    ref_col = ref_table["from_col"].replace("user_id", "user_id")
                    ref_tbl = [f["to_table"] for f in fks if f["from_col"] == "user_id" and f["to_table"] != t]
                    if ref_tbl:
                        return f"""SELECT u.*, COUNT(*) as activity_count
FROM {t} u
LEFT JOIN {ref_tbl[0]} a ON a.user_id = u.id
GROUP BY u.id
ORDER BY activity_count DESC;"""
                return f"SELECT * FROM {t} ORDER BY created_at DESC LIMIT 10;"

    if "along with its related details" in q or "full details" in q:
        for t in target_tables:
            if t in tables:
                for fk in fks:
                    if fk["to_table"] == t:
                        child_tbl = next((tbl for tbl, cols in tables.items() if fk["from_col"] in cols), None)
                        if child_tbl:
                            return f"""SELECT t.*, c.*
FROM {t} t
LEFT JOIN {child_tbl} c ON c.{fk['from_col']} = t.{fk['to_col']};"""
                return f"SELECT * FROM {t};"

    if "how many" in q and "last month" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                date_col = get_date_column(t, cols)
                if date_col:
                    return f"""SELECT COUNT(*) FROM {t}
WHERE {date_col} >= date('now', '-1 month');"""
                return f"SELECT COUNT(*) FROM {t};"

    if "break it down" in q or "how many in each" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                group_col = get_group_column(t, cols)
                if group_col:
                    return f"SELECT {group_col}, COUNT(*) as count FROM {t} GROUP BY {group_col};"
                for c in cols:
                    if c not in ("id", "created_at", "updated_at"):
                        return f"SELECT {c}, COUNT(*) as count FROM {t} GROUP BY {c};"
        t = target_tables[0] if target_tables else list(tables.keys())[0]
        cols = tables.get(t, [])
        group_col = get_group_column(t, cols) or (cols[1] if len(cols) > 1 else "id")
        return f"SELECT {group_col}, COUNT(*) as count FROM {t} GROUP BY {group_col};"

    if "total or average" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                num_col = get_numeric_column(t, cols)
                if num_col:
                    return f"SELECT SUM({num_col}) as total, AVG({num_col}) as average FROM {t};"

    if "highest or lowest" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                num_col = get_numeric_column(t, cols)
                if num_col:
                    return f"SELECT * FROM {t} ORDER BY {num_col} DESC LIMIT 1;"

    if "don't have a match" in q or "somewhere else" in q:
        for t in target_tables:
            if t in tables:
                child_fks = [f for f in fks if f["to_table"] == t]
                if child_fks:
                    cf = child_fks[0]
                    child_tbl = next((tbl for tbl, cols in tables.items() if cf["from_col"] in cols), None)
                    if child_tbl and child_tbl != t:
                        return f"""SELECT * FROM {t}
WHERE id NOT IN (SELECT DISTINCT {cf['from_col']} FROM {child_tbl} WHERE {cf['from_col']} IS NOT NULL);"""
                return f"SELECT * FROM {t} LIMIT 10;"

    if "top 3" in q or "top few" in q:
        for t in target_tables:
            if t in tables and get_group_column(t, tables[t]):
                cols = tables[t]
                group_col = get_group_column(t, cols)
                num_col = get_numeric_column(t, cols)
                order_col = num_col or "id"
                if group_col and group_col in cols:
                    return f"""SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY {group_col} ORDER BY {order_col} DESC) as rn
  FROM {t}
) WHERE rn <= 3;"""
                return f"SELECT * FROM {t} ORDER BY {order_col} DESC LIMIT 3;"

    if "numbers change" in q or "compared to last month" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                date_col = get_date_column(t, cols)
                if date_col:
                    return f"""SELECT
  strftime('%Y-%m', {date_col}) as period,
  COUNT(*) as count
FROM {t}
WHERE {date_col} >= date('now', '-2 months')
GROUP BY period
ORDER BY period;"""

    # --- HARD ---
    if "pulls together" in q or "several different places" in q:
        if len(tables) >= 2 and fks:
            child_counts = {}
            for fk in fks:
                child = next((tbl for tbl, cols in tables.items() if fk["from_col"] in cols), None)
                if child and child in tables:
                    child_counts[child] = child_counts.get(child, 0) + 1
            base = max(child_counts, key=child_counts.get) if child_counts else list(tables.keys())[0]
            result = f"SELECT * FROM {base}"
            seen_parents = set()
            for fk in fks[:4]:
                child = next((tbl for tbl, cols in tables.items() if fk["from_col"] in cols), None)
                parent = fk["to_table"]
                if child == base and parent in tables and parent not in seen_parents:
                    result += f"\nLEFT JOIN {parent} ON {base}.{fk['from_col']} = {parent}.{fk['to_col']}"
                    seen_parents.add(parent)
            return result + ";"
        return f"SELECT * FROM {list(tables.keys())[0]};"

    if "multi-step analysis" in q:
        t = list(tables.keys())[0]
        cols = tables.get(t, [])
        group_col = get_group_column(t, cols) or (cols[1] if len(cols) > 1 else "id")
        return f"""WITH grouped AS (
  SELECT {group_col}, COUNT(*) as cnt FROM {t} GROUP BY {group_col}
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;"""

    if "best in each group" in q or "top performer" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                group_col = get_group_column(t, cols)
                num_col = get_numeric_column(t, cols)
                if group_col and num_col:
                    return f"""SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY {group_col} ORDER BY {num_col} DESC) as rn
  FROM {t}
) WHERE rn = 1;"""
        t = list(tables.keys())[0]
        cols = tables[t]
        gc = get_group_column(t, cols) or cols[1] if len(cols) > 1 else "id"
        nc = get_numeric_column(t, cols) or "id"
        return f"""SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY {gc} ORDER BY {nc} DESC) as rn
  FROM {t}
) WHERE rn = 1;"""

    if "above average" in q:
        skip_tables = {"cache", "sessions", "jobs", "failed_jobs"}
        numeric_tables = [t for t in tables if t not in skip_tables and get_numeric_column(t, tables[t])]
        for t in (numeric_tables or target_tables):
            if t in tables:
                cols = tables[t]
                group_col = get_group_column(t, cols)
                num_col = get_numeric_column(t, cols)
                if num_col and num_col in cols:
                    if group_col and group_col in cols:
                        return f"""SELECT * FROM {t} t1
WHERE {num_col} > (
  SELECT AVG({num_col}) FROM {t} t2 WHERE t2.{group_col} = t1.{group_col}
);"""
                    return f"""SELECT * FROM {t}
WHERE {num_col} > (SELECT AVG({num_col}) FROM {t});"""

    # Fallback
    t = target_tables[0] if target_tables else list(tables.keys())[0]
    return f"SELECT * FROM {t} LIMIT 10;"


def to_sqlite_schema(schema: dict) -> str:
    """Convert parsed schema to SQLite CREATE TABLE statements."""
    lines = []
    for table, cols in schema["tables"].items():
        col_defs = []
        for c in cols:
            col_defs.append(f'  "{c}" TEXT')
        col_defs[0] = col_defs[0].replace('TEXT', 'INTEGER PRIMARY KEY', 1) if cols else col_defs[0]
        if "id" in cols:
            idx = cols.index("id")
            col_defs[idx] = f'  "id" INTEGER PRIMARY KEY'
        lines.append(f'CREATE TABLE IF NOT EXISTS "{table}" (\n' + ",\n".join(col_defs) + "\n);")
    return "\n\n".join(lines)


def main():
    base_dir = Path(__file__).parent
    questions_dir = base_dir / "generated_questions"
    output_dir = base_dir / "generated_sql"
    sql_dir = base_dir

    output_dir.mkdir(exist_ok=True)

    question_files = sorted(questions_dir.glob("*_questions.txt"))
    print(f"Processing {len(question_files)} question files...")

    for qfile in question_files:
        schema_name = qfile.stem.replace("_questions", "")
        sql_file = sql_dir / f"{schema_name}.sql"

        if not sql_file.exists():
            sql_files = list(sql_dir.glob("*.sql"))
            sql_file = next((f for f in sql_files if f.stem == schema_name), None)

        if not sql_file or not sql_file.exists():
            print(f"  Skip {qfile.name}: No schema found")
            continue

        try:
            schema_content = sql_file.read_text(encoding="utf-8", errors="ignore")
            schema = parse_sql_schema(schema_content)

            if not schema["tables"]:
                print(f"  Skip {qfile.name}: Empty schema")
                continue

            # Parse questions
            content = qfile.read_text(encoding="utf-8")
            questions = []
            for line in content.split("\n"):
                m = re.match(r"^\d+\.\s*\[(\w+)\]\s*(.+)$", line.strip())
                if m:
                    questions.append({"difficulty": m.group(1).lower(), "question": m.group(2).strip()})

            if not questions:
                print(f"  Skip {qfile.name}: No questions")
                continue

            # Generate SQL for each question
            output_file = output_dir / f"{schema_name}_queries.sql"
            with open(output_file, "w", encoding="utf-8") as f:
                f.write(f"-- SQLite queries for: {schema_name}\n")
                f.write(f"-- Generated from natural language questions\n")
                f.write("=" * 60 + "\n\n")

                for i, q in enumerate(questions, 1):
                    sql = question_to_sql(q["question"], q["difficulty"], schema, schema_name)
                    f.write(f"-- {i}. [{q['difficulty'].upper()}] {q['question']}\n")
                    f.write(sql.strip() + "\n\n")

            print(f"  OK: {output_file.name}")

        except Exception as e:
            print(f"  Error {qfile.name}: {e}")
            import traceback
            traceback.print_exc()

    print(f"\nDone! Output in {output_dir}")


if __name__ == "__main__":
    main()
