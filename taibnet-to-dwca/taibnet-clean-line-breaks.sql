-- Cleaning. New lines break ingestion.
update details set distribution = replace(distribution, '\n', ' ');
update details set distribution = replace(distribution, '\r', ' ');
update details set diagnosis = replace(diagnosis, '\n', ' ');
update details set diagnosis = replace(diagnosis, '\r', ' ');

-- Cleaning NULL value
update details set distribution = CASE distribution WHEN 'NULL' THEN NULL ELSE distribution END;