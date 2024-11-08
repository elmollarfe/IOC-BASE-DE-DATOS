use concessionsjardineria;

create table concessio2 as
 select*from concessio;
 
 
 -- Afegiu a la taula concessio2 la columna nomBarri del tipus idoni per emmagatzemar els noms dels barris i que admeti valors nuls. Comproveu que efectivament s’ha creat la nova columna. 

 alter table concessio2
 add nomBarri varchar(50);
 
 desc concessio2;
 
-- Actualitzeu la taula ‘concessio2’ de forma que a la columna ‘nomBarri’ aparegui ara el nom del barri associat amb el codi de barri del registre
update concessio2 c
set nomBarri = (select denominacio from barri b
where b.Codi = c.Codi_barri
);

select * from concessio2;

-- Modifiqueu la taula concessio2 de forma que desaparegui la columna creada anteriorment ‘nomBarri’

alter table concessio2
drop column nomBarri;

desc concessio2;




select * from concessio2;

desc concessio2;

select * from concessio2;
select Codi, denominacio from barri;

-- Creeu un índex sobre la columna CIF per la taula concessio2. Com esborraríeu aquest índex?

create index concessio2_CIF on concessio2 (CIF); 
drop index concessio2_CIF on concessio2;
show indexes from concessio2;


--  Volem ara que el camp ‘data’ de la taula ‘concessio2’ tingui un valor per defecte que sigui la data de l’instant en el que es faci la inserció del registre. Canvieu el tipus de dades del camp ‘Data’ a ‘Timestamp’ i aconseguiu també que el valor per defecte d’aquesta columna sigui la data de la inserció del registre.
alter table concessio2
modify `Data` timestamp default current_timestamp();

-- nseriu un registre a la taula ‘concessio2’ per al sector 1, barri 2, CIF B12345678, i la resta de camps no els detalleu.
insert into concessio2 values ('1','2',default,'B12345678',null);

-- Esborreu de la taula ‘concessio2’ tots els sectors amb codi major o igual a 30, i comproveu que efectivament s’han esborrat els registres.

delete from concessio2 where Codi >= 30;

-- Esborreu de la taula ‘concessio2’ tots els sectors amb codi major o igual a 30, i comproveu que efectivament s’han esborrat els registres.
drop table concessio2;

select * from concessio2;

drop view barrisplantes;

-- Creeu la vista ‘barrisplantes’ en la qual es mostri, per cada barri, el nom comú seguit del nom científic de les plantes que trobem plantades en sectors d’aquests, ordenades per barri, nom comú i nom científic. A continuació indiqueu com heu de fer (quina seria la sintaxi) per realitzar una consulta del contingut de la vista, així com què faríeu per esborrar la vista creada.
create view barrisplantes
as select s.Codi as sector , b.denominacio, concat(p.NomComu,' ' ,p.NomCientific)
from barri b, trobem t, planta p, sector s 
where b.Codi = t.Codi_Barri and t.Codi_planta = p.Codi and s.Codi_Barri = t.Codi_Barri
order by b.denominacio, p.Nomcomu, p.NomCientific;

select * from barrisplantes;