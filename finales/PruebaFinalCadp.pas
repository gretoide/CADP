program pruebaFinalCadp;

type
  lista = ^nodo;
  nodo = record
    dato:integer;
    sig:lista;
  end;
  
procedure estructuraFor();
  var
    x,i:integer;
  begin
    x:=0;
    for i:=1 to 100 do begin
      x:=x+1;
    end;
    writeln('Resultado del For: ',x);
    writeln('---------------------');
  end;
  
procedure agregarAtras(var l,ult:lista; dni:integer);
  var
    nuevo:lista;
  begin
	new(nuevo);
		nuevo^.dato:=dni;
		nuevo^.sig:=nil;
		
		if (L = nil) then begin
			L:=nuevo;
			ult:=nuevo;
			end
			else 
				ult^.sig:=nuevo;
			ult:=nuevo;
  end;
  
procedure imprimirLista(l:lista);
  begin
    while(l<>nil)do begin
      writeln('Dni: ',l^.dato);
      l:=l^.sig;
    end;
  end;
  
{problema ---> almacenar dni's mientras que no sea lea el dni 0, sin guardarnos el 0'}
procedure estructuraWhile(var l,ult:lista);
  var
    dni:integer;
  begin
    readln(dni);
    while(dni <> 0)do begin
      agregarAtras(l,ult,dni);
      readln(dni);
    end;
  end;
  
{problema ---> almacenar dni's hasta que no se lea el dni 0, guardando el ultimo'}
procedure estructuraRepeatUntil(var l,ult:lista);
  var
    dni:integer;
  begin
    repeat
      readln(dni);
      agregarAtras(l,ult,dni);
    until dni = 0;
  end;
var
  l,l2,ult:lista;
begin
  l:=nil;
  l2:=nil;
  ult:=nil;
  estructuraFor();
  writeln('While');
  estructuraWhile(l,ult);
  writeln('RepeatUntil');
  estructuraRepeatUntil(l2,ult);
  writeln('Resultado while: ');
  imprimirLista(l);
  writeln('Resultado RepeatUntil: ');
  imprimirLista(l2);
end.
