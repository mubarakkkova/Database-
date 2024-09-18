CREATE DATABASE lab_1;

CREATE TABLE users (
    id SERIAL,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

ALTER TABLE users
ADD COLUMN isadmin INT
CONSTRAINT isadmin_check CHECK (isadmin IN (0, 1));

ALTER TABLE users DROP CONSTRAINT isadmin_check;

ALTER TABLE users
ALTER COLUMN isadmin TYPE boolean
USING (isadmin = 1);

ALTER TABLE users
ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users
ADD CONSTRAINT users_pkey PRIMARY KEY (id);

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    user_id INTEGER
);

DROP TABLE users;

DROP DATABASE Lab1;