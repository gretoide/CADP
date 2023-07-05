program finalDeAgosto;
const
    dimf = 5000;
    cinco = 5;
type
    categoria = 1..5;

    participante = record
        dni:String;
        nombre:String;
        apellido:String;
        categoria:integer;
        fecha:String;
    end;

    inscriptos = array[1..dimf] of participante;

    vectorContador = array[categoria] of integer;

    lista = ^nodo; {lista para luego guardar los participantes}

    nodo = record
        dato:participante;
        sig:lista;
    end;

    procedure leerDatos(var r:participante); {se dispone}
        begin
            writeln('--------------------');
            write('ingrese su categoría: ');readln(r.categoria);
        end;
    
    procedure guardarEnVector(var v:inscriptos; var diml:integer); {se dispone}
    var
    p:participante;
    begin
      leerDatos(p);  
      while(diml <= dimf)and(p.categoria <> 0)do begin {para que corte}
        diml:=diml+1;
        v[diml]:= p;
        leerDatos(p);
      end;
    end;

    procedure inicializarVector(var v:vectorContador);
    var
    i:integer;
    begin
      for i:= 1 to cinco do
        v[i]:=0;
    end;
    
    procedure contarInscriptos(var v:vectorContador; num:integer);
    begin
		v[num]:=v[num]+1;
    end;

    procedure cargarVectorContador(var v:vectorContador; inscriptos:inscriptos; diml:integer);
    var
    i:integer;
    begin
    i:=0;
      while(i<=diml)do begin
        contarInscriptos(v,inscriptos[i].categoria);
        i:=i+1;
      end;
    end;

    procedure crearLista(var l:lista; p:participante);
    var
    nuevo:lista;
    begin
      new(nuevo);
      nuevo^.dato:=p;
      nuevo^.sig:=nil;
      l:=nuevo;
      writeln('estoy guardando bien');
    end;

    procedure recorrerVector(diml:integer; num:integer; v:inscriptos; var l:lista); {guarda en la lista los de la cateogoria}
    var
    i:integer;
    begin
      for i:=1 to diml do begin
        if(v[i].categoria = num)then
          crearLista(l,v[i]);
      end;
    end;

    procedure cargarLista(diml:integer;v:inscriptos; vc:vectorContador; var l:lista); {pregunta la cantidad de inscriptos por categoria}
    var
    i:integer;
    begin
	  for i:=1 to cinco do begin
        if(vc[i]<=50)then
          recorrerVector(diml,i,v,l);
      end;
    end;
    
    procedure imprimirVector(vc:vectorContador);
    var i:integer;
    begin
		for i:=1 to cinco do begin
			writeln('la categoria: [',i,'] tiene [',vc[i],'] inscriptos');
		end;
    end;
    
    procedure imprimirLista(l:lista);
    begin
		while(l<>nil)do begin
		writeln('participante en categoria: ', l^.dato.categoria);
		l:=l^.sig;
		end;
    end;

var
  diml:integer;
  vinscriptos:inscriptos;
  l:lista;
  vc:vectorContador;
begin
  diml:=0;
  {carga de datos}
  guardarEnVector(vinscriptos,diml); {se dispone}

  {inicializar vector contador}
  inicializarVector(vc);
  cargarVectorContador(vc,vinscriptos,diml);
  imprimirVector(vc);

   writeln('-------------------------------------');
  {recopilar inscriptos}
  cargarLista(diml,vinscriptos,vc,l);
  imprimirLista(l);
end.
