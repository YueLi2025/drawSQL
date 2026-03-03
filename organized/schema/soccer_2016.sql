CREATE TABLE Batting_Style (
  Batting_Id INTEGER,
  Batting_hand TEXT,
  PRIMARY KEY (Batting_Id)
);

CREATE TABLE Bowling_Style (
  Bowling_Id INTEGER,
  Bowling_skill TEXT,
  PRIMARY KEY (Bowling_Id)
);

CREATE TABLE City (
  City_Id INTEGER,
  City_Name TEXT,
  Country_id INTEGER,
  PRIMARY KEY (City_Id)
);

CREATE TABLE Country (
  Country_Id INTEGER,
  Country_Name TEXT,
  PRIMARY KEY (Country_Id)
);

CREATE TABLE Extra_Type (
  Extra_Id INTEGER,
  Extra_Name TEXT,
  PRIMARY KEY (Extra_Id)
);

CREATE TABLE Extra_Runs (
  Match_Id INTEGER,
  Over_Id INTEGER,
  Ball_Id INTEGER,
  Extra_Type_Id INTEGER,
  Extra_Runs INTEGER,
  Innings_No INTEGER,
  FOREIGN KEY (Extra_Type_Id) REFERENCES Extra_Type(Extra_Id)
);

CREATE TABLE Out_Type (
  Out_Id INTEGER,
  Out_Name TEXT,
  PRIMARY KEY (Out_Id)
);

CREATE TABLE Outcome (
  Outcome_Id INTEGER,
  Outcome_Type TEXT,
  PRIMARY KEY (Outcome_Id)
);

CREATE TABLE Player (
  Player_Id INTEGER,
  Player_Name TEXT,
  DOB TEXT,
  Batting_hand INTEGER,
  Bowling_skill INTEGER,
  Country_Name INTEGER,
  PRIMARY KEY (Player_Id),
  FOREIGN KEY (Batting_hand) REFERENCES Batting_Style(Batting_Id),
  FOREIGN KEY (Bowling_skill) REFERENCES Bowling_Style(Bowling_Id),
  FOREIGN KEY (Country_Name) REFERENCES Country(Country_Id)
);

CREATE TABLE Rolee (
  Role_Id INTEGER,
  Role_Desc TEXT,
  PRIMARY KEY (Role_Id)
);

CREATE TABLE Season (
  Season_Id INTEGER,
  Man_of_the_Series INTEGER,
  Orange_Cap INTEGER,
  Purple_Cap INTEGER,
  Season_Year INTEGER,
  PRIMARY KEY (Season_Id)
);

CREATE TABLE Team (
  Team_Id INTEGER,
  Team_Name TEXT,
  PRIMARY KEY (Team_Id)
);

CREATE TABLE Toss_Decision (
  Toss_Id INTEGER,
  Toss_Name TEXT,
  PRIMARY KEY (Toss_Id)
);

CREATE TABLE Umpire (
  Umpire_Id INTEGER,
  Umpire_Name TEXT,
  Umpire_Country INTEGER,
  PRIMARY KEY (Umpire_Id),
  FOREIGN KEY (Umpire_Country) REFERENCES Country(Country_Id)
);

CREATE TABLE Venue (
  Venue_Id INTEGER,
  Venue_Name TEXT,
  City_Id INTEGER,
  PRIMARY KEY (Venue_Id),
  FOREIGN KEY (City_Id) REFERENCES City(City_Id)
);

CREATE TABLE Win_By (
  Win_Id INTEGER,
  Win_Type TEXT,
  PRIMARY KEY (Win_Id)
);

CREATE TABLE Match (
  Match_Id INTEGER,
  Team_1 INTEGER,
  Team_2 INTEGER,
  Match_Date TEXT,
  Season_Id INTEGER,
  Venue_Id INTEGER,
  Toss_Winner INTEGER,
  Toss_Decide INTEGER,
  Win_Type INTEGER,
  Win_Margin INTEGER,
  Outcome_type INTEGER,
  Match_Winner INTEGER,
  Man_of_the_Match INTEGER,
  PRIMARY KEY (Match_Id),
  FOREIGN KEY (Team_1) REFERENCES Team(Team_Id),
  FOREIGN KEY (Team_2) REFERENCES Team(Team_Id),
  FOREIGN KEY (Season_Id) REFERENCES Season(Season_Id),
  FOREIGN KEY (Venue_Id) REFERENCES Venue(Venue_Id),
  FOREIGN KEY (Toss_Winner) REFERENCES Team(Team_Id),
  FOREIGN KEY (Toss_Decide) REFERENCES Toss_Decision(Toss_Id),
  FOREIGN KEY (Win_Type) REFERENCES Win_By(Win_Id),
  FOREIGN KEY (Outcome_type) REFERENCES Out_Type(Out_Id),
  FOREIGN KEY (Match_Winner) REFERENCES Team(Team_Id),
  FOREIGN KEY (Man_of_the_Match) REFERENCES Player(Player_Id)
);

CREATE TABLE Ball_by_Ball (
  Match_Id INTEGER,
  Over_Id INTEGER,
  Ball_Id INTEGER,
  Innings_No INTEGER,
  Team_Batting INTEGER,
  Team_Bowling INTEGER,
  Striker_Batting_Position INTEGER,
  Striker INTEGER,
  Non_Striker INTEGER,
  Bowler INTEGER,
  FOREIGN KEY (Match_Id) REFERENCES Match(Match_Id)
);

CREATE TABLE Batsman_Scored (
  Match_Id INTEGER,
  Over_Id INTEGER,
  Ball_Id INTEGER,
  Runs_Scored INTEGER,
  Innings_No INTEGER,
  FOREIGN KEY (Match_Id) REFERENCES Match(Match_Id)
);

CREATE TABLE Player_Match (
  Match_Id INTEGER,
  Player_Id INTEGER,
  Role_Id INTEGER,
  Team_Id INTEGER,
  FOREIGN KEY (Match_Id) REFERENCES Match(Match_Id),
  FOREIGN KEY (Player_Id) REFERENCES Player(Player_Id),
  FOREIGN KEY (Role_Id) REFERENCES Rolee(Role_Id),
  FOREIGN KEY (Team_Id) REFERENCES Team(Team_Id)
);

CREATE TABLE Wicket_Taken (
  Match_Id INTEGER,
  Over_Id INTEGER,
  Ball_Id INTEGER,
  Player_Out INTEGER,
  Kind_Out INTEGER,
  Fielders INTEGER,
  Innings_No INTEGER,
  FOREIGN KEY (Match_Id) REFERENCES Match(Match_Id),
  FOREIGN KEY (Player_Out) REFERENCES Player(Player_Id),
  FOREIGN KEY (Kind_Out) REFERENCES Out_Type(Out_Id),
  FOREIGN KEY (Fielders) REFERENCES Player(Player_Id)
);
