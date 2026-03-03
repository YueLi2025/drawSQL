CREATE TABLE playstore (
  App TEXT,
  Category TEXT,
  Rating REAL,
  Reviews INTEGER,
  Size TEXT,
  Installs TEXT,
  Type TEXT,
  Price TEXT,
  "Content Rating" TEXT,
  Genres TEXT
);

CREATE TABLE user_reviews (
  App TEXT,
  Translated_Review TEXT,
  Sentiment TEXT,
  Sentiment_Polarity TEXT,
  Sentiment_Subjectivity TEXT,
  FOREIGN KEY (App) REFERENCES playstore(App)
);
