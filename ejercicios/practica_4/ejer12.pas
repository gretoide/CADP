program galaxias;

const
	dimF = 53;
	
type
	rango = 1..4;
	galaxia = record;
		nombre:string;
		tipo:rango;
		masa:integer;
		
	vector = array[1..dimF] of galaxia;
	vectorContador = array[1..4] of galaxia;
	
procedure leerRegistro(var g:galaxia); {NO SE DEBE IMPLEMENTAR}
	begin
		writeln('__________________________________');
		write('ingrese el nombre de la galaxia: ');readln(g.nombre);
		writeln;
		write('ingrese tipo de galaxia');
		writeln('1 : eliptica');
		writeln('2 : espiral');
		writeln('3 : lenticular');
		writeln('4 : irregular');
		readln(g.tipo);
		writeln;
		write('masa de la galaxia: ');readln(g.tipo);
	end;

procedure CargarVector(var v:vector); {NO SE DEBE IMPLEMENTAR}
	var
		i:integer;
	begin
		for i:= 1 to dimF do
			leerRegistro(v[i]);
	end;
	
procedure ContarTipos(var vc:vectorContador; tipo:rango); {vector contador para galaxias del tipo}
	var
		i:integer;
	begin
		for i:= 1 to 4 do
			vc[num]:= vc[num] + 1;
	end;
	
procedure ContGalaxias(g:galaxia, var galaxiasTot,galaxiasBus:integer); {galaxias contador}
	begin
		if ((g.nombre = 'via lactea') or (g.nomrbre = 'andromeda') or (g.nombre = 'triangulo')) then
			galaxiasbus:=galaxiasbus+1
		else
			galaxiasTot:=galaxiasTot+1;
	end;
	
function promedio(galaxiasTot,galaxiaBus:integer):integer; {calcula el promedio}
	begin
		promedio:=(galaxiasBus/galaxiasTot)*100;
	end;
