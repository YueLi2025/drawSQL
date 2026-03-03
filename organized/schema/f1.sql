CREATE TABLE circuits (
    circuit_id INT(11),
    circuit_ref VARCHAR(255),
    name VARCHAR(255),
    location VARCHAR(255),
    country VARCHAR(255),
    lat FLOAT,
    lng FLOAT,
    alt INT(11),
    url VARCHAR(255)
);

CREATE TABLE constructor_results (
    constructor_results_id INT(11),
    race_id INT(11),
    constructor_id INT(11),
    points FLOAT,
    status VARCHAR(255)
);

CREATE TABLE constructor_standings (
    constructor_standings_id INT(11),
    race_id INT(11),
    constructor_id INT(11),
    points FLOAT,
    position INT(11),
    position_text VARCHAR(255),
    wins INT(11)
);

CREATE TABLE constructors (
    constructor_id INT(11),
    constructor_ref VARCHAR(255),
    name VARCHAR(255),
    nationality VARCHAR(255),
    url VARCHAR(255)
);

CREATE TABLE driver_standings (
    driver_standings_id INT(11),
    race_id INT(11),
    driver_id INT(11),
    points FLOAT,
    position INT(11),
    position_text VARCHAR(255),
    wins INT(11)
);

CREATE TABLE drivers (
    driver_id INT(11),
    driver_ref VARCHAR(255),
    number INT(11),
    code VARCHAR(3),
    forename VARCHAR(255),
    surname VARCHAR(255),
    dob DATE,
    nationality VARCHAR(255),
    url VARCHAR(255)
);

CREATE TABLE lap_times (
    race_id INT(11),
    driver_id INT(11),
    lap INT(11),
    position INT(11),
    time VARCHAR(255),
    milliseconds INT(11)
);

CREATE TABLE pit_stops (
    race_id INT(11),
    driver_id INT(11),
    stop INT(11),
    lap INT(11),
    time TIME,
    duration VARCHAR(255),
    milliseconds INT(11)
);

CREATE TABLE qualifying (
    qualify_id INT(11),
    race_id INT(11),
    driver_id INT(11),
    constructor_id INT(11),
    number INT(11),
    position INT(11),
    q1 VARCHAR(255),
    q2 VARCHAR(255),
    q3 VARCHAR(255)
);

CREATE TABLE races (
    race_id INT(11),
    year INT(11),
    round INT(11),
    circuit_id INT(11),
    name VARCHAR(255),
    date DATE,
    time TIME,
    url VARCHAR(255),
    fp1_date VARCHAR(255),
    fp1_time VARCHAR(255),
    fp2_date VARCHAR(255),
    fp2_time VARCHAR(255),
    fp3_date VARCHAR(255),
    fp3_time VARCHAR(255),
    quali_date VARCHAR(255),
    quali_time VARCHAR(255),
    sprint_date VARCHAR(255),
    sprint_time VARCHAR(255)
);

CREATE TABLE results (
    result_id INT(11),
    race_id INT(11),
    driver_id INT(11),
    constructor_id INT(11),
    number INT(11),
    grid INT(11),
    position INT(11),
    position_text VARCHAR(255),
    position_order INT(11),
    points FLOAT,
    laps INT(11),
    time VARCHAR(255),
    milliseconds INT(11),
    fastest_lap INT(11),
    rank INT(11),
    fastest_lap_time VARCHAR(255),
    fastest_lap_speed VARCHAR(255),
    status_id INT(11)
);

CREATE TABLE seasons (
    year INT(11),
    url VARCHAR(255)
);

CREATE TABLE status (
    status_id INT(11),
    status VARCHAR(255)
);

CREATE TABLE sprint_results (
    result_id INT(11),
    race_id INT(11),
    driver_id INT(11),
    constructor_id INT(11),
    number INT(11),
    grid INT(11),
    position INT(11),
    position_text VARCHAR(255),
    position_order INT(11),
    points FLOAT,
    laps INT(11),
    time VARCHAR(255),
    milliseconds INT(11),
    fastest_lap INT(11),
    fastest_lap_time VARCHAR(255),
    fastest_lap_speed VARCHAR(255),
    status_id INT(11)
);

CREATE TABLE short_grand_prix_names (
    full_name VARCHAR(255),
    short_name VARCHAR(255)
);

CREATE TABLE short_constructor_names (
    constructor_ref VARCHAR(255),
    short_name VARCHAR(255)
);

CREATE TABLE liveries (
    constructor_ref VARCHAR(255),
    start_year INT(11),
    end_year INT(11),
    primary_hex_code VARCHAR(255)
);

CREATE TABLE tdr_overrides (
    year INT(11),
    constructor_ref VARCHAR(255),
    driver_ref VARCHAR(255),
    team_driver_rank INT(11)
);

CREATE TABLE circuits_ext (
    circuit_id INT,
    circuit_ref TEXT,
    name TEXT,
    location TEXT,
    country TEXT,
    lat REAL,
    lng REAL,
    alt INT,
    url TEXT,
    last_race_year ,
    number_of_races 
);

CREATE TABLE constructors_ext (
    constructor_id INT,
    constructor_ref TEXT,
    name TEXT,
    nationality TEXT,
    url TEXT,
    short_name 
);

CREATE TABLE drivers_ext (
    driver_id INT,
    driver_ref TEXT,
    number INT,
    code ,
    forename TEXT,
    surname TEXT,
    full_name TEXT,
    dob NUM,
    nationality TEXT,
    url TEXT
);

CREATE TABLE driver_standings_ext (
    driver_standings_id INT,
    race_id INT,
    driver_id INT,
    points REAL,
    position INT,
    position_text TEXT,
    wins INT
);

CREATE TABLE lap_times_ext (
    race_id INT,
    driver_id INT,
    lap INT,
    position INT,
    time TEXT,
    milliseconds INT,
    seconds REAL,
    running_milliseconds 
);

CREATE TABLE lap_time_stats (
    race_id INT,
    driver_id INT,
    avg_milliseconds ,
    avg_seconds ,
    stdev_milliseconds ,
    stdev_seconds 
);

CREATE TABLE races_ext (
    race_id INT,
    year INT,
    round INT,
    circuit_id INT,
    name TEXT,
    date NUM,
    time NUM,
    url TEXT,
    fp1_date TEXT,
    fp1_time TEXT,
    fp2_date TEXT,
    fp2_time TEXT,
    fp3_date TEXT,
    fp3_time TEXT,
    quali_date TEXT,
    quali_time TEXT,
    sprint_date TEXT,
    sprint_time TEXT,
    is_pit_data_available ,
    short_name ,
    has_sprint ,
    max_points 
);

CREATE TABLE team_driver_ranks (
    year INT,
    constructor_id INT,
    constructor_ref TEXT,
    driver_id INT,
    driver_ref TEXT,
    team_driver_rank 
);

CREATE TABLE drives (
    year INT,
    driver_id INT,
    drive_id ,
    constructor_id INT,
    first_round INT,
    last_round INT,
    is_first_drive_of_season ,
    is_final_drive_of_season 
);

CREATE TABLE retirements (
    race_id INT,
    driver_id INT,
    lap ,
    position_order INT,
    status_id INT,
    retirement_type 
);

CREATE TABLE lap_positions (
    race_id INT,
    driver_id INT,
    lap INT,
    position INT,
    lap_type 
);