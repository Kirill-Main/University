uses crt;
var
  str:string;
  j:char;
  m,a:set of char;
  i:integer;
begin
    m:=['a','e','i','o','u'];
    writeln('Введите строку str');
    read(str);
    writeln('В данном тексте следующие гласные буквы');
    for i:=1 to length(str) do
      if (str[i] in m) then
        if (a=(a-[str[i]])) then begin
          a:=a+[str[i]];
        end;
  for j:='a' to 'z' do
    if (j in a) then write(j,' '); 
  writeln;
end.