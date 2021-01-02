uses crt;
type
  house=class
    private
      number,floors:integer;
    public
      procedure init(y,z:integer);
      procedure vuvod;
      function chet:boolean;
      function num:integer;
      function floorsnum:integer;
  end;
  street=class
    private
      houses: array[1..100] of house;
      name:string;
    public
      procedure init1(s:string;n:integer);
      procedure vuvod1(n:integer);
      function chethouse(n:integer):integer;
      function nechethouse(n:integer):integer;
  end;
procedure house.init(y,z:integer);
begin
  number:=y;
  floors:=z;
end;
procedure house.vuvod;
begin
  writeln('Дом номер: ',number,'. Количество этажей: ',floors);
end;
function house.chet:boolean;
begin
  if (number mod 2=0) then result:=true
  else result:=false;
end;
function house.num:integer;
begin
  result:=number;
end;
function house.floorsnum:integer;
begin
  result:=floors;
end;
procedure street.init1(s:string;n:integer);
var
  a,b,i:integer;
begin
  name:=s;
  for i:=1 to n do begin
    write('Введите номер дома: ');
    read(a);
    write('Введите количество этажей дома: ');
    read(b);
    houses[i]:=new house;
    houses[i].init(a,b);
  end;
end;
procedure street.vuvod1(n:integer);
var i:integer;
begin
  writeln;
  writeln('Название улицы: ',name);
  write('Дома на четной стороне: ');
  for i:=1 to n do
    if (houses[i].chet=true) then
      write('дом №',houses[i].num,'-',houses[i].floorsnum,' этажей ');
  writeln;    
  write('Дома на нечетной стороне: ');
  for i:=1 to n do
    if (houses[i].chet=false) then
      write('дом №',houses[i].num,'-',houses[i].floorsnum,' этажей ');
end;
function street.chethouse(n:integer):integer;
var
  x,i,m:integer;
begin
  x:=0; m:=0;
  for i:=1 to n do
    if ((houses[i].chet=true) and (houses[i].floorsnum>x)) then begin
      x := houses[i].floorsnum;
      m:=houses[i].num;
    end;
  result:=m;
end;
function street.nechethouse(n:integer):integer;
var
  x,i,m:integer;
begin
  x:=0; m:=0;
  for i:=1 to n do
    if ((houses[i].chet=false) and (houses[i].floorsnum>x)) then begin
      x := houses[i].floorsnum;
      m:=houses[i].num;
    end;
  result:=m;
end;
var
  m:string;
  l:integer;
  f:street:=new street;
begin
  writeln('Введите название улицы');
  readln(m);
  writeln('Введите количество домов');
  readln(l);
  f.init1(m,l);
  f.vuvod1(l);
  writeln;
  writeln;
  writeln('Самый высокий дом на четной сторне-дом №',f.chethouse(l));
  writeln('Самый высокий дом на нечетной сторне-дом №',f.nechethouse(l));
  writeln;
end.