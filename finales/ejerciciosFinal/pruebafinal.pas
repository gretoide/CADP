program prueba;
var c:integer;

{procedure calcular(var  b,a:integer);
	begin
		b:=10;
		while(b>0)do begin
			a:=a+b;
			b:=b-2;
			c:=c-b;
		end;
		writeln('2: ',a,' - ',b,' - ',c);
	end;}
	
procedure calcular(var  b,a:integer);
	var
		i:integer;
	begin
		b:=10;
		for i:=1 to 5 do begin
			a:=a+b;
			b:=b-2;
			c:=c-b;
		end;
		writeln('2: ',a,' - ',b,' - ',c);
	end;
	
var
	a,b:integer;
begin
	b:=80;
	c:=30;
	writeln('1: ',a,' - ',b,' - ',c);
	calcular(a,b);
	writeln('3: ',a,' - ',b,' - ',c);
end.
