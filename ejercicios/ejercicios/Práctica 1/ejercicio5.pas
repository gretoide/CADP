program numerorealx;

var
	num1, nums: real;
	numingresados: integer;
	
begin
	numingresados:= 0;
	writeln('ingrese un numero');
	readln(num1);
	writeln('ahora ingrese 10 numeros mas');
	readln(nums);
	while ((nums <> num1*2) and (numingresados <> 10)) do
	begin
		readln(nums);
		numingresados:= numingresados + 1;
	end;
	if (nums = num1 * 2) then
		writeln('ingreso el numero correspondiente')
	else
		writeln('no se ha ingresado ningun valor igual al primero numero multiplicado dos veces')
end.
