#!/usr/bin/env python3
"""
Extract SQL templates from generated queries per template_extraction_rules.txt.
Output: sql_templates.csv with database_name, question_id, question, difficulty, sql_query, template
"""

import csv
import re
from pathlib import Path
from collections import defaultdict


def load_schema(schema_path: Path) -> dict:
    """Load schema: {database_name: {tables: set, columns: set, table_cols: {(table, col)}}}"""
    schema_by_db = defaultdict(lambda: {"tables": set(), "columns": set(), "table_cols": set()})
    with open(schema_path, encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            db = row["database_name"]
            tbl = row["table_name"]
            col = row["column_name"]
            schema_by_db[db]["tables"].add(tbl.lower())
            schema_by_db[db]["columns"].add(col.lower())
            schema_by_db[db]["table_cols"].add((tbl.lower(), col.lower()))
    return dict(schema_by_db)


SQL_KEYWORDS = {
    "select", "from", "where", "join", "left", "right", "inner", "outer",
    "on", "and", "or", "not", "in", "exists", "between", "like", "is", "null",
    "group", "order", "by", "asc", "desc", "limit", "offset", "having",
    "union", "all", "distinct", "as", "case", "when", "then", "else", "end",
    "with", "partition", "over", "row_number", "rank", "using", "value",
    "date", "datetime", "strftime", "max", "min", "count", "sum", "avg",
    "day", "days", "month", "months", "year", "years",  # common in date literals
    "string", "at",  # literal placeholder; at (in datetime)
}

def extract_template(sql: str, schema: dict, database_name: str) -> str:
    """
    Extract template by replacing identifiers and literals per rules.
    Simplified implementation for SQLite SELECT queries.
    """
    if not sql or not sql.strip():
        return ""

    t = sql.strip()
    schema_info = schema.get(database_name, {"tables": set(), "columns": set(), "table_cols": set()})
    tables = schema_info["tables"]
    columns = schema_info["columns"]
    table_cols = schema_info["table_cols"]

    # 1. Strip comments
    t = re.sub(r"/\*.*?\*/", "\n", t, flags=re.DOTALL)
    t = re.sub(r"--[^\n]*", "\n", t)
    t = re.sub(r"\n\s*\n+", "\n", t)

    # 2. Literal replacement
    # IMPORTANT: Replace quoted strings BEFORE numerics, so numbers inside
    # strings (e.g. '+7 days') are not corrupted by numeric replacement.

    # Pass 1: Quoted strings only (right-to-left)
    replacements = []
    for m in re.finditer(r"'([^']*)'", t):
        s = m.group(1)
        if s and s[0] in "{[":
            replacements.append((m.start(), m.end(), "jsonb"))
        elif re.match(r"\d{4}-\d{2}-\d{2}", s):
            replacements.append((m.start(), m.end(), "date"))
        else:
            replacements.append((m.start(), m.end(), "STR_LIT"))
    for m in re.finditer(r'"([^"]*)"', t):
        replacements.append((m.start(), m.end(), '"string"'))
    replacements.sort(key=lambda x: -x[0])
    for s, e, val in replacements:
        t = t[:s] + val + t[e:]

    # Pass 2: TRUE/FALSE and numerics (right-to-left)
    replacements = []
    for m in re.finditer(r"\b(TRUE|FALSE)\b", t, re.I):
        replacements.append((m.start(), m.end(), "boolean"))
    for m in re.finditer(r"\b(\d+\.?\d*|\.\d+)([eE][+-]?\d+)?\b", t):
        replacements.append((m.start(), m.end(), "num"))
    replacements.sort(key=lambda x: -x[0])
    for s, e, val in replacements:
        t = t[:s] + val + t[e:]

    t = t.replace("STR_LIT", "string")

    # Parameter placeholder ? -> num (so id=? becomes id=num)
    t = t.replace("?", "num")

    # 3. Table alias detection: FROM table AS alias, JOIN table AS alias
    alias_map = {}
    alias_idx = 0
    for m in re.finditer(r"(?:FROM|JOIN)\s+(\w+)\s+(?:AS\s+)?(\w+)\b", t, re.I):
        tbl_ref, alias = m.group(1).lower(), m.group(2).lower()
        if alias not in SQL_KEYWORDS and alias not in alias_map:
            alias_map[alias] = f"table_alias{alias_idx}"
            alias_idx += 1

    # Also: table alias without AS (FROM t a) - exclude SQL keywords
    for m in re.finditer(r"(?:FROM|JOIN)\s+(\w+)\s+(\w+)(?:\s|$|,|\))", t, re.I):
        first, second = m.group(1).lower(), m.group(2).lower()
        if second not in SQL_KEYWORDS and second not in alias_map:
            if first in tables:
                alias_map[second] = f"table_alias{alias_idx}"
                alias_idx += 1

    # Replace aliases (longest first to avoid partial matches)
    for alias, placeholder in sorted(alias_map.items(), key=lambda x: -len(x[0])):
        t = re.sub(rf"\b{re.escape(alias)}\b", placeholder, t, flags=re.I)

    # 4. Column alias detection: AS name
    col_alias_map = {}
    col_alias_idx = 0
    for m in re.finditer(r"\s+AS\s+(\w+)(?:\s*[,\)\n]|$)", t, re.I):
        name = m.group(1).lower()
        if name not in col_alias_map and name not in alias_map and name not in tables:
            col_alias_map[name] = f"column_alias{col_alias_idx}"
            col_alias_idx += 1

    for alias, placeholder in sorted(col_alias_map.items(), key=lambda x: -len(x[0])):
        t = re.sub(rf"\b{re.escape(alias)}\b", placeholder, t, flags=re.I)

    # 5. Table name replacement (schema-bound -> table_name)
    for tbl in sorted(tables, key=len, reverse=True):
        if len(tbl) < 2 or tbl.startswith(("table_", "col_", "column_", "new_")):
            continue
        t = re.sub(rf"\b{re.escape(tbl)}\b", "table_name", t, flags=re.I)

    # 6. Column name replacement (schema-bound -> col_name), exclude SQL keywords
    # Preserve "id" so templates show "id=num" or "id=?" for id lookups
    for col in sorted(columns, key=len, reverse=True):
        if col in SQL_KEYWORDS or len(col) < 2 or col == "id":
            continue
        t = re.sub(rf"\b{re.escape(col)}\b", "col_name", t, flags=re.I)

    # 7. Normalize whitespace
    t = re.sub(r"\s+", " ", t).strip()

    return t


def parse_queries_file(path: Path) -> list[dict]:
    """Parse a *_queries.sql file into list of {question_id, question, difficulty, sql}."""
    content = path.read_text(encoding="utf-8")
    queries = []
    current = None
    sql_lines = []

    for line in content.split("\n"):
        m = re.match(r"^--\s*(\d+)\.\s*\[(\w+)\]\s*(.+)$", line.strip())
        if m:
            if current and sql_lines:
                current["sql_query"] = "\n".join(sql_lines).strip()
                queries.append(current)
            current = {
                "question_id": int(m.group(1)),
                "difficulty": m.group(2).upper(),
                "question": m.group(3).strip(),
                "sql_query": "",
            }
            sql_lines = []
        elif current and line.strip() and not line.strip().startswith("--") and not line.strip().startswith("="):
            sql_lines.append(line.rstrip())

    if current and sql_lines:
        current["sql_query"] = "\n".join(sql_lines).strip()
        queries.append(current)

    return queries


def main():
    base_dir = Path(__file__).parent
    schema_path = base_dir / "all_databases_schema.csv"
    queries_dir = base_dir / "generated_sql"
    output_path = base_dir / "sql_templates.csv"

    schema = load_schema(schema_path)

    rows = []
    for qfile in sorted(queries_dir.glob("*_queries.sql")):
        if qfile.name == "template_extraction_rules.txt":
            continue
        database_name = qfile.stem.replace("_queries", "")
        try:
            queries = parse_queries_file(qfile)
            for q in queries:
                template = extract_template(
                    q["sql_query"], schema, database_name
                )
                rows.append({
                    "database_name": database_name,
                    "question_id": q["question_id"],
                    "question": q["question"],
                    "difficulty": q["difficulty"],
                    "sql_query": q["sql_query"],
                    "template": template,
                })
        except Exception as e:
            print(f"Error {qfile.name}: {e}")

    with open(output_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(
            f,
            fieldnames=["database_name", "question_id", "question", "difficulty", "sql_query", "template"],
            quoting=csv.QUOTE_MINIMAL,
        )
        writer.writeheader()
        writer.writerows(rows)

    print(f"Wrote {len(rows)} rows to {output_path}")


if __name__ == "__main__":
    main()
