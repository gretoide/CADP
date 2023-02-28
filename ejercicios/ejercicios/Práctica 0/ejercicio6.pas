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
