-- COA common name
SELECT c.name_code, c.common_name AS vernacularName, "zh" AS language, "TW" AS countryCode
FROM common_names c
         LEFT JOIN scientific_names s USING (name_code)
         LEFT JOIN details d USING (name_code)
WHERE s.is_accepted_name = 1
  AND s.author IS NOT NULL
  AND d.coa_redlist_code IS NOT NULL
  AND c.type_id = 1
ORDER BY c.name_code;