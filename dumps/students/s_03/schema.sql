DROP TABLE IF EXISTS clients CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS services CASCADE;
DROP TABLE IF EXISTS promotions CASCADE;
DROP TABLE IF EXISTS vacations CASCADE;
DROP TABLE IF EXISTS shifts CASCADE;
DROP TABLE IF EXISTS employees_shifts CASCADE;
DROP TABLE IF EXISTS promotions_services CASCADE;
DROP TABLE IF EXISTS skills CASCADE;
DROP TABLE IF EXISTS services_skills CASCADE;
DROP TABLE IF EXISTS employees_skills CASCADE;

CREATE TABLE clients(
  id                  SERIAL PRIMARY KEY,
  first_name          VARCHAR(50) NOT NULL,
  last_name           VARCHAR(50) NOT NULL,
  date_of_birth       DATE,  /* client have the right to refuse disclosing her DOB */
  phone_number        VARCHAR(12),
  email               VARCHAR(50),
  personal_discount   SMALLINT CONSTRAINT discount CHECK (personal_discount >= 0 AND personal_discount <= 100)
);

CREATE TABLE services(
  id                  SERIAL PRIMARY KEY,
  title               VARCHAR(30) NOT NULL,
  description         TEXT NOT NULL,
  price               MONEY NOT NULL
);

CREATE TABLE promotions(
  id                  SERIAL PRIMARY KEY,
  title               VARCHAR(30) NOT NULL,
  description         TEXT NOT NULL,
  start_date          DATE NOT NULL,
  end_date            DATE  /* some promotional offers may last an indefinitely long time */
);


CREATE TABLE promotions_services(
  id                  SERIAL PRIMARY KEY,
  promotion_id        INT REFERENCES promotions (id),
  service_id          INT REFERENCES services (id),
  promo_discount      SMALLINT CONSTRAINT discount CHECK (promo_discount >= 0 AND promo_discount <= 100)
);

CREATE TABLE employees(
  id                  SERIAL PRIMARY KEY,
  first_name          VARCHAR(50) NOT NULL,
  last_name           VARCHAR(50) NOT NULL,
  date_of_birth       DATE NOT NULL,
  phone_number        VARCHAR(12),
  hourly_rate         MONEY NOT NULL
);

CREATE TABLE skills(
  id                  SERIAL PRIMARY KEY,
  title               VARCHAR(30) NOT NULL,
  description         TEXT NOT NULL
);

CREATE TABLE services_skills(
  id                  SERIAL PRIMARY KEY,
  service_id          INT REFERENCES services (id),
  skill_id            INT REFERENCES skills (id)
);

CREATE TABLE employees_skills(
  id                  SERIAL PRIMARY KEY,
  employee_id          INT REFERENCES employees (id),
  skill_id            INT REFERENCES skills (id),
  skill_level         SMALLINT CONSTRAINT skill_level CHECK (skill_level >= 0 AND skill_level <= 10)
);

CREATE TABLE vacations(
  id                  SERIAL PRIMARY KEY,
  employee_id         INT REFERENCES employees (id),
  start_date          DATE NOT NULL,
  end_date            DATE  /* if an amployee is sick */
);

CREATE TABLE shifts(
  id                  SERIAL PRIMARY KEY,
  start_datetime      DATE NOT NULL,
  end_datetime        DATE NOT NULL
);

CREATE TABLE employees_shifts(
  id                  SERIAL PRIMARY KEY,
  employee_id         INT REFERENCES employees (id),
  shift_id            INT REFERENCES shifts (id)
);
