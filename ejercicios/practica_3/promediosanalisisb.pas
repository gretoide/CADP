Program uno;
Procedure numero (var a: integer; b:integer; var c:integer);
Begin
  a:= (b + c) MOD 2;
  if (a MOD 2 = 0) then 
   begin
     b:= b + a * 3;
     c:= 8 DIV 2;
     a:= a + b * c;
   end
  else begin
        b:= (b + a) DIV 2;
        c:= 25 DIV 4;
        a:= a + b * c;   
       end;
  write (a); write (b); write (c);
End;

Var
 a,b,c:integer;
Begin
  a:= 18;  b:= 16;  c:= 3;
  numero (c,a,b);
  write (a); write (b); write (c);
End.
