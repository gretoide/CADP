program ESC;

type
	Escuela = record
		CUE:integer;
		nombre:string;
		alumnos:integer;
		docentes:integer;
		localidad:string;
	end;

//LEER ESCUELA
procedure leerEscuela(var escuela:Escuela);
	begin
	writeln('__________________________________________');
	writeln('Ingrese el CODIGO de la escuela');
	readln(escuela.CUE);
	writeln('Ingrese el NOMBRE de la escuela');
	readln(escuela.nombre);
	writeln('Ingrese cant. alumnos');
	readln(escuela.alumnos);
	writeln('Ingrese cant. docentes');
	readln(escuela.docentes);
	writeln('Ingrese la localidad');
	readln(escuela.localidad);
	end;
//CALCULAR RELACION
function RelacionDA(escuela:Escuela):integer;
	var
		rel:integer;
	begin
	rel:=escuela.alumnos div escuela.docentes;
	RelacionDA:=rel;
	end;
//DOS MEJORES RELACIONES
procedure LpMejores(escuela:Escuela; var cue1,cue2:integer; var mejor1,mejor2: integer);
	begin
	while (escuela.docentes <> 0)do
		begin
		if (RelacionDA(escuela) < mejor1)then
			begin
			mejor2:=mejor1;
			cue2:=cue1;
			mejor1:=RelacionDa(escuela);
			cue1:=escuela.CUE;
			end
			else
				if (RelacionDA(escuela) < mejor2)then
					begin
					mejor2:=RelacionDA(escuela);
					cue2:=escuela.CUE;
					end;
		end;
	end;

//PROGRAMA PRINCIPAL

var
	cue1,cue2,i,cont,rel,mejor1,mejor2:integer;
	escu:Escuela;
begin
	cue1:=0;cue2:=0;cont:=0;rel:=0;	mejor1:=23435;mejor2:=23435;
	for i:= 1 to 5 do
	begin
		leerEscuela(escu);
		if((escu.nombre = 'la plata')and(RelacionDA(escu) > 23435))then
			cont:=cont+1;
		LPMejores(escu,cue1,cue2,mejor1,mejor2);
	end;
	writeln('___________________');
	writeln('Cantidad de escuelas de LP con relacion mayor a la propuesta por unesa: ',cont);
	writeln('CUE de las dos mejores relaciones: ',cue1, ' y ',cue2);
		
end.
