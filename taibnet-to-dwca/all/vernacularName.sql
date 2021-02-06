-- All common name
SELECT c.name_code AS TaxonID, c.common_name AS vernacularName, "zh" AS language, "TW" AS countryCode
 FROM common_names c
 WHERE c.name_code IN
       (SELECT s.name_code FROM scientific_names s WHERE s.is_accepted_name = 1 AND s.author IS NOT NULL)
   AND c.type_id = 1
   ORDER BY c.name_code;