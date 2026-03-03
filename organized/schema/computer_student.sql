CREATE TABLE course (
  course_id INTEGER,
  courseLevel TEXT,
  PRIMARY KEY (course_id)
);

CREATE TABLE person (
  p_id INTEGER,
  professor INTEGER,
  student INTEGER,
  hasPosition TEXT,
  inPhase TEXT,
  yearsInProgram TEXT,
  PRIMARY KEY (p_id)
);

CREATE TABLE advisedBy (
  p_id INTEGER,
  p_id_dummy INTEGER,
  FOREIGN KEY (p_id) REFERENCES person(p_id),
  FOREIGN KEY (p_id_dummy) REFERENCES person(p_id)
);

CREATE TABLE taughtBy (
  course_id INTEGER,
  p_id INTEGER,
  FOREIGN KEY (course_id) REFERENCES course(course_id),
  FOREIGN KEY (p_id) REFERENCES person(p_id)
);
