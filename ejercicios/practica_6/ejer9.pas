program ejer9;

type
    lista = ^nodo;

    nodo = record
        num : integer;
        sig : lista;
    end;

    listaSublista = ^nodo1;

    nodo1 = record {lista para los valores A y B}
        num:integer;
        sig:listaSublista;
    end;

procedure armarNodo(var L: lista; v: integer);
var
 aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;

function EstaOrdenada(L:lista):boolean; {verifica que la lista este ordenada}
    var
        ok:boolean;
        ant:lista;
    begin
        ant:=L;
      ok:=false;
      while((L <> nil)and(ant^.num < L^.num ))do begin {usamos un puntero auxiliar para ir recorriendo y corroborando que el anterior sea menor al siguiente}
        ant:=L;
        L:=L^.sig;
        end;
        if(L = nil)then
          ok:=true;
        EstaOrdenada:=ok;
    end;

procedure eliminar(var L:lista; v:integer); {elimina un elemento de la lista, debemos pasar la lista por referenia xq puede modificarse}
    var
        ant,act:lista; {variable auxiliar para modificar lista}
    begin
      ant:=L;
      act:=L;
      while((act <> nil)and(act^.num <> v))do begin
        ant:=act;
        act:=act^.sig;
      end;
      if(act <> nil)then begin{si entra en el if es que la lista no esta vacia}
        if(act = L)then {si es el primer elemento}
            L:=L^.sig {apunta a nil}
        else {si entra en el else es que no es el primer elemento}
            ant^.sig:=act^.sig; {el siguiente del anterior, pasa a ser el siguiente de actual}
            dispose(act);{actual desaparece}
          end; 
    end;
procedure GenerarNuevaLista(var L,ult:listaSublista; v:integer); {modulo dentro de Sublista}
    var
        nuevo:lista;
    begin
      new(nuevo);
      nuevo^.num:=v;
      nuevo^.sig:=nil;
      if(L = nil)then begin
        L:=nuevo;
        ult:=nuevo;
        end {es decir que es el primer elemento}
        else begin
          ult^.sig:=nuevo;
          ult:=nuevo;
        end;
    end;

procedure Sublista (L:lista; A,B:integer;var LS,ult:listaSublista);
    begin
      while(L<>nil)do begin
        if((L^.num > A)or(L^.num < B))then {evalua}
            GenerarNuevaLista(LS,ult,L^.num); {agregar el elemento si cumple}
        L:=L^.sig;
      end;
    end;

procedure SublistAsc(L:lista; A,B:integer;var LS,ult:listaSublista); 
    begin
      while(L<>nil)and(L^.num < B)do begin 
        if((L^.num > A)or(L^.num < B))then {evalua}
            GenerarNuevaLista(LS,ult,L^.num); {agregar el elemento si cumple}
        L:=L^.sig;
      end;
    end;

procedure SublistaDes(L:lista; A,B:integer; var LS,ult:listaSublista); 
    var
        LS,ult:listaSublista;
    begin
      while(L<>nil)and(L^.num > A)do begin
        if((L^.num > A)or(L^.num < B))then {evalua}
            GenerarNuevaLista(LS,ult,L^.num); {agregar el elemento si cumple}
        L:=L^.sig;
      end;
    end;
//PROGRAMA PRINCIPAL
var
    pri : lista;
    LS,ult:listaSublista
    A,B,valor : integer;
begin
    A:=0;
    B:=0;
    LS:=nil;
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    if (EstaOrdenada(L))then
        writeln('la lista esta ordenada')
    else
        writeln('la lista no esta ordenada');
    
    readln(valor);
    eliminar(pri,valor); {proceso que elimina}
    realdn(A);readln(B);
    Sublista(L,A,B;LS,ult); {sublistas...}
    SublistaAsc(L,A,B,LS,ult);
    SublistaDes(L,A,B,LS,ult);
end.