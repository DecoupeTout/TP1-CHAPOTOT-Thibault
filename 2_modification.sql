use codelard;

-- c. deuxieme conception
-- un cours peut etre assure par plusieurs professeurs.
alter table enseigne
    drop primary key,
    add primary key (c_id, p_id);

-- ajouter le domaine d'enseignement de chaque professeur.
ALTER TABLE professeur
    ADD COLUMN domaine VARCHAR(100) NOT NULL DEFAULT 'general';

-- Ajouter le genre de chaque eleve.
ALTER TABLE `élève`
    ADD COLUMN genre VARCHAR(20) NOT NULL DEFAULT 'non precise';

-- Un professeur peut diriger au maximum une maison.
-- p_id est NULL si la maison n'a pas encore de directeur.
alter table maison
    add column p_id varchar(50) null;

alter table maison
    add constraint fk_maison_directeur
    foreign key (p_id) references professeur(p_id);
