-- SQL statements for compiling TaiBNET database for GNA Award

-- All_core data
SELECT s.name_code, f.kingdom, f.phylum, f.`class`, f.`order`, f.family, s.genus, s.species as specificEpithet, s.infraspecies, s.author as scientificNameAuthorship,
IF(s.infraspecies is null, "species", "subspecies") AS rank
FROM scientific_names s
LEFT JOIN families f USING (family_id) 
WHERE s.is_accepted_name = 1
ORDER BY s.name_code

-- All common name
SELECT c.name_code, c.common_name FROM common_names c
WHERE c.name_code in (SELECT s.name_code FROM scientific_names s WHERE s.is_accepted_name = 1)
AND c.type_id = 1
ORDER BY c.name_code

-- All diagnosis
SELECT d.name_code, d.diagnosis FROM details d
WHERE d.name_code in (SELECT s.name_code FROM scientific_names s WHERE s.is_accepted_name = 1)
AND d.diagnosis IS NOT NULL
ORDER BY d.name_code

-- All distribution
SELECT d.name_code, d.distribution FROM details d
WHERE d.name_code in (SELECT s.name_code FROM scientific_names s WHERE s.is_accepted_name = 1)
AND d.distribution IS NOT NULL
ORDER BY d.name_code

-- IUCN_core
SELECT s.name_code, f.kingdom, f.phylum, f.`class`, f.`order`, f.family, s.genus, s.species as specificEpithet, s.infraspecies, s.author as scientificNameAuthorship,
IF(s.infraspecies is null, "species", "subspecies") AS rank, d.iucn_code AS ThreatenStatus
FROM scientific_names s
LEFT JOIN families f USING (family_id)
LEFT JOIN details d USING (name_code)
WHERE s.is_accepted_name = 1
AND d.iucn_code IS NOT NULL
ORDER BY s.name_code

-- IUCN common name
SELECT c.name_code, c.common_name, c.type_id FROM common_names c
LEFT JOIN scientific_names s USING (name_code)
LEFT JOIN details d USING (name_code)
WHERE s.is_accepted_name = 1 AND d.iucn_code IS NOT NULL AND c.type_id = 1
ORDER BY c.name_code

-- IUCN diagnosis
SELECT s.name_code, d.diagnosis
FROM scientific_names s
LEFT JOIN details d USING (name_code)
WHERE s.is_accepted_name = 1
AND d.iucn_code IS NOT NULL
AND d.diagnosis IS NOT NULL
ORDER BY s.name_code

-- IUCN distribution
SELECT d.name_code, d.distribution FROM details d
LEFT JOIN scientific_names s USING (name_code)
WHERE s.is_accepted_name = 1 AND d.iucn_code IS NOT NULL AND d.distribution IS NOT NULL
ORDER BY d.name_code

-- COA core
SELECT s.name_code, f.kingdom, f.phylum, f.`class`, f.`order`, f.family, s.genus, s.species as specificEpithet, s.infraspecies, s.author as scientificNameAuthorship,
IF(s.infraspecies is null, "species", "subspecies") AS rank, d.coa_redlist_code AS COA
FROM scientific_names s
LEFT JOIN families f USING (family_id)
LEFT JOIN details d USING (name_code)
WHERE s.is_accepted_name = 1
AND d.coa_redlist_code IS NOT NULL
ORDER BY s.name_code

-- COA common name
SELECT c.name_code, c.common_name, c.type_id FROM common_names c
LEFT JOIN scientific_names s USING (name_code)
LEFT JOIN details d USING (name_code)
WHERE s.is_accepted_name = 1 AND d.coa_redlist_code IS NOT NULL AND c.type_id = 1
ORDER BY c.name_code

-- COA diagnosis
SELECT s.name_code, d.diagnosis
FROM scientific_names s
LEFT JOIN details d USING (name_code)
WHERE s.is_accepted_name = 1
AND d.coa_redlist_code IS NOT NULL
AND d.diagnosis IS NOT NULL
ORDER BY s.name_code

-- COA distribution
SELECT d.name_code, d.distribution FROM details d
LEFT JOIN scientific_names s USING (name_code)
WHERE s.is_accepted_name = 1 AND d.coa_redlist_code IS NOT NULL AND d.distribution IS NOT NULL
ORDER BY d.name_code

-- Endemic core
SELECT s.name_code, f.kingdom, f.phylum, f.`class`, f.`order`, f.family, s.genus, s.species as specificEpithet, s.infraspecies, s.author as scientificNameAuthorship,
IF(s.infraspecies is null, "species", "subspecies") AS rank
FROM scientific_names s
LEFT JOIN families f USING (family_id) 
WHERE s.is_accepted_name = 1
AND s.is_endemic = 1
ORDER BY s.name_code

-- Endemic common name
SELECT c.name_code, c.common_name, c.type_id FROM common_names c
LEFT JOIN scientific_names s USING (name_code)
WHERE s.is_accepted_name = 1
AND s.is_endemic = 1
AND c.type_id = 1
ORDER BY c.name_code

-- Endemic dianosis
SELECT s.name_code, d.diagnosis
FROM scientific_names s
LEFT JOIN details d USING (name_code)
WHERE s.is_accepted_name = 1
AND s.is_endemic = 1
AND d.diagnosis IS NOT NULL
ORDER BY s.name_code

-- Endemic distribution
SELECT d.name_code, d.distribution FROM details d
LEFT JOIN scientific_names s USING (name_code)
WHERE s.is_accepted_name = 1
AND s.is_endemic = 1
AND d.distribution IS NOT NULL
ORDER BY d.name_code