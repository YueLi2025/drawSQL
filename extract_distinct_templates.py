#!/usr/bin/env python3
"""
Extract distinct templates from sql_templates.csv with counts.
Output: distinct_templates.csv with template, count
"""

import csv
from pathlib import Path
from collections import Counter


def main():
    base_dir = Path(__file__).parent
    input_path = base_dir / "all_sql_queries.csv"
    output_path = base_dir / "distinct_templates.csv"

    templates = []
    with open(input_path, encoding="utf-8") as f:
        reader = csv.DictReader(f, delimiter="\t")
        for row in reader:
            templates.append(row["template"])

    counts = Counter(templates)

    with open(output_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f, delimiter="\t", quoting=csv.QUOTE_NONE, escapechar="\\")
        writer.writerow(["template", "count"])
        for template, count in counts.most_common():
            writer.writerow([template.replace("\t", " "), count])

    print(f"Wrote {len(counts)} distinct templates to {output_path}")
    print(f"Total rows: {sum(counts.values())}")


if __name__ == "__main__":
    main()
