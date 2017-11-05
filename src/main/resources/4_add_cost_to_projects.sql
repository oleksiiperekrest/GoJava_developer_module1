#4. Добавить поле (cost - стоимость) в таблицу Projects .

USE homework1;

ALTER TABLE projects
  ADD cost DECIMAL(13,4);

CREATE TEMPORARY TABLE project_cost (
  id   INT UNIQUE,
  cost DECIMAL(13,4)
);

INSERT INTO project_cost (id, cost)
  SELECT
    projects.id            AS id,
    sum(developers.salary) AS cost
  FROM projects, developers, projects_developers
  WHERE projects.id = projects_developers.project_id AND
        developers.id = projects_developers.developer_id
  GROUP BY projects.id;

UPDATE projects, project_cost
SET projects.cost = project_cost.cost
WHERE project_cost.id = projects.id;

DROP TEMPORARY TABLE project_cost;




