-- IUCN distribution for threat status
SELECT d.name_code AS TaxonID, d.iucn_code AS threatStatus, "TW" AS countryCode
FROM details d
         LEFT JOIN scientific_names s USING (name_code)
WHERE s.is_accepted_name = 1
  AND s.author IS NOT NULL
  AND d.iucn_code IS NOT NULL
  AND d.distribution IS NOT NULL;