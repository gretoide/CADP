{Realice un programa que informe el valor total en pesos de una transacción en dólares.
Para ello, el programa debe leer el monto total en dólares de la transacción, el valor del
dólar al día de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la
transacción. Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor
20,54 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar:
La transacción será de 213,61 pesos argentinos
(resultado de multiplicar 10*20,54 y adicionarle el 4%)
}

program ejercicio_6;

var 
	usd, valor_usd_pesos, transaccion_pesos, total_comision: real;
	
begin
	writeln('ingrese la cantidad de dolares a transferir');
	writeln('dolares totales:');
	readln(usd);
	writeln('valor actual del dolar (en pesos):');
	readln(valor_usd_pesos);
	writeln('inserte la comision a aplicar (en pesos):');
	readln(transaccion_pesos);
	total_comision:= (usd * valor_usd_pesos) + (usd * valor_usd_pesos) * transaccion_pesos / 100;
	writeln('la transaccion sera de ',total_comision:1:2 , ' pesos argentinos.');
end.
