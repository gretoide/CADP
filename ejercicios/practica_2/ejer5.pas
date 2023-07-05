program ejer5;

var
	num, min, max, sumador: integer;
	
begin
	min:=0;
	max:=0;
	sumador:=0;
	repeat
		writeln('ingrese un numero:');
		readln(num);
		sumador:= sumador + num;
		if ((num < min)and(num < max)) then
			min:= num;
		if ((num > min) and (num > max)) then
			max:=num;
	until (num = 100);
	writeln('el maximo numero es: ', max );
	writeln('el menor numero es: ',min);
	writeln('la suma de todos los numeros es: ',sumador);
end.
