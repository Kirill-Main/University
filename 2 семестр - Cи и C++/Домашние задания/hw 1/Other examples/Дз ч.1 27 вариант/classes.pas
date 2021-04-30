unit classes;

interface

uses System, System.Drawing, System.Windows.Forms;

type
  square=class
  private
    a,x0,y0:integer;
    graph:graphics;
  public
    procedure init(a1,x1,y1:integer; var gr:graphics);
    procedure draw(var pen1:pen);
  end;
  
  house=class
  private
    square_small, square_big:square;
    a,x0,y0:integer;
    graph:graphics;
  public
    procedure init(a1,x1,y1:integer; var gr:graphics; percent:real);
    procedure draw(var pen1:pen);
  end;
  
implementation

  procedure square.init(a1,x1,y1:integer; var gr:graphics);
  begin
    a:=a1; x0:=x1; y0:=y1; graph:=gr;
  end;
  
  procedure square.draw(var pen1:pen);
  begin
    graph.DrawRectangle(pen1, x0 - round(a/2), y0 - round(a/2), a, a); 
  end;
  
  procedure house.init(a1,x1,y1:integer; var gr:graphics; percent:real);
  begin
    square_small := new square;
    square_big := new square;
    x0 := x1; y0 := y1; graph := gr; a:=a1;
    square_small.init(round(a1*percent/100), x1, y1, gr);
    square_big.init(a1, x1, y1, gr)
  end;
  
  procedure house.draw(var pen1:pen);
  begin
    square_small.draw(pen1);
    square_big.draw(pen1);
    graph.DrawLine(pen1, x0 + round(a/2), y0 - round(a/2), x0, y0 - round(a));
    graph.DrawLine(pen1, x0, y0 - round(a), x0 - round(a/2), y0 - round(a/2));
  end;
  
end.