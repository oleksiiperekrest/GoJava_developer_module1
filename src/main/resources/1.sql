# 1. Добавить разаработчикам поле (salary - зарплата).

USE homework1;
ALTER TABLE developers
  ADD salary INT;

CREATE TABLE developers_salary (
  developer_id INT AUTO_INCREMENT PRIMARY KEY,
  salary       INT
);

INSERT INTO developers_salary (salary)
VALUES
  (3010),
  (3520),
  (4030),
  (2340),
  (1550),
  (1860),
  (2970),
  (3180),
  (3490),
  (2200);

UPDATE developers, developers_salary
SET developers.salary = developers_salary.salary
WHERE id = developers_salary.developer_id;

DROP TABLE developers_salary;

