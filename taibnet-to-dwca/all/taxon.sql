-- All_core data
SELECT s.name_code                                         AS TaxonID,
        IFNULL(f.kingdom, '')                               AS kingdom,
        IFNULL(f.phylum, '')                                AS phylum,
        IFNULL(f.`class`, '')                               AS `class`,
        IFNULL(f.`order`, '')                               AS `order`,
        IFNULL(f.family, '')                                AS family,
        IFNULL(s.genus, '')                                 AS genus,
        IFNULL(s.species, '')                               AS specificEpithet,
        IFNULL(s.infraspecies, '')                          AS infraspecificEpithet,
        IFNULL(s.author, '')                                AS scientificNameAuthorship,
        IFNULL(CONCAT(s.genus, ' ', s.species, ' ', IF(s.infraspecies IS NULL, "", s.infraspecies), ' ',
                      s.author), '')                        AS scientificName,
        IF(s.infraspecies IS NULL, "species", "subspecies") AS taxonRank
 FROM scientific_names s
          LEFT JOIN families f USING (family_id)
 WHERE s.is_accepted_name = 1
   AND s.author IS NOT NULL
   ORDER BY s.name_code;