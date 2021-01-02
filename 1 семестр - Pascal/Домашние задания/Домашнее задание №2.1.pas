uses crt;
var
  a:array[1..50] of integer;
  i,j,x,k,n:integer;
begin
    writeln('Введите n ');
    readln(n);
    writeln('Введите массив A(n)');
    for i:=1 to n do
        read(a[i]);
    for i:=1 to n do begin
        k:=i; x:=a[i];
        for j:=i+1 to n do
          if (a[j]<x) then begin
            k:=j; x:=a[j];
          end;
          a[k]:=a[i]; a[i]:=x;
    end;
    writeln('После обработки');
    for i:=1 to n do begin
      write(a[i]);
      write(' ');
    end;
    writeln;
end.