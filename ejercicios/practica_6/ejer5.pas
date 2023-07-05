program ejer5;

type
	lista = ^nodo; {lista que apunta a un nodo}
	
	registro = record {registro}
		codigo:integer;
		descripcion:string;
		stockActual:integer;
		stockMinimo:integer;
		precio:real;
	end;
	
	nodo = record {la lista apunta al nodo, el cual contiene los datos y el enlace al siguiente}
		dato:registro; 
		siguienteNodo:lista;
	end;
	
procedure CargarRegistro(var r:registro); {carga el registro}
	begin
		writeln('------------------------------------');
		write('ingrese el codigo del producto: ');readln(r.codigo);
			if(r.codigo <> -1)then begin
				writeln;
				write('descripcion del producto: ');readln(r.descripcion);
				writeln;
				write('stock actual del producto: ');readln(r.stockActual);
				writeln;
				write('stock minimo del producto: ');readln(r.stockMinimo);
				writeln;
				write('precio: ');readln(r.precio);
				end;
	end;

procedure AgregarAlFinal(var L,ult:lista; r:registro);
	var
		nuevo:lista;
	begin
		new(nuevo);
		nuevo^.dato:=r;
		nuevo^.siguienteNodo:=nil;
		
		if (L = nil) then begin
			L:=nuevo;
			ult:=nuevo;
			end
			else
				ult^.siguienteNodo:=nuevo;
				ult:=nuevo;
		
	end;

procedure cargarLista (var L:lista); {creamos la lista}
	var
		ult:lista;
		r:registro;
	begin
		{reservamos espacio en memoria}
		CargarRegistro(r);{leemos un registro}
		while(r.codigo <> -1)do begin
			AgregarAlFinal(L,ult,r);
			CargarRegistro(r);
		end;
	end;

procedure Porcentaje(r:registro; var cantMenor,total:integer); {cuenta los stocks actuales menores }
	begin													   {al stock minimo y elementos en total} 
		total:=total+1;													   { para calcular promedio}
		if(r.stockActual < r.stockMinimo)then
			cantMenor:=cantMenor+1;
	end;
	
{descripcion de productos los cuales tengan al menos tres digitos pares en sus codigos}
///
function descomponer(r:registro):boolean;
	var
		dig,cantPar:integer;
		estaOK:boolean;
	begin
		dig:=0;
		cantPar:=0;
		estaOk:=false;
		while(r.codigo <> 0)do begin
			dig:=r.codigo mod 10; {nos quedamos con el ultimo digito}
			if(dig mod 2 = 0) then
				cantPar:=cantPar+1;
			r.codigo:=r.codigo div 10; {achicamos el numero}
			end;
		if (cantPar >= 3)then
			estaOk:=true
			else
				estaOk:=false;
				
		descomponer:=estaOk;
	end;


///
procedure Minimos(r:registro; var cod1, cod2:integer; var min1, min2:real); {desc. de los productos mas economicos}
	begin
		if(r.precio < min1)then begin
			cod2:=cod1;
			min2:=min1;
			cod1:=r.codigo;
			min1:=r.precio;
			end
			else
				if(r.precio > min2)then begin
					cod2:=r.codigo;
					min2:=r.precio;
					end;
	end;
	
{RECORRIDO DE LA LISTA + CALCULOS NECESARIOS}

procedure RecorrerCalcular(L:lista);
	var
		cantMenor,total,cod1,cod2:integer;
		min1,min2:real;
	begin
		cantMenor:=0; {inicializamos variables}
		total:=0;
		min1:=999;min2:=999;
		
		{comenzamos a recorrer}
			while(L <> nil)do begin
				Porcentaje(L^.dato,cantMenor,total); 
				if (descomponer(L^.dato))then
					writeln('el producto "',L^.dato.descripcion,'" contiene al menos 3 digitos pares en su codigo');
				Minimos(L^.dato,cod1,cod2,min1,min2);
				L:=L^.siguienteNodo;
				end;
				
				{informa}
				writeln('-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-');
				writeln('el porcentaje de productos con stockActual < stockMinimo: ',(cantMenor/total)*100:1:2);
				writeln;
				writeln('los productos: ',cod1,' y ',cod2,' son los mas economicos');
				writeln;
	end;
{PROGRAMA PRINCIPAL}

var
	L:lista;
begin
	L:=nil; {inicializamos la lista en nil}
	cargarLista(L); {creamos la lista}
	RecorrerCalcular(L); {calculamos e imprimimos}
end.
