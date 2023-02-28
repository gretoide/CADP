program Registros;

type
	str20 = string[20];
	alumno = record
		codigo : integer;
		nombre : str20;
		promedio : real;
	end;
	
	procedure mayorPromedio(a:alumno; var nombreMaxPromedio:str20);
		var
			max:real;
			begin
			max:=-1;
			if (a.promedio > max) then
				begin
				nombreMaxPromedio:=a.nombre;
				max:=a.promedio;
				end;
			end;
	procedure leer(var a: alumno; var contAlumn: integer);
		begin
		writeln('Ingrese el codigo del alumno');
		readln(a.codigo);
		if (a.codigo <> 0) then 
			begin
			writeln('Ingrese el nombre del alumno'); 
			readln(a.nombre);
			contAlumn:= contAlumn+1; //contador de alumnos totales
			writeln('Ingrese el promedio del alumno'); 
			readln(a.promedio);
			writeln('///////////////////////////////');
			end;
end;

{ declaración de variables del programa principal }

var
	a : alumno;
	contAlumn: integer;
	alumnMayorPro:str20;
	

{ cuerpo del programa principal }

begin
	contAlumn:=0;
	leer(a,contAlumn);
	while(a.codigo <> 0)do
		begin
		leer(a,contAlumn);
		mayorPromedio(a,alumnMayorPro);
		end;
	writeln('La cantidad de alumnos es: ',contAlumn);
	writeln('////El alumno con mayor promedio es: ', alumnMayorPro);
end.
