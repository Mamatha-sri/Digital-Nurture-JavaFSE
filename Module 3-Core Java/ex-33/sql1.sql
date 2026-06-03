CREATE DATABASE bankdb;
USE bankdb;

CREATE TABLE accounts (
    id INT PRIMARY KEY,
    balance DOUBLE
);

INSERT INTO accounts VALUES (1, 5000);
INSERT INTO accounts VALUES (2, 3000);