program anidamientos;
 
 procedure leer(letrarda:char;analisi:boolean);
 begin
	writeln('ingrese una letra: ');
	readln(letrarda);
 if (analisi = true) then
 writeln('Se trata de una minuscula')
 else
 writeln('Se trata de una mayuscula');
 end; { fin del procedure leer}
 
 function analizarLetra(letra:char):boolean;
 var 
 begin
 if (letra >= 'a') and (letra <= 'z') then
	analizarLetra := true
 else
	if (letra >= 'A') and (letra <= 'Z') then
	begin
	analizarletra := false;
	end;
 end; { fin de la funcion analizarLetra }

var
 ok : boolean;
 letra_of: char;
begin { programa principal }
	ok := analizarLetra(letra_of);
	leer(letra_of,ok);
	if (ok = true) then
	writeln('Gracias, vuelva prontosss'); 
end.
