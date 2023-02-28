program ejer4;

const
	dimF = 2;
	
type
	alumnos = record
		nro:integer;
		apellido:string;
		nombre:string;
		asistencias:integer;
	end;
	
	alumnDatos = array[1..dimF] of alumnos;
	
procedure leerRegistro(var a:alumnos); {lectura del registro} //se dispone, no es necesario 
	begin
		writeln('________________________________');
		write('ingrese numero de alumno: ');readln(a.nro);writeln;
		write('ingrese apellido: ');readln(a.apellido);writeln;
		write('ingrese nombre: ');readln(a.nombre);writeln;
		write('cantidad de asistencias: ');readln(a.asistencias);writeln;
	end;
	
procedure cargaVector(var v:alumnDatos;var dl:integer); {carga del vector} //se dispone, no es necesario
	var
		aux:alumnos;
	begin
		dl:=0;
		leerRegistro(aux);
		while(dl <= dimF)do 
			begin
				dl:=dl+1;
				v[dl]:=aux;
				leerRegistro(aux);
			end;
	end;

//MODULOS DEL ENUNCIADO

{(a)}
function retornePos(v:alumnDatos; diml:integer; nroAlumn:integer):integer;
	var
		i,pos:integer;
	begin
		for i:= 1 to diml do
		begin
			if(v[i].nro = nroAlumn)then
				begin
					pos:=i;
				end;
			retornePos:=pos;
		end;
	end;
	
{(b)} //preguntar
procedure insertarAlumn(var v:alumnDatos; var diml:integer; alumno:alumnos); {recibe un alumno y lo inserta en el vector}
	var
		i,pos:integer;
	begin
		
		pos:=0;
		while(pos<=diml)and(alumno.nro <> v[pos].nro)do
			begin
			pos:=pos+1;
				for i:= diml downto pos do
					v[i]:=v[i+1];
			end;
			v[pos]:=alumno;
			diml:=diml+1;
		
	end;

{(c)}
procedure eliminarAlumno(var v:alumnDatos; var diml:integer; posAlumn:integer); {recibe posicion del alumno y lo borra}
	var
		i:integer;
	begin
		if((posAlumn>=1)and(posAlumn<=diml))then
			for i:= posAlumn to (diml-1) do
				v[i]:=v[i+1];
			diml:=diml-1;
	end;
	
{(d)}
procedure eliminarAlumnoConNro(var v:alumnDatos; nroAlumno:integer; var diml:integer); {recibe el numero de alumno, lo busca y lo elimina}
	var
		i,pos:integer;
	begin
		pos:=1;
		while(pos>=1)and(pos<=diml)do
			begin
				pos:=pos+1;
				if(v[pos].nro = nroAlumno)then
					for i:= pos to (diml-1)do
						v[i]:=v[i+1];
					diml:=diml-1;
		end;
	end;

{(e)}
procedure eliminarAusentes(var v:alumnDatos; var diml:integer);
	var
		i,y:integer;
	begin
		for i:= 1 to diml do
			begin
				if(v[i].asistencias = 0)then
					for y:= i to (diml-1) do
						v[y]:=v[y+1];
					diml:=diml-1;
			end;
	end;
//PROGRAMA PRINCIPAL
VAR
	v:alumnDatos;
	r:alumnos;
	rAUX:alumnos;
	diml,pos:integer;
BEGIN
	cargaVector(v,diml); {no se implemente xq se dispone}
	writeln('ingrese el nro de alumno del cual desea saber la posicion: ');readln(r.nro);
	writeln('la posicion es: ',retornePos(v,diml,r.nro)); {a}
	
	
	writeln('ingrese un alumno para insertar en el vector');leerRegistro(rAUX); 
	insertarAlumn(v,diml,rAUX);	{b}
	
	writeln('ingrese una posicion de alumno para eliminarlo: ');readln(pos); 
	eliminarAlumno(v,diml,pos);	{c}
	
	
	writeln('ingrese el nro. de alumno para buscarlo y eliminarlo');readln(r.nro);
	eliminarAlumnoConNro(v,diml,r.nro); {d}
	
	writeln('________________________________________');
	writeln('procederemos a eliminar los alumnos ausentes');eliminarAusentes(v,diml)
END.
