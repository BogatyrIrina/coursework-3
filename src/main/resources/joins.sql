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

SELECT * FROM employee WHERE first_name LIKE '____%';

SELECT * FROM employee;
UPDATE employee SET first_name = 'Taras' WHERE id = 1;
UPDATE employee SET first_name = 'Makar' WHERE id = 2;

SELECT first_name AS Имя, sum(age) AS Суммарный_возвраст FROM employee
GROUP BY first_name, age;

SELECT * FROM employee WHERE age = (SELECT MIN(age) FROM employee);
SELECT * FROM employee WHERE age = (SELECT MAX(age) FROM employee)
ORDER BY age DESC;

SELECT first_name AS Имя, MAX(age) FROM employee GROUP BY Имя HAVING COUNT(*)>2;

CREATE TABLE city (city_id BIGSERIAL NOT NULL PRIMARY KEY,city_name VARCHAR(30) NOT NULL);

ALTER TABLE employee ADD city_id INT;
ALTER TABLE employee ADD CONSTRAINT city_id FOREIGN KEY(city_id) REFERENCES city(city_id);

INSERT INTO city (city_name) VALUES ('Vienna');
INSERT INTO city (city_name) VALUES ('Munich');
INSERT INTO city (city_name) VALUES ('Aachen');
INSERT INTO city (city_name) VALUES ('Cologne');
INSERT INTO city (city_name) VALUES ('Bremen');

UPDATE employee SET city_id=1 WHERE id=1;
UPDATE employee SET city_id=3 WHERE id=3;
UPDATE employee SET city_id=4 WHERE id=4;
UPDATE employee SET city_id=5 WHERE id=5;
UPDATE employee SET city_id=1 WHERE id=1;
UPDATE employee SET city_id=5 WHERE id=8;
UPDATE employee SET city_id=5 WHERE id=9;

SELECT first_name, last_name, city_name FROM employee INNER JOIN city ON employee.city_id=city.city_id;
SELECT first_name, last_name, city_name FROM city LEFT JOIN employee ON city.city_id=employee.city_id;
SELECT first_name, city_name FROM employee FULL JOIN city ON employee.city_id=city.city_id;
SELECT first_name, city_name FROM employee CROSS JOIN city;
SELECT city_name FROM city LEFT JOIN employee ON city.city_id=employee.city_id WHERE employee.first_name IS NULL;

SELECT * FROM employee;
SELECT * FROM city;