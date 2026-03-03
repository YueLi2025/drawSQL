CREATE TABLE torrents (
  groupName TEXT,
  totalSnatched INTEGER,
  artist TEXT,
  groupYear INTEGER,
  releaseType TEXT,
  groupId INTEGER,
  id INTEGER,
  PRIMARY KEY (id)
);

CREATE TABLE tags (
  "index" INTEGER,
  id INTEGER,
  tag TEXT,
  PRIMARY KEY ("index")
);
