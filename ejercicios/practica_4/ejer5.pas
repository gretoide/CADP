program ejer5;
const
	dimF = 500;
type 
	tipoM = A..F;
	codigoC = 1..2400;
	monotributista = record
		dia:integer;
		mes:integer;
		año:integer;
		tipo:tipoM;
		codigo:codigoC;
		montoMensual:real;
	end;
	
	vectorAmazon = array[1..dimF] of monotributista;
	
	vectorMonotributista = array[tipoM] of monotributista;
	
	
procedure leerRegistro(var m:monotributista); {lee el registro}
	begin
		writeln('=======================================================');
		write('ingrese anio/mes/dia comenzando desde el mas viejo ');readln(m.año);write('/');read(m.mes);write('/');read(m.dia);
		writeln;
		write('ingrese su tipo de monotributista [A..F]:');readln(m.tipo);
		writeln;
		write('ingrese el codigo de su ciudad[1..2400]: ');readl(m.codigo);
		writeln;
		write('ingrese monto mensual: ');readln(m.montoMensual);
	end;
	
procedure cargarVector(var v:vectorAmazon); {cargar vector}
	var
		i:integer;
		reg:monotributista;
	begin
		for i:= 1 to dimF do
			leerRegistro(reg);
	end;
	
procedure vectorContadorMes(var v1:vectorAmazon); {vector contador de meses}
	var
		i:integer;
	begin
		for i:= 1 to 12 do
			v[i].mes:=v[i].mes+1;
	end;
	
procedure vectorContadorAño(var v2:vectorAmazon); {vector contador de años}
	var
		i:integer;
	begin
		for i:= 1 to dimF do
			v[i].año:=v[i].año+1;
	end;

