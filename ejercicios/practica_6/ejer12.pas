program ejer12;

type
    lista = ^nodo;

    dispositivos = record
        version:integer;
        pantalla:integer;
        ram:integer;
    end;

    nodo = record
        dato:dispositivos;
        sig:lista;
    end;

    

procedure rampantalla(ram,pantalla:integer;CantCumplen:integer); {celulares con + de 3 de ram y al menos 5 pantallas}
    begin
      if((ram > 3)and(pantalla >= 5))then CantCumplen:=Cantcumplen+1;
    end;

function promedio(CantCelus,TamanoTot:integer):real; {promedio total de pantallas}
    begin
      promedio:=TamanoTot/CantCelus;
    end;

procedure RecorrerLista(L:lista);
    var 
        aux:lista;
        CantCumplen,CantVersion,CantCelus,TamanoTot:integer;
    begin
      CantVersion:=0;
      CantCelus:=0;
      TamanoTot:=0;
      CantCumplen:=0;
      aux:=L;
        while(L <> nil)do begin
            while(aux^.dato.version = L^.dato.version)do
                CantVersion:=CantVersion+1;
          CantVersion:=0;
          rampantalla(L^.dato.ram,L^.dato.pantalla,CantCumplen);
          CantCelus:=CantCelus+1;
          TamanoTot:=TamanoTot+L^.dato.pantalla;
          L:=L^.sig;
        end;
        writeln('la cantidad de celulares RAM > 3 y PULG. <= 5 es: ',CantCumplen);
        writeln('tamaño promedio: ',promedio(CantCelus,TamanoTot):2:1);
    end;

var
    L:lista;
begin
    {   -se dispone-
        L:=nil;
        CargarLista(L); 
    }
    RecorrerLista(L);
end.