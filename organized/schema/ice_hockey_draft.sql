CREATE TABLE height_info (
  height_id INTEGER,
  height_in_cm INTEGER,
  height_in_inch TEXT,
  PRIMARY KEY (height_id)
);

CREATE TABLE weight_info (
  weight_id INTEGER,
  weight_in_kg INTEGER,
  weight_in_lbs INTEGER,
  PRIMARY KEY (weight_id)
);

CREATE TABLE PlayerInfo (
  ELITEID INTEGER,
  PlayerName TEXT,
  birthdate TEXT,
  birthyear TEXT,
  birthmonth INTEGER,
  birthday INTEGER,
  birthplace TEXT,
  nation TEXT,
  height INTEGER,
  weight INTEGER,
  position_info TEXT,
  shoots TEXT,
  draftyear INTEGER,
  draftround INTEGER,
  overall INTEGER,
  overallby TEXT,
  CSS_rank INTEGER,
  sum_7yr_GP INTEGER,
  sum_7yr_TOI INTEGER,
  GP_greater_than_0 TEXT,
  PRIMARY KEY (ELITEID),
  FOREIGN KEY (height) REFERENCES height_info(height_id),
  FOREIGN KEY (weight) REFERENCES weight_info(weight_id)
);

CREATE TABLE SeasonStatus (
  ELITEID INTEGER,
  SEASON TEXT,
  TEAM TEXT,
  LEAGUE TEXT,
  GAMETYPE TEXT,
  GP INTEGER,
  G INTEGER,
  A INTEGER,
  P INTEGER,
  PIM INTEGER,
  PLUSMINUS INTEGER,
  FOREIGN KEY (ELITEID) REFERENCES PlayerInfo(ELITEID)
);
