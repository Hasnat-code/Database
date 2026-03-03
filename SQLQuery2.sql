SELECT *
FROM employees
WHERE first_name COLLATE Latin1_General_CS_AS LIKE '%Lex%';