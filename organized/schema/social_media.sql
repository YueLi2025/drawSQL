CREATE TABLE location (
  LocationID INTEGER,
  Country TEXT,
  State TEXT,
  StateCode TEXT,
  City TEXT,
  PRIMARY KEY (LocationID)
);

CREATE TABLE user (
  UserID TEXT,
  Gender TEXT,
  PRIMARY KEY (UserID)
);

CREATE TABLE twitter (
  TweetID TEXT,
  Weekday TEXT,
  Hour INTEGER,
  Day INTEGER,
  Lang TEXT,
  IsReshare TEXT,
  Reach INTEGER,
  RetweetCount INTEGER,
  Likes INTEGER,
  Klout INTEGER,
  Sentiment REAL,
  text TEXT,
  LocationID INTEGER,
  UserID TEXT,
  PRIMARY KEY (TweetID),
  FOREIGN KEY (LocationID) REFERENCES location(LocationID),
  FOREIGN KEY (UserID) REFERENCES user(UserID)
);
