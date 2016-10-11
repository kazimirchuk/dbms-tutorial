DROP TABLE IF EXISTS service CASCADE;
DROP TABLE IF EXISTS service_sale CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS user_manager CASCADE;
DROP TABLE IF EXISTS user_seller CASCADE;
DROP TABLE IF EXISTS cars CASCADE;
DROP TABLE IF EXISTS car_details CASCADE;

CREATE TABLE service(
    id               SERIAL PRIMARY KEY,
    person_name      VARCHAR(50) NOT NULL,
    service_type     VARCHAR(20) NOT NULL,
    deal_date        TIMESTAMP
)

CREATE TABLE service_sale{
    id               SERIAL PRIMARY KEY,
    profit           DECIMAL
}

CREATE TABLE users{
    id               SERIAL PRIMARY KEY,
    first_name       VARCHAR(50) NOT NULL,
    last_name        VARCHAR(50) NOT NULL,
    user_role        VARCHAR(50) NOT NULL,
    store_owner      BOOLEAN,
    users_type       VARCHAR(50) NOT NULL,
    born_year        SMALLINT NOT NULL CONSTRAINT positive_age CHECK (born_year > 0)
}

CREATE TABLE user_manager(
    id               SERIAL PRIMARY KEY,
    users_id         INT REFERENCES users (id),
    bill_access      BOOLEAN
)

CREATE TABLE user_seller(
    id               SERIAL PRIMARY KEY,
    users_id         INT REFERENCES users (id),
    staff            BOOLEAN
)

CREATE TABLE cars{
    id               SERIAL PRIMARY KEY,
    car_type         VARCHAR(50) NOT NULL,
    car_price        DECIMAL,
    created_date     TIMESTAMP
}

CREATE TABLE car_details{
    id               SERIAL PRIMARY KEY,
    cars_id          INT REFERENCES uscarsers (id),
    car_color        VARCHAR(10) NOT NULL,
    car_manufacturer VARCHAR(50) NOT NULL,
    car_volume       SMALLINT NOT NULL CONSTRAINT menace_levels CHECK (menace_level >= 0 AND menace_level <= 10),
    description      TEXT
}
