program ejer3;

CONST
DIMF= 200;

type
dias=0..31;

marzo=record
	diaM:dias;
	monto:real;
	km:real;
end;

vtransporte= array [1..DIMF] of marzo;
vdias= array [dias] of integer;

procedure inicializar (var v:vdias);
var
	i:integer;
begin
	for i:= 1 to 31 do 
		v[i]:= 0;
end;

{a}

procedure leer (var t:marzo);
begin
	with t do begin
	write ('Ingrese dia del mes donde se realizo el viaje: '); readln (diaM);
	write ('Ingrese el monto del dinero transportado: '); readln (monto);
	write ('Ingrese km recorridos: '); readln (km);
	writeln ();
	end;
end;

procedure cargar (var v:vtransporte;var dimL:integer);
var
	aux:marzo;
begin
	dimL:=0;
	leer (aux);
	while (aux.km <>0) and(dimL < dimF) do begin
		dimL:= dimL + 1;
		v[dimL]:= aux;
		leer (aux);
	end;
end;

{b}

procedure totalParaPR (monto:real; var montoTotal:real);
begin
	montoTotal+= monto;
end;

procedure menosDin (reg:marzo; var min:marzo);
begin
if (reg.monto < min.monto) then 
	min:=reg;
end;

procedure cantViajes (diaM:dias ; var totaldias:vdias);
begin
	totaldias[diaM]:= totaldias[diaM] + 1;
end;

procedure imprimir (min:marzo);
begin
writeln ('DISTANCIA:= ',min.km:2:1);
writeln ('DIA DEL MES:= ',min.diaM);
writeln ();
end;

procedure imprimir2 (v:vdias);
var
	i:dias;
begin
for i:= 1 to 31 do
	if (v[i] <> 0) then writeln ('La cantidad de viajes realizados el dia ',i, ' es de: ',v[i]);
end;

procedure recorrer (v:vtransporte;dimL:integer);
var
	i:integer;
	montoTotal:real;
	min:marzo;
	totaldias:vdias;
begin
	min.diaM:=0;
	min.monto:= 32000;
	min.km:=0;
	inicializar (totalDias);
	for i:= 1 to dimL do begin
		totalParaPr (v[i].monto,montoTotal);
		menosDin (v[i],min);
		cantViajes (v[i].diaM, totalDias);
	end;
	writeln ('El monto promedio realizado es: ',montoTotal/DIML:2:1); //1
	writeln ();
	writeln ('La distancia recorrida y el dia del mes en que se realizo el viaje que transporto menos dinero: ');
	writeln ();
	imprimir (min); //2
	imprimir2 (totalDias); //3
end;

{c}

procedure eliminar (var v:vtransporte;var dimL:integer;var seBorro:boolean);
var 
	i:integer;
begin
seBorro:=false;
	for i:=1 to dimL - 1 do begin
		if (v[i].km = 100) then begin
			v[i]:= v[i+1];
			seBorro:=true;	
			dimL:= dimL - 1;
		end;
	end;
end;


//

{programa principal}

var
	v:vtransporte;
	dimL:integer;
	seBorro:boolean;

begin
	seBorro:=false;
	cargar (v,dimL); //A
	recorrer (v,dimL); //B
	eliminar (v,dimL, seBorro); //C
	writeln ();
	if (seBorro) then writeln ('Se han borrado todos los viajes cuya distancia sea = 100') else writeln ('No habia viajes cuyos km sean 100 para borrar');
end.
