DROP TABLE IF EXISTS service CASCADE;
DROP TABLE IF EXISTS service_sale CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS user_manager CASCADE;
DROP TABLE IF EXISTS user_seller CASCADE;
DROP TABLE IF EXISTS cars CASCADE;
DROP TABLE IF EXISTS car_details CASCADE;

CREATE TABLE services(
    id               SERIAL PRIMARY KEY,
    service_name     VARCHAR(50) NOT NULL
)

CREATE TABLE services_sale{
    id               SERIAL PRIMARY KEY,
    services_id      INT REFERENCES services (id),
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

CREATE TABLE users_manager(
    id               SERIAL PRIMARY KEY,
    users_id         INT REFERENCES users (id),
    bill_access      BOOLEAN
)

CREATE TABLE users_seller(
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

CREATE TABLE cars_details{
    id               SERIAL PRIMARY KEY,
    cars_id          INT REFERENCES cars (id),
    car_color        VARCHAR(10) NOT NULL,
    car_manufacturer VARCHAR(50) NOT NULL,
    car_volume       DECIMAL positive_volume CHECK (positive_volume >= 0 AND positive_volume <= 10),
    description      TEXT
}
