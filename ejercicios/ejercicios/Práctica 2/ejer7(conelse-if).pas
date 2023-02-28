program carreras;

var
	nombrecorredor, corredormin1, corredormin2, corredormax1, corredormax2:string;
	velocidad, min1, min2, max1, max2: real;
	i:integer;
begin
	min1:=999;
	min2:=0;
	max1:=-1;
	max2:=0;
	for i:= 1 to 100 do
	begin
		write('ingrese el NOMBRE del corredor: ');
		readln(nombrecorredor);
		write('ingrese el TIEMPO en el que completo la carrera: ');
		readln(velocidad);
		if (velocidad > max1) then {calcula el corredor maximo n1}
			begin
			max2:= max1;
			corredormax2:= corredormax1;
			max1:= velocidad;
			corredormax1:= nombrecorredor;
			end
			else
				if (velocidad > max2) then {calcula el corredor maximo n2}
				begin
				max2:= velocidad;
				corredormax2:= nombrecorredor;
				end;
		if (velocidad < min1) then {calcula el corredor minimo n1}
			begin
			min2:= min1;
			corredormin2:= corredormin1;
			min1:= velocidad;
			corredormin1:= nombrecorredor;
			end
			else
				if (velocidad < min2) then
				begin
				min2:= velocidad;
				corredormin2:= nombrecorredor;
				end;
	end;
	writeln('los corredores mas RAPIDOS fueron: 1er puesto [', corredormin1, '] y 2do puesto [', corredormin2,']');
	writeln('los corredores ULTIMOS fueron: [', corredormax1, '] y [', corredormax2,']');

end.
