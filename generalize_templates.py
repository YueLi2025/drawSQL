#!/usr/bin/env python3
"""
Generalize distinct_templates.csv by replacing all non-command tokens with 'variable'.
- table_name, col_name, id, value, num, string, date, boolean, jsonb -> variable
- table_aliasN, column_aliasN, grouped, cnt, count, average, etc. -> variable
- XX.XX (qualified refs like table_alias0.col_name) -> single variable
- Keep only SQL command language (keywords, functions, operators, punctuation)
Output: generalized_templates.csv
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
    # Other
    "CAST", "COALESCE", "IFNULL", "NULLIF", "TYPEOF", "REPLACE",
    "SUBSTR", "LENGTH", "UPPER", "LOWER", "TRIM", "INSTR",
    "ABS", "ROUND", "RANDOM", "HEX", "QUOTE", "ZEROBLOB",
    "GLOB", "PRINTF", "UNICODE", "LIKELIHOOD", "LIKELY", "UNLIKELY",
    "IIF", "FILTER",
}

# Lowercase set for matching
SQL_COMMANDS_LOWER = {kw.lower() for kw in SQL_COMMANDS}


def generalize_template(template: str) -> str:
    """Replace all non-command tokens with 'variable'."""
    # First: replace qualified references (word.word or word.*) with a single placeholder
    # e.g. table_alias0.col_name -> __QUAL__, table_name.* -> __QUALSTAR__
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
            result.append(tok)
        elif re.match(r'^[^\w]$', tok):
            # Punctuation: (, ), ;, ,, =, >, <, !, etc.
            result.append(tok)
        elif tok.lower() in SQL_COMMANDS_LOWER:
            result.append(tok.upper())
        elif re.match(r'^[a-zA-Z_]\w*$', tok):
            # Any identifier/placeholder that isn't a SQL command -> variable
            result.append("variable")
        else:
            result.append(tok)

    return "".join(result)


def main():
    base_dir = Path(__file__).parent
    input_path = base_dir / "distinct_templates.csv"
    output_path = base_dir / "generalized_templates.csv"

    rows = []
    with open(input_path, encoding="utf-8") as f:
        reader = csv.DictReader(f, delimiter="\t")
        for row in reader:
            template = row["template"].strip()
            count = int(row["count"])
            generalized = generalize_template(template)
            rows.append((template, generalized, count))

    # Aggregate by generalized template (multiple originals may merge)
    gen_counts = Counter()
    for _, gen, count in rows:
        gen_counts[gen] += count

    sorted_gen = sorted(gen_counts.items(), key=lambda x: -x[1])

    with open(output_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f, delimiter="\t", quoting=csv.QUOTE_NONE, escapechar="\\")
        writer.writerow(["id", "generalized_template", "count"])
        for i, (gen, count) in enumerate(sorted_gen, start=1):
            writer.writerow([i, gen, count])

    print(f"Original distinct templates: {len(rows)}")
    print(f"Generalized distinct templates: {len(sorted_gen)}")
    print(f"Total count: {sum(gen_counts.values())}")

    # Also print mapping for review
    print("\nGeneralized templates:")
    for i, (gen, count) in enumerate(sorted_gen, start=1):
        print(f"  {i}. [{count}] {gen}")


if __name__ == "__main__":
    main()
