program ejer11;

type 
	lista = ^nodo;
	
		egresado = record
		nro:integer;
		apellido:string;
		prom:real;
	end;
	
	nodo = record
		elem:egresado; {el nodo contiene el registro como elemento}
		sig:lista;
	end;
		
procedure CargarEgresado(var e:egresado); {carga de egresados}
	begin
		writeln('------------------------');
		writeln;
		write('ingrese el nro de alumno: ');readln(e.nro);
		if(e.nro <> 0)then begin {da error si no ingresamos minimo 4 alumnos}
			writeln;
			write('ingrese el apellido de alumno: ');readln(e.apellido);
			writeln;
			write('ingrese promedio de la carrera: ');readln(e.prom);
		end;
	end;
	
procedure InsertarOrdenado(var L:lista; e:egresado); {inserta los egresados}
	var
		nuevo,ant,act:lista;
	begin
		new(nuevo);
		nuevo^.elem:=e;
		ant:=L;
		act:=L;
		while((act <> nil)and(e.prom < act^.elem.prom))do begin
			ant:=act;
			act:=act^.sig;
		end;
		if(act = L)then 
			L:=nuevo
		else
			ant^.sig:=nuevo;
		nuevo^.sig:=act;	
	end;
	
procedure CargarLista(var L:lista); {cargala lista de egresados}
	var
		e:egresado;
	begin
		writeln('INGRESE LOS EGRESADOS');
		writeln;
		CargarEgresado(e);
		while(e.nro <> 0)do begin
			InsertarOrdenado(L,e);
			CargarEgresado(e);
		end;
	end;
	
procedure imprimirPremios(L:lista); 
	var
		i:integer;
	begin
		writeln('LISTADO DE ALUMNOS CON EL PREMIO');
		writeln;
		for i:= 1 to 10 do begin
			writeln('el egresado ',L^.elem.apellido,'con nro de alumno : ',L^.elem.nro);
			writeln;
			L:=L^.sig;
			end;
	end;
	
{programa principal}
var
	L:lista;
begin
	L:=nil;
	CargarLista(L);
	imprimirPremios(L);
end.
