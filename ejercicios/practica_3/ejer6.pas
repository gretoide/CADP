program microprocesadores;

type
	micros = record
		marca:string;
		linea:string;
		cores:integer;
		velocidadReloj:integer;
		transistores:integer;
	end;
	
procedure leer(var m:micros); //lee
	begin
		writeln('-------------------------------------------');
		write('ingrese la MARCA del procesador: ');readln(m.marca);
		write('ingrese la LINEA: ');readln(m.linea);
		write('ingrese la cant. de CORES: ');readln(m.cores);
			if(m.cores <> 0)then
				begin
				write('ingrese  la VELOCIDAD del reloj (en Ghz): ');readln(m.velocidadReloj);
				writeln('ingrese el TAMAÑO de los transistores (en nm): ');readln(m.transistores);
				end;
	end;
	
procedure marcaYlinea(m:micros; var lista1,lista2:string); //marca y linea de mcores > 2 y transistores >=22
	begin
		if (m.cores>2)and(m.transistores >= 22)then
			lista1:=m.marca;
			lista2:=m.linea;
	end;
	
procedure multiCore(m:micros; var contMulti:integer); //contador de multicores amd or intel
	begin
		if((m.marca = 'amd')or(m.marca = 'intel'))then
			if((m.cores>1)and(m.velocidadReloj >= 2))then
				contMulti:=contMulti+1;
	end;
	
procedure maxTransistores(m:micros; var marca1,marca2:string; var conttransis:integer; var max1,max2:integer); //maximos de transis
	begin
		if(conttransis>max1)then
			begin
			marca2:=marca1;
			max2:=max1;
			marca1:=m.marca;
			max2:=conttransis;
			end
			else
				if(conttransis>max2)then
					begin
					marca2:=m.marca;
					max2:=conttransis;
					end;
	end;
	
var
	m:micros;
	contMulti,conttransis,max1,max2:integer;
	lista1,lista2,marca1,marca2,marcaActual:string;
	
begin
	max1:=-1;max2:=-1;conttransis:=0;contMulti:=0;
	writeln('para salir ingrese en cores el 0');
	leer(m);
	while(m.cores <> 0)do
	begin
		conttransis:=0;
		marcaActual:=m.marca;
		while((m.marca = marcaActual)
			 and(m.cores<>0))do
			begin
			if(m.transistores = 14)then
				conttransis:=conttransis+1;
			marcaYlinea(m,lista1,lista2);
			multicore(m,contMulti);
			leer(m);
			end;
		maxTransistores(m,marca1,marca2,conttransis,max1,max2);
	end;
			
	writeln('_____________________________');
	writeln('lista de procesadores con cores>2 y transis>=22: ',lista1, 'y',lista2);
	writeln('dos marcas con mayores micros con transis = 14: ', marca1, ' y ', marca2);
	writeln('cant. procesadores intel o amd multicore: ', contMulti);
end.

