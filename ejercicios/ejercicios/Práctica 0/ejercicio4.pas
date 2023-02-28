program calcular_circulo;
	
const
	pi=3.141592654;

var
	diametro, radio, area, perimetro: real;

begin
	writeln('ingrese el diametro del circulo:');
	readln(diametro);
	radio:= diametro / 2;
	area:= pi * (radio * radio);
	perimetro:= diametro * pi;
	writeln('radio del circulo: ', radio:1:2, ', area del ciruculo: ', area:1:2, ', perimetro del circulo: ', perimetro:1:2);
end.
	
