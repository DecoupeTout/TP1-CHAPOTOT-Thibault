use codelard;

-- d. contraintes de validation
-- les notes doivent etre a, b, c, d, e ou f.
alter table suit
    add constraint chk_suit_note
    check (note in ('A', 'B', 'C', 'D', 'E', 'F'));

-- les ajouts et retraits de points ne peuvent pas depasser 200 points
-- en valeur absolue : de -200 a 200 inclus.
alter table attribue_des_points
    add constraint chk_attribution_points
    check (nb_points between -200 and 200);

-- le titre doit contenir deux parties non vides separees par " - ".
alter table cours
    add constraint chk_cours_intitule
    check (c_intitulé regexp '^.+ - .+$');

-- valeurs autorisees pour le genre (contrainte supplementaire utile).
alter table `élève`
    add constraint chk_eleve_genre
    check (genre in ('F', 'M', 'Autre', 'Non precise'));
