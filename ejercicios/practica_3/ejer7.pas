program ejer7;

type
	inve = record
		universidad:string;
		nombreCentro:string;
		cantInve:integer;
		cantBeca:integer;
	end;
	
procedure leer(var i:inve); //lectura de datos
	begin
		writeln('=============================');
		write('ingrese la universidad: ');readln(i.universidad);
		write('ingrese el NOMBRE DEL CENTRO: ');readln(i.nombreCentro);
		write('ingrese cant. Investigadores: ');readln(i.cantInve);
		write('ingrese cant. Becados: ');readln(i.cantBeca);
	end;
	
procedure MaxUniInve(i:inve;var uniMax:string;var cantInvestigadores:integer); //universidad con mayor cant investigadores
	begin
		if (i.cantInve>cantInvestigadores)then
			begin
			uniMax:=i.universidad;
			CantInvestigadores:=i.cantInve;
			end;
			
	end;

procedure MinimosBecados(i:inve; var centroMin1,centroMin2:string; var min1,min2:integer); //dos centros con menos becados
	begin
		if(i.cantBeca<min1)then
			begin
			min2:=min1;
			centroMin2:=centroMin1;
			min1:=i.cantBeca;
			centroMin1:=i.nombreCentro;
			end
		else
			if(i.cantBeca<min2)then
				begin
				min2:=i.cantBeca;
				centroMin2:=i.nombreCentro;
				end;
	end;
	
//PROGRAMA PRINCIPAL	

var	
	i:inve;
	cantInvestigadores,cantCentros,min1,min2:integer;
	centroMin1,centroMin2,uniMax,uniActual:string;
	
begin
	min1:=999;min2:=999;
	leer(i);
	while(i.cantInve<>0)do
		begin
		uniActual:=i.universidad;
		cantInvestigadores:=0;
		cantCentros:=0;
			while((i.cantInve <> 0)and (i.universidad = uniActual))do
			begin
			cantInvestigadores:=i.cantInve;
			cantCentros:=cantCentros+1;
			leer(i);
			end;
		writeln('la cantidad de centros de la univeridad ',uniActual, ' es: ',cantCentros);
		MinimosBecados(i,centroMin1,centroMin2,min1,min2);
		MaxUniInve(i,uniMax,cantInvestigadores);
	end;
	writeln('////////////////////');
	writeln('la Universidad con mayor cantidad de investigadores fue: ',uniMax);
	writeln('los centros con menor cant. de Becados son: ', centroMin1, ' y ',centroMin2);
end.
