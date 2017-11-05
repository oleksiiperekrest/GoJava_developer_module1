# 6. Вычислить, среднюю ЗП программистов в проекте, который приносит наименьшую прибыль.

USE homework1;

SELECT avg(salary)
FROM developers, projects_developers
WHERE developers.id = projects_developers.developer_id AND
      project_id = (
        SELECT id
        FROM projects
        WHERE cost = (
          SELECT min(cost)
          FROM projects
        )
      );