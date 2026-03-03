CREATE TABLE Method (
  Id INTEGER,
  Name TEXT,
  FullComment TEXT,
  Summary TEXT,
  ApiCalls TEXT,
  CommentIsXml INTEGER,
  SampledAt INTEGER,
  SolutionId INTEGER,
  Lang TEXT,
  NameTokenized TEXT,
  PRIMARY KEY (Id)
);

CREATE TABLE MethodParameter (
  Id INTEGER,
  MethodId TEXT,
  Type TEXT,
  Name TEXT,
  PRIMARY KEY (Id)
);

CREATE TABLE Repo (
  Id INTEGER,
  Url TEXT,
  Stars INTEGER,
  Forks INTEGER,
  Watchers INTEGER,
  ProcessedTime INTEGER,
  PRIMARY KEY (Id)
);

CREATE TABLE Solution (
  Id INTEGER,
  RepoId INTEGER,
  Path TEXT,
  ProcessedTime INTEGER,
  WasCompiled INTEGER,
  PRIMARY KEY (Id)
);
