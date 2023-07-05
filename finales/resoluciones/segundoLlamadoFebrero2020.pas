program congreso;

const
	dimf = 12;
	
type
	subrango = 1..12;
	
	publicaciones = record
		titulo:String;
		autor:String;
		dni:integer;
		publicacion:subrango;
	end;
	
	vector = array[subrango] of integer;
	
	lista = ^nodo;
	
	nodo = record
		dato:publicaciones;
		sig:lista;
	end;
	
procedure leerDatos(var p:publicaciones; var v:vector);
	begin
		writeln('--------------------------');
		write('ingrese dni: ');readln(p.dni);
		if(p.dni <> 0)then begin
			write('tipo de publicacion: ');readln(p.publicacion);
			v[p.publicacion]:= v[p.publicacion]+1;
		end;
	end;
	
procedure listaOrdenada(var l:lista; p:publicaciones);
	var
		nuevo,anterior,actual:lista;
	begin
		new(nuevo);
		nuevo^.dato:=p;
		anterior:=l;
		actual:=l;
		while(actual <> nil)and(p.dni < actual^.dato.dni)do begin
			anterior:=actual;
			actual:=actual^.sig;
		end;
		if(anterior = actual)then 
			l:=nuevo
		else
			anterior^.sig:=nuevo;
		nuevo^.sig:=actual;
	end;

procedure inicializarVector(var v:vector);
	var
		i:integer;
	begin
		for i:= 1 to dimf do
			v[i]:=0;
	end;
	
procedure crearLista(var l:lista; var v:vector);
	var
	p:publicaciones;
	begin
		leerDatos(p,v);
		while(p.dni <>0)do begin
			listaOrdenada(l,p);
			leerDatos(p,v);
		end;
	end;
	
procedure maxPublicaciones(v:vector);
	var
	publi,max,i:integer;
	begin
		max:=0;
		for i:=1 to dimf do begin
			if(v[i]>max)then begin
				max:=v[i];
				publi:=i;
			end;
		end;
		writeln('la cant maxima del tipo de publicacion: [',publi,'] es [',max,']');
	end;
	
procedure cantidadDePublicacionesPorAutor(l:lista);
	var
	actual:lista;
	cant:integer;
	begin
		while(l<>nil)do begin
			cant:=0;
			actual:=l;
			while(l^.dato.dni = actual^.dato.dni)do begin
				cant:=cant+1;
				l:=l^.sig;
			end;
			writeln('autor: ',actual^.dato.dni,' con ',cant,' publicaciones');
			l:=l^.sig;
		end;
	end;

{programa principal}

var
	v:vector;
	l:lista;
begin
	l:=nil;
	inicializarVector(v);
	crearLista(l,v);
	maxPublicaciones(v);
	cantidadDePublicacionesPorAutor(l);
end.
