unit figures;

interface

uses System, System.Drawing, System.Windows.Forms;

type
  figure=class
    private
      p:point;
      a,move_figure:integer;
      pen1:pen;
      graph:graphics;
      Is_up:boolean:=true;
      Is_down:boolean:=false;
    public
      constructor create(var pen2:pen; x,y:integer; var g:graphics;a1,m:integer);
      procedure move();
      procedure draw; virtual; abstract;
  end;
  
  squart=class(figure)
  public
    procedure draw; override;
  end;
  
  sixang=class(figure)
  public
    procedure draw; override;
  end;
  
  eightang=class(figure)
  public
    procedure move;
    procedure draw; override;
  end;
  
implementation

constructor figure.create(var pen2:pen; x,y:integer; var g:graphics;a1,m:integer);
begin
    pen1:=pen2;
    p.x:=x;
    p.Y:=y;
    graph:=g;
    a:=a1;
    draw;
    move_figure:=m;
end;

procedure figure.move;
begin
  if (p.Y-a)<=0 then begin
    Is_up:=false;
    Is_down:=true;
  end
  else if (p.Y+a)>=592 then begin
    Is_up:=true;
    Is_down:=false;
  end;
  if Is_up then
    p.y-=move_figure
  else if Is_down then
    p.y+=move_figure;
  draw;
end;

procedure squart.draw;
begin
  graph.DrawLine(pen1,p.X+a,p.Y+a,p.X+a,p.Y-a);
  graph.DrawLine(pen1,p.X+a,p.Y-a,p.X-a,p.Y-a);
  graph.DrawLine(pen1,p.X-a,p.Y-a,p.X-a,p.Y+a);
  graph.DrawLine(pen1,p.X-a,p.Y+a,p.X+a,p.Y+a);
end;

procedure sixang.draw;
begin
  graph.DrawLine(pen1,round(p.X-a/2),round(p.Y-sqrt(3)*a/2),p.X-a,p.Y);
  graph.DrawLine(pen1,p.X-a,p.Y,round(p.X-a/2),round(p.Y+sqrt(3)*a/2));
  graph.DrawLine(pen1,round(p.X-a/2),round(p.Y+sqrt(3)*a/2),round(p.X+a/2),round(p.Y+sqrt(3)*a/2));
  graph.DrawLine(pen1,round(p.X+a/2),round(p.Y+sqrt(3)*a/2),p.X+a,p.Y);
  graph.DrawLine(pen1,p.X+a,p.Y,round(p.X+a/2),round(p.Y-sqrt(3)*a/2));
  graph.DrawLine(pen1,round(p.X+a/2),round(p.Y-sqrt(3)*a/2),round(p.X-a/2),round(p.Y-sqrt(3)*a/2));
end;

procedure eightang.move;
var
  r:integer;
begin
  r:=round(sqrt((1+sqrt(2))/(1+sqrt(2)-1))*a);
  if (p.Y-r)<=0 then begin
    Is_up:=false;
    Is_down:=true;
  end
  else if (p.Y+r)>=592 then begin
    Is_up:=true;
    Is_down:=false;
  end;
  if Is_up then
    p.y-=move_figure
  else if Is_down then
    p.y+=move_figure;
  draw;
end;

procedure eightang.draw;
var
  r:integer;
begin
  r:=round(sqrt((1+sqrt(2))/(1+sqrt(2)-1))*a);
  graph.DrawLine(pen1,p.X+r,p.y,round(p.x+r/sqrt(2)),round(p.y-r/sqrt(2)));
  graph.DrawLine(pen1,round(p.x+r/sqrt(2)),round(p.y-r/sqrt(2)),p.X,p.Y-r);
  graph.DrawLine(pen1,p.X,p.Y-r,round(p.x-r/sqrt(2)),round(p.y-r/sqrt(2)));
  graph.DrawLine(pen1,round(p.x-r/sqrt(2)),round(p.y-r/sqrt(2)),p.X-r,p.y);
  graph.DrawLine(pen1,p.X-r,p.y,round(p.x-r/sqrt(2)),round(p.y+r/sqrt(2)));
  graph.DrawLine(pen1,round(p.x-r/sqrt(2)),round(p.y+r/sqrt(2)),p.X,p.Y+r);
  graph.DrawLine(pen1,p.X,p.Y+r,round(p.x+r/sqrt(2)),round(p.y+r/sqrt(2)));
  graph.DrawLine(pen1,round(p.x+r/sqrt(2)),round(p.y+r/sqrt(2)),p.X+r,p.y);
end;

end.