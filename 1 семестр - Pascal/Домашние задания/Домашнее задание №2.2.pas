uses crt;
var
  d:array[0..9,0..11] of integer;
  x,y,sum,i,j,k,m:integer;
begin
  sum:=0;
  k:=1;
  for i:=1 to 8 do begin
    for j:=1 to 10 do begin
      d[i,j]:=k;
      k:=k+1;
    end;
  end;
  writeln('Текущая матрица');
  writeln;
  i:=0; m:=9;
  for j:=0 to 11 do begin
    d[i,j]:=0;
    d[m,j]:=0;
  end;
  j:=0; m:=11;
  for i:=0 to 9 do begin
    d[i,j]:=0;
    d[i,m]:=0;
  end;
  for i:=1 to 8 do begin
    for j:=1 to 10 do
      if ((d[i-1,j]+d[i+1,j]+d[i,j-1]+d[i,j+1])>sum) then begin
        sum:=d[i-1,j]+d[i+1,j]+d[i,j-1]+d[i,j+1]; x:=i; y:=i;
      end;
  end;
  for i:=1 to 8 do begin
    for j:=1 to 10 do
      write(d[i,j]:6);
    writeln;
  end;
  writeln;
  writeln('Сумма равна ',sum);
  writeln('Строке ',x,' и столбцу ',y,' соответствует элемент ', d[x,y]);
end.