
create or replace function mostraExplotacionsSuperior( nomExplotacio varchar)
returns void as $$
declare
	superficieParametre numeric; 
    explotacioCursor refcursor;
	explotacio record;
	numSortida int := 1;
	
begin 

	select superficie into superficieParametre
	from regidor.explotacio_agraria
	where nom = nomExplotacio;
	
   	open explotacioCursor 
	   for select * from regidor.explotacio_agraria 
	   where superficie > superficieParametre;

	loop
	 	fetch explotacioCursor into explotacio;
		 exit when not found;
		 raise notice '%. Nom: %', numSortida, explotacio.nom;
		 numSortida := numSortida + 1;
	end loop;
	
			numSortida := numSortida - 1;
			raise notice 'Hi ha % explotacions amb més superfície que % ', numSortida , nomExplotacio;
    
	close explotacioCursor;
   
end;
$$language plpgsql;

select mostraExplotacionsSuperior('Cal Pinques');

