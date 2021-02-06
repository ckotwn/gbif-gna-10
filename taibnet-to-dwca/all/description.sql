-- All diagnosis & distribution
SELECT d.name_code AS TaxonID, TRIM(d.diagnosis) AS description, "diagnostic" AS type, "en" AS language
 FROM details d
 WHERE d.name_code IN
       (SELECT s.name_code FROM scientific_names s WHERE s.is_accepted_name = 1 AND s.author IS NOT NULL)
   AND d.diagnosis IS NOT NULL
 UNION
 SELECT d.name_code AS TaxonID, TRIM(d.distribution) AS description, "distribution" AS type, "en" AS language
 FROM details d
 WHERE d.name_code IN
       (SELECT s.name_code FROM scientific_names s WHERE s.is_accepted_name = 1 AND s.author IS NOT NULL)
   AND d.distribution IS NOT NULL;