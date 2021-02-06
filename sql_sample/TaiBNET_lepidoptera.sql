select f.kingdom, f.phylum, f.class, f.order, f.family, s.genus, concat(s.name, " ", s.author) as taxon, concat("species") as rank, concat(null) as description from scientific_names s
INNER JOIN families f using (family_id)
where f.order = "lepidoptera" and s.is_accepted_name = 1
union
select distinct f.kingdom, f.phylum, f.class, f.order, f.family, s.genus, concat(null) as taxon, concat("genus") as rank, concat(null) as description from scientific_names s
INNER JOIN families f using (family_id)
where f.order = "lepidoptera" and s.is_accepted_name = 1
union
select distinct f.kingdom, f.phylum, f.class, f.order, f.family, concat(null) as genus, concat(null) as taxon, concat("family") as rank, concat(null) as description from families f
where f.order = "lepidoptera"
order by family, genus, taxon