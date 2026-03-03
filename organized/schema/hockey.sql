CREATE TABLE AwardsMisc (
  name TEXT,
  ID TEXT,
  award TEXT,
  year INTEGER,
  lgID TEXT,
  note TEXT,
  PRIMARY KEY (name)
);

CREATE TABLE HOF (
  year INTEGER,
  hofID TEXT,
  name TEXT,
  category TEXT,
  PRIMARY KEY (hofID)
);

CREATE TABLE Teams (
  year INTEGER,
  lgID TEXT,
  tmID TEXT,
  franchID TEXT,
  confID TEXT,
  divID TEXT,
  rank INTEGER,
  playoff TEXT,
  G INTEGER,
  W INTEGER,
  L INTEGER,
  T INTEGER,
  OTL TEXT,
  Pts INTEGER,
  SoW TEXT,
  SoL TEXT,
  GF INTEGER,
  GA INTEGER,
  name TEXT,
  PIM TEXT,
  BenchMinor TEXT,
  PPG TEXT,
  PPC TEXT,
  SHA TEXT,
  PKG TEXT,
  PKC TEXT,
  SHF TEXT
);

CREATE TABLE Coaches (
  coachID TEXT,
  year INTEGER,
  tmID TEXT,
  lgID TEXT,
  stint INTEGER,
  notes TEXT,
  g INTEGER,
  w INTEGER,
  l INTEGER,
  t INTEGER,
  postg TEXT,
  postw TEXT,
  postl TEXT,
  postt TEXT,
  FOREIGN KEY (year) REFERENCES Teams(year),
  FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE AwardsCoaches (
  coachID TEXT,
  award TEXT,
  year INTEGER,
  lgID TEXT,
  note TEXT,
  FOREIGN KEY (coachID) REFERENCES Coaches(coachID)
);

CREATE TABLE Master (
  playerID TEXT,
  coachID TEXT,
  hofID TEXT,
  firstName TEXT,
  lastName TEXT,
  nameNote TEXT,
  nameGiven TEXT,
  nameNick TEXT,
  height TEXT,
  weight TEXT,
  shootCatch TEXT,
  legendsID TEXT,
  ihdbID TEXT,
  hrefID TEXT,
  firstNHL TEXT,
  lastNHL TEXT,
  firstWHA TEXT,
  lastWHA TEXT,
  pos TEXT,
  birthYear TEXT,
  birthMon TEXT,
  birthDay TEXT,
  birthCountry TEXT,
  birthState TEXT,
  birthCity TEXT,
  deathYear TEXT,
  deathMon TEXT,
  deathDay TEXT,
  deathCountry TEXT,
  deathState TEXT,
  deathCity TEXT,
  FOREIGN KEY (coachID) REFERENCES Coaches(coachID)
);

CREATE TABLE AwardsPlayers (
  playerID TEXT,
  award TEXT,
  year INTEGER,
  lgID TEXT,
  note TEXT,
  pos TEXT,
  FOREIGN KEY (playerID) REFERENCES Master(playerID)
);

CREATE TABLE CombinedShutouts (
  year INTEGER,
  month INTEGER,
  date INTEGER,
  tmID TEXT,
  oppID TEXT,
  R/P TEXT,
  IDgoalie1 TEXT,
  IDgoalie2 TEXT,
  FOREIGN KEY (IDgoalie1) REFERENCES Master(playerID),
  FOREIGN KEY (IDgoalie2) REFERENCES Master(playerID)
);

CREATE TABLE Goalies (
  playerID TEXT,
  year INTEGER,
  stint INTEGER,
  tmID TEXT,
  lgID TEXT,
  GP TEXT,
  Min TEXT,
  W TEXT,
  L TEXT,
  T/OL TEXT,
  ENG TEXT,
  SHO TEXT,
  GA TEXT,
  SA TEXT,
  PostGP TEXT,
  PostMin TEXT,
  PostW TEXT,
  PostL TEXT,
  PostT TEXT,
  PostENG TEXT,
  PostSHO TEXT,
  PostGA TEXT,
  PostSA TEXT,
  FOREIGN KEY (playerID) REFERENCES Master(playerID),
  FOREIGN KEY (year) REFERENCES Teams(year),
  FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE GoaliesSC (
  playerID TEXT,
  year INTEGER,
  tmID TEXT,
  lgID TEXT,
  GP INTEGER,
  Min INTEGER,
  W INTEGER,
  L INTEGER,
  T INTEGER,
  SHO INTEGER,
  GA INTEGER,
  FOREIGN KEY (playerID) REFERENCES Master(playerID),
  FOREIGN KEY (year) REFERENCES Teams(year),
  FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE GoaliesShootout (
  playerID TEXT,
  year INTEGER,
  stint INTEGER,
  tmID TEXT,
  W INTEGER,
  L INTEGER,
  SA INTEGER,
  GA INTEGER,
  FOREIGN KEY (playerID) REFERENCES Master(playerID),
  FOREIGN KEY (year) REFERENCES Teams(year),
  FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE Scoring (
  playerID TEXT,
  year INTEGER,
  stint INTEGER,
  tmID TEXT,
  lgID TEXT,
  pos TEXT,
  GP INTEGER,
  G INTEGER,
  A INTEGER,
  Pts INTEGER,
  PIM INTEGER,
  "+/-" TEXT,
  PPG TEXT,
  PPA TEXT,
  SHG TEXT,
  SHA TEXT,
  GWG TEXT,
  GTG TEXT,
  SOG TEXT,
  PostGP TEXT,
  PostG TEXT,
  PostA TEXT,
  PostPts TEXT,
  PostPIM TEXT,
  "Post+/-" TEXT,
  PostPPG TEXT,
  PostPPA TEXT,
  PostSHG TEXT,
  PostSHA TEXT,
  PostGWG TEXT,
  PostSOG TEXT,
  FOREIGN KEY (playerID) REFERENCES Master(playerID),
  FOREIGN KEY (year) REFERENCES Teams(year),
  FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE ScoringSC (
  playerID TEXT,
  year INTEGER,
  tmID TEXT,
  lgID TEXT,
  pos TEXT,
  GP INTEGER,
  G INTEGER,
  A INTEGER,
  Pts INTEGER,
  PIM INTEGER,
  FOREIGN KEY (playerID) REFERENCES Master(playerID),
  FOREIGN KEY (year) REFERENCES Teams(year),
  FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE ScoringShootout (
  playerID TEXT,
  year INTEGER,
  stint INTEGER,
  tmID TEXT,
  S INTEGER,
  G INTEGER,
  GDG INTEGER,
  FOREIGN KEY (playerID) REFERENCES Master(playerID),
  FOREIGN KEY (year) REFERENCES Teams(year),
  FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE ScoringSup (
  playerID TEXT,
  year INTEGER,
  PPA TEXT,
  SHA TEXT,
  FOREIGN KEY (playerID) REFERENCES Master(playerID)
);

CREATE TABLE SeriesPost (
  year INTEGER,
  round TEXT,
  series TEXT,
  tmIDWinner TEXT,
  lgIDWinner TEXT,
  tmIDLoser TEXT,
  lgIDLoser TEXT,
  W INTEGER,
  L INTEGER,
  T INTEGER,
  GoalsWinner INTEGER,
  GoalsLoser INTEGER,
  note TEXT,
  FOREIGN KEY (year) REFERENCES Teams(year),
  FOREIGN KEY (tmIDWinner) REFERENCES Teams(tmID),
  FOREIGN KEY (tmIDLoser) REFERENCES Teams(tmID)
);

CREATE TABLE TeamSplits (
  year INTEGER,
  lgID TEXT,
  tmID TEXT,
  hW INTEGER,
  hL INTEGER,
  hT INTEGER,
  hOTL TEXT,
  rW INTEGER,
  rL INTEGER,
  rT INTEGER,
  rOTL TEXT,
  SepW TEXT,
  SepL TEXT,
  SepT TEXT,
  SepOL TEXT,
  OctW TEXT,
  OctL TEXT,
  OctT TEXT,
  OctOL TEXT,
  NovW TEXT,
  NovL TEXT,
  NovT TEXT,
  NovOL TEXT,
  DecW TEXT,
  DecL TEXT,
  DecT TEXT,
  DecOL TEXT,
  JanW INTEGER,
  JanL INTEGER,
  JanT INTEGER,
  JanOL TEXT,
  FebW INTEGER,
  FebL INTEGER,
  FebT INTEGER,
  FebOL TEXT,
  MarW TEXT,
  MarL TEXT,
  MarT TEXT,
  MarOL TEXT,
  AprW TEXT,
  AprL TEXT,
  AprT TEXT,
  AprOL TEXT,
  FOREIGN KEY (year) REFERENCES Teams(year),
  FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE TeamVsTeam (
  year INTEGER,
  lgID TEXT,
  tmID TEXT,
  oppID TEXT,
  W INTEGER,
  L INTEGER,
  T INTEGER,
  OTL TEXT,
  FOREIGN KEY (year) REFERENCES Teams(year),
  FOREIGN KEY (tmID) REFERENCES Teams(tmID),
  FOREIGN KEY (oppID) REFERENCES Teams(tmID)
);

CREATE TABLE TeamsHalf (
  year INTEGER,
  lgID TEXT,
  tmID TEXT,
  half INTEGER,
  rank INTEGER,
  G INTEGER,
  W INTEGER,
  L INTEGER,
  T INTEGER,
  GF INTEGER,
  GA INTEGER,
  FOREIGN KEY (year) REFERENCES Teams(year),
  FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE TeamsPost (
  year INTEGER,
  lgID TEXT,
  tmID TEXT,
  G INTEGER,
  W INTEGER,
  L INTEGER,
  T INTEGER,
  GF INTEGER,
  GA INTEGER,
  PIM TEXT,
  BenchMinor TEXT,
  PPG TEXT,
  PPC TEXT,
  SHA TEXT,
  PKG TEXT,
  PKC TEXT,
  SHF TEXT,
  FOREIGN KEY (year) REFERENCES Teams(year),
  FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE TeamsSC (
  year INTEGER,
  lgID TEXT,
  tmID TEXT,
  G INTEGER,
  W INTEGER,
  L INTEGER,
  T INTEGER,
  GF INTEGER,
  GA INTEGER,
  PIM TEXT,
  FOREIGN KEY (year) REFERENCES Teams(year),
  FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE abbrev (
  Type TEXT,
  Code TEXT,
  Fullname TEXT
);
