program ejer7;

type
    Rangoespectro = 1..7;
    str = string[30];
    lista = ^nodo;

    sondas = record
        nombre:str;
        duracion:integer;
        costoConstruccion:real;
        costoMantencion:real;
        espectro:Rangoespectro;
    end;

    listaCumple = ^nodo2; {lista de los que cumplen las condiciones}

    nodo2 = record 
        dato:sondas;
        siguiente:listaCumple;
    end;

    listaNoCumple = ^nodo2;

    nodo3 = record
        dato:sondas;
        siguiente:listaNoCumple;
    end;

{funcion cumple}
function Cumple(S:sondas):boolean;
    var
        ok:boolean;
    begin
      ok:=false;
      if((S.espectro <> 1)and(S.costoMantencion < S.costoConstruccion))then {ponemos primero la condicion del radio porque ya}
        ok:=true;                                                                              {sabemos que NO se financian ese tipo de proyectos y corte primero}
    Cumple:=ok; {retorna el resultado de ok}
    end;

procedure CargarCumplidos (var CumpleLista:listaCumple; L:lista); {proceso que carga los proyectos de los que si cumplen}
    var
        nuevo:listaCumple;
    begin
        new(nuevo);
        nuevo^.dato:=L^.dato;
        nuevo^.siguiente:=CumpleLista;
        CumpleLista:=nuevo;
    end;

procedure CargarNOCumplidos (var NOCumpleLista:listaNoCumple; L:lista); {proceso que carga los proyectos de los que NO cumplen}
    var
        nuevo:listaNoCumple;
    begin
        new(nuevo);
        nuevo^.dato:=L^.dato;
        nuevo^.siguiente:=NOCumpleLista;
        NOCumpleLista:=nuevo;
    end;

procedure recorrerLista(L:lista; var ListaCumple:listaCumple; var ListaNo:listaNoCumple); {recorre las listas guardando los valores en las nuevas}
    begin
      while(L <> nil)do begin
        if(Cumple(L^.dato))then
            CargarCumplidos(ListaCumple,L)
        else
            CargarNOCumplidos(ListaNO,L);
        L:=L^.siguiente; {pasa el siguiente nodo}
        end;
    end;
//informar listas
function CostoTotal(L:listaNoCumple):real; {retorna el costo total}
    var
        SumaCostos:real;
    begin
      sumaCostos:=0;
      while(L <> nil)then begin
        sumaCostos:= L^.dato.costoConstruccion + L^.dato.costoMantencion;
        L:=L^.siguiente;
      end;
      CostoTotal:=sumaCostos;
    end;
//PROGRAMA PRINCIPAL//
var
    Lista:lista;
    ListaCumple:listaCumple;
    ListaNO:listaNoCumple;
    TotalCostos:real;
begin
    ListaCumple:=nil;
    ListaNO:=nil;
    recorrerLista(Lista,listaCumple,ListaNo); {deberia imprimirlas? estaria retornando las listas en los parametros?}
    writeln('el costo total de los proyectos que no cumplen es: ',CostoTotal(ListaNO):2:1);
end.