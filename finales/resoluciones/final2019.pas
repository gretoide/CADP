program finalCadp;

type
	ventas = record
		codVenta:integer;
		codProducto:integer;
		cantVentas:integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato:ventas;
		sig:lista;
	end;
	
	procedure leerDatos(var v:ventas);
	begin
		write('codigo venta: ');readln(v.codVenta);
		if(v.codVenta <> 999)then begin
			write('codigo producto: ');readln(v.codProducto);
			write('cant ventas: ');readln(v.cantVentas);
		end;
	end;

	procedure listaOrdenada(var l:lista; v:ventas);
	var
	nuevo,anterior,actual:lista;
	begin
		new(nuevo);
		nuevo^.dato:=v;
		actual:=l;
		anterior:=l;
		while(actual <> nil)and(v.codProducto > actual^.dato.codProducto)do begin
			anterior:=actual;
			actual:=actual^.sig;
		end;
		if(anterior=actual)then
			l:=nuevo
		else
			anterior^.sig:=nuevo;
		nuevo^.sig:=actual;
	end;
	
	procedure cargarDatos(var l:lista);
	var
	v:ventas;
	begin
		leerDatos(v);
		while(v.codVenta<>999)do begin
			listaOrdenada(l,v);
			leerDatos(v);
		end;
	end;
	
	procedure cantidadTotal(l:lista);
	var
	dato,cantTotal:integer;
	begin
		cantTotal:=0;
		write('ingrese el codigo de producto que quiere calcular: ');readln(dato);
		while(l<>nil)and(l^.dato.codProducto <> dato)do
			l:=l^.sig;
		while(l<>nil)and(l^.dato.codProducto=dato) do begin
			cantTotal:=cantTotal+l^.dato.cantVentas;
			l:=l^.sig;
		end;
		write('dato: ',dato,' | cantVentas: ',cantTotal);
	end;
	
var
l:lista;
begin
l:=nil;
cargarDatos(l);
cantidadTotal(l);
end.
