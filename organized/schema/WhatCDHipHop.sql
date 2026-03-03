CREATE TABLE tags (
  "index" REAL,
  id REAL PRIMARY KEY,
  tag TEXT
);
CREATE TABLE torrents (
  groupName TEXT,
  totalSnatched REAL,
  artist TEXT,
  groupYear REAL,
  releaseType TEXT,
  groupId REAL,
  id REAL PRIMARY KEY,
  FOREIGN KEY (id) REFERENCES tags(id)
);
