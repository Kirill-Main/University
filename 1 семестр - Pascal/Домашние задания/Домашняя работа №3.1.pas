uses crt;
type
  svet = class 
    private 
      color:string;
    public
      procedure init;
      procedure vuvod;
      procedure change(m:string);
   end;
procedure svet.init;
begin
  color:='красный';
end;
procedure svet.vuvod;
begin
  writeln('Текущий цвет светофора ',color);
end;
procedure svet.change(m:string);
begin
  color:=m;
end;
var
i:svet:=new svet;
a:string;
begin
  i.init;
  i.vuvod;
  writeln('Введите новый цвет');
  read(a);
  i.change(a);
  i.vuvod;
end.
