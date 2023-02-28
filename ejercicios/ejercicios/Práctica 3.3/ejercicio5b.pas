program ejer5b;

function x(num1,num2:integer):boolean;
	var
		ok:boolean;
	begin
		if(num2 = num1 * 2) then
			ok:=true
		else
			ok:=false;
		x:=ok;
		
	end;

var //variables locales al programa
	num1, num2, cant, dobleA: integer;

BEGIN
	dobleA:=0;
	cant:=0;
	writeln('ingrese un par de numeros '); readln(num1); readln(num2);
	while ((num1 <> 0) and (num2 <> 0)) do
		begin
			x(num1,num2);
				if (x(num1,num2)) then
					dobleA:=dobleA+1;
			readln(num1,num2);cant:=cant+1;
		end;
	writeln('cant. pares: ', cant, ' cant. pares donde B = A * 2: ', dobleA);
END.
