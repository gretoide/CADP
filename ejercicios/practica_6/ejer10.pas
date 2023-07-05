program ejer10;

type
    lista = ^clientes; {a}
    
    clientes = record
        dni:integer;
        sig:lista;
    end;

procedure CargarClientes(var c:clientes);
    begin
        writeln('-------------------------------------');
        writeln;
        write('INGRESE DNI:' );readln(c.dni);
    end;
procedure RecibirCliente(var L,ult:lista;dni:integer); {agregar al final}
    var
        nuevo:lista;
    begin
        new(nuevo);
        nuevo^.dni:=dni;
        nuevo^.sig:=nil;
        if(L = nil)then begin
            L:=nuevo;
            ult:=nuevo;
        end
        else
            begin
              ult:=nuevo;
              ult^.sig:=nuevo;
            end;
    end;

procedure CargaDeClientes(var L,ult:lista); {va cargando los clientes en la lista de espera}
    var
        c:clientes;
    begin
      CargarClientes(c);
      while(c.dni <> 0)do begin
        RecibirCliente(L,ult,c.dni);
        CargarClientes(c);
        end;
    end;

procedure AtenderClientes(var L,ult:lista;var ClienteAtendido:integer);
    var
        ant,act:lista;
    begin
        ant:=L;
        act:=L;
        while(act <> nil)do begin
          ant:=act;
          act:=act^.sig;
        end;
        {como es el ultimo}
        ClienteAtendido:=act^.dni;
        ant^.sig:=act^.sig;
        dispose(act);
    end;

//PROGRAMA PRINCIPAL
var
    L,ult:lista;
    ClienteListo:integer;
begin
    L:=nil;
    ult:=nil;
  CargaDeClientes(L,ult); {deberia estar en el programa principal??}
  AtenderClientes(L,ult,ClienteListo);
    writeln('se atendió el cliente con DNI: ',ClienteListo);
end.
