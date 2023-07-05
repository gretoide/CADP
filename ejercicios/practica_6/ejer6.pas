{
  6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión (cantidad
de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y rango del
espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
    a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
    b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
    c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
    d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
    Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse una única vez.  
}

program ejer6; 

type 
    espectro = 1..7; {cantidad de espectros}
    
    vSonda = array[espectro] of integer; {arreglo para los espectros de la sonda}

    lista = ^nodo;

    sondas = record
        nombre:string;
        duracion:integer; {duracion de la mision en meses}
        costoConstruccion:real;
        costoMantencion:real;
        espectro:integer;
    end;

    nodo = record
        dato:sondas;
        siguienteNodo:lista;
    end;

//modulos
procedure PonerEnCeroVector(var v:vSonda); {inicializamos en 0 el vector}
    var
        i:integer;
    begin
        for i:= 1 to 7 do
            v[i]:=0;
    end;


procedure cargarRegistro(var r:sondas);
    begin
        writeln('............................................................');
        writeln;
        write('ingrese el nombre de la sonda: ');readln(r.nombre);
        writeln;
        write('ingrese duracion de la mision (en meses): ');readln(r.duracion);
        writeln;
        write('costo de construccion: ');readln(r.costoConstruccion);
        writeln;
        write('costo de mantenimiento: ');readln(r.costoMantencion);
        writeln;
        write('rango del espectro electromagnetico:');
        writeln;
        writeln('   1 | Radio');
        writeln('   2 | Microondas');
        writeln('   3 | Infrarojo');
        writeln('   4 | Luz visible');
        writeln('   5 | Ultravioleta');
        writeln('   6 | Rayos X');
        writeln('   7 | Rayos Gamma');
        readln(r.espectro); 
    end;
    
procedure CargarEspectro(var v:vSonda; espectro:integer); {cargamos el vector con el dato leido}
    begin
        v[espectro]:=v[espectro]+1;
    end;
    
///
procedure PromedioCosto(r:sondas; Sondas:integer; var sumadorCostos,costoPromedio:real); {calcula el costo promedio}
    begin
        sumadorCostos:= (r.costoConstruccion + r.costoMantencion);
        costoPromedio:= sumadorCostos/sondas;
    end;
    
///
procedure PromedioTiempo(r:sondas; Sondas,sumadorTiempo:integer; var tiempoPromedio:real); {calcula el promedio de tiempos}
    begin
        sumadorTiempo:= sumadorTiempo + r.duracion;
        tiempoPromedio:=(sumadorTiempo/Sondas); {se va actualizando a medida que recorre la lista}
    end;

procedure AgregarAlFinal(var L,ult:lista; r:sondas);
	var
		nuevo:lista;
	begin
		new(nuevo);
		nuevo^.dato:=r;
		nuevo^.siguienteNodo:=nil;
		if (L = nil)then begin
			L:=nuevo;
			ult:=nuevo;
			end
			else
				ult^.siguienteNodo:=nuevo;
				ult:=nuevo;			
	end;

procedure GenerarLista(var L:lista; var Sondas,sumadorTiempo:integer;tiempoPromedio,sumadorCosto,costoPromedio:real); {agrega los elementos a la lista}
    var
        ult:lista;
        r:sondas;
        v:vSonda;
    begin
        cargarRegistro(r);
        cargarEspectro(v,r.espectro);
        repeat
            Sondas:=Sondas+1; {contador de sondas totales}
            PromedioTiempo(r,Sondas,sumadorTiempo,tiempoPromedio);
            PromedioCosto(r,Sondas,sumadorCosto,costoPromedio); 
			AgregarAlFinal(L,ult,r);
            cargarRegistro(r);
            cargarEspectro(v,r.espectro);
        until(r.nombre = 'gaia');
    end;

procedure MaximaSonda(r:sondas;var nombreMasCara:string;var max:real); {calcula la sonda mas cara}
    var
        costoTotal:real;
    begin
        costoTotal:=0;
        costoTotal:=costoTotal + (r.costoConstruccion + r.costoMantencion);
            if(costoTotal > max) then
              nombreMasCara:=r.nombre;
    end;


procedure sondaMayorTiempo(r:sondas; tiempoPromedio:real; var cantSondas:integer);
    begin
        if (r.duracion > tiempoPromedio)then
            cantSondas:=cantSondas+1;
    end;
///

procedure imprimirVector(v:vSonda); {imprime la cantidad de sondas que hicieron ese espectro}
    var
        i:integer;
    begin
        for i:= 1 to 7 do begin
          writeln('la cantidad de sondas del espectro ',i,' fue de ',v[i]);
          writeln;
        end; 
    end;


    
procedure ConstruccionSuperaPromedio(r:sondas; costoPromedio:real);
    begin
        if(r.costoConstruccion > costoPromedio)then
            writeln('el costo de construccion de la sonda ', r.nombre, ' supera al costo promedio');
    end;
///

procedure RECORRER(L:lista;costoPromedio:real;tiempoPromedio:real);
    var
        max:real;
        nombreMasCara:string;
        v:vSonda;
        cantSondas:integer;
    begin
        cantSondas:=0;
        max:=-999;
        while(L <> nil)do begin
            MaximaSonda(L^.dato,nombreMasCara,max);
            SondaMayorTiempo(L^.dato,tiempoPromedio,cantSondas);
            ConstruccionSuperaPromedio(L^.dato,costoPromedio); {d}
            L:=L^.siguienteNodo;
        end;
            {a} writeln('la sonda mas cara fue ',nombreMasCara);
				writeln;
            {b} ImprimirVector(v);
				writeln;
            {c} writeln('la cantidad de sondas que su precio de construccion supera el costo promedio es ', cantSondas);
    end;
    
//PROGRAMA PRINCIPAL

VAR
	costo,tiempo,sumadorCosto:real;
	SondasTot,sumadorTiempo:integer;
	L:lista;
	v:vSonda;
BEGIN
	costo:=0;
	SondasTot:=0;
	tiempo:=0;
	sumadorCosto:=0;
	sumadorTiempo:=0;
	L:=nil;
	PonerEnCeroVector(v);
	GenerarLista(L,SondasTot,sumadorTiempo,tiempo,sumadorCosto,costo); {ejer6.pas(198,26) Error: Call by var for arg no. 2 has to match exactly: Got "SmallInt" expected "Real"}
	RECORRER(L,costo,tiempo);
END.
{ejer6.pas(201) Fatal: There were 3 errors compiling module, stopping}
