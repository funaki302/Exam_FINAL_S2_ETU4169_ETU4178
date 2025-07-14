use partage_objets;

create or replace view po_v_objet as
select m.*,ob.id_objet,ob.nom_objet,co.*
from po_objet as ob join po_membre as m
on ob.id_membre = m.id_membre join po_categorie_objet as co
on ob.id_categorie = co.id_categorie;

create or replace view po_v_emp_objet as
select ob.*,m.id_membre as id_preteur,m.nom as nom_preteur, e.date_emprunt,e.date_retour
from po_emprunt as e join po_v_objet as ob
on e.id_objet = ob.id_objet join po_membre as m
on m.id_membre = e.id_membre;