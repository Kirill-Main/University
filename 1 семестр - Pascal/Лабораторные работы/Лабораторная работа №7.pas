type
  digit=array[1..10,1..10] of integer;
const 
  n=10;
  m=10;
var 
  i,j,k:integer;
  a:digit;
procedure swap(x:digit);
var
  k:integer;
begin
  for k:=n downto 1 do
    write(x[i,k]:6);
end;
begin
  k:=1;
  for i:=1 to n do
    for j:=1 to m do begin
      a[i,j]:=k*k;
      k:=k+1;
    end;
  writeln('Матрица до');
  writeln;
  for i:=1 to n do begin
    for j:=1 to m do
      write(a[i,j]:6);
    writeln;
  end;
  writeln;
  writeln('Матрица после');
  writeln;
  for i:=1 to n do begin
      if (i mod 2<>0) then begin
        swap(a);
        writeln;
        continue;
      end;
    for j:=1 to m do
        write(a[i,j]:6);
    writeln;
  end;
  writeln;
end.