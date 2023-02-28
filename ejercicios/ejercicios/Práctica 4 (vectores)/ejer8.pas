program ejer8;

const 
	dimF = 400;
type
	alumnos = record
		nroDesc:integer;
		DNI:integer;
		apellido:string;
		nombre:string;
		anoNacimiento:integer;
	end;

	vector = array[1..dimF] of alumnos;
	
procedure leerRegistro(var a:alumnos); {carga el registro}
	begin
	writeln('-------------------------------------------------------------------------------');
	write('ingrese el nro de descripcion del alumno: ');readln(a.nroDesc);
	writeln;
	write('ingrese DNI del alumnno: ');readln(a.DNI);
		if (a.DNI <> -1)then
		begin
		writeln;
		write('ingrese el apellido: ');readln(a.apellido);
		writeln;
		write('ingrese nombre: ');readln(a.nombre);
		writeln;
		write('ingre año de nacimiento: ');readln(a.anoNacimiento);
		end;
	end;
	

	
procedure apellidoYnombre(a:alumnos; var apellido1,apellido2,nombre1,nombre2:string; var min1,min2:integer); {maximos edades}
	begin
		if (a.anoNacimiento < min1) then
			begin
			apellido2:=apellido1;
			nombre2:=nombre1;
			min2:=min1;
			apellido1:=a.apellido;
			nombre1:=a.nombre;
			min1:=a.anoNacimiento;
			end
			else
				if(a.anoNacimiento < min2)then
				begin
				apellido2:=a.apellido;
				nombre2:=a.nombre;
				min2:=a.anoNacimiento;
				end;
	end;
	
function Espar(dni:integer):boolean; {compruebalos dni compuestos de los digitos pares}
	var
		seguir:boolean;resto:integer;
	begin
		seguir:=true;
		while ((dni <> 0)and(seguir=true))do
			begin
				resto:= dni MOD 10;
				if((resto mod 2)= 0)then
					begin
					seguir:=true;
					dni:=dni div 10;
					end
					else
						seguir:=false;
			end;
		EsPar:=seguir;
	end;
 
 procedure ContadorPar(Espar:boolean; var contPar:integer); {cuenta definitavemente}
	begin
	if(Espar)then
		contPar:=contPar+1;
	end;
	{fin}

//PROGRAMA PRINCIPAL
VAR
	ape1,ape2,nom1,nom2:string;
	min1,min2,i,contPar, alumnosprom:integer;
	v:vector;
BEGIN
	alumnosprom:=0;
	contPar:=0;
	min1:=9999;
	min2:=9999;
  {módulo cargar vector}
  for i:= 1 to dimF do 
	begin
	LeerRegistro(v[i]);
  end;
  {esta acá...}
  for i:= 1 to dimF do 
	begin
		alumnosprom:=alumnosprom+1;
		apellidoYNombre(v[i],ape1,ape2,nom1,nom2,min1,min2);
		ContadorPar(Espar(v[i].DNI),ContPar);
	end;
	writeln('los alumnos de mayor edad son: ',ape1, ' ', nom1, ' y ',ape2, ' ',nom2);
	writeln('el promedio de alumnos con DNI con todos digitos pares es: %',((contPar/alumnosprom)*100):1:2);
END.
