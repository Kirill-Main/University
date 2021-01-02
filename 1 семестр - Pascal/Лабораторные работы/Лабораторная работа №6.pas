uses crt;
var
  m:string[40];
  a:array[1..40] of integer;
  i,j,n,c,x:integer;
begin
  writeln('Введите значение m');
  readln(m);
  for i:=1 to n do
    a[i]:=0;
  i:=1;
  j:=1;
  while (m[i]=' ') do i:=i+1;
  while (m[i]<>'.') do begin
    if (m[i]<>' ') then begin
      if (m[i]='A') then a[j]:=a[j]+1;
    end
    else if (m[i+1]<>' ') then j:=j+1;
    i:=i+1;
  end;
  n:=j;
  x:=a[1];
  c:=1;
  for i:=1 to n do
    if (a[i]>x) then begin
      c:=i; x:=a[i];
    end;
  writeln('Номер слова равен ',c);
end.