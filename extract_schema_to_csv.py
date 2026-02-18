#!/usr/bin/env python3
"""Extract schema from all SQL files and write to all_databases_schema.csv"""

import csv
import re
from pathlib import Path


def classify_column_type(col_type: str) -> str:
    """Classify SQL column type into: string, num, binary, boolean, date."""
    t = col_type.upper().strip()
    t_base = re.sub(r"\([^)]*\)", "", t).strip()  # Remove (255), (8,2), etc.

    if t_base in ("BOOLEAN", "BIT") or t == "TINYINT(1)":
        return "boolean"
    if t_base in ("TIMESTAMP", "DATETIME", "DATE", "TIME", "YEAR"):
        return "date"
    if t_base in ("BLOB", "BINARY", "VARBINARY", "BYTEA"):
        return "binary"
    if t_base in ("INT", "INTEGER", "BIGINT", "TINYINT", "SMALLINT", "MEDIUMINT",
                  "DECIMAL", "NUMERIC", "FLOAT", "DOUBLE", "REAL"):
        return "num"
    if t_base in ("VARCHAR", "CHAR", "TEXT", "LONGTEXT", "MEDIUMTEXT", "TINYTEXT",
                  "JSON", "JSONB", "UUID", "ENUM", "SET"):
        return "string"

    return "string"  # Default fallback


def parse_schema_with_types(content: str) -> list[tuple[str, str, str]]:
    """Parse SQL and return list of (table_name, column_name, column_type)."""
    results = []
    create_pattern = re.compile(
        r'CREATE\s+TABLE\s+(?:`|")?(\w+)(?:`|")?\s*\((.*?)\)\s*;',
        re.DOTALL | re.IGNORECASE
    )
    # Match: column_name TYPE or column_name TYPE(size) or column_name TYPE(size,size)
    col_pattern = re.compile(
        r'(?:`|")?(\w+)(?:`|")?\s+(\w+(?:\s*\(\s*\d+(?:\s*,\s*\d+)?\s*\))?)\s+(?:NULL|NOT NULL)?',
        re.IGNORECASE
    )
    skip_cols = {'PRIMARY', 'FOREIGN', 'CONSTRAINT', 'UNIQUE', 'INDEX', 'CHECK'}

    for match in create_pattern.finditer(content):
        table_name = match.group(1)
        table_body = match.group(2)
        for col_match in col_pattern.finditer(table_body):
            col_name = col_match.group(1)
            col_type = col_match.group(2).strip()
            if col_name.upper() not in skip_cols:
                results.append((table_name, col_name, col_type))

    return results


def main():
    base_dir = Path(__file__).parent
    sql_files = sorted(base_dir.glob("*.sql"))
    output_file = base_dir / "all_databases_schema.csv"

    rows = []
    for sql_file in sql_files:
        if sql_file.name == "all_databases_schema.csv":
            continue
        try:
            content = sql_file.read_text(encoding="utf-8", errors="ignore")
            schema_rows = parse_schema_with_types(content)
            database_name = sql_file.stem
            for table_name, column_name, column_type in schema_rows:
                rows.append({
                    "database_name": database_name,
                    "table_name": table_name,
                    "column_name": column_name,
                    "column_types": column_type,
                    "column_class": classify_column_type(column_type),
                })
        except Exception as e:
            print(f"Error parsing {sql_file.name}: {e}")

    with open(output_file, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(
            f,
            fieldnames=["database_name", "table_name", "column_name", "column_types", "column_class"],
        )
        writer.writeheader()
        writer.writerows(rows)

    print(f"Wrote {len(rows)} rows to {output_file}")


if __name__ == "__main__":
    main()
