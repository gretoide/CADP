
{-------------------------------------------------VECTORES-------------------------------------------------}

{agregar elemento al final de un vector}
procedure agregarVector (var v:vector; var diml:integer; elemento:integer);
  begin
    if ((diml+1) <= dimf) then begin
      diml:=diml+1;
      v[diml]:=elemento;
    end;
  end;

{insertar elemento}
procedure insertar (var v:vector; var diml:integer; pos,elemento:integer);
  var
    i:integer;
  begin
    if (diml+1) <= dimf) and ((pos >= 1) and (pos <= diml)) then begin {que tengamos lugar y que sea pos valida}
      for i:=pos to (diml-1) do begin
        v[i+1]:=v[i];
      end;
      diml:=diml+1;
      v[pos]:=elemento;
    end;
  end;

procedure eliminar (var v:vector; var diml:integer; pos:integer); {borra logicamente}
  var
    i:integer;
  begin
    if (pos >= 1) and (pos <= diml) then begin {corroboramos que sea una posicion valida}
      for i:=pos to (diml-1) do
        v[i]:=v[i+1]; {pisamos el actual con el siguiente}
      diml:=diml-1;
  end;


{busquedas en vector}

procedure vectorDesordenado (v:vector; diml:integer; num:integer; var ok:boolean);
  var
    i:integer;
  begin
    i:=1; 
    ok:= false;
    while (i <= diml) and (not ok) do begin
      if (v[i] = num) then
        ok:=true
      i:=i+1;
    end;
  end;

procedure vectorOrdenado (v:vector; diml:integer; num:integer; var ok:boolean);
  var
    i:integer;
  begin
    i:=1;
    ok:=false;
    while (i <= diml) and (v[i] <= num) do begin
      i:=i+1;
    end;
    if (i <= diml) and (v[i] = num) then
      ok:=true
  end;

procedure busquedaDicotomica (var v:vector; diml:integer; elem:integer; var ok:boolean);
  var
    pri, ult, medio:integer;
  begin
    ok:=false;
    pri:=1; {inicio del arreglo}
    ult:=diml; {final del arreglo}
    medio:= (pri + ult) div 2;
    while (pri <= ult) and (v[medio] <> elem) do begin {mientras no se crucen los extremos y no encuentre el elem}
      if (v[medio] < elem) then
        medio:=medio:=+1 {se va para valores mas grandes}
      else
        medio:=medio-1; {se va para valores mas chicos}
      medio:=(pri+ult) div 2;
    end;
    if (pri <= ult) and (v[medio] = elem) then
      ok:=true;
  end;


{ordenacion de vectores}
procedure seleccion (var v:vector; diml:integer);
  var
    i,j,p,aux:integer;
  begin
    for i:=1 to (diml-1) do begin {no es necesario procesar el ultimo}
      aux:=i; {guardamos pos del elemento}
      for j:=i+1 to diml do
        if (v[j] < v[p]) then
          p:=j; {intercambia posiciones}
      aux:=v[p]; {nos guardamos el elemento}
      v[p]:=v[i];
      v[i]:=aux;
    end;
  end;

  {elegimos el primer elemento, buscamos el elemento mas chiquito
  del resto del vector y los intercambiamos
  hace diml pasadas}

  {existen los de inserccion y intercambio}

  {-------------------------------------------------LISTAS-------------------------------------------------}

  procedure agregarAdelante (var l:lista; d:dato);
    var
      nuevo:lista;
    begin
      new(nuevo);
      nuevo^.dato:=d;
      nuevo^.sig:=l; {lo enganchamos con el puntero incial}
      l:=nuevo; {el puntero inicial ahora es el nuevo}
    end;

  procedure agregarAlFinal (var l,ult:lista; d:dato);
    var
      nuevo:lista;
    begin
      new(nuevo);
      nuevo^.dato:=d;
      if (l = ult) then begin {la lista esta vacia}
        l:=nuevo;
        ult:=nuevo;
      else
        ult^.sig:=nuevo;
      ult:=nuevo;
    end;

  procedure insertarOrdenado (var l:lista; d:dato);
    var
      nuevo,anterior,actual:lista;
    begin
      new(nuevo);
      nuevo^.dato:=d;
      anterior:=l;
      actual:=l;
      while (actual <> nil) and (actual^.dato > d) do begin
        anterior^.sig:=actual;
        actual:=actual^.sig;
      end;
      if (anterior = actual) then {lista vacia}
        l:=nuevo
      else
        anterior^.sig:=nuevo;
      nuevo^.sig:=actual;
    end;