# 5. Найти клиента (customer), который приносит меньше всего прибыли компании (company)
# для каждой из компаний .

USE homework1;

CREATE TABLE customer_company_profit (
  company_id  INT,
  customer_id INT,
  profit      INT,
  PRIMARY KEY PK (customer_id, company_id)
);

INSERT INTO customer_company_profit (company_id, customer_id, profit)
  SELECT
    companies.id           AS company_id,
    customers.id           AS customer_id,
    sum(developers.salary) AS profit
  FROM customers, projects, developers, companies, projects_developers, customers_projects,
    developers_companies
  WHERE customers.id = customers_projects.customer_id AND
        projects.id = customers_projects.project_id AND
        projects.id = projects_developers.project_id AND
        developers.id = projects_developers.developer_id AND
        developers.id = developers_companies.developer_id AND
        companies.id = developers_companies.company_id
  GROUP BY company_id, customer_id;

SELECT
  companies.name       AS company_name,
  customers.first_name AS customer_first_name,
  customers.last_name  AS customer_last_name,
  profit               AS min_profit
FROM customer_company_profit, companies, customers
WHERE profit IN (
  SELECT profit
  FROM customer_company_profit
  WHERE profit IN (
    SELECT min(profit)
    FROM customer_company_profit
    GROUP BY company_id)
)
      AND company_id = companies.id
      AND customer_id = customers.id
GROUP BY company_name;

