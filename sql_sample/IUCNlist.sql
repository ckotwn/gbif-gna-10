Select sn.name_code, sn.name_code_sp2k, sn.name, sn.genus, sn.species, sn.infraspecies, sn.author, sn.datelastmodified, sn.ref_short, d.iucn_code from scientific_names sn
Left join details d on d.name_code = sn.name_code
where sn.name_code in (SELECT name_code FROM `TaiBNET`.`details` where iucn_code is not null)
and sn.is_accepted_name = 1
