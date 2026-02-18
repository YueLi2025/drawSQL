#!/usr/bin/env python3
"""
Combine templates from distinct_templates.csv and all_templates.csv.
Output: combined_templates.csv with id, template, count (summed for duplicates)
"""

import csv
from pathlib import Path
from collections import defaultdict


def main():
    base_dir = Path(__file__).parent
    distinct_path = base_dir / "distinct_templates.csv"
    all_path = base_dir / "all_templates.csv"
    output_path = base_dir / "combined_templates.csv"

    # template -> total count
    counts = defaultdict(int)

    # Read distinct_templates.csv (tab-delimited)
    with open(distinct_path, encoding="utf-8") as f:
        reader = csv.DictReader(f, delimiter="\t")
        for row in reader:
            template = row["template"].strip()
            if template:
                counts[template] += int(row["count"])

    # Read all_templates.csv (comma-delimited)
    with open(all_path, encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            template = row["template"].strip()
            if template:
                counts[template] += int(row["count"])

    # Write combined file, sorted by count descending
    sorted_templates = sorted(counts.items(), key=lambda x: -x[1])

    with open(output_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["id", "template", "count"])
        for i, (template, count) in enumerate(sorted_templates, start=1):
            writer.writerow([i, template, count])

    print(f"Wrote {len(sorted_templates)} templates to {output_path}")
    print(f"Total count: {sum(counts.values())}")


if __name__ == "__main__":
    main()
