DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS teachers CASCADE;
DROP TABLE IF EXISTS services CASCADE;
DROP TABLE IF EXISTS teachers_services CASCADE;
DROP TABLE IF EXISTS students_teachers_services CASCADE;

CREATE TABLE students(
    id               SERIAL PRIMARY KEY,
    first_name       VARCHAR(20) NOT NULL,
    last_name        VARCHAR(20) NOT NULL,
    born_year        SMALLINT NOT NULL CONSTRAINT positive_age CHECK (born_year > 0)
);

CREATE TABLE teachers(
   id               SERIAL PRIMARY KEY,
   first_name       VARCHAR(20) NOT NULL,
   last_name        VARCHAR(20) NOT NULL,
   born_year        SMALLINT NOT NULL CONSTRAINT positive_age CHECK (born_year > 0),
   experience	    SMALLINT NOT NULL CONSTRAINT positive_experience CHECK (experience > 0)
);

CREATE TABLE subjects(
   id               SERIAL PRIMARY KEY,
   name             VARCHAR(20) NOT NULL
);

CREATE TABLE teachers_subjects(
   id               SERIAL PRIMARY KEY,
   id_teacher       INT REFERENCES teachers (id),
   id_subject       INT REFERENCES subjects (id)
);

CREATE TABLE services(
    id               SERIAL PRIMARY KEY,
    name             VARCHAR(50) NOT NULL
);

CREATE TABLE teachers_services(
   id               SERIAL PRIMARY KEY,
   id_teacher       INT REFERENCES teachers (id),
   id_service       INT REFERENCES services (id),
   price            SMALLINT NOT NULL CONSTRAINT positive_price CHECK (price > 0)
);

CREATE TABLE students_teachers_setvices(
   id                    SERIAL PRIMARY KEY,
   id_student            INT REFERENCES students (id),
   id_teacher_service    VARCHAR(50) NOT NULL
);
