create schema regidor;
create schema tecnic; 
create table if not exists regidor.explotacio_agraria(
    codi smallint primary key,
	nom varchar(45),
	data_inici date, 
	superficie numeric(7,2),
	nom_z varchar(45)
)

create table if not exists regidor.zona(
    nom varchar(45) primary key,
	extensio numeric(6,2)
)

create table if not exists tecnic.sector_explotacio(
    codi_ea smallint,
	codi smallint,
	superficie numeric(7,2),
	codi_c smallint,
	primary key (codi_ea , codi)
)


create table if not exists tecnic.cultiu(
   codi smallint primary key ,
   nom varchar(40),
   preu numeric(6,2)
    
)

alter table regidor.explotacio_agraria
add constraint fk_nom_z foreign key (nom_z) references regidor.zona(nom);

alter table tecnic.sector_explotacio
add constraint fk_codi_c foreign key (codi_c) references tecnic.cultiu(codi);

INSERT INTO regidor.zona VALUES ('El remolar',78.05),
    ('La Marina de baix',105.18),
    ('La Marina de dalt',215.36),
    ('La Ricarda',103.06),
    ('La Rivera nord',450.25),
    ('La Rivera sud',325.15);

INSERT INTO regidor.explotacio_agraria VALUES 
	(1,'Cal Pinques','2001-05-03',50.23,'La Rivera nord'),
	(2,'Cal Misses','2002-06-03',45.20,'La Rivera nord'),
	(3,'Cal Gallina','2009-06-22',15.95,'La Rivera nord'),
	(4,'Cal Xicomèdia','2007-01-03',58.10,'La Rivera nord'),
	(5,'Cal Passero','2017-02-05',17.19,'La Rivera nord'),
	(6,'Parc Agrari','2011-09-15',76.20,'La Rivera nord'),
	(7,'Cal Molas','2018-11-02',11.95,'La Rivera sud'),
	(8,'Cal Pusela','2017-03-03',16.90,'La Rivera sud'),
	(9,'Cal Marcdenoves','2015-05-20',26.30,'La Rivera sud'),
	(10,'Cal Malet','2018-05-20',33.35,'La Rivera sud'),
	(11,'Cal Ixu','2010-02-26',30.30,'La Rivera sud'),
	(12,'Cal Ramonet','2005-12-15',15.23,'La Ricarda'),
	(13,'Cal Perdiuet','2019-01-02',23.35,'La Ricarda'),
	(14,'Cal Jener','2013-07-09',26.30,'La Ricarda'),
	(15,'Cal Saio','2019-10-20',22.32,'La Marina de dalt'),
	(16,'Cal Alaio','2017-01-10',10.45,'La Marina de dalt'),
	(17,'Cal Xotis','2001-02-21',25.10,'La Marina de dalt'),
	(18,'Cal Jordà','2005-08-23',15.55,'La Marina de dalt'),
	(19,'Cal Ximenis','2004-06-01',12.10,'La Marina de dalt'),
	(20,'Cal Trabucador','2000-10-15',5.80,'La Marina de baix'),
	(21,'Cal Arana','2015-11-05',9.55,'La Marina de baix'),
	(22,'Cal Tet','2000-01-15',7.20,'La Marina de baix'),
	(23,'Cal Filipines','2005-01-10',6.35,'El remolar'),
	(24,'Cal Figureta','2003-06-09',9.30,'El remolar'),
	(25,'Cal Misses','2019-08-27',10.32,'El remolar'),
	(26,'Cal Robert','2020-01-01',8.45,'El remolar'),
	(27,'Cal Gomis','2005-02-20',7.19,'El remolar'),
	(28,'Cal Pileta','2000-08-13',8.55,'El remolar'),
	(29,'Cal Ximenis','2004-06-01',12.10,'La Marina de dalt');

INSERT INTO tecnic.cultiu VALUES (1,'Carxofa',599.50),
	(2,'Enciam',459.50),
	(3,'Mongeta',223.50),
	(4,'Fava',123.55),
	(5,'Espinac',223.15),
	(6,'Blat de moro',326.42),
	(7,'Rave',259.50),
	(8,'Escarola',359.50),
	(9,'Col',256.82),
	(10,'Col-i-flor',276.50),
	(11,'Bròquil',197.58),
	(12,'Síndria',481.50),
	(13,'Meló',575.20),
	(14,'Carbassó',356.23),
	(15,'Carbassa',389.80),
	(16,'Tomàquet',402.50),
	(17,'Patata',265.32);

	INSERT INTO tecnic.sector_explotacio VALUES 
		(1,1,25.23,1),
		(1,2,25.00,17),
		(2,1,25.20,2),
		(2,2,15.00,10),
		(3,1,5.95,1),
		(3,2,10.00,7),
		(4,1,10.10,5),
		(4,2,8.00,6),
		(4,3,40.00,4),
		(5,1,11.19,9),
		(5,2,6.00,8),
		(6,1,6.20,2),
		(6,2,10.00,1),
		(6,3,60.00,12),
		(7,1,0.95,8),
		(7,2,6.00,1),
		(7,3,5.00,16),
		(8,1,0.90,1),
		(8,2,6.00,2),
		(8,3,10.00,3),
		(9,1,1.30,8),
		(9,2,1.00,1),
		(9,3,5.00,11),
		(9,4,20.00,14),
		(10,1,3.05,4),
		(10,2,10.30,5),
		(10,3,10.00,6),
		(10,4,10.00,7),
		(11,1,15.10,1),
		(11,2,15.20,9),
		(12,1,15.23,14),
		(13,1,3.35,4),
		(13,2,10.00,15),
		(13,3,10.00,16),
		(14,1,6.00,14),
		(14,2,20.30,1),
		(15,1,2.30,4),
		(15,2,10.02,5),
		(15,3,10.00,6),
		(16,1,10.45,3),
		(17,1,10.05,7),
		(17,2,15.05,8),
		(18,1,5.55,1),
		(18,2,10.00,10),
		(19,1,2.10,2),
		(19,2,10.00,8),
		(20,1,5.80,15),
		(21,1,5.50,11),
		(21,2,4.05,16),
		(22,1,7.20,12),
		(23,1,3.35,1),
		(23,2,2.00,5),
		(23,3,1.00,6),
		(24,1,3.00,4),
		(24,2,6.30,6),
		(25,1,5.30,4),
		(25,2,3.02,5),
		(25,3,2.00,6);

create role sotsregidoragricultura
with password '1234';

grant usage on schema regidor to sotsregidoragricultura;
grant usage on schema tecnic to sotsregidoragricultura;
grant select, insert, update, delete on all tables in schema regidor to sotsregidoragricultura;
grant select, insert, update, delete on all tables in schema tecnic to sotsregidoragricultura;

create role tecnicagricultura
with password '1234';

grant usage on schema tecnic to tecnicagricultura;
grant select on all tables in schema tecnic to tecnicagricultura;