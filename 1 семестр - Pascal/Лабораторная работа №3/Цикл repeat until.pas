uses crt;
var
  i,N:integer;
begin
  writeln('Введите число N');
  readln(N);
  writeln('Простые делители числа N:');
  i:=2;
    repeat
      if (N mod i=0) then begin
        writeln(i);
        N:=N div i;
        i:=2;
      end
      else
        i:=i+1;
    until (N=1);
end.