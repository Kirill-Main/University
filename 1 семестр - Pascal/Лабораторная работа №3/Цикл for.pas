uses crt;
var
  i,N,j:integer;
  prov:boolean;
begin
  writeln('Введите число N');
  readln(N);
  writeln('Простые делители числа N:');
  for i:=2 to N do begin
    prov:=true;
    if (N mod i=0) then begin
      for j:=2 to i-1 do
        if (i mod j=0) then begin
          prov:=false;
          break;
        end;
        if (prov) then writeln(i);
    end;
  end;
end.