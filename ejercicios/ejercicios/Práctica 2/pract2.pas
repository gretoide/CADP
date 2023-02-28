program ejer1;

var
	i, num, numstotales, nummayor5: integer;
	

begin
	numstotales:=0;
	nummayor5:= 0;
	for i:= 1 to 10 do 
	begin
		writeln('ingrese un numero: ');
		readln(num);
		numstotales:= numstotales + num;
		if (num > 5) then 
			begin
			nummayor5 := nummayor5 + 1;
			end;
	end;
		writeln('la suma de todos los numeros es: ', numstotales);
		writeln('los cantidad de numeros mayores a 5 es: ', nummayor5);
end.
