CREATE TABLE langs (
  lid INTEGER,
  lang TEXT,
  locale TEXT,
  pages INTEGER,
  words INTEGER,
  PRIMARY KEY (lid)
);

CREATE TABLE pages (
  pid INTEGER,
  lid INTEGER,
  page INTEGER,
  revision INTEGER,
  title TEXT,
  words INTEGER,
  PRIMARY KEY (pid),
  FOREIGN KEY (lid) REFERENCES langs(lid)
);

CREATE TABLE words (
  wid INTEGER,
  word TEXT,
  occurrences INTEGER,
  PRIMARY KEY (wid)
);

CREATE TABLE langs_words (
  lid INTEGER,
  wid INTEGER,
  occurrences INTEGER,
  FOREIGN KEY (lid) REFERENCES langs(lid),
  FOREIGN KEY (wid) REFERENCES words(wid)
);

CREATE TABLE pages_words (
  pid INTEGER,
  wid INTEGER,
  occurrences INTEGER,
  FOREIGN KEY (pid) REFERENCES pages(pid),
  FOREIGN KEY (wid) REFERENCES words(wid)
);

CREATE TABLE biwords (
  lid INTEGER,
  w1st INTEGER,
  w2nd INTEGER,
  occurrences INTEGER,
  FOREIGN KEY (lid) REFERENCES langs(lid),
  FOREIGN KEY (w1st) REFERENCES words(wid),
  FOREIGN KEY (w2nd) REFERENCES words(wid)
);
