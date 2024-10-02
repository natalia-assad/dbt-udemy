WITH new_id AS
  (SELECT *,
          first_value(customer_id) OVER (PARTITION BY company_name, contact_name) AS RESULT
   FROM {{source('sources','customers')}}),
     only_unique_id AS
  (SELECT DISTINCT RESULT
   FROM new_id),
     FINAL AS
  (SELECT *
   FROM {{source('sources','customers')}}
   WHERE customer_id IN
       (SELECT RESULT
        FROM only_unique_id))
SELECT *
FROM FINAL