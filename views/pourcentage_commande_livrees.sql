create or replace view article_livraison as

Select commande.NOCOMMANDE,
DATECOMMANDE,
détaillivraison.NOARTICLE,
NOCLIENT,
détaillivraison.QUANTITélivrée,
lignecommande.quantité,
ROUND((détaillivraison.QUANTITélivrée / lignecommande.quantité) * 100, 1) as percentLivraison
from commande
join détaillivraison on commande.NOCOMMANDE = détaillivraison.NOCOMMANDE
join lignecommande on lignecommande.NOCOMMANDE = commande.NOCOMMANDE
and lignecommande.NOARTICLE = détaillivraison.NOARTICLE

create or replace view commande_livraison as
Select nocommande,
CONCAT(ROUND(SUM("QUANTITÉLIVRÉE") / SUM("QUANTITÉ") * 100, 0), '%') as estLivrée
from ARTICLE_livraison
group by nocommande;

select * from article_LIVRAISON;

select * from commande_livraison;
