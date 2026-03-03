CREATE TABLE hall_of_fame (
  player_id TEXT PRIMARY KEY,
  yearid REAL,
  votedby TEXT,
  ballots TEXT,
  needed TEXT,
  votes TEXT,
  inducted TEXT,
  category TEXT,
  needed_note TEXT
);
CREATE TABLE player_award (
  player_id TEXT PRIMARY KEY,
  award_id TEXT,
  year REAL,
  league_id TEXT,
  tie TEXT,
  notes TEXT,
  FOREIGN KEY (player_id) REFERENCES hall_of_fame(player_id)
);
CREATE TABLE player_award_vote (
  award_id TEXT,
  year REAL,
  league_id TEXT,
  player_id TEXT PRIMARY KEY,
  points_won REAL,
  points_max REAL,
  votes_first TEXT,
  FOREIGN KEY (player_id) REFERENCES hall_of_fame(player_id)
);
CREATE TABLE salary (
  year REAL,
  team_id TEXT,
  league_id TEXT,
  player_id TEXT PRIMARY KEY,
  salary REAL,
  FOREIGN KEY (player_id) REFERENCES hall_of_fame(player_id)
);
CREATE TABLE player (
  player_id TEXT PRIMARY KEY,
  birth_year TEXT,
  birth_month TEXT,
  birth_day TEXT,
  birth_country TEXT,
  birth_state TEXT,
  birth_city TEXT,
  death_year TEXT,
  death_month TEXT,
  death_day TEXT,
  death_country TEXT,
  death_state TEXT,
  death_city TEXT,
  name_first TEXT,
  name_last TEXT,
  name_given TEXT,
  weight TEXT,
  FOREIGN KEY (player_id) REFERENCES hall_of_fame(player_id)
);
