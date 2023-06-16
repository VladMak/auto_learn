create database auto_learn;
create role "service.auto_learn" with superuser login password 'qwerty';

CREATE TABLE Users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE Courses (
  course_id SERIAL PRIMARY KEY,
  course_name VARCHAR(255) NOT NULL,
  course_description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE Lessons (
  lesson_id SERIAL PRIMARY KEY,
  lesson_name VARCHAR(255) NOT NULL,
  lesson_description TEXT NOT NULL,
  course_id INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Questions (
  question_id SERIAL PRIMARY KEY,
  question_text TEXT NOT NULL,
  lesson_id INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY (lesson_id) REFERENCES Lessons(lesson_id)
);

CREATE TABLE Answers (
  answer_id SERIAL PRIMARY KEY,
  answer_text TEXT NOT NULL,
  question_id INTEGER NOT NULL,
  is_correct BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY (question_id) REFERENCES Questions(question_id)
);

CREATE TABLE Progress (
  progress_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  lesson_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  answer_id INTEGER NOT NULL,
  is_correct BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (lesson_id) REFERENCES Lessons(lesson_id),
  FOREIGN KEY (question_id) REFERENCES Questions(question_id),
  FOREIGN KEY (answer_id) REFERENCES Answers(answer_id)
);