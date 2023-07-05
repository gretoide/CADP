program ejer3;
const
	zidname = 'zidane zinedine';
type
	nota = 1..10; 

var
	alumnoscon8, alumnosdesaprobados: integer;
	nombre: string;
	notas: nota;

begin
	alumnoscon8:=0;
	alumnosdesaprobados:=0;
	repeat
	writeln('ingrese su nombre: ');
	readln(nombre);
	writeln('ingrese su calificacion: ');
	readln(notas); 
	if (notas >= 8) then
		alumnoscon8:= alumnoscon8 + 1
	else
		if (notas = 7) then
		alumnosdesaprobados:= alumnosdesaprobados + 1;
	until (nombre = zidname);
	writeln('la cantidad de alumnos aprobados es: ', alumnoscon8);
	writeln('los alumnos con nota 7 son: ', alumnosdesaprobados);
	
end.
