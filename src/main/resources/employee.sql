CREATE TABLE employee (
                          id BIGSERIAL NOT NULL PRIMARY KEY,
                          first_name VARCHAR(50) NOT NULL,
                          last_name VARCHAR(50) NOT NULL,
                          gender VARCHAR(6) NOT NULL DEFAULT 'm',
                          age INT NOT NULL
);
INSERT INTO employee (first_name, last_name, gender, age) VALUES ('Ivan', 'Ivanov', 'm', 30);
INSERT INTO employee (first_name, last_name, gender, age) VALUES ('Petr', 'Petrov', 'm', 35);
INSERT INTO employee (first_name, last_name, gender, age) VALUES ('Aleksandra', 'Aleksandrova', 'f', 33);

SELECT * FROM employee;

UPDATE employee SET first_name = 'Semen', last_name = 'Semenov', gender = 'm', age = 15 WHERE id = 3;

SELECT * FROM employee;

DELETE FROM employee WHERE id = 1;

SELECT * FROM employee;

INSERT INTO employee (first_name, last_name, gender, age) VALUES ('Taras', 'Tarasov', 'm', 40);
INSERT INTO employee (first_name, last_name, gender, age) VALUES ('Makar', 'Makarov', 'm', 18);

SELECT * FROM employee;

SELECT first_name AS Имя, last_name AS Фамилия
FROM employee
ORDER BY Фамилия DESC, Имя;

SELECT * FROM employee WHERE age < 30 OR age > 50;
SELECT * FROM employee WHERE age BETWEEN 30 AND 50;

SELECT * FROM employee WHERE first_name LIKE '____';

SELECT * FROM employee;
UPDATE employee SET first_name = 'Taras' WHERE id = 1;
UPDATE employee SET first_name = 'Makar' WHERE id = 2;

SELECT first_name AS Имя, sum(age) AS Суммарный_возвраст FROM employee
GROUP BY first_name, age;

SELECT * FROM employee WHERE age = (SELECT MIN(age) FROM employee);
SELECT * FROM employee WHERE age = (SELECT MAX(age) FROM employee);