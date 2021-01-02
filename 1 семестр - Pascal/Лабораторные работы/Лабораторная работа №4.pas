uses crt;
var
  a:array[1..50] of integer;
  i,j,x,k,n,l:integer;
begin
  write('Введите число n: ');
  readln(n);
  write('Введите сами числа: ');
  for i:=1 to n do
    read(a[i]);
  i:=1;
  while (i<=n) do begin
    l:=0;
    for j:=1 to n do
      if (a[i]=a[j]) then l:=l+1;
    if (l>3) then begin
      x:=a[i];
      j:=i;
      while (j<=n) do begin
        if (a[j]=x) then begin
          for k:=j to n-1 do
            a[k]:=a[k+1];
          n:=n-1;
        end
        else j:=j+1;
      end;
    end
    else i:=i+1;
  end;
  if (n=0) then writeln('Осталось 0 элементов')
  else begin
    write('Оставшиеся элементы: ');
    for i:=1 to n do begin
      write(a[i]);
      write(' ');
    end;
    end;
  writeln('');
end.
  
  