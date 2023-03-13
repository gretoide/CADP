procedure sacarPorcentaje();
	begin
		{
		totalASacarPorcentaje - 100%
				      - porcentajeASacar
		((porcentajeASacar*totalASacar)/100)
		* }
	end;
	
procedure sacarPROMEDIO();
	begin
		{
		supongamos que tengo 10 entradas...
		sumaDelValorDeTodasLasEntradas/cantEntradas;
		* }
	end;
procedure ARBOLES();

procedure declaracionArbol();
type
	arbol = ^nodo;
	
	nodo = record
		dato:integer;
		hd:arbol;
		hi:arbol;
	end;
	
procedure crearNodo(var a:arbol; x:integer); {creacion nodo arbol}
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:=x;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(x < a^.dato) then
				crearNodo(a^.hi,x)
			else
				crearNodo(a^.hd,x);
	end;
	
procedure crearArbol(var a:arbol); {crear arbol, modulo recursivo}
	var
		n:integer;
	begin
		read(n);
		while(n <> constanteCorte) do begin
			crearNodo(a,n);
			read(n);
		end;
	end;
	
procedure ImprimirArbol(a:arbol); {como imprimir un arbol}
	begin
		if(a <> nil)then begin
			ImprimirArbol(a^.hd);
			ImprimirArbol(a^.hi);
			writeln(a^.dato);
		end;
	end;
	
procedure MultiplicarArbol(a:arbol);
	begin
		if(a <> nil)then begin
			MultiplicarArbol(a^.hd);
			MultiplicarArbol(a^.hi);
			a^.dato:=a^.dato*2;
		end;
	end;
	
	
procedure crearArbol_SIN_REPETICIONES(var a:arbol; n:integer); {modulo b}
	begin
		if(a = nil)then begin
			new(a);
			a^.dato:=n;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else if not(a^.dato = n)then begin {else para descartar repeticiones en al abb}
			if(a^.dato > n)then
				crearArbol(a^.hi,n)
			else
				crearArbol(a^.hd,n);
		end;
	end;
	
{-------------------MODULOS PARA IMPRIMIRPORNIVEL------------------------------}

// CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l

function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;

//busca productos de cierto rango en el arbol (ordenado por cod) e informa su tipo
procedure buscar(a: arbol; inf, sup: integer);
begin
    if (a <> nil) then
    begin
        if a^.dato.cod > sup then
            buscar(a^.hi, inf, sup);
        if a^.dato.cod < inf then
            buscar(a^.hd, inf, sup)
        else
        begin
			writeln('tipo: ', a^.dato.tipo);
			buscar(a^.hi, inf, sup);
			buscar(a^.hd, inf, sup);
        end;
    end;
end;
    
//busca cierto rango de montos en el arbol (ordenado por cod) e informa cant
procedure buscar2(a: arbol; inf, sup: real; var cant: integer);
begin
    if a <> nil then 
    begin
        if (a^.dato.monto > inf) and (a^.dato.monto < sup) then
            cant:= cant + 1;
        buscar2(a^.hi, inf, sup, cant);
        buscar2(a^.hd, inf, sup, cant);
    end;
end;
//  AGREGARATRAS - Agrega un elemento atr�s en l

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
 var nue:listaNivel;

 begin
 new (nue);
 nue^.info := a;
 nue^.sig := nil;
 if l= nil then l:= nue
           else ult^.sig:= nue;
 ult:= nue;
 end;


// IMPRIMIRPORNIVEL - Muestra los datos del �rbol a por niveles

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;
{-------------------FIN MODULOS PARA IMPRIMIRPORNIVEL-------------------------}
	
	
procedure ORDENES_IMPRESION();

//ORDENES ARBOLES IMPRESION
procedure OrdenCreciente(a:arbol); {este modulo imprime de menor a mayor}
	begin
		if(a <> nil)then begin
			OrdenCreciente(a^.hi);
			writeln(a^.dato);
			OrdenCreciente(a^.hd);
		end;
	end;

procedure OrdenDecreciente(a:arbol); {este modulo imprime de mayor a menor}
	begin
		if(a <> nil)then begin
			OrdenDecreciente(a^.hd);
			writeln(a^.dato);
			OrdenDecreciente(a:arbol);
		end;
	end;
	
procedure PreOrden(a:arbol); {imprime primero el nodo, luego los hijos}
	begin
		if(a <> nil)then begin
			writeln(a^.dato);
			PreOrden(a^.hi);
			PreOrden (a^.hd);
		end;
	end;
	
procedure enOrden(a:arbol); {imprime en el orden}
	begin
		if (a <> nil) then begin
			enOrden (a^.HI);
			//procesar a^.dato
			enOrden (a^.HD);
		end;
	end;
	
procedure postOrden(a:arbol); {primero hijos, luego padre}
	begin
		if (a <> nil) then begin
			postOrden(a^.HI);
			postOrden(a^.HD);
			writeln(a^.dato);
		end;
	end;

procedure LISTAS();

procedure CrearLista(var l:lista); {proceso de armar listas}
	var
		n:integer;
		cant:integer;
	begin
		cant:=1;
		read(n); {lee un numero}
		while(cant < corte)do begin  {mientras no se cumpla la condición de corte}
			cant:=cant+1;
			AgregarAdelante(l,n); {llama al proceso que enlaza los nodos y la variable}
			read(n); {vuelve a leer otro num}
		end;
	end;
	

procedure agregarAtras(var L,ult:lista; lib:libro); //SE ALMACENAN EN ORDEN
	var
		nuevo:lista;
	begin
		new(nuevo);
		nuevo^.dato:=lib;
		nuevo^.sig:=nil;
		
		if (L = nil) then begin
			L:=nuevo;
			ult:=nuevo;
			end
			else 
				ult^.sig:=nuevo;
			ult:=nuevo;
	end;

procedure agregarAdelante(var l:lista; dato:dato);
	var
		nuevo:lista;
	begin
		new(nuevo);
		nuevo^.dato:=dato;
		nuevo^.sig:=nil;
		l:=nuevo;
	end;

//AGREGAR LISTA
procedure agregarOrd (var l:lista; p:producto);
	var
		ant,act,nuevo:lista;
	begin
		act:= l;
		ant:= l;
		new (nuevo); 
		nuevo^.dato:= p; 
		nuevo^.sig:= nil;
		while (act <> nil) and (act^.dato.cod < nuevo^.dato.cod) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (l = act) then
			l:= nuevo
		else
			ant^.sig:= nuevo;
		nuevo^.sig:= act;
	end;

procedure insertarEnLista (var l:lista; elem:integer);
	var ant, nuevo, act: lista;
	begin
		new (nuevo); {reserva espacio}
		nue^.datos := elem; {datos = elemento}
		act := l; {ubicamos puntero auxilar al principio de la lista}
		while (act<>NIL) and (act^.datos < elem) do begin
		{busca recorriendo con punteros auxiliares}
			ant := act; 
			act := act^.sig; {actual siempre apunta al siguietne}
		end;
		{una vez salidos del while, evaluamos condiciones}
		if (act = l) then {si la lista está vacía}
			l:= nuevo
		else 
			ant^.sig := nuevo; {el siguiente del anterior, es el nuevo}
		nuevo^.sig := act ; {el siguiente del nuevo, es el actual}
		{queda insertado anterior --> nuevo ---> actual 
		* (que pasa a ser siguiente del nuevo)}
		end;

procedure agregarAtras(var l,ult:lista; p:pelicula); {probar con el primero antes}
var
nuevo:lista;
begin
	new (nuevo); nuevo^.dato:= p ; nuevo^.sig:= nil;
	if (l = nil) then
		l:= nuevo
	else
		ult^.sig:= nuevo;
	ult:= nuevo;
end;


//ORDENAR

procedure ORDENACION_DE_VECTORES();

procedure ordenarSeleccion (var v:vector) // MENOR A MAYOR.
var
i,j,p:integer;
aux:integer;
begin
	for i:= 1 to DIMF-1 do begin
		p:= i;
		for j:= i+1 to DIMF do
			if (v[j] < v[p]) then
				p:= j;
		aux:= v[p]
		v[p]:= v[i]
		v[i]:= aux;
	end;
end;
{
•	Sencillo
•	Tiempo de ejecución en N^2--> N tamaño del arreglo.
•	Siempre trabaja igual.
}

procedure ordenarInsercion (var v:vector) //MAYOR A MENOR
var
i,j,actual:integer;
begin
	for i:= 2 to dimF do begin
		actual:= v[i];
		j:= i-1;
		while (j > 0) and (v[j] < actual) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= actual;
	end;
end;
{
•	No es tan sencillo de implementar.
•	N^2 ejecución --> N tamaño del arreglo.
•	Si los datos ya están ordenados el algoritmo solo hace comparaciones, por lo tanto, el orden es (N)
•	Si están ordenados de mayor a menor hace todas las comparaciones e intercambios por lo tanto en orden (N^2)
}

    procedure vectorContador(var v:vectorContador; inscriptos:inscriptos);
    var
    i:integer;
    begin
    i:=0;
      while(i<=diml)do begin
		contarInscriptos(v,inscriptos[i].categoria);
        i:=i+1;
        
      end;
    end;

procedure VECTOR_DE_LISTAS();//AGREGAR VECTOR DE LISTAS

procedure inicializar (var v:vector);
var
i:integer;
begin
	for i:= 1 to DIMF do
		v[i]:= nil;
end;

procedure cargarVector (var v:vector);
var
p:pelicula;
ult: vector;
begin
	leer (p);
	while (p.cod <> -1) do begin
		agregarAtras(v[p.genero],ult[p.genero],p);
		leer (p);
	end;
end;

//RECORRER VECTOR DE LISTAS

procedure recorrerLista (l:lista);
begin
	while (l <> nil) do begin
		writeln ('|CODIGO: ',l^.dato.cod,'|RUBRO: ',l^.dato.rubro,'|PRECIO: ',l^.dato.precio);
		l:= l^.sig;
	end;
end;

procedure recorrerIMP (v:vector);
var
i:integer;
begin
	for i:= 1 to DIMF do
		recorrerLista (v[i]);
end;

//GENERAR NUEVO VECTOR
procedure nuevoVector (v:vector; var v2:vectorMax);
var
i:integer;
max:integer;
maxPuntaje:integer;
begin
	for i:= 1 to DIMF do begin
		recorrerLista(v[i],max,maxPuntaje);
		v2[i].cod:= max;
		v2[i].punt:= maxPuntaje;
	end;
end;

procedure BUSQUEDA_DICOTOMICA();

procedure busquedaDicotomicaRecursiva(v: vector; ini,fin: integer; dato:integer; var pos:integer);
	var
		medio:integer;
	begin
		if (ini <= fin) then begin
			medio:= (ini + fin) div 2;
			if (v[medio] = dato) then 
				pos:= medio
			else
				if (v[medio]< dato) then
					busquedaDicotomica(v,medio+1,fin,dato,pos)
				else
					if (v[medio]>dato) then
						busquedaDicotomica (v,ini,medio-1,dato,pos)	
		end
		else 
			pos:= -1; {valor que retorna al no encontrar el elemento}
	end;


procedure VECTOR_DE_LISTAS_MERGE();

{merge contador de cantidad de entradas vendidas}
{MERGE ACUMULADOR}
procedure minimo(var todos:vector; var min:integer);
var
minIndice:integer;
i:integer;
begin
	min:= 32000;
	minIndice:= -1;
	for i:= 1 to dimf do 
		if (todos[i] <> nil) and (todos[i]^.dato.codObra <= min) then begin
			minIndice:= i;
			min:= todos[i]^.dato.codObra;
		end;
	if (minIndice <> -1) then begin
		todos[minIndice]:= todos[minIndice]^.sig;
	end;
	
end;

procedure agregarAtras (var l,ult:lista2; cod:integer; cant:integer);
var
nuevo:lista2;
begin
	new (nuevo); 
	nuevo^.dato.codObra:= cod;
	nuevo^.dato.cant:= cant; 
	nuevo^.sig:= nil;
	if (l = nil) then
		l:= nuevo
	else
		ult^.sig:= nuevo;
	ult:= nuevo;
end;

procedure mergeTotal(todos:vector; var eNuevo:lista2);
var
cantTotal,min,codActual:integer;
ult:lista2;
begin
	eNuevo:= nil;
	minimo (todos,min);
	while (min <> 32000) do begin
		codActual:= min;
		cantTotal:= 0;
		while ((min <> 32000) and (min = codActual)) do begin
			cantTotal:= cantTotal + 1;
			minimo (todos,min);
		end;
		agregarAtras(eNuevo,ult,codActual,cantTotal);
	end;
end;

//Vector de listas para Merge//

{Declaracion}

const
	listas = 5;
type
	lista = ^nodo;
	
	nodo = record
		dato:integer;
		sig:lista;
	end;
	
	TodasListas = array[1..Listas] of lista;
	
	{luego al merge le pasamos los siguientes datos}
	
	Merge(TodasListas,ListaNueva);
	
	{procedimiento merge}
	
procedure Merge(TListas:TodasListas; var ListaNuevo:lista);
	var
		min:integer;
	begin
		min:=9999;
		ListaNuevo:=nil;
		Minimo(Tlistas;min);
	end;

procedure minimoMerge(var v:vector; var min:integer); {merge en vector de listas}
	var
		i:integer;
		indiceMin:integer;
	begin
		min:=9999;
		indiceMin:=-1;
		for i:=1 to dimf do {recorre todas las listas}
			if(v[i]<>nil)and(v[i]^.dato.codObra <= min) then begin {si no es el final de la lista y el actual no}
				min:=v[i]^.dato.codObra; {actualiza el min}
				indiceMin:=i; {el indice del nuevo minimo es i}
			end;
		if(indiceMin <> -1)then
			v[indiceMin]:=v[indiceMin]^.sig; {avanza al siguiente en esa lista}
	end;
		end
end;

//CREAR ARBOL REPETICIONES
procedure ARBOLES();
procedure crearArbol (var arbol:ABBA; num:integer);
begin
	if (arbol = nil) then begin
		new (arbol);
		arbol^.dato:= num;
		arbol^.HI:=nil;
		arbol^.HD:=nil;
	end
	else
		if (num < arbol^.dato) then
			crear (arbol^.HI,num)
		else 
			crear (arbol^.HD,num);
end;

//CREAR ARBOL SIN REPETICIONES

procedure crearArbol2 (var arbol:ABBA; num:integer);
begin
	if (arbol = nil) then begin
		new (arbol);
		arbol^.dato:= num;
		arbol^.HI:=nil;
		arbol^.HD:=nil;
	end
	else
		if (num < arbol^.dato) then
			crear (arbol^.HI,num)
		else 
		if (num > arbol^.dato) then
			crear (arbol^.HD,num);
end;

//-----//

procedure leer (var arbol:ABBA);
var
num:integer;
begin
	write ('|INGRESE NUMERO: '); readln (num);
	while (num <> 0) do begin
		crear(arbol,num);
		write ('|INGRESE NUMERO: '); readln (num);
	end;
end;

//MAXIMO

function maximoArbol (a:ABBA): integer;
begin
	if (a <> nil) then begin
		if (a^.HD = nil) then 
			maximo:= a^.dato
		else
			maximo:= maximo (a^.HD);
	end
	else
		maximo:= -1;
end;

//MINIMO

function minimoArbol(a:ABBA): integer;
begin
	if (a <> nil) then begin
		if (a^.HI = nil) then minimo:= a^.dato
		else
			minimo:= minimo (a^.HI);
	end
	else
		minimo:= -1;
end;

//CANTIDAD ELEMENTOS

procedure cantElementos (a:ABBA; var cant:integer);
begin
	if (a <> nil) then begin
		cantElementos (a^.HI,cant);
		cant:= cant + 1;
		cantElementos (a^.HD,cant);
	end;	
end;

procedure PosOrden(a:arbol); {imprime primero los hijos, luego el nodo}
	begin
		if(a <> nil)then begin
			PosOrden(a^.hi);
			PosOrden (a^.hd);
			writeln(a^.dato);
	end;
//Funcion Maximo ARBOLES
function maximoArbolRecursivo (a : arbol):integer; 
begin    
	if (a=nil) then       
		maximo:=-32767    
		else          
			maximo := Max(Max(a^.dato, maximo(a^.hi)),Max(a^.dato, maximo(a^.hd)));        
			if (a^.hd = nil) then        
				maximo := a^.dato        
			else            
			maximo := maximo(a^.hd);
end;

//Maximo Recursivo Vector
	
procedure maximoVector(v:vector; i:integer; var max:integer); {si encuentra el maxim}
	begin
		if(i<df)then begin
			if(v[i] > max)then 
				max:=v[i];
			Maximo(v,(i+1),max);
		end;
	end;


procedure MERGE();
//MERGE NORMAL 

procedure agregarAtrasMERGE (var l,ult:lista; p:pelicula);
var
nuevo:lista;
begin
	new (nuevo); nuevo^.dato:= p; nuevo^.sig:= nil;
	if (l = nil) then
		l:= nuevo
	else
		ult^.sig:= nuevo;
	ult:= nuevo;
end;


procedure minimo(var todos:vector; var min:pelicula);
var
i:integer;
indiceMin:integer;
begin
	min.cod:= 32000;
	indiceMin:= -1;
	for i:= 1 to DIMF do
		if (todos[i] <> nil) then
			if (todos[i]^.dato.cod <= min.cod) then begin
				min:= todos[i]^.dato;
				indiceMin:= i;
			end;
	if (indiceMin <> -1) then
		todos[indiceMin]:= todos[indiceMin]^.sig;
end;

procedure merge(todos:vector; var listaNueva:lista);
var
min:pelicula;
ult:lista;
begin
	listaNueva:= nil;
	minimo (todos,min);
	while (min.cod <> 32000) do begin
		agregarAtras(listaNueva,ult,min);
		minimo (todos,min);
	end;
end;

procedure MERGE_ACUMULADOR();

//MERGE ACUMULADOR DE CANTIDAD

procedure minimo(var todos:vector; var min:integer; var cant:integer);
var
minIndice:integer;
i:integer;
begin
	min:= 32000;
	minIndice:= -1;
	for i:= 1 to cantS do 
		if (todos[i] <> nil) and (todos[i]^.dato.cod <= min) then begin
			minIndice:= i;
			min:= todos[i]^.dato.cod;
		end;
	if (minIndice <> -1) then begin
		cant:= todos[minIndice]^.dato.cant;
		todos[minIndice]:= todos[minIndice]^.sig;
	end;
	
end;

{MERGE COMUN?}
procedure mergeTotal(todos:vector; var eNuevo:lista2);
var
cantTotal,cant,min,codActual:integer;
ult:lista2;
begin
	eNuevo:= nil;
	minimo (todos,min,cant);
	while (min <> 32000) do begin
		codActual:= min;
		cantTotal:= 0;
		while ((min <> 32000) and (min = codActual)) do begin
			cantTotal:= cantTotal + cant;
			minimo (todos,min,cant);
		end;
		agregarAtras(eNuevo,ult,codActual,cantTotal);
	end;
end;

procedure agregarAtras(var l,ult:lista; cod:integer; cant:integer);
var
nuevo:lista;
begin
	new (nuevo); 
	nuevo^.dato.cod:= cod;
	nuevo^.dato.cant:= cant; 
	nuevo^.sig:= nil;
	if (l = nil) then
		l:= nuevo
	else
		ult^.sig:= nuevo;
	ult:= nuevo;
end;

procedure mergeTotal(todos:vector; var eNuevo:lista);
var
cantTotal,cant,min,codActual:integer;
ult:lista;
begin
	eNuevo:= nil;
	minimo (todos,min,cant);
	while (min <> 32000) do begin
		codActual:= min;
		cantTotal:= 0;
		while ((min <> 32000) and (min = codActual)) do begin
			cantTotal:= cantTotal + cant;
			minimo (todos,min,cant);
		end;
		agregarAtras (eNuevo,ult,codActual,cantTotal);
	end;
end;

procedure MERGE_CON_CORTE_DE_CONTROL();

//MAS MACHETE DE LISTAS
procedure mergeCorteControl(l:lista; var listaNuevo:lista); //merge con corte de control en listas
	begin
		Begin
  listaNuevo:= nil;
  minimo (todos,minNombre, monto);
  while (minNombre <> ‘ZZZ’) do
    begin
     actual:= minNombre; montoTotal:=0;
     while ((minNombre <> ‘ZZZ’) and (minNombre = actual))do begin
       montoTotal:= montoTotal + monto;
       minimo (todos,minNombre,monto);
     end;
     agregarAtras(Enuevo,actual,montoTotal);
    end;  
	end;

//Vector de listas para Merge//

{Declaracion}

const
	listas = 5;
type
	lista = ^nodo;
	
	nodo = record
		dato:integer;
		sig:lista;
	end;
	
	TodasListas = array[1..Listas] of lista;
	
	{luego al merge le pasamos los siguientes datos}
	
	Merge(TodasListas,ListaNueva);
	
	{procedimiento merge}
	
procedure Merge(TListas:TodasListas; var ListaNuevo:lista);
	var
		min:integer;
	begin
		min:=9999;
		ListaNuevo:=nil;
		Minimo(Tlistas;min);
	end;

procedure minimoMerge(var v:vector; var min:integer); {merge en vector de listas}
	var
		i:integer;
		indiceMin:integer;
	begin
		min:=9999;
		indiceMin:=-1;
		for i:=1 to dimf do {recorre todas las listas}
			if(v[i]<>nil)and(v[i]^.dato.codObra <= min) then begin {si no es el final de la lista y el actual no}
				min:=v[i]^.dato.codObra; {actualiza el min}
				indiceMin:=i; {el indice del nuevo minimo es i}
			end;
		if(indiceMin <> -1)then
			v[indiceMin]:=v[indiceMin]^.sig; {avanza al siguiente en esa lista}
	end;

procedure EXTRAS();

//BINARIO
procedure binarioProcedimiento (num:integer);
var
dig:integer;
begin
        if (num <> 0) then begin
			dig:= num mod 2;
			num:= num div 2;
			binario (num);
			writeln (dig);
procedure mergeCorteControl(l:lista; var listaNuevo:lista); //merge con corte de control en listas
	begin
		Begin
  listaNuevo:= nil;
  minimo (todos,minNombre, monto);
  while (minNombre <> ‘ZZZ’) do
    begin
     actual:= minNombre; montoTotal:=0;
     while ((minNombre <> ‘ZZZ’) and (minNombre = actual))do begin
       montoTotal:= montoTotal + monto;
       minimo (todos,minNombre,monto);
     end;
     agregarAtras(Enuevo,actual,montoTotal);
    end;  
	end;
