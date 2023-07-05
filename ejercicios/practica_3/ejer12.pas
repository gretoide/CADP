{
   ejer12.pas
   
Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió
   
}


program untitled;

function secuenciaA(c:char):boolean; {analiza los valores permitidos de la secuencia a}
	var
	cumple:boolean;
	begin
		if((c = 'a') or (c = 'e') or (c = 'i') or (c = 'o') or (c = 'u'))then
			cumple:=true
		else
			cumple:=false;
		
		secuenciaA:=cumple;
	end;
	
procedure cumpleA(var cumple:boolean); {mientras se ingresa la secuencia, verifica que sea <> del caracter de corte y que la secuncia vaya cumpliendo}
	var
		c:char;
		
		begin
			readln(c);
			while((c<>'$')and(cumple))do
			begin
				if(not secuenciaA(c))then
					begin
					cumple:=false;
					writeln('ha ingresado un valor incorrecto')
					end
					else
					readln(c);
				
				
			end;
				
		end;
	
function secuenciaB(c:char):boolean; {valores permitidos de la secuencia b}
	var
	cumple2:boolean;
	begin
		if (c > 'A')and (c<='z')and (not secuenciaA(c))then
			cumple2:=true
		else
			cumple2:=false;
			
		secuenciaB:=cumple2;
	end;
	
procedure cumpleB (var cumple2:boolean);
	var
		c:char;
		begin
			readln(c);
			while(c <> '#')and(cumple2)do
			begin
				if(not secuenciaB(c))then
					begin
					cumple2:=false;
					writeln('ha ingresado un valor incorrecto');
					end
					else
					readln(c);
			end;
		end;
		
//PROGRRAMA PRINCIPAL
VAR
	cumple, cumple2:boolean;
BEGIN
	cumple:=true;
	writeln('ingrese la secuencia A, para terminar ingrese "$" ');
	cumpleA(cumple); //si A cumple
		if(cumple)then
		writeln('la secuencia a se cumplio satisfactoriamente');
		writeln('ahora ingrese la secuencia B, para terminar ingrese "#" ');
			cumpleB(cumple2); //si B cumple
				if (cumple2)then
				writeln('la secuencia se cumplio satisfactoriamente');
	
	
END.

