program numerorealx;

var
	num1, nums: real;
	
begin
	writeln('ingrese un numero');
	readln(num1);
	writeln('ahora ingrese numeros hasta encontrar el primero * 2');
	readln(nums);
	while (nums <> num1*2) do
		readln(nums);
		writeln('ingreso el numero correspondiente');
end.
