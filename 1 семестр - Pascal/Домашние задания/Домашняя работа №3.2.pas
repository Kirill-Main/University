uses crt;
type
  zakpismo = class
    private
      addressfrom:string;
      addressto:string;
      weight:real;
    public
      procedure init(w:real;c,v:string);
      procedure vuvod;
      function potchet(w:real):real;
  end;
  zenpismo = class(zakpismo)
    private
      cennost:real;
    public
      function doplata(w:real):real;
      function poln(w,z:real):real;
      procedure vuvod(w:real);
      function potchet(w:real):real;
  end;
procedure zakpismo.init(w:real;c,v:string);
begin
  addressfrom:=c;
  addressto:=v;
  weight:=w;
end;
function zakpismo.potchet(w:real):real;
begin
  if (w<20) then result:=60
  else if (w<40) then result:=63.60
  else if (w<60) then result:=67.20
  else if (w<80) then result:=70.80
  else if (w<=100) then result:=74.40
  else result:=-1;
end;
procedure zakpismo.vuvod;
begin
  if (potchet(weight)<>-1) then begin
    writeln;
    writeln('Отправка из: ',addressfrom);
    writeln('Отправка в: ',addressto);
    writeln('Вес письма: ',weight,' г');
    writeln('Стоимость отправки: ',potchet(weight),' руб.');
    writeln;
  end
  else
    writeln('Слишком тяжелое заказное письмо');
end;
function zenpismo.doplata(w:real):real;
begin
  result:=0.03*w;
end;
function zenpismo.poln(w,z:real):real;
begin
  result:=w+z;
end;
function zenpismo.potchet(w:real):real;
begin
  if (w<=20) then result:=132
  else if ((w>21) and (w<=40)) then result:=135.6
  else if ((w>41) and(w<=60)) then result:=139.2
  else if ((w>61) and (w<=80)) then result:=142.8
  else if ((w>81) and (w<=100)) then result:=146.4
  else result:=-1;
end;
procedure zenpismo.vuvod(w:real);
begin
  if (potchet(weight)<>-1) then begin
    writeln;
    writeln('Отправка из: ',addressfrom);
    writeln('Отправка в: ',addressto);
    writeln('Вес письма: ',weight,' г');
    writeln('Стоимость отправки: ',potchet(weight)+w,' руб.');
    writeln;
  end
  else
    writeln('Слишком тяжелое ценное письмо');
end;
var
  x,y:real;
  m,m1:string;
  i:zakpismo:= new zakpismo;
  j:zenpismo:= new zenpismo;
begin
  writeln('Откуда отправляете заказное письмо');
  readln(m);
  writeln('Куда отправляете заказное письмо');
  readln(m1);
  writeln('Введите вес заказного письма в г');
  readln(x);
  i.init(x,m,m1);
  i.vuvod;
  writeln('Откуда отправляете ценное письмо');
  readln(m);
  writeln('Куда отправляете ценное письмо');
  readln(m1);
  writeln('Введите вес ценного письма в г');
  readln(x);
  j.init(x,m,m1);
  writeln('Введите ценность письма в руб');
  readln(x);
  y:=j.doplata(x);
  x:=j.poln(x,y);
  j.vuvod(x);
end.