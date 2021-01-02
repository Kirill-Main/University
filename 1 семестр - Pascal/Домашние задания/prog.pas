unit prog;
interface
var
  a,b,e,x:real;
  prov:boolean;
function f(x:real):real;
procedure KOR(a,b,e:real);
Implementation
  function f(x:real):real;
  begin
    if (prov) then f:=power(x,3)-2*cos(x)
    else f:=sqrt(abs(x))-2;
  end;
  procedure KOR(a,b,e:real);
  begin
    while (abs(b-a)>e) do begin
      x:=(a+b)/2;
      if (f(a)*f(x)<=0) then b:=x 
      else a:=x;
    end;
  end;
end.