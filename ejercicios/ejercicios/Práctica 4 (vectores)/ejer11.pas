program ejer11;

const 
	dimF = 3;
	
type
	ArgenPics = record
		titulo:string;
		autor:string;
		likes:integer;
		clics:integer;
		comentarios:integer;
	end;
	
	vector = array[1..dimF] of ArgenPics;
	
procedure leerRegistro(var pics:ArgenPics); {lectura de los datos de registro}
	begin
		writeln('___________________________________________');
		writeln;
		write('ingrese el TITULO de la foto: ');readln(pics.titulo);
		writeln;
		write('ingrese el AUTOR: ');readln(pics.autor);
		writeln;
		write('ingrese cant. LIKES: ');readln(pics.likes);
		writeln;
		write('cantidad de CLICS en la foto: ');readln(pics.clics);
		writeln;
		write('comentarios de la foto: ');readln(pics.comentarios);
	end;
	
procedure cargarVector(var v:vector); {carga el vector con los datos del registro}
	var
		i:integer;
	begin
		for i:= 1 to dimF do
			leerRegistro(v[i]);
	end;
	
	
procedure TitMasVisto(pics:ArgenPics; var TituloMasVisto:string; var max:integer); {calcula el titulo + visto}
	begin
		if (pics.clics > max) then
			begin
				TituloMasVisto:= pics.titulo;
				max:=pics.clics;
			end;
	end;
	
procedure ArtVandelayLikes(pics:ArgenPics; var likesTotales:integer); {titulo de la foto de art vandelay con mas likes}
	begin
			if (pics.autor = 'art vandelay')then
				likesTotales:=LikesTotales + pics.likes;
	end;
	
procedure comen4foto(pics:ArgenPics); {imprime los resultados}
	var
		i:integer;
	begin
		writeln('foto n: ',i, ' : ', pics.comentarios , ' comentarios');
	end;
	
//PROGRAMA PRINCIPAL
VAR
	v:vector;
	i,max,likesTotales:integer;
	TituloMasVisto:string;
BEGIN
	max:=-1;
	CargarVector(v);
	likesTotales:=0;
	for i:= 1 to dimF do
	begin
		TitMasVisto(v[i],TituloMasVisto,max);
		ArtVandelayLikes(v[i],likesTotales);
		comen4foto(v[i]);
	end;
	{finaliza la carga y calculo de datos}
	
	writeln('****RESULTADOS****');
	writeln('Titulo de la foto mas vista: ',TituloMasvisto);
	writeln('Total de likes de las fotos de Art Vandelay: ',likesTotales);
END.
