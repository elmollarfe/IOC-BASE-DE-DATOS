use concessionsjardineria;

create table concessio2 as
 select*from concessio;
 
 alter table concessio2
 add nomBarri varchar(50);
 
update concessio2 c 
join barri b on c.Codi_Barri = b.Codi
set c.nomBarri = b.denominacio;

alter table concessio2
drop column nomBarri;

desc concessio2;

create index CIF_Concessio2
on concessio2 (CIF);



select * from concessio2;

desc concessio2
select * from concessio2;
select Codi, denominacio from barri