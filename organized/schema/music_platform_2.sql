CREATE TABLE runs (
  run_at TEXT,
  max_rowid INTEGER,
  reviews_added INTEGER
);

CREATE TABLE podcasts (
  podcast_id TEXT,
  itunes_id INTEGER,
  slug TEXT,
  itunes_url TEXT,
  title TEXT,
  PRIMARY KEY (podcast_id)
);

CREATE TABLE reviews (
  podcast_id TEXT,
  title TEXT,
  content TEXT,
  rating INTEGER,
  author_id TEXT,
  created_at TEXT
);

CREATE TABLE categories (
  podcast_id TEXT,
  category TEXT
);
