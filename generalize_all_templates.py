#!/usr/bin/env python3
"""
Generalize all_templates.csv by replacing all non-command tokens with 'variable'.
- table_name, col_name, id, value, num, string, date, boolean, jsonb -> variable
- table_aliasN, column_aliasN -> variable
- XX.XX (qualified refs like table_alias0.col_name) -> single variable
- Keep only SQL command language (keywords, functions, operators, punctuation)
Output: all_templates_generalized.csv
"""

import csv
import re
from pathlib import Path
from collections import Counter

# SQL keywords and functions to preserve (everything else -> variable)
SQL_COMMANDS = {
    # DML
    "SELECT", "FROM", "WHERE", "INSERT", "INTO", "UPDATE", "SET", "DELETE",
    "VALUES", "RETURNING",
    # Joins
    "JOIN", "LEFT", "RIGHT", "INNER", "OUTER", "CROSS", "NATURAL", "ON", "USING",
    # Logical / comparison
    "AND", "OR", "NOT", "IN", "EXISTS", "BETWEEN", "LIKE", "IS", "NULL",
    # Sorting / limiting
    "GROUP", "ORDER", "BY", "ASC", "DESC", "LIMIT", "OFFSET", "HAVING",
    # Set operations
    "UNION", "ALL", "DISTINCT", "INTERSECT", "EXCEPT",
    # Case
    "CASE", "WHEN", "THEN", "ELSE", "END",
    # CTE / subquery
    "WITH", "AS", "RECURSIVE",
    # Window functions
    "PARTITION", "OVER", "ROW_NUMBER", "RANK", "DENSE_RANK", "NTILE",
    "LAG", "LEAD", "FIRST_VALUE", "LAST_VALUE", "ROWS", "RANGE",
    "UNBOUNDED", "PRECEDING", "FOLLOWING", "CURRENT", "ROW",
    # Aggregate functions
    "COUNT", "SUM", "AVG", "MAX", "MIN", "TOTAL", "GROUP_CONCAT",
    # Date/time functions (SQL commands)
    "strftime", "date", "datetime", "time", "julianday",
    # Other functions
    "CAST", "COALESCE", "IFNULL", "NULLIF", "TYPEOF", "REPLACE",
    "SUBSTR", "LENGTH", "UPPER", "LOWER", "TRIM", "INSTR",
    "ABS", "ROUND", "RANDOM", "HEX", "QUOTE", "ZEROBLOB",
    "GLOB", "PRINTF", "UNICODE", "LIKELIHOOD", "LIKELY", "UNLIKELY",
    "IIF", "FILTER",
    # Additional keywords found in spider/other benchmarks
    "CREATE", "TABLE", "VIEW", "INDEX", "DROP", "ALTER", "ADD", "COLUMN",
    "PRIMARY", "KEY", "FOREIGN", "REFERENCES", "CHECK", "DEFAULT",
    "CONSTRAINT", "UNIQUE", "TRIGGER", "TEMP", "TEMPORARY",
    "IF", "THEN", "BEGIN", "COMMIT", "ROLLBACK",
    "TOP", "FETCH", "NEXT", "FIRST", "ONLY", "PERCENT",
    "LIKE", "ILIKE", "SIMILAR", "TO", "ANY", "SOME",
    "TRUE", "FALSE",
}

SQL_COMMANDS_LOWER = {kw.lower() for kw in SQL_COMMANDS}


def generalize_template(template: str) -> str:
    """Replace all non-command tokens with 'variable'."""
    # Replace qualified references (word.word or word.*) with a single placeholder
    def replace_qualified(m):
        qualifier = m.group(1)
        member = m.group(2)
        if member == "*":
            q_lower = qualifier.lower()
            if q_lower in SQL_COMMANDS_LOWER:
                return m.group(0)
            return "__QUALSTAR__"
        q_lower = qualifier.lower()
        m_lower = member.lower()
        if q_lower in SQL_COMMANDS_LOWER and m_lower in SQL_COMMANDS_LOWER:
            return m.group(0)
        return "__QUAL__"

    t = re.sub(r'\b(\w+)\.(\w+|\*)', replace_qualified, template)

    # Tokenize: split on whitespace and punctuation, keeping delimiters
    tokens = re.findall(r'__QUAL(?:STAR)?__|[a-zA-Z_]\w*|\*|[^\s\w]|\s+', t)

    result = []
    for tok in tokens:
        if tok == "__QUAL__":
            result.append("variable")
        elif tok == "__QUALSTAR__":
            result.append("variable.*")
        elif tok == "*":
            result.append("*")
        elif tok.strip() == "":
            result.append(" ")
        elif re.match(r'^[^\w]$', tok):
            result.append(tok)
        elif tok.lower() in SQL_COMMANDS_LOWER:
            result.append(tok.upper())
        elif re.match(r'^[a-zA-Z_]\w*$', tok):
            result.append("variable")
        else:
            result.append(tok)

    return " ".join("".join(result).split())


def main():
    base_dir = Path(__file__).parent
    input_path = base_dir / "all_templates.csv"
    output_path = base_dir / "all_templates_generalized.csv"

    # Read all_templates.csv (tab-delimited, may have multiline templates)
    # Parse manually: each record starts with id\ttemplate...\tcount
    gen_counts = Counter()
    total_in = 0
    content = open(input_path, encoding="utf-8").read()
    lines = content.split("\n")

    # Skip header
    i = 1
    while i < len(lines):
        line = lines[i]
        if not line.strip():
            i += 1
            continue
        # A record starts with a number followed by tab
        parts = line.split("\t")
        if len(parts) >= 3 and parts[0].strip().isdigit():
            # Simple single-line record: id\ttemplate\tcount
            template = parts[1]
            count = int(parts[-1])
            total_in += 1
            generalized = generalize_template(template)
            gen_counts[generalized] += count
            i += 1
        elif len(parts) >= 2 and parts[0].strip().isdigit():
            # Multiline: id\ttemplate starts here, continues until we find line ending with \tcount
            record_lines = [line]
            i += 1
            while i < len(lines):
                next_line = lines[i]
                # Check if next line starts a new record (number\t...)
                next_parts = next_line.split("\t")
                if next_parts[0].strip().isdigit() and len(next_parts) >= 3:
                    break
                record_lines.append(next_line)
                i += 1
            full = "\n".join(record_lines)
            # Extract: first field is id, last field after last tab is count
            first_tab = full.index("\t")
            last_tab = full.rindex("\t")
            template = full[first_tab + 1:last_tab]
            count_str = full[last_tab + 1:].strip()
            try:
                count = int(count_str)
            except ValueError:
                count = 1
            total_in += 1
            # Normalize multiline to single line
            template = " ".join(template.replace("\\", " ").split())
            generalized = generalize_template(template)
            gen_counts[generalized] += count
        else:
            i += 1

    sorted_gen = sorted(gen_counts.items(), key=lambda x: -x[1])

    with open(output_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f, delimiter="\t", quoting=csv.QUOTE_NONE, escapechar="\\")
        writer.writerow(["id", "generalized_template", "count"])
        for i, (gen, count) in enumerate(sorted_gen, start=1):
            writer.writerow([i, gen, count])

    print(f"Original templates: {total_in}")
    print(f"Generalized distinct templates: {len(sorted_gen)}")
    print(f"Total count: {sum(gen_counts.values())}")

    print("\nTop 20 generalized templates:")
    for i, (gen, count) in enumerate(sorted_gen[:20], start=1):
        print(f"  {i}. [{count}] {gen}")


if __name__ == "__main__":
    main()
