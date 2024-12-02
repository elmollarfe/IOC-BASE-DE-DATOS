create or replace function intercanvisembrats(cultiu1 varchar, cultiu2 varchar)
returns table (codi_ea smallint, codi smallint, codi_c1 smallint, nom varchar, codi1 smallint)
as
$$
declare

	cultiuCursor refcursor;
	cultiuCursor2 refcursor;
	cultiusSembrats record;
	cultiusSembrats2 record;
	codiCultiu1 smallint;
	codiCultiu2 smallint;
	
begin

	select s.codi_c into codiCultiu1
	from tecnic.sector_explotacio s
	join tecnic.cultiu c
	on c.codi = s.codi_c
	where upper(c.nom) = upper(cultiu1);
	
	select s.codi_c into codiCultiu2
	from tecnic.sector_explotacio s
	join tecnic.cultiu c
	on c.codi = s.codi_c
	where upper(c.nom)=upper(cultiu2);

	open cultiuCursor for
	select s.codi_ea, s.codi, s.codi_c, c.nom, c.codi as codi1
	from tecnic.sector_explotacio s
	join tecnic.cultiu c
	on c.codi = s.codi_c
	where upper(c.nom) = upper(cultiu1) or upper(c.nom)= upper(cultiu2);

	loop 
		fetch cultiuCursor into cultiusSembrats;
		exit when not found;

		if cultiusSembrats.codi_c = codiCultiu1 then
			update tecnic.sector_explotacio s
			set codi_c = codiCultiu2
			from tecnic.cultiu c  
			where s.codi_c = c.codi
			      and c.nom = cultiu1
				  and s.codi_ea = cultiusSembrats.codi_ea;
	
		elsif cultiusSembrats.codi_c = codiCultiu2 then
			 update tecnic.sector_explotacio s
			 set codi_c = codiCultiu1
			 from tecnic.cultiu c
			 where s.codi_c = c.codi
			       and c.nom = cultiu2
			 	    and s.codi_ea = cultiusSembrats.codi_ea;

		end if;

	end loop; 
	close cultiuCursor;


	return query 
	select s.codi_ea, s.codi, s.codi_c, c.nom, c.codi
	from tecnic.sector_explotacio s
	join tecnic.cultiu c
	on c.codi = s.codi_c
	where upper(c.nom) = upper(cultiu1) or upper(c.nom) = upper(cultiu2);

end; 
$$ language plpgsql;

select intercanviSembrats('Patata','Enciam');

select s.codi_ea, s.codi, s.codi_c, c.nom, c.codi
	from tecnic.sector_explotacio s
	join tecnic.cultiu c
	on c.codi = s.codi_c
	where upper(c.nom) = upper('Patata') or upper(c.nom)= upper('Enciam');

