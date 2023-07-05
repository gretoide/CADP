program numeros_imprimir;

var
	num1, num2: integer;
	
begin
	writeln('inserte el primer numero: ');
	readln(num1);
	writeln('inserte el segundo numero');
	readln(num2);
	if (num1 = num2) then
		writeln('ambos numeros son iguales')
	else 
	begin
		if (num1 < num2) then
			writeln('el numero ', num1, ' es menor que el numero ', num2)
		else
			writeln('el numero ', num1, ' es mayor que el numero ', num2);
	end
end.
