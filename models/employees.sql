SELECT *,
       (first_name || ' ' || last_name) AS name,
       (DATE_PART('year', CURRENT_DATE) - DATE_PART('year', birth_date)) AS age,
       (DATE_PART('year', CURRENT_DATE) - DATE_PART('year', hire_date)) AS lengthofservice
FROM {{source('sources','employees')}}