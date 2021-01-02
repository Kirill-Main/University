uses crt,prog in 'C:\\Users\\kir20\\Desktop\\prog.pas';//не знабудь путь к файлу изменить
begin
  WriteLn('Введите значение e'); 
  ReadLn(e);
  prov:=true;
  a:=0; b:=2;
  KOR(a,b,e);
  WriteLn('В первом уравнении корень равен ',x:9:7);
  prov:=false;
  a:=0; b:=10;
  KOR(a,b,e);
  WriteLn('Во втором уравнении корень равен ',x:9:7);
end.