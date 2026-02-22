#!/usr/bin/env python3
"""
Generate SQLite queries for each natural language question.
Uses the schema from each database to produce valid SQLite SQL.
Handles typed placeholders: id=num, name=string, created_at=date, etc.
"""

import re
from pathlib import Path
from typing import Optional

from generate_sql_questions import parse_sql_schema, human_entity


def entity_to_tables(question: str, schema: dict) -> list[str]:
    """Map question text to relevant table names from schema."""
    q = question.lower()
    tables = schema["tables"]

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
        ("users", ["users", "customuser", "auth_user"]),
        ("people signed up", ["users"]),
        ("signed up", ["users"]),
        ("rooms", ["rooms"]),
        ("reservations", ["reservations"]),
        ("reviews", ["reviews"]),
        ("ratings", ["reviews"]),
        ("revenue", ["reservations", "payments", "orders"]),
        ("invitations", ["invites", "teams_invitation"]),
        ("tickets", ["tickets"]),
        ("customers", ["customers"]),
        ("each group", ["component_groups", "components", "categories"]),
    ]

    for entity, table_candidates in entity_map:
        if entity in q:
            matched = [t for t in table_candidates if t in tables]
            if matched:
                return matched

    # Try matching table names directly in the question
    for tbl in schema["table_names"]:
        if tbl.lower() in q or tbl.replace("_", " ").lower() in q:
            return [tbl]

    return schema["table_names"][:3]


def get_date_column(table: str, cols: list) -> Optional[str]:
    for c in cols:
        if c in ("created_at", "occurred_at", "scheduled_at", "start_date", "updated_at", "created"):
            return c
    for c in cols:
        if "date" in c.lower() or "at" in c.lower():
            return c
    return None


def get_status_column(table: str, cols: list) -> Optional[str]:
    for c in cols:
        if c in ("status", "active", "enabled", "visible"):
            return c
    return None


def get_numeric_column(table: str, cols: list) -> Optional[str]:
    for c in cols:
        if c in ("price", "amount", "total", "rating", "value", "salary", "quantity"):
            return c
    return None


def get_group_column(table: str, cols: list) -> Optional[str]:
    for c in cols:
        if "group" in c.lower() or "type" in c.lower() or "category" in c.lower():
            return c
    return None


def get_name_column(table: str, cols: list) -> Optional[str]:
    for c in cols:
        if any(x in c.lower() for x in ["email", "name", "title", "username"]):
            return c
    return None


def get_fk_for_join(schema: dict, from_table: str) -> list[dict]:
    return [fk for fk in schema["foreign_keys"] if fk["to_table"] == from_table]


def extract_col_placeholder(question: str) -> list[tuple[str, str]]:
    """Extract col=type placeholders from question text, e.g. 'id=num' -> [('id', 'num')]."""
    return re.findall(r'(\w+)=(num|string|date|boolean|binary)', question)


def question_to_sql(question: str, difficulty: str, schema: dict, schema_name: str) -> str:
    """Generate SQLite query for a natural language question."""
    q = question.lower()
    tables = schema["tables"]
    fks = schema["foreign_keys"]

    target_tables = entity_to_tables(question, schema)
    if not target_tables:
        target_tables = [t for t in schema["table_names"] if t in tables][:3]

    placeholders = extract_col_placeholder(question)

    # --- EASY ---

    if "how many" in q and "in each group" in q and "components" in str(tables).lower():
        if "components" in tables and "component_groups" in tables:
            return """SELECT cg.name as group_name, COUNT(c.id) as component_count
FROM component_groups cg
LEFT JOIN components c ON c.group_id = cg.id
GROUP BY cg.id, cg.name;"""

    if "how many" in q and ("do we have" in q or "in total" in q or "are there" in q):
        for t in target_tables:
            if t in tables:
                return f"SELECT COUNT(*) FROM {t};"

    if "how many" in q and ("this month" in q or "since" in q or "created since" in q):
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                date_col = get_date_column(t, cols)
                if date_col:
                    return f"""SELECT COUNT(*) FROM {t}
WHERE {date_col} >= date('now', '-1 month');"""
        t = target_tables[0] if target_tables else list(tables.keys())[0]
        date_col = get_date_column(t, tables.get(t, []))
        if date_col:
            return f"""SELECT COUNT(*) FROM {t}
WHERE {date_col} >= date('now', '-1 month');"""
        return f"SELECT COUNT(*) FROM {t};"

    if "how many" in q and "last month" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                date_col = get_date_column(t, cols)
                if date_col:
                    return f"""SELECT COUNT(*) FROM {t}
WHERE {date_col} >= date('now', '-1 month');"""
                return f"SELECT COUNT(*) FROM {t};"

    if "how many people" in q and "subscribed" in q:
        if "subscribers" in tables:
            return "SELECT COUNT(*) FROM subscribers;"
        if "subscriptions" in tables:
            return "SELECT COUNT(DISTINCT subscriber_id) FROM subscriptions;"

    if "how many" in q and ("signed up" in q or "users" in q):
        for t in ["users", "customuser", "auth_user"]:
            if t in tables:
                cols = tables[t]
                date_col = get_date_column(t, cols)
                if date_col:
                    return f"""SELECT COUNT(*) FROM {t}
WHERE {date_col} >= date('now', '-1 month');"""
                return f"SELECT COUNT(*) FROM {t};"

    if ("which" in q or "what" in q) and ("status=" in q or "down" in q or "having issues" in q):
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                status_col = get_status_column(t, cols)
                if status_col:
                    return f"SELECT * FROM {t} WHERE {status_col} != 1 AND enabled = 1;" if "enabled" in cols else f"SELECT * FROM {t} WHERE {status_col} = num;"
                return f"SELECT * FROM {t};"

    if "maintenance" in q and ("scheduled" in q or "between" in q):
        if "schedules" in tables:
            return """SELECT * FROM schedules
WHERE scheduled_at BETWEEN date('now') AND date('now', '+7 days')
AND (completed_at IS NULL OR completed_at > datetime('now'));"""

    if "show me all" in q or "give me a list" in q:
        for t in target_tables:
            if t in tables:
                return f"SELECT * FROM {t};"
        t = list(tables.keys())[0]
        return f"SELECT * FROM {t};"

    if "look up" in q and ("id=num" in q or "id=" in q or "specific" in q):
        for t in target_tables:
            if t in tables and "id" in tables[t]:
                return f"SELECT * FROM {t} WHERE id = num;"

    if "find" in q and any(f"{col}=" in q for col, _ in placeholders):
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                for col, ptype in placeholders:
                    if col in cols or col == "id":
                        return f"SELECT * FROM {t} WHERE {col} = {ptype};"
                name_col = get_name_column(t, cols)
                if name_col:
                    return f"SELECT * FROM {t} WHERE {name_col} = string;"

    if "find" in q and ("name" in q or "email" in q):
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                name_col = get_name_column(t, cols)
                if name_col:
                    return f"SELECT * FROM {t} WHERE {name_col} = string;"

    if ("which" in q or "what" in q) and ("have" in q or "active" in q or "status" in q):
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                for col, ptype in placeholders:
                    if col in cols:
                        return f"SELECT * FROM {t} WHERE {col} = {ptype};"
                status_col = get_status_column(t, cols)
                if status_col:
                    return f"SELECT * FROM {t} WHERE {status_col} = num;"

    if "between" in q and "num" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                num_col = get_numeric_column(t, cols)
                if num_col:
                    return f"SELECT * FROM {t} WHERE {num_col} BETWEEN num AND num ORDER BY {num_col};"

    if "most recent" in q or "ordered by" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                date_col = get_date_column(t, cols)
                order_col = date_col or (cols[1] if len(cols) > 1 else "id")
                return f"SELECT * FROM {t} ORDER BY {order_col} DESC LIMIT num;"

    if "show me the first" in q or "first few" in q:
        for t in target_tables:
            if t in tables:
                return f"SELECT * FROM {t} LIMIT num;"

    if "how many tickets" in q and ("open" in q or "status=" in q):
        if "tickets" in tables:
            cols = tables["tickets"]
            status_col = get_status_column("tickets", cols)
            if status_col:
                return f"SELECT COUNT(*) FROM tickets WHERE {status_col} = num;"
            return "SELECT COUNT(*) FROM tickets;"

    if "tickets" in q and ("created since" in q or "created_at=" in q):
        if "tickets" in tables:
            cols = tables["tickets"]
            date_col = get_date_column("tickets", cols)
            if date_col:
                return f"""SELECT * FROM tickets
WHERE {date_col} >= date('now', '-1 month');"""

    if "how many members" in q or "on each team" in q:
        for t in tables:
            if "member" in t.lower() or "team" in t.lower():
                cols = tables[t]
                group_col = next((c for c in cols if "team" in c.lower()), cols[1] if len(cols) > 1 else "id")
                return f"SELECT {group_col}, COUNT(*) as member_count FROM {t} GROUP BY {group_col};"

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

    if "how many components" in q and "in each group" in q:
        if "components" in tables and "component_groups" in tables:
            return """SELECT cg.name as group_name, COUNT(c.id) as component_count
FROM component_groups cg
LEFT JOIN components c ON c.group_id = cg.id
GROUP BY cg.id, cg.name;"""

    if "total and average" in q or "total or average" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                num_col = get_numeric_column(t, cols)
                if num_col:
                    return f"SELECT SUM({num_col}) as total, AVG({num_col}) as average FROM {t};"

    if "highest" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                num_col = get_numeric_column(t, cols)
                if num_col:
                    return f"SELECT * FROM {t} ORDER BY {num_col} DESC LIMIT 1;"

    if ("revenue" in q or "total revenue" in q) and "since" in q:
        for t in ["reservations", "payments", "orders", "transactions"]:
            if t in tables:
                cols = tables[t]
                num_col = get_numeric_column(t, cols) or "amount"
                date_col = get_date_column(t, cols)
                if date_col:
                    return f"""SELECT SUM({num_col}) as total_revenue FROM {t}
WHERE {date_col} >= date('now', '-1 month');"""

    if "best" in q and ("average rating" in q or "reviews" in q):
        if "reviews" in tables and "rooms" in tables:
            return """SELECT r.*, AVG(rev.rating) as avg_rating
FROM rooms r
JOIN reservations res ON res.room_id = r.id
JOIN reviews rev ON rev.reservation_id = res.id
GROUP BY r.id
ORDER BY avg_rating DESC;"""

    if "most active users" in q or "most active" in q:
        for t in ["users", "customuser", "auth_user"]:
            if t in tables:
                fk_refs = [fk for fk in fks if fk["to_table"] == t]
                if fk_refs:
                    ref_tbl = [f["to_table"] for f in fks if f["from_col"] == "user_id" and f["to_table"] != t]
                    if ref_tbl:
                        return f"""SELECT u.*, COUNT(*) as activity_count
FROM {t} u
LEFT JOIN {ref_tbl[0]} a ON a.user_id = u.id
GROUP BY u.id
ORDER BY activity_count DESC;"""
                return f"SELECT * FROM {t} ORDER BY created_at DESC LIMIT 10;"

    if "along with" in q and "related details" in q:
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

    if "how many" in q and ("added since" in q or "since" in q):
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                date_col = get_date_column(t, cols)
                if date_col:
                    return f"""SELECT COUNT(*) FROM {t}
WHERE {date_col} >= date('now', '-1 month');"""
                return f"SELECT COUNT(*) FROM {t};"

    if "break down" in q or "how many in each" in q:
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

    if "don't have a match" in q or "not in a related" in q:
        for t in target_tables:
            if t in tables:
                child_fks = [f for f in fks if f["to_table"] == t]
                if child_fks:
                    cf = child_fks[0]
                    child_tbl = next((tbl for tbl, cols in tables.items() if cf["from_col"] in cols), None)
                    if child_tbl and child_tbl != t:
                        return f"""SELECT * FROM {t}
WHERE id NOT IN (SELECT DISTINCT {cf['from_col']} FROM {child_tbl} WHERE {cf['from_col']} IS NOT NULL);"""
                return f"SELECT * FROM {t} LIMIT num;"

    if "top 3" in q or "top entries" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                group_col = get_group_column(t, cols)
                num_col = get_numeric_column(t, cols)
                order_col = num_col or "id"
                if group_col:
                    return f"""SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY {group_col} ORDER BY {order_col} DESC) as rn
  FROM {t}
) WHERE rn <= num;"""
                return f"SELECT * FROM {t} ORDER BY {order_col} DESC LIMIT num;"

    if "month over month" in q or "change" in q or "compared to" in q:
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

    if "duplicate" in q or "repeated" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                group_col = get_group_column(t, cols)
                if not group_col:
                    for c in cols:
                        if c not in ("id", "created_at", "updated_at"):
                            group_col = c
                            break
                if group_col:
                    return f"""WITH grouped AS (
  SELECT {group_col}, COUNT(*) as cnt FROM {t} GROUP BY {group_col}
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;"""

    if "average resolution" in q or "resolve" in q:
        if "tickets" in tables:
            cols = tables["tickets"]
            date_col = get_date_column("tickets", cols)
            if date_col:
                return f"SELECT AVG(julianday(updated_at) - julianday({date_col})) as avg_days FROM tickets;"

    # --- HARD ---

    if "pull together" in q or "pulling data" in q or "several" in q or "comprehensive report" in q or "joining all" in q:
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

    if "combine data from" in q:
        mentioned = [t for t in schema["table_names"] if t.lower() in q]
        if len(mentioned) >= 2:
            base = mentioned[0]
            result = f"SELECT * FROM {base}"
            for t in mentioned[1:]:
                fk_match = next((fk for fk in fks if fk["to_table"] == t or fk["to_table"] == base), None)
                if fk_match:
                    result += f"\nLEFT JOIN {t} ON {t}.{fk_match['to_col']} = {base}.{fk_match['from_col']}"
                else:
                    result += f"\nLEFT JOIN {t} ON {t}.id = {base}.id"
            return result + ";"
        return question_to_sql("Pull together a report joining all related tables.", "hard", schema, schema_name)

    if "multi-step analysis" in q or "group" in q and "filter" in q and "rank" in q:
        t = list(tables.keys())[0]
        cols = tables.get(t, [])
        group_col = get_group_column(t, cols) or (cols[1] if len(cols) > 1 else "id")
        return f"""WITH grouped AS (
  SELECT {group_col}, COUNT(*) as cnt FROM {t} GROUP BY {group_col}
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;"""

    if "best" in q and ("in each" in q or "each group" in q):
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                group_col = get_group_column(t, cols)
                num_col = get_numeric_column(t, cols)
                if group_col and num_col:
                    return f"""SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY {group_col} ORDER BY {num_col} DESC) as rn
  FROM {t}
) WHERE rn = num;"""
        t = list(tables.keys())[0]
        cols = tables[t]
        gc = get_group_column(t, cols) or (cols[1] if len(cols) > 1 else "id")
        nc = get_numeric_column(t, cols) or "id"
        return f"""SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY {gc} ORDER BY {nc} DESC) as rn
  FROM {t}
) WHERE rn = num;"""

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

    if "running total" in q or "cumulative" in q:
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                date_col = get_date_column(t, cols)
                num_col = get_numeric_column(t, cols)
                if date_col:
                    if num_col:
                        return f"""SELECT *, SUM({num_col}) OVER (ORDER BY {date_col}) as running_total
FROM {t}
ORDER BY {date_col};"""
                    return f"""SELECT *, COUNT(*) OVER (ORDER BY {date_col}) as running_count
FROM {t}
ORDER BY {date_col};"""

    if "exist in one" in q and "not in" in q:
        if len(tables) >= 2 and fks:
            for fk in fks:
                parent = fk["to_table"]
                child = next((tbl for tbl, cols in tables.items() if fk["from_col"] in cols), None)
                if parent in tables and child and child in tables and child != parent:
                    return f"""SELECT * FROM {parent}
WHERE id NOT IN (SELECT DISTINCT {fk['from_col']} FROM {child} WHERE {fk['from_col']} IS NOT NULL);"""

    if "rank" in q and ("percentile" in q or "within" in q or "top performer" in q):
        for t in target_tables:
            if t in tables:
                cols = tables[t]
                group_col = get_group_column(t, cols)
                num_col = get_numeric_column(t, cols) or "id"
                if group_col:
                    return f"""SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY {group_col} ORDER BY {num_col} DESC) as rn
  FROM {t}
) WHERE rn <= num;"""
                return f"""SELECT *, ROW_NUMBER() OVER (ORDER BY {num_col} DESC) as rn
FROM {t};"""

    # Fallback
    t = target_tables[0] if target_tables else list(tables.keys())[0]
    return f"SELECT * FROM {t} LIMIT num;"


def main():
    base_dir = Path(__file__).parent
    questions_dir = base_dir / "generated_questions"
    output_dir = base_dir / "generated_sql"
    sql_dir = Path("/Users/liyue/Desktop/drawSQL_sql")

    output_dir.mkdir(exist_ok=True)

    question_files = sorted(questions_dir.glob("*_questions.txt"))
    print(f"Processing {len(question_files)} question files...")

    for qfile in question_files:
        schema_name = qfile.stem.replace("_questions", "")
        sql_file = sql_dir / f"{schema_name}.sql"

        if not sql_file or not sql_file.exists():
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

            content = qfile.read_text(encoding="utf-8")
            questions = []
            for line in content.split("\n"):
                m = re.match(r"^\d+\.\s*\[(\w+)\]\s*(.+)$", line.strip())
                if m:
                    questions.append({"difficulty": m.group(1).lower(), "question": m.group(2).strip()})

            if not questions:
                print(f"  Skip {qfile.name}: No questions")
                continue

            output_file = output_dir / f"{schema_name}_queries.sql"
            with open(output_file, "w", encoding="utf-8") as f:
                f.write(f"-- SQLite queries for: {schema_name}\n")
                f.write(f"-- Generated from natural language questions\n")
                f.write("=" * 60 + "\n\n")

                for i, q_item in enumerate(questions, 1):
                    sql = question_to_sql(q_item["question"], q_item["difficulty"], schema, schema_name)
                    f.write(f"-- {i}. [{q_item['difficulty'].upper()}] {q_item['question']}\n")
                    f.write(sql.strip() + "\n\n")

            print(f"  OK: {output_file.name} ({len(questions)} queries)")

        except Exception as e:
            print(f"  Error {qfile.name}: {e}")
            import traceback
            traceback.print_exc()

    print(f"\nDone! Output in {output_dir}")


if __name__ == "__main__":
    main()
