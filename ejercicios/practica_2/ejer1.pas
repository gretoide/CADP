program ejercicioadicional;

const 	
	montoasuperar = 50000;
var
	codigo, inversiones, codigomayor, i, mayor50: integer;
	monto, promedio, montotal, mayorinversion: real;
begin
codigo:=0;
inversiones:=0; 
codigomayor:=0; 
mayor50:=0; 
monto:=0; 
promedio:=0; 
montotal:=0; 
mayorinversion:=-1;

repeat
	writeln('ingrese el codigo de su empresa:');
	readln(codigo);
	writeln('ingrese la cantidad de inversiones:');
	readln(inversiones);
	writeln('ingrese el monto por cada inversion:');
	for i:= 1 to inversiones do
		begin
		readln(monto);
		montotal:= montotal + monto;
		end;
		if (montotal>montoasuperar) then
			mayor50:= mayor50 + 1;
		if(montotal>mayorinversion)then
			begin
			codigomayor:= codigo;
			mayorinversion:= montotal;
			end;	
	promedio:= montotal/inversiones;
	montotal:=0;
	writeln('resultado del analisis');
	writeln('la empresa ', codigo, ', monto promedio $', promedio:0:2);
until (codigo = 100);
writeln('la empresa ', codigomayor, ' fue la que mayor dinero invirtio. Monto: $',mayorinversion:0:2);
writeln('hay ', mayor50, ' empresas con monto mayor a $50000');

end.
	
