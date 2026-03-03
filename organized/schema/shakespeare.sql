CREATE TABLE chapters (
  id INTEGER,
  Act INTEGER,
  Scene INTEGER,
  Description TEXT,
  work_id INTEGER,
  PRIMARY KEY (id)
);

CREATE TABLE characters (
  id INTEGER,
  CharName TEXT,
  Abbrev TEXT,
  Description TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE paragraphs (
  id INTEGER,
  ParagraphNum INTEGER,
  PlainText TEXT,
  character_id INTEGER,
  chapter_id INTEGER,
  PRIMARY KEY (id)
);

CREATE TABLE works (
  id INTEGER,
  Title TEXT,
  LongTitle TEXT,
  Date INTEGER,
  GenreType TEXT,
  PRIMARY KEY (id)
);
