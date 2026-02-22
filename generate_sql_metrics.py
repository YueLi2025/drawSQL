#!/usr/bin/env python3
"""
Calculate SQL complexity metrics for each query using the template column.
Output: sql_metrics.csv
"""

import csv
import re
import sys

csv.field_size_limit(sys.maxsize)


def count_tables(template):
    """Count distinct table references (table_name occurrences in FROM/JOIN)."""
    # Count FROM table_name and JOIN table_name
    froms = re.findall(r'\bFROM\s+\w+', template, re.I)
    joins = re.findall(r'\bJOIN\s+\w+', template, re.I)
    return len(froms) + len(joins)


def count_joins(template):
    """Count JOIN keywords."""
    return len(re.findall(r'\bJOIN\b', template, re.I))


def count_subqueries(template):
    """Count subqueries by counting SELECT keywords minus 1 (the outermost)."""
    selects = len(re.findall(r'\bSELECT\b', template, re.I))
    return max(0, selects - 1)


def max_nesting_depth(template):
    """Calculate maximum parenthesis nesting depth."""
    depth = 0
    max_depth = 0
    for ch in template:
        if ch == '(':
            depth += 1
            max_depth = max(max_depth, depth)
        elif ch == ')':
            depth -= 1
    return max_depth


def count_aggs_group_by(template):
    """Count aggregate functions + GROUP BY clauses."""
    aggs = len(re.findall(r'\b(COUNT|SUM|AVG|MAX|MIN|TOTAL|GROUP_CONCAT)\s*\(', template, re.I))
    group_bys = len(re.findall(r'\bGROUP\s+BY\b', template, re.I))
    return aggs + group_bys


def count_advanced_features(template):
    """Count window functions, FILTER, set operations, CTEs."""
    count = 0
    # Window functions: OVER(
    count += len(re.findall(r'\bOVER\s*\(', template, re.I))
    # ROW_NUMBER, RANK, DENSE_RANK, NTILE, LAG, LEAD, FIRST_VALUE, LAST_VALUE
    count += len(re.findall(r'\b(ROW_NUMBER|RANK|DENSE_RANK|NTILE|LAG|LEAD|FIRST_VALUE|LAST_VALUE|PERCENT_RANK|CUME_DIST)\b', template, re.I))
    # PERCENTILE
    count += len(re.findall(r'\bPERCENTILE\b', template, re.I))
    # FILTER clause
    count += len(re.findall(r'\bFILTER\s*\(', template, re.I))
    # Set operations: UNION, INTERSECT, EXCEPT
    count += len(re.findall(r'\b(UNION|INTERSECT|EXCEPT)\b', template, re.I))
    # CTEs: WITH ... AS
    count += len(re.findall(r'\bWITH\b', template, re.I))
    return count


def main():
    input_path = "all_sql_queries.csv"
    output_path = "sql_metrics.csv"

    rows = []
    with open(input_path, encoding="utf-8") as f:
        reader = csv.DictReader(f, delimiter="\t")
        for row in reader:
            template = row["template"]
            rows.append({
                "database_name": row["database_name"],
                "id": row["id"],
                "difficulty_tier": row["difficulty_tier"],
                "Num_tables": count_tables(template),
                "Num_joins": count_joins(template),
                "Num_subqueries": count_subqueries(template),
                "Max_nesting_depth": max_nesting_depth(template),
                "Num_aggs_plus_group_by": count_aggs_group_by(template),
                "Advanced_feature_count": count_advanced_features(template),
            })

    with open(output_path, "w", newline="", encoding="utf-8") as f:
        fields = ["database_name", "id", "difficulty_tier",
                  "Num_tables", "Num_joins", "Num_subqueries",
                  "Max_nesting_depth", "Num_aggs_plus_group_by",
                  "Advanced_feature_count"]
        writer = csv.writer(f, delimiter="\t", quoting=csv.QUOTE_NONE, escapechar="\\")
        writer.writerow(fields)
        for r in rows:
            writer.writerow([r[f] for f in fields])

    print(f"Wrote {len(rows)} rows to {output_path}")

    # Summary stats by difficulty
    for diff in ["EASY", "MEDIUM", "HARD"]:
        subset = [r for r in rows if r["difficulty_tier"] == diff]
        if not subset:
            continue
        n = len(subset)
        print(f"\n{diff} (n={n}):")
        for metric in ["Num_tables", "Num_joins", "Num_subqueries",
                        "Max_nesting_depth", "Num_aggs_plus_group_by",
                        "Advanced_feature_count"]:
            vals = [r[metric] for r in subset]
            avg = sum(vals) / n
            print(f"  {metric}: avg={avg:.2f}, min={min(vals)}, max={max(vals)}")


if __name__ == "__main__":
    main()
