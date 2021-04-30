uses crt;
var
  i,N,j:integer;
  prov:boolean;
begin
  writeln('Введите число N');
  readln(N);
  writeln('Простые делители числа N:');
  i:=1;
  while (i<N) do begin
    i:=i+1;
    prov:=true;
    if (N mod i=0) then begin
      j:=1;
      while (j<(i-1)) do begin
        j:=j+1;
        if (i mod j=0) then begin
          prov:=false;
          break;
        end;
      end;
      if (prov) then writeln(i);
    end;
  end;
end.