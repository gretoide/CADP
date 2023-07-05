

program ejer2;

var 
	i, num, nummax, position: integer;

BEGIN
	nummax:=-1;
	position:=0;
	for i:= 1 to 10 do
	begin
		writeln('inserte un numero: ');
		readln(num);
		if (num > nummax) then
		begin
			nummax:= num;
			position:= i;
		end;
	end;
	writeln('el mayor numero leido es: ', nummax, ' y su posicion es la: ', position);
		
	
	
END.

