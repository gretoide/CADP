program ejer7;

type
	
	vector = array[1..9] of integer;

{debemos poner el vector completamente en 0 para que luego podamos sumar correctamente}
procedure Inicializar(var v:vector);
	var i:integer;
	begin
		for i:= 1 to 9 do
			v[i]:=0;
	end;
	
{cantidad de veces que aparece un digito}
procedure ContarDigs(var v:vector; num:integer);
	begin
			v[num]:= v[num] + 1; {va a la posicion dada por el num ingresado, y suma 1}
	end;
	
{el digito mas leido}
function DigMasLeido(v:vector):integer;
	var
		i,max,dig:integer;	
	begin
		max:=-1;
		for i:= 1 to 9 do begin
			if (v[i] > max) then 
			begin
				max:=v[i];
				dig:=i; {indica la pos donde hay mas cantidad}
			end;
		end;
		DigMasLeido:=dig;
	end;
	
procedure DigSinleer(v:vector); {digitos sin leer}
	var i:integer;
	begin
		for i:= 1 to 9 do 
		begin
			if (v[i] = 0) then 
				writeln(i,' ');
		end;
	end;
	
procedure Imprimir(v:vector);
	var i:integer;
	begin
		writeln('cantidad de veces que se imprimio cada num');
		for i:= 1 to 9 do 
		writeln('numero ', i,': ', v[i], ' veces');
	end;

//programa principal
VAR
	v:vector;
	num:integer;
	
BEGIN
	Inicializar(v);
	writeln('ingrese numeros: ');
	readln(num);
	while (num <> -1)do 
	begin
		ContarDigs(v,num);
		readln(num);
	end;
	Imprimir(v);
	writeln('el digito mas leido fue: ', DigMasLeido(v));
	writeln('los digitos sin leer fueron: ');DigSinLeer(v);
END.
	
