program kiosquero_raton;
var
	caramelos, clientes, save_car, div_car: integer;
	precio_caro: real;
begin
	writeln('ingrese la cantidad de los caramelos:');
	readln(caramelos);
	writeln('ingrese la cantidad de clientes:');
	readln(clientes);
	div_car:= caramelos div clientes;
	save_car:= caramelos mod clientes;
	writeln('la cantidad corespondiente para cada cliente es: ', div_car, ' la cantidad de caramelos que se queda el kioskero es: ', save_car);
	precio_caro:= 1.60 * caramelos * clientes;
	writeln('si el precio fuera $1.60 deberia cobrar en total: ', precio_caro:1:2);
end.
