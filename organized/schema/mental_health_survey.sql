CREATE TABLE Question (
  questiontext TEXT,
  questionid INTEGER,
  PRIMARY KEY (questionid)
);

CREATE TABLE Survey (
  SurveyID INTEGER,
  Description TEXT,
  PRIMARY KEY (SurveyID)
);

CREATE TABLE Answer (
  AnswerText TEXT,
  SurveyID INTEGER,
  UserID INTEGER,
  QuestionID INTEGER
);
