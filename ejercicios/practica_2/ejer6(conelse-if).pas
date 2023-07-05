
program ejer6;

type
	subrango = 0..200;

var
	i, may16: integer;
	codigos, barat1, barat2: subrango;
	precio, min1, min2: real;

begin
	min1:=10000000;
	min2:=10000000;
	may16:= 0;
	barat1:=0;
	barat2:=0;
	for i:= 1 to 200 do
	begin
		write('ingrese el CODIGO del producto: ');
		read(codigos);
		write(' --------> ahora ingrese el PRECIO del producto: ');
		read(precio);
		if (precio < min1) then {evalua que el precio sea menor al maximo}
			begin
			min2:= min1;
			barat2:= barat1;
			min1:= precio;
			barat1:= codigos; 
			end
			else
				if (precio < min2) then {evalua el segundo mas barato}
				begin
				min2:= precio;
				barat2:= codigos;
				end;
		if ((precio > 16)and(codigos mod 2 = 0)) then  {guarda los precios mayor a 16 cuales su codigo es par}
			may16:= may16 + 1;
	end;
	writeln('el codigo del articulo mas barato es: ', barat1);
	writeln('el codigo del segundo articulo mas barato es: ', barat2);
	writeln('la cantidad de precios mayores a 16 con codigo par: ', may16);
end.

