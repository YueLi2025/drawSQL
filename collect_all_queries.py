#!/usr/bin/env python3
"""
Collect all SQL queries from generated_sql/ into a single CSV file.
Columns: database_name, id, difficulty_tier, sql_query, template
"""

import csv
import re
from pathlib import Path
from extract_sql_templates import extract_template, load_schema
from generalize_templates import generalize_template


def parse_queries_file(path: Path) -> list[dict]:
    """Parse a *_queries.sql file into list of {difficulty, sql_query}."""
    content = path.read_text(encoding="utf-8")
    queries = []
    current = None
    sql_lines = []

    for line in content.split("\n"):
        m = re.match(r"^--\s*\d+\.\s*\[(\w+)\]\s*(.+)$", line.strip())
        if m:
            if current and sql_lines:
                current["sql_query"] = "\n".join(sql_lines).strip()
                queries.append(current)
            current = {
                "difficulty": m.group(1).upper(),
                "question": m.group(2).strip(),
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
    queries_dir = base_dir / "generated_sql"
    schema_path = base_dir / "all_databases_schema.csv"
    output_path = base_dir / "all_sql_queries.csv"

    schema = load_schema(schema_path)

    rows = []
    global_id = 1

    for qfile in sorted(queries_dir.glob("*_queries.sql")):
        if qfile.name == "template_extraction_rules.txt":
            continue
        database_name = qfile.stem.replace("_queries", "")
        queries = parse_queries_file(qfile)
        for q in queries:
            template = extract_template(q["sql_query"], schema, database_name)
            gen_template = generalize_template(template)
            rows.append({
                "database_name": database_name,
                "id": global_id,
                "difficulty_tier": q["difficulty"],
                "question": q["question"],
                "sql_query": q["sql_query"],
                "template": template,
                "generalized_template": gen_template,
            })
            global_id += 1

    with open(output_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f, delimiter="\t", quoting=csv.QUOTE_NONE, escapechar="\\")
        writer.writerow(["database_name", "id", "difficulty_tier", "question", "sql_query", "template", "generalized_template"])
        for r in rows:
            sql_oneline = " ".join(r["sql_query"].replace("\t", " ").split())
            tmpl_oneline = " ".join(r["template"].replace("\t", " ").split())
            gen_oneline = " ".join(r["generalized_template"].replace("\t", " ").split())
            writer.writerow([r["database_name"], r["id"], r["difficulty_tier"], r["question"], sql_oneline, tmpl_oneline, gen_oneline])

    easy = sum(1 for r in rows if r["difficulty_tier"] == "EASY")
    med = sum(1 for r in rows if r["difficulty_tier"] == "MEDIUM")
    hard = sum(1 for r in rows if r["difficulty_tier"] == "HARD")
    print(f"Wrote {len(rows)} queries to {output_path}")
    print(f"  EASY: {easy}, MEDIUM: {med}, HARD: {hard}")


if __name__ == "__main__":
    main()
