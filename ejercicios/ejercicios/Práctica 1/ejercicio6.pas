program ejercicio6;

var
	promedio, porcentaje: real;
	legajo, alumnostotales, alumnosdesaprobados, alumnlegajo: integer;
	

begin
	alumnostotales:=0;
	alumnosdesaprobados:=0;
	alumnlegajo:=0;
	legajo:=0;
	writeln('ingrese nro de legajo:');
	readln(legajo);
	while (legajo <> -1) do																		{mientras que el legajo sea distinto de -1}
	begin																						{lee legajo y lee promedio}
		alumnostotales:= alumnostotales + 1;
		writeln('ingrese nro de promedio:');
		readln(promedio);
			if (promedio > 6.5) then
				begin													{anota los alumnos desaprobados}
				alumnosdesaprobados:= alumnosdesaprobados + 1;
				end
			else
				if ((promedio > 8.5) and (legajo<2500)) then						{anota los alumnos destacados}
					alumnlegajo:= alumnlegajo + 1;
		writeln('ingrese nro de legajo:');
		readln(legajo);			{siempre que el ultimo dato no deba procesarse, se usa un while con el read al final}

	end;
		writeln('la cantidad de alumnos leida es: ', alumnostotales);
		writeln('la cantidad de alumnos con promedio > 6.5: ', alumnosdesaprobados);
		porcentaje:= (alumnostotales / alumnlegajo) * 100;
		writeln('el promedio de alumnos con promedio > 8.5: ', porcentaje:1:1, '%');
end.
