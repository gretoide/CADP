program ejer3;

const
	viajesGuardados = 200;
type
	
	infoViajes = record
		dia: integer;
		montoTransportado: real;
		km:integer;
	end;
	
	vector = array[1..viajesGuardados] of infoViajes;
	
	marzo = array[1..31] of integer;


{carga del registro}

procedure inicializarDias(var m:marzo);
var
	i:integer;
begin
	for i:= 1 to 31 do
		m[i]:=0;
end;
procedure leerRegistro(var viaje: infoViajes);

begin
	writeln('---------------------------------------------------');
	write('ingrese km recorridos: ');readln(viaje.km); {debemos colocar primero la condicion de corte}
	if (viaje.km <> 0) then
		begin
			write('ingrese el dia del mes: ');readln(viaje.dia);
			write('monto transportado: ');readln(viaje.montoTransportado);
		end;
end;
{cargar vector de a lo sumo 200 viajes}
procedure cargaVector(var v:vector; var dimL: integer);

var
	r:infoViajes;
	
begin
	dimL:=0;
	leerRegistro(r);
	
	while(dimL <= viajesGuardados)and(r.km <> 0)do
		begin
			dimL:=dimL+1;
			v[dimL]:=r;
			leerRegistro(r);
		end;
end;

{monto contador}

procedure montoContador(monto:real; var montoTotal:real);

begin
	montoTotal:=montoTotal+monto;
end;


{distancia recorrida y el dia del mes del viaje con menor dinero}

procedure viajeBarato(r:infoViajes; var min,distancia,dia:integer);

begin
	if(r.montoTransportado < min) then
		begin
			distancia:=r.km;
			dia:=r.dia;
		end;
end;
{cargamos el vector contador de los dias}

procedure CargarDias(var m:marzo; dia:integer);
begin
	m[dia]:=m[dia]+1;
end;
{imprime los dias con sus viajes en otro vector}
procedure Dias(m:marzo); 

var
	i:integer;
begin
	for i:= 1 to 31 do 
		writeln('el dia ',i,' se hicieron ',m[i], ' viajes');
end;

{analisis completo}
procedure AnalizarImprimir(v:vector;dimL:integer;var m:marzo); {debemos pasar el mes por valor para que pueda editarlo}
var
	i,min,distancia,dia:integer;
	montoTotal:real;
begin
	min:=999;
	for i:= 1 to dimL do
		begin
		montoContador(v[i].montoTransportado,montoTotal);
		viajeBarato(v[i],min,distancia,dia);
		CargarDias(m,v[i].dia);
		end;
		write('-----------------------------------');
		writeln('el monto promedio de los viajes realizados es: ',(montoTotal/dimL):2:1);writeln;
		writeln('el dia ',dia,' se recorrio ',distancia,'km y fue el dia que menor dinero se transporto');writeln;
		Dias(m);
end;

procedure Eliminar(var v:vector;dimL:integer); 
var

	i,pos:integer;
begin
	pos:=1;
	while(pos<=dimL)do {mientras que no se termine el vector, si encuentra un numero hace todos los corriemientos, y luego evalua el siguiente}
		begin
			if (v[pos].km = 100) then 
			begin
				for i:= pos to dimL-1 do
					v[i]:=v[i+1];
				dimL:=dimL-1;
			end;
		end;
end;
	
//PROGRAMA PRINCIPAL
var
	v:vector;
	dl:integer;
	m:marzo;
	
begin
	inicializarDias(m);
	cargaVector(v,dl);
	AnalizarImprimir(v,dl,m);
	Eliminar(v,dl);
end.
	
	

	
	
	
	
	
	
