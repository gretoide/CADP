{5. Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo
cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X),
la cantidad de clientes (Y), e imprima en pantalla un mensaje informando la
cantidad de caramelos que le corresponderá a cada cliente, y la cantidad de
caramelos que se quedará para sí mismo.
b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo
tiene un valor de $1.60,}

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
