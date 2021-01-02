uses crt;
var
  f,g:text;
  x,y,sum:integer;
  prov:boolean;
begin
  assign(f,'C:\\Users\\kir20\\Desktop\\f.txt');//Необходимо создать файл f!
  assign(g,'C:\\Users\\kir20\\Desktop\\g.txt');//Измени путь к файлу!
  reset(f);
  rewrite(g);
  prov:=false;
  while (not(eof(f))) do begin
    readln(f,x);
    if (prov) then begin
      sum:=x+y;
      writeln(g,sum);
    end;
    if (x mod 2<>0) then begin
      readln(f,y);
      if (y mod 2<>0) then prov:=true
      else prov:=false;
      sum:=x+y;
      writeln(g,sum);
    end;
  end;
  close(f);
  close(g);
  assign(f,'C:\\Users\\kir20\\Desktop\\f.txt');
  assign(g,'C:\\Users\\kir20\\Desktop\\g.txt');
  reset(f);
  reset(g);
  writeln('В f файле:');
  while (not(eof(f))) do begin
    readln(f,x);
    write(x);
    write(' ');
  end;
  writeln;
  writeln('В g файле:');
  while (not(eof(g))) do begin
    readln(g,x);
    write(x);
    write(' ');
  end;
  writeln;
  close(f);
  close(g);
end.