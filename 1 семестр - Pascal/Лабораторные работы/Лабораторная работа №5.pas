uses crt;
const n=10;
var
  a:array[1..n,1..n] of integer;
  i,j,k,p:integer;
begin
  k:=1;
  for i:=1 to n do
    for j:=1 to n do begin
      a[i,j]:=k*k;
      k:=k+1;
    end;
  k:=n;
  for i:=1 to n do begin
    for j:=1 to k do
      write(a[i,j]:6);
    for p:=k to 9 do
      write('':6);
    writeln;
    k:=k-1;
  end;
  k:=10;
  writeln;
  for i:=1 to 10 do begin
    for p:=2 to k do
      write('':6);
    for j:=k to n do
      write(a[i,j]:6);
    writeln;
    k:=k-1;
  end;
  writeln;
end.