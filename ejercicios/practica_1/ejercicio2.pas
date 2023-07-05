program valores_absolutos;

var
	num: real;
	
begin
	writeln('ingrese un numero real');
	read(num);
	if (num >= 0) then
		writeln('|',num:1:2,'|')
	else
		writeln('|',(num*(-1)):1:2,'|');
end.
