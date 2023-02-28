
program ejer10;

procedure sum(num:integer; var sumpares, digimpares: integer);
	var
		dig:integer;
	begin
		while(num<>0)do
			begin
			dig:= num mod 10;
			if(dig mod 2 = 0)then
				sumpares:=sumpares+dig
			else
				digimpares:=digimpares+1;
			num:= num div 10;
			end;
	end;

//programa principal
VAR
	sumapares, digimpares, num: integer;

BEGIN
	readln(num);
	while (num<>12345) do
		begin
		sum(num,sumapares,digimpares);
		writeln('la suma de los digitos pares es ', sumapares);
		writeln('la cant. de digitos impares es ',digimpares);
		readln(num);
		sumapares:=0;
		digimpares:=0;
		end;
	
END.

