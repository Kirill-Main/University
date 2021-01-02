Type 
  tpel=^element;
  element=record
    num:integer;
    p:tpel; 
  end;
var
  first,q,second,r:tpel;
  a:element;
procedure f(e:tpel);
begin
  if (e^.p<>nil) then
    f(e^.p);
  write(e^.num,' ');
end;
function find(a:integer;k:tpel):tpel;
begin
  while (k<>nil) and (a<>k^.num) do
    k:=k^.p;
  result:=k;
end;
procedure g(e,h:tpel);
begin
  if (h^.p<>nil) then
    g(e,h^.p);
  if ((find(h^.num,e))<>nil) then 
    write(h^.num,' ');
end;
begin
  writeln('Введите 2 последовательности, в конце которых стоит 0');
  writeln('0 не входит в последовательность');
  new(first);
  first^.p:=nil;
	read(a.num);  
  while ((a.num)<>0) do begin
    first:=q;
    new(q);
	  q^.num:=a.num;   
	  q^.p:=first;
	  read(a.num);
  end;
  first:=q;
  new(second);
  second^.p:=nil;
	read(a.num);  
  while ((a.num)<>0) do begin
    second:=r;
    new(r);
	  r^.num:=a.num;   
	  r^.p:=second;
	  read(a.num);
  end;
  second:=r;
  writeln('В первом списке:');
  f(q);
  writeln;
  writeln('Во втором списке:');
  f(r);
  writeln;
  writeln('Общие элементы:');
  g(q,r);
  writeln;
end.
  
