program CADPGames;
    
uses  
  CADPDataLoader;

const
   CONTINUAR = '.';
   
procedure leerInstruccion(var car : char);
begin
    writeln('-----------------------------------------------------------------');
    write('Ingrese . para procesar los datos desde el comienzo: ');
    readln(car);
    if (car <> CONTINUAR) then begin
        writeln ('');
		writeln('NO SE PROCESARON CORRECTAMENTE LOS DATOS');
		writeln ('');
	end
	else
	    writeln('-----------------------------------------------------------------');
end;

//Procedimiento 1) CANTIDAD TOTAL DE EMPLEADOS
procedure cantE (var cantEmpleados:integer); {Devuelve la cantidad de empleados totales}
begin
	cantEmpleados:= cantEmpleados + 1;
end;

//Procedimiento 2) CANTIDAD DE EMPLEADOS CUYO SALARIO  ES MENOR A 300
procedure salario(salario:integer; var salarioCANT:integer); {Devuelve la cantidad de salarios menores a 300}																									
begin
	if (salario < 300) then
  		salarioCANT := salarioCANT + 1;
end;

//Procedimiento 3) Salario promedio de los empleados
procedure salarioT (salario:integer; var salarioTOTAL:integer); {Devuelve salario total para calcular el salario promedio}
begin
	salarioTOTAL:= salarioTOTAL + salario;
end;

//Procedimiento 4) Cantidad de veces que aparece el digito 1 en el legajo del empleado con mayor salario.
procedure salarioMaximo(dato: Tdatos; var maximo:integer; var legajo:integer); {Devuelve el salario maximo de todos los datos leidos}
begin
	if(dato.salario > maximo)then
		begin
			maximo:= dato.salario;
			legajo:= dato.legajo;
		end;	
end;

function digitoUno(legajo:integer):integer ; {Corrobora cuantos digitos 1 tiene el salario maximo}
var
	dig,total:integer;
begin
	total:= 0;
	while(legajo <> 0)do
		begin
			dig:= legajo mod 10;
			if(dig = 1)then
				total:= total + 1;
			legajo:= legajo div 10;
		end;
	digitoUno:= total;
end;
//FIN DEL 4
//Procedimiento 5) DNI DE LOS DOS EMPLEADOS CON MENOR SALARIO
procedure menorSalario(d:Tdatos; var dniMin1, dniMin2:string; var min1,min2:integer); {Devuelve los DNI de los salarios mas bajos}
	begin
		if(d.salario < min1)then
			begin
				dniMin2:=dniMin1;
				min2:=min1;
				dniMin1:=d.DNI;
				min1:=d.salario;
			end
			else
				if(d.salario < min2)then
					begin
						dniMin2:=d.DNI;
						min2:=d.salario;
					end;
	end;
  //Procedimiento 6) calcula los legajos con todos digitos pares o impares
function esPar (legajo:integer):boolean;
var
	seguir:boolean;
	dig:integer;
begin
	seguir:=true;
	while(legajo <> 0) and (seguir) do begin
			dig:= legajo mod 10;
			if((dig mod 2) = 0)then begin
				seguir:=true;
				legajo:= legajo div 10;
			end
			else
			seguir:=false;
	end;
	esPar:=seguir;
end;

function esImpar (legajo:integer):boolean;
var
	seguir:boolean;
	dig:integer;
begin
	seguir:=true;
	while(legajo <> 0) and (seguir) do
		begin
			dig:= legajo mod 10;
			if((dig mod 2) <> 0)then begin
				seguir:=true;
				legajo:= legajo div 10;
			end
			else
			seguir:=false;
	end;
	esImpar:=seguir;
end;

procedure sonTodosPoI (esPar,esImpar:boolean; var cantPoI:integer);
begin
	if (esPar) or (esImpar) then
		cantPoI:= cantPoI + 1;
end;
//fin del 6

//Procedimiento 7) procentaje de empleados con edad > a 50 y salario < 50
procedure porcentaje(d: Tdatos; var empleadoEspecial:integer); {cuenta los empleados que cumplen la condicion y luego calcula el promedio en el menu}
	begin;
		if (d.edad > 50) and (d.salario < 600) then
			empleadoEspecial:=empleadoEspecial+1;
	end;
//Procedimiento 8) cantidad de veces que aparece el dig 0 entre todos los legajos
procedure cantCeros(legajo:integer;var cant0:integer); {Corrobora cuantos digitos 0 tienen TODOS los legajos}
var
	dig:integer;
begin
	while(legajo <> 0)do
		begin
			dig:= legajo mod 10;
			if(dig = 0)then
				cant0:= cant0 + 1;
				legajo:= legajo div 10;
		end;
end;

//Procedimiento 9) cant. veces que un empleado cobra el doble del anterior
procedure salarioDoble(d:Tdatos; var doble, anterior: integer); {calcula los salarios dobles}
	begin
		if (d.salario > anterior *2 )then
			doble:=doble+1;
			anterior:=d.salario;	
	end;

//Menu de opciones
procedure menu(var opciones:integer); {menu de opciones}
begin
	writeln;
	writeln('--> Elija una de las siguientes opciones:');
	writeln;
	writeln('1: Cantidad total de empleados');
	writeln;
	writeln('2: Cantidad de empleados cuyo salario es menor a 300 dolares');
	writeln;
	writeln('3: Salario promedio de los empleados');
	writeln;
	writeln('4: Cantidad de veces que aparece el digito 1 en el legajo del empleado con mayor salario');
	writeln;
	writeln('5: DNI de los dos empleados con menor salario');
	writeln;
	writeln('6: Cantidad de empleados cuyos legajos posee todos digitos pares o todos digitos impares');
	writeln;
	writeln('7: Porcentaje de empleados de edad mayor a 50 y que cobran menos de 600 dolares');
	writeln;
	writeln('8: Cantidad de veces que aparece el digito 0 entre todos los legajos');
	writeln;
	writeln('9: Cantidad de veces en las que un empleado cobra mas del doble del empleado anterior del listado');
	writeln;
	write('Su opcion es: '); readln(opciones);
	writeln;
end;

//PROGRAMA PRINCIPAL
var
  dato : Tdatos;
  fin : boolean;
  cantEmpleados, min1, min2, max, legajo,salarioCANT,salarioTOTAL,opciones,empleadoEspecial,doble,cant0,anterior,cantPoI: integer;
  dniMin1, dniMin2: string;
  car,menuL:char;
begin
	cantEmpleados:=0;
    salarioCANT:= 0;
    salarioTOTAL:= 0;
    max:= -1;
    min1:=999; min2:=999;
	empleadoEspecial:=0;
	cant0:=0;
	Doble:=0;
	cantPoI:=0;
    leerInstruccion(car);
    if (car = CONTINUAR) then begin
		CADPVolverAlInicio('DatosGrupo');		
		repeat
		  	CADPleerDato(dato,fin);
            cantE (cantEmpleados); {punto 1}
            salario (dato.salario,salarioCANT); {punto 2}  
            salarioT (dato.salario,salarioTOTAL); {calculo salario total para saber punto 3}
            salarioMaximo(dato,max,legajo); {punto 4}
			menorSalario(dato,dniMin1,dniMin2,min1,min2); {punto 5}
			sonTodosPoI (esPar (dato.legajo), esImpar (dato.legajo),cantPoI);{punto 6}
            porcentaje(dato,empleadoEspecial);{punto7} 
			cantCeros (dato.legajo,cant0);{punto 8} 
	        salarioDoble(dato,doble,anterior); {punto9}        
		until(fin);
		CADPfinalizarLectura();        
	//ESPACIO PARA MENU
		write ('Ingrese M para desplegar el menu o cualquier otro caracter para finalizar: '); readln (menuL);
		while (menuL = 'M') or (menuL = 'm') do begin
			menu(opciones);     {Lee el menu de opciones y elige}
			case opciones of
				1: begin writeln ('---'); writeln('Los cantidad TOTAL de empleados es: ', cantEmpleados); writeln ('---'); end;
				2: begin writeln ('---'); writeln ('La cantidad de empleados cuyo salario es menor a 300 dolares: ' ,salarioCANT); writeln ('---'); end;
				3: begin writeln ('---'); writeln ('El salario promedio de los empleados es: ',salarioTOTAL/cantEmpleados:1:2); writeln ('---'); end;
				4: begin writeln ('---'); writeln('Con el legajo: ',legajo,' aparecen ',digitoUno(legajo),' veces el digito 1'); writeln ('---'); end;
				5: begin writeln ('---'); writeln('Los DNI de los empleados con menor salario son : ',dniMin1,' y ', dniMin2); writeln ('---'); end;
				6: begin writeln ('---'); writeln ('Cantidad de empleados cuyos legajos posee todos digitos pares o todos digitos impares: ',cantPoI); writeln ('---'); end;	
				7: begin writeln ('---'); writeln('El porcentaje de empleados de edad mayor a 50 y que cobran menos de 600 dolares es: % ', ((empleadoEspecial/cantEmpleados)*100):1:2); writeln ('---'); end;	
				8: begin writeln ('---'); writeln ('Cantidad de veces que aparece el digito 0 entre todos los legajos: ',cant0); writeln ('---'); end;
				9: begin writeln ('---'); writeln ('Cantidad de veces en las que un empleado cobra mas del doble del empleado anterior del listado: ',doble); writeln ('---'); end;
			else
				write('No pusiste una opcion correcta');
			end;
			writeln;
			write ('Ingrese M para desplegar el menu nuevamente u otro caracter para finalizar: '); readln(menuL)
		end;
	end;
	writeln;
	writeln ('PROGRAMA FINALIZADO');
end.
