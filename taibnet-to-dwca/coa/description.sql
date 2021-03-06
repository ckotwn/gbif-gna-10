-- COA diagnosis and distribution
SELECT d.name_code AS TaxonID, TRIM(d.diagnosis) AS description, "diagnostic" AS type, "en" AS language
FROM scientific_names s
         LEFT JOIN details d USING (name_code)
WHERE s.is_accepted_name = 1
  AND s.author IS NOT NULL
  AND d.coa_redlist_code IS NOT NULL
  AND d.diagnosis IS NOT NULL
UNION
SELECT d.name_code AS TaxonID, TRIM(d.distribution) AS description, "distribution" AS type, "en" AS language
FROM details d
         LEFT JOIN scientific_names s USING (name_code)
WHERE s.is_accepted_name = 1
  AND s.author IS NOT NULL
  AND d.coa_redlist_code IS NOT NULL
  AND d.distribution IS NOT NULL;