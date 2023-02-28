program practica3_2;

type
	fecha = record
		dia:integer;
		mes:integer;
		ano:integer;
	end;

procedure leerFecha(var f:fecha);
	begin
		writeln('Ingrese dia/mes/año: '); {meter if por si el año es 2020?}
		readln(f.dia);
		readln(f.mes);
		readln(f.ano);
	end;
	
function Verano(f:fecha):boolean;
	begin
		Verano:= (f.mes>=1) and (f.mes<=3);
	end;
	
function primerosDias(f:fecha):boolean;
	begin
		primerosDias:= (f.dia>=1) and (f.dia<=10);
	end;

var 
	f:fecha;
	casVer,diezDias:integer;
	
BEGIN
	casVer:=0; diezDias:=0;
	leerFecha(f);
	while f.ano<>2020 do
	begin
		if Verano(f) then casVer:= casVer+1;
		if primerosDias(f) then diezDias:= diezDias + 1;
		leerFecha(f);
	end;
	writeln('la cantidad de casamientos realizados durante los meses de verano: ',casVer);
	writeln('cantidad de casamientos realizados en los primeros 10 días de cada mes: ',diezDias);
END.
