CREATE TABLE cites (
  cited_paper_id TEXT,
  citing_paper_id TEXT
);

CREATE TABLE paper (
  paper_id TEXT,
  class_label TEXT,
  PRIMARY KEY (paper_id)
);

CREATE TABLE content (
  paper_id TEXT,
  word_cited_id TEXT,
  FOREIGN KEY (paper_id) REFERENCES paper(paper_id)
);
