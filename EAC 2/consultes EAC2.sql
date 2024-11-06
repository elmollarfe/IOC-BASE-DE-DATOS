use concessionsjardineria;

-- 1
select denominacio, habitants
from barri
where habitants > 20000
order by habitants desc;

-- 2
select b.denominacio as DenominacioBarri, d.*
from barri b, districte d
where b.Codi_districte = d.Codi
order by b.superficie, b.habitants desc;

-- 3

select e.CIF, e.denominacio
from empresa e join concessio c using (CIF) join sector s using (Codi_barri) 
where s.superficie_zona_verda > 0.8
group by CIF;

-- 4 
select denominacio
from barri
where habitants = (select max(habitants) 
	from barri);

-- 5 
select e.CIF, e.denominacio, c.*
from empresa e 
left join concessio c using (CIF);

-- 6
select  j.*
from jardiners j 
join treballador t using(DNI) join sector s using (Codi_barri)
where s.superficie_zona_verda >  0.6;

-- 7 
select distinct e.CIF, e.denominacio, count(t.DNI) as 'Nombre de treballadors'
from empresa e
join treballa t using (CIF)
group by e.CIF
order by 3 desc ;

-- 8 

select p.Codi, p.nomComu, count(b.denominacio) as 'Nombre de barris' 
from planta p
left join trobem t on p.Codi = t.Codi_planta
left join barri b on b.Codi = t.Codi_Barri
group by p.Codi, p.nomComu;

-- 9

select p.Codi, p.NomComu, p.NomCientific, p2.Codi, p2.NomComu , p2.NomCientific
from compatible c
join planta p on c.Codi1 = p.Codi
join planta p2 on c.Codi2 = p2.Codi; 

-- 10

select distinct b.denominacio, count(s.Codi)
from barri b
join sector s on b.Codi = s.Codi_Barri
group by b.denominacio
having count(s.Codi)>( select count(s2.Codi) from sector s2 join barri b2 on b2.Codi = s2.Codi_Barri
where b2.denominacio like 'La Barceloneta');
