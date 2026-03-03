CREATE TABLE lists (
  user_id INTEGER,
  list_id INTEGER,
  list_title TEXT,
  list_movie_number INTEGER,
  list_update_timestamp_utc TEXT,
  list_creation_timestamp_utc TEXT,
  list_followers INTEGER,
  list_url TEXT,
  list_comments INTEGER,
  list_description TEXT,
  list_cover_image_url TEXT,
  list_first_image_url TEXT,
  list_second_image_url TEXT,
  list_third_image_url TEXT,
  PRIMARY KEY (list_id),
  FOREIGN KEY (user_id) REFERENCES lists_users(user_id)
);

CREATE TABLE movies (
  movie_id INTEGER,
  movie_title TEXT,
  movie_release_year INTEGER,
  movie_url TEXT,
  movie_title_language TEXT,
  movie_popularity INTEGER,
  movie_image_url TEXT,
  director_id TEXT,
  director_name TEXT,
  director_url TEXT,
  PRIMARY KEY (movie_id)
);

CREATE TABLE ratings_users (
  user_id INTEGER,
  rating_date_utc TEXT,
  user_trialist INTEGER,
  user_subscriber INTEGER,
  user_avatar_image_url TEXT,
  user_cover_image_url TEXT,
  user_eligible_for_trial INTEGER,
  user_has_payment_method INTEGER,
  FOREIGN KEY (user_id) REFERENCES lists_users(user_id)
);

CREATE TABLE lists_users (
  user_id INTEGER,
  list_id INTEGER,
  list_update_date_utc TEXT,
  list_creation_date_utc TEXT,
  user_trialist INTEGER,
  user_subscriber INTEGER,
  user_avatar_image_url TEXT,
  user_cover_image_url TEXT,
  user_eligible_for_trial TEXT,
  user_has_payment_method TEXT,
  FOREIGN KEY (user_id) REFERENCES lists(user_id),
  FOREIGN KEY (list_id) REFERENCES lists(list_id)
);

CREATE TABLE ratings (
  movie_id INTEGER,
  rating_id INTEGER,
  rating_url TEXT,
  rating_score INTEGER,
  rating_timestamp_utc TEXT,
  critic TEXT,
  critic_likes INTEGER,
  critic_comments INTEGER,
  user_id INTEGER,
  user_trialist INTEGER,
  user_subscriber INTEGER,
  user_eligible_for_trial INTEGER,
  user_has_payment_method INTEGER,
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
  FOREIGN KEY (user_id) REFERENCES lists_users(user_id)
);
