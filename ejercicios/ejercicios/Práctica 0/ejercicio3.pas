program numero_decimales;

var 
	num1, num2: real;

begin
	writeln('ingrese dos numeros reales a imprimir: ');
	readln(num1,num2);
	writeln('El resultado de la operacion es:', num1 / num2:1:2);		{Debemos recordar, que para limitar la parte fraccionaria que queremos que sea impresa por pantalla}
																		{se usa la notacion writeln(x:y:z), donde x es el numero a imprimir, y el es el ancho y z es la cantidad de decimales}
end.
