
create or replace function importCultiu(nomCultiu varchar)returns numeric 
AS 
$$
declare 
   preuCultiu Numeric;
   superficieCultiu Numeric;
begin 
    select preu into preuCultiu
    from tecnic.cultiu
    where upper(nom) = upper(nomCultiu);

	if preuCultiu is null then
	    preuCultiu = 0;
	end if; 

	select sum(s.superficie) into superficieCultiu
	from tecnic.sector_explotacio s
	join tecnic.cultiu c
	on c.codi = s.codi_c
	where upper(c.nom) = upper(nomCultiu);

	if superficieCultiu is null then
	    superficieCultiu = 0;
	end if;
	
    return preuCultiu * superficieCultiu;
end;
$$ language plpgsql;

select importCultiu('Carxofa');
