program paralto;

procedure enteros (par_alto : integer);

var
	nums, par: integer;
begin
	par_alto:=-1;
	readln(nums);
	while (nums > 0) do
	begin
	if (nums mod 2 = 0) then
		par:= nums;
	if (par>par_alto) then
		par_alto:=par;
	readln(nums);	
	end;
end;

//programa principal

begin
	writeln('ingrese numeros: ');
	enteros(par_alto);
	writeln('el par mas alto es: ',par_alto);
end.
