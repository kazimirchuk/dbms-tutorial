DROP TABLE IF EXISTS persons CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS services CASCADE;
DROP TABLE IF EXISTS roles_services CASCADE;
DROP TABLE IF EXISTS church_goods CASCADE;
DROP TABLE IF EXISTS persons_church_goods CASCADE;

CREATE TABLE persons(
    id           SERIAL PRIMARY KEY,
    first_name   VARCHAR(50) NOT NULL,
    last_name    VARCHAR(50) NOT NULL,
    faith VARCHAR(70) NOT NULL
)

CREATE TABLE roles(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    born_year SMALLINT NOT NULL CONSTRAINT positive_age CHECK (born_year > 0) and (born_year < 101)
)

CREATE TABLE services(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC NOT NULL positive_num CHECK (price > 0),
    due_at TIMESTAMP WITH TIME ZONE,
    desciption TEXT
)

CREATE TABLE roles_services {
    id SERIAL PRIMARY KEY,
    roles_id INT REFERENCES roles (id),
    services_id INT REFERENCES services (id)
}

CREATE TABLE church_goods(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC NOT NULL positive_num CHECK (price > 0),
    desciption TEXT
)

CREATE TABLE persons_church_goods(
    id SERIAL PRIMARY KEY,
    persons_id INT REFERENCES persons (id),
    church_goods_id INT REFERENCES church_goods (id)
)