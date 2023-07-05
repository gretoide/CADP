program autos;

type
	autitos = record
		marca:string;
		modelo:string;
		precio:real;
	end;
	
procedure leer(var a:autitos);
	begin
	writeln('___________________');
	writeln('ingrese una marca: ');readln(a.marca);
	if(a.marca <> 'zzz')then
		begin
		writeln('ingrese un modelo: ');readln(a.modelo);
		writeln('ingrese su precio: ');readln(a.precio);
		end;
	end;
	
//marca y modelo del precio mas caro

procedure autoCaro(a:autitos;var marcaCara:string; var modeloCaro:string; var max:real);
	begin
		if(a.precio>max)then
			begin
			marcaCara:=a.marca;
			modeloCaro:=a.modelo;
			max:=a.precio;
			end;
	end;

//PROGRAMAPRINCIPAL

var
	a:autitos;
	max,cantMarca,precioTot:real;
	marcaCara,modeloCaro,mismaMarca:string;
begin
	writeln('para dejar de ingresar autos, escriba "zzz" ');
	leer(a);
	while(a.marca<>'zzz')do
		begin
		mismaMarca:=a.marca;
		precioTot:=0;cantMarca:=0;
		while(mismaMarca = a.marca)do
			begin 
			precioTot:=precioTot+a.precio;
			cantMarca:=cantMarca+1;
			autoCaro(a,marcaCara,modeloCaro,max);
			leer(a);
			end;
		writeln('___________________');
		writeln('el precio promedio por la marca: ',mismaMarca, ' fue ',precioTot/cantMarca:2:2); {siempre me da 0, deberia usar una funcion?}
		end;
		writeln('la marca del auto mas caro fue: ',marcaCara,' del modelo ',modeloCaro);
end.
