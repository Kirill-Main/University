uses crt;
function f(x:real):integer;
var
  m,i:integer;
  prog:boolean;
begin
  prog:=true;
  m:=round(x);
  for i:=1 to m-1 do
    if (m mod i=0) then begin
      prog:=false;
      break;
    end;
  if (prog) then f:=i
  else f:=m;
end;
var
  a,b,S:Real;
  n:integer;
begin
  writeln('Введите стороны а и b прямоугольника');
  read(a,b);
  S:=a*b;
  n:=0;
  while (S<>0) do begin
    if (((S-a*a)>0)or((S-b*b)>0)) then begin
      if (a>b) then  begin
        S-=(b*b);
        a:=a-b;
        n:=n+1;
      end
      else  begin
        S-=(a*a);
        b:=b-a;
        n:=n+1;
      end;
    end
    else begin
        if (a>b) then begin
          if ((S-b*b)<0) then b:=b/f(b)
          else begin
            if ((S-b*b)=0) then S:=0;
            n:=n+1;
          end;
        end
        else begin
          if ((S-a*a)<0) then a:=a/f(a)
          else begin
            if ((S-a*a)=0) then S:=0;
            n:=n+1;
          end;
        end;
    end;
  end;
  writeln('Общее число квадратов в прямоугольнике равно ',n);
end.