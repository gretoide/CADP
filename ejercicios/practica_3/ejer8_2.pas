
program pantalones;


//proceso para calcular los minimos
procedure minimos(var codigo:integer; precio:real; var codmin1, codmin2:integer);

	var
		min1, min2: real;
		
	begin
		min1:=999;
		min2:=999;
		if(precio<min1)then
		begin
			codmin2:=codmin1;
			min2:=min1;
			codmin1:=codigo;
			min1:=precio;
		end
		else
			if(precio<min2)then
			begin
			codmin2:=codigo;
			min2:=precio;
			end;
		
	end;
//proceso para calcular los pantalones
procedure pantalones(tipoRopa:string; precioPant:real; codigo:integer; var codPantCaro:integer);

	var
		max:real;
	
	begin
		max:=-1;
		if(precioPant>max)then
			begin
			max:=precioPant;
			codPantCaro:=codigo;
			end;
	end;
//funcion que retorne el promedio total
function promediotot(preciotot:real):real;
	
	var
		proms:real;
	begin
	proms:= preciotot/4;
	promediotot:=proms;
	end;
	
//FIN DE LOS MODULOS 
VAR
	precio, preciostot: real;
	i,codigo,codmin1,codmin2,codPantCaro: integer;
	tipoRopa: string;
BEGIN
	preciostot:=0;
	for i:= 1 to 4 do
	begin
	writeln('ingrese el precio del producto'); readln(precio);
	preciostot:=preciostot+precio;
	writeln('ingrese el nombre del producto'); readln(tipoRopa);	//lectura de datos
	writeln('ingrese el codigo del producto'); readln(codigo);
	
		if (tipoRopa = 'pantalon') then
			pantalones(tipoRopa,precio,codigo,codPantCaro);	//evalua si es un pantalon, sino, calcula los minimos
	minimos(codigo,precio,codmin1,codmin2);
	end;
	
	writeln('el codigo de los productos mas baratos es: ', codmin1, ' y ', codmin2);
	writeln('el codigo del pantalon mas caro es: ',codPantCaro);
	writeln('el promedio total es: ',promediotot(preciostot):1:2);
	
END.

