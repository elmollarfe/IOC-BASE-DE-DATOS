create or replace function regidor.importCultiu(nomCultiu varchar)returns numeric 
AS 
$$
declare 
   preuCultiu Numeric; 
begin 
    select preu into preuCultiu
    from tecnic.cultiu
    where upper(nom) = upper(nomCultiu);

	if preuCultiu is null then
	    preuCultiu = 0;
	end if; 
	
    return preuCultiu;
end;
$$ language plpgsql;

select regidor.importCultiu(' ');
