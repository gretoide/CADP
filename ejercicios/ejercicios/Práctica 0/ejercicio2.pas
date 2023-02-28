program numero_inverso;

var
	num1, num2: integer;
	
begin
		writeln('Inserte dos numeros enteros:');
		readln(num1,num2);															
		writeln('Los numeros ingresados son: ', num2, ' y ', num1);
		writeln('La suma de ambos numeros es: ', num1 + num2);
end.

{  
 
Si implementáramos una variable

begin
		writeln('Inserte dos numeros enteros:');
		readln(num1,num2);															
		writeln('Los numeros ingresados son: ', num2, ' y ', num1);
		suma := num1 + num2;
		writeln('La suma de ambos numeros es: ', suma);
end.
}
