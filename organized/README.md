# Organized data

This folder contains schema, soft/hard templates, SQL queries, NL questions, and variable lists.

## Large files not in repo (GitHub 100MB limit)

The following schema files are **excluded** from this repo because they exceed GitHub’s file size limit:

- `schema/soccer_1.sql` (~307 MB)
- `schema/baseball_1.sql` (~55 MB)

They remain in your local `organized` folder. To add them to the repo later with [Git LFS](https://git-lfs.github.com):

```bash
git lfs install
git lfs track "organized/schema/soccer_1.sql" "organized/schema/baseball_1.sql"
git add .gitattributes organized/schema/soccer_1.sql organized/schema/baseball_1.sql
git commit -m "Add large schema files via Git LFS"
git push origin main
```
