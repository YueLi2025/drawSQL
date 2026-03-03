CREATE TABLE player (
    player_id INTEGER,
    player_name TEXT,
    dob DATE,
    batting_hand TEXT,
    bowling_skill TEXT,
    country_name TEXT
);

CREATE TABLE team (
    team_id INTEGER,
    name TEXT
);

CREATE TABLE match (
    match_id INTEGER,
    team_1 INTEGER,
    team_2 INTEGER,
    match_date DATE,
    season_id INTEGER,
    venue TEXT,
    toss_winner INTEGER,
    toss_decision TEXT,
    win_type TEXT,
    win_margin INTEGER,
    outcome_type TEXT,
    match_winner INTEGER,
    man_of_the_match INTEGER
);

CREATE TABLE player_match (
    match_id INTEGER,
    player_id INTEGER,
    role TEXT,
    team_id INTEGER
);

CREATE TABLE ball_by_ball (
    match_id INTEGER,
    over_id INTEGER,
    ball_id INTEGER,
    innings_no INTEGER,
    team_batting INTEGER,
    team_bowling INTEGER,
    striker_batting_position INTEGER,
    striker INTEGER,
    non_striker INTEGER,
    bowler INTEGER
);

CREATE TABLE batsman_scored (
    match_id INTEGER,
    over_id INTEGER,
    ball_id INTEGER,
    runs_scored INTEGER,
    innings_no INTEGER
);

CREATE TABLE wicket_taken (
    match_id INTEGER,
    over_id INTEGER,
    ball_id INTEGER,
    player_out INTEGER,
    kind_out TEXT,
    innings_no INTEGER
);

CREATE TABLE extra_runs (
    match_id INTEGER,
    over_id INTEGER,
    ball_id INTEGER,
    extra_type TEXT,
    extra_runs INTEGER,
    innings_no INTEGER
);