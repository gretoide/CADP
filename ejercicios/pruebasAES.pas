
program punteros;
type
    pinteger = ^integer;
procedure sumar(num : pinteger; valor : integer);
begin
   num^ := num^ + valor;
end;
var
   num : pinteger;
   valor : integer;
begin
   new(num);
   readln(valor);
  repeat
      sumar(num,valor);
      readln(valor);
  until (valor = 10);
  writeln(num^);
end.