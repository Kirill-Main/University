uses crt;
var
  i,N,j:integer;
  prov:boolean;
begin
  writeln('Введите число N');
  readln(N);
  writeln('Простые делители числа N:');
  i:=1;
  repeat
    i:=i+1;
    prov:=true;
    if (N mod i=0) then begin
      j:=1;
      repeat
        if (j=(i-1)) then break
        else j:=j+1;
        if (i mod j=0) then begin
          prov:=false;
          break;
        end;
      until (j=(i-1));
      if (prov) then writeln(i);
    end;
  until (i=N);
end.