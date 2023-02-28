program ejer8;

{
    Utilizando el programa del ejercicio 1, modificar el módulo armarNodoOrdenado para que los elementos de la lista
queden ordenados de manera ascendente (insertar ordenado).

}

type
    lista = ^nodo;

    nodo = record
        num : integer;
        sig : lista;
    end;

procedure armarNodoOrdenado(var L: lista; v: integer);
    var
        nuevo,anterior,actual: lista;

    begin
        new(nuevo);
        nuevo^.num:=v;
        anterior:=L; {ubicamos ambos punteros al comienzo de la lista}
        actual:=L;
        while((actual <> nil)and(v > actual^.num))do begin {comienza la busqueda hasta que llegue al lugar donde debe insertarlo usando ACTUAL, cuando encuentra un num mayor, para y lo inserta anterior al actual}
          anterior:=actual;
          actual:=actual^.sig;
        end;
        {fin del bloque while}
        if(anterior = actual)then {la lista esta vacia}
            L:=nuevo
        else  {la lista no esta vacia}
          anterior^.sig:=nuevo;
        nuevo^.sig:=actual;
    end;
procedure ImprimirLista (L:lista);
    begin
      while(L <> nil)do begin
        writeln('num: ',L^.num);
        L:=L^.sig;
      end;
    end;
//PROGRAMA PRINCIPAL//
var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    readln(valor);
    while (valor <> 0) do begin {ingresa dato, arma nodo}
        armarNodoOrdenado(pri, valor);
        writeln('Ingrese un numero');
        readln(valor);
    end;
    ImprimirLista(pri);
end.
