
program ejercicio11;

//apellidos de los dos nros. de inscripcion mas chicos

procedure apellidoyminimos(apellido:string; var apemin1,apemin2:string; var min1,min2:integer; nro:integer);
	begin
	if (nro<min1)then
		begin
		apemin2:=apemin1;
		min2:=min1;
		apemin1:=apellido;
		min1:=nro;
		end
		else
			if(nro<min2)then
				begin
				apemin2:=apellido;
				min2:=nro;
				end;
	end;

//nombres de los dos nros. mas grandes

procedure nombresymaximos(nombre:string; var nommax1,nommax2:string; var max1,max2:integer; nro:integer);
	begin
		if (nro>max1)then
			begin
			nommax2:=nommax1;
			max2:=max1;
			nommax1:=nombre;
			max1:=nro;
			end
			else
				if(nro>max2)then
					begin
					nommax2:=nombre;
					max2:=nro;
					end;
	end;
	
//contador de nros pares

procedure contadorpar(nro:integer; var contpar:integer);
	begin
		if(nro mod 2 = 0)then
			contpar:=contpar+1;
	end;
//cuerpo principal del programa
VAR
	apellido, nombre, apemin1, apemin2, nommax1, nommax2: string;
	contpar, contnro, min1, min2, max1, max2, nro:integer;
	
BEGIN
	min1:=999;
	min2:=999;
	max1:=-1;
	max2:=-1;
	contpar:=0;
	contnro:=0;
	
	repeat
		writeln('ingrese el nro de inscripcion: ');readln(nro);
		contnro:=contnro+1;
		writeln('ingrese nombre y apellido');
		readln(nombre);
		readln(apellido);
		
		apellidoyminimos(apellido,apemin1,apemin2,min1,min2,nro);
		
		nombresymaximos(nombre,nommax1,nommax2,max1,max2,nro);
		
		contadorpar(nro,contpar)
		
	until(nro = 1200);
	
	writeln('apellidos de los alumnos con nros. mas chicos: ', apemin1, ' y ', apemin2);
	writeln('nombres de los alumnos con nros. mas grandes: ', nommax1, ' y ', nommax2);
	
	write('el promedio de nros. de inscripcion pares es: ',(contpar/contnro):1:2);
END.

