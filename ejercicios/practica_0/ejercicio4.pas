{4. Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro)
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R 2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula
D*PI (o también PI*R*2)}

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
	
