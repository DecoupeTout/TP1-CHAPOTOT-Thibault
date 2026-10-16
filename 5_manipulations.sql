use codelard;

-- f.1 visualiser les donnees
select * from maison;
select * from `élève`;
select * from professeur;
select * from cours;
select * from appartient;
select * from suit;
select * from enseigne;
select * from attribue_des_points;

-- f.2 les notes e et f sont majorees par d
update suit
set note = 'D'
where note in ('E', 'F');

-- verifier les notes restantes
select note, count(*) as nombre
from suit
group by note;

-- f.3 supprimer les attributions dont l'ajout ou le retrait depasse 150 points
delete from attribue_des_points
where nb_points > 150 or nb_points < -150;

-- pour aller plus loin : total net de points par maison pour la coupe 2026.
-- attention : cette requete utilise toutes les attributions presentes,
-- car le schema fourni ne comporte pas de colonne annee/date.
select m.m_nom, coalesce(sum(a.nb_points), 0) as total_points
from maison as m
left join attribue_des_points as a on a.m_nom = m.m_nom
group by m.m_nom
order by total_points desc;
