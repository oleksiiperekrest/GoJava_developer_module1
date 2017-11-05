# 2. Найти самый дорогой проект (исходя из ЗП разработчиков).

USE homework1;

SELECT
  projects.name          AS project_name,
  sum(developers.salary) AS project_cost
FROM projects, developers, projects_developers
WHERE projects.id = projects_developers.project_id AND
      developers.id = projects_developers.developer_id
GROUP BY projects.name
ORDER BY sum(developers.salary) DESC
LIMIT 1;