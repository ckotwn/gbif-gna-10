-- Endemic common name
SELECT c.name_code AS TaxonID, c.common_name AS vernacularName, "zh" AS language, "TW" AS countryCode
FROM common_names c
         LEFT JOIN scientific_names s USING (name_code)
WHERE s.is_accepted_name = 1
  AND s.author IS NOT NULL
  AND s.is_endemic = 1
  AND c.type_id = 1
ORDER BY c.name_code;