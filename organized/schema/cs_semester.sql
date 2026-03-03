CREATE TABLE course (
  course_id INTEGER,
  name TEXT,
  credit INTEGER,
  diff INTEGER,
  PRIMARY KEY (course_id)
);

CREATE TABLE prof (
  prof_id INTEGER,
  gender TEXT,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  popularity INTEGER,
  teachingability INTEGER,
  graduate_from TEXT,
  PRIMARY KEY (prof_id)
);

CREATE TABLE RA (
  student_id INTEGER,
  capability INTEGER,
  prof_id INTEGER,
  salary TEXT,
  FOREIGN KEY (student_id) REFERENCES student(student_id),
  FOREIGN KEY (prof_id) REFERENCES prof(prof_id)
);

CREATE TABLE registration (
  course_id INTEGER,
  student_id INTEGER,
  grade TEXT,
  sat INTEGER,
  FOREIGN KEY (course_id) REFERENCES course(course_id),
  FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE student (
  student_id INTEGER,
  f_name TEXT,
  l_name TEXT,
  phone_number TEXT,
  email TEXT,
  intelligence INTEGER,
  gpa REAL,
  type TEXT,
  PRIMARY KEY (student_id)
);
