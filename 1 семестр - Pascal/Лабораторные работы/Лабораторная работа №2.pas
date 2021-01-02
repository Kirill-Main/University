uses crt;
var
  x,y:real;
begin
  writeln('Введите значение x и y');
  readln(x,y);
  if (y>=(-0.5*x+0.5)) and (y<=(-0.5*x+1.75)) and (y<=(2*x+0.5)) and (y>=(2*x-2)) then
    writeln('Принадлежит')
  else
    writeln('Не принадлежит');
end.