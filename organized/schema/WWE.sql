CREATE TABLE Promotions (
    id INTEGER,
    name TEXT
);

CREATE TABLE sqlite_sequence (
    name ,
    seq 
);

CREATE TABLE Tables (
    id INTEGER,
    html TEXT,
    url TEXT
);

CREATE TABLE Cards (
    id INTEGER,
    table_id INTEGER,
    location_id INTEGER,
    promotion_id INTEGER,
    event_date TEXT,
    event_id INTEGER,
    url TEXT,
    info_html TEXT,
    match_html TEXT
);

CREATE TABLE Locations (
    id INTEGER,
    name TEXT
);

CREATE TABLE Events (
    id INTEGER,
    name TEXT
);

CREATE TABLE Matches (
    id INTEGER,
    card_id INTEGER,
    winner_id TEXT,
    win_type TEXT,
    loser_id TEXT,
    match_type_id TEXT,
    duration TEXT,
    title_id TEXT,
    title_change INTEGER
);

CREATE TABLE Belts (
    id INTEGER,
    name TEXT
);

CREATE TABLE Wrestlers (
    id INTEGER,
    name 
);

CREATE TABLE Match_Types (
    id INTEGER,
    name TEXT
);