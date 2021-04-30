unit figures;

interface

uses System, System.Drawing, System.Windows.Forms;

type
  figure=class
    private
      p,center,pa,pb:point;
      pen1:pen;
      graph:graphics;
      a:integer;
      R:integer;
      alpha:real;
      Go_right:boolean;
      len:integer;
    public
      constructor create(var pen2:pen; x,y,a1,r1,m:integer; var g:graphics);
      procedure move;
      procedure draw; virtual; abstract;
   end;
   
   circle=class(figure)
    public
      procedure draw; override;
   end;
   
   triangle=class(figure)
    public
      procedure draw; override;
   end;
   
   kite=class(figure)
    private
      pc:point;
    public
      constructor create(var pen2:pen; x,y,a1,r1,m:integer; var g:graphics);
      procedure move;
      procedure draw; override;
   end;
   
implementation

constructor figure.create(var pen2:pen; x,y,a1,r1,m:integer; var g:graphics);
begin
  p.X:=x; p.Y:=y; pen1:=pen2; graph:=g; a:=a1; R:=r1; alpha:=1/m; center.x:=p.X; center.Y:=p.Y-a; len:=m;
  Go_right:=True;
  pa.X:=p.X - round(a/2); pa.Y:=p.Y + round(a/2);
  pb.X:=p.X + round(a/2); pb.Y:=p.Y + round(a/2);
end;

procedure figure.move;
begin
  if (pa.x -center.X <= len) and Go_right then begin
    
    pa.X := round((pa.X - center.X)*cos(alpha) + (pa.y - center.Y) * sin(alpha) + center.X);
    pa.y := round((pa.y - center.y)*cos(alpha) - (pa.x - center.x) * sin(alpha) + center.y);
    
    pb.X := round((pb.X - center.X)*cos(alpha) + (pb.y - center.Y) * sin(alpha) + center.X);
    pb.y := round((pb.y - center.y)*cos(alpha) - (pb.x - center.x) * sin(alpha) + center.y);
  end
  else begin
    if alpha > 0 then alpha:=0-alpha;
    Go_right:=false;
    pa.X := round((pa.X - center.X)*cos(alpha) + (pa.y - center.Y) * sin(alpha) + center.X);
    pa.y := round((pa.y - center.y)*cos(alpha) - (pa.x - center.x) * sin(alpha) + center.y);
    
    pb.X := round((pb.X - center.X)*cos(alpha) + (pb.y - center.Y) * sin(alpha) + center.X);
    pb.y := round((pb.y - center.y)*cos(alpha) - (pb.x - center.x) * sin(alpha) + center.y);
    
    {if (pa.X- pb.X) / 2 - center.x < 1e-1 then begin
      pa.X:=p.X - round(a/2); pa.Y:=p.Y + round(a/2);
      pb.X:=p.X + round(a/2); pb.Y:=p.Y + round(a/2);
    end;}
    if center.X - pb.X > len then begin
      Go_right:=true;
      alpha:=0-alpha;
    end;
  end;
  
  draw;
end;

procedure circle.draw;
begin
  graph.DrawEllipse(pen1, pa.x, pa.y - a, a, a);
end;

procedure triangle.draw;
begin
  graph.DrawLine(pen1, pa.x, pa.y, pb.X, pb.y);
  graph.DrawLine(pen1, pb.X, pb.y, center.X, center.y);
  graph.DrawLine(pen1, center.X, center.y, pa.x, pa.y);
end;

procedure kite.draw;
begin
  graph.DrawLine(pen1, pa.x, pa.y, pb.X, pb.y);
  graph.DrawLine(pen1, pb.X, pb.y, center.X, center.y);
  graph.DrawLine(pen1, center.X, center.y, pa.x, pa.y);
  graph.DrawLine(pen1,pa.x, pa.y, pc.X, pc.y);
  graph.DrawLine(pen1, pc.X, pc.y, pb.x, pb.y);
  graph.DrawLine(pen1, center.X, center.y, pc.X, pc.y);
end;

procedure kite.move;
begin
  if (pa.x -center.X <= len) and Go_right then begin
    
    pa.X := round((pa.X - center.X)*cos(alpha) + (pa.y - center.Y) * sin(alpha) + center.X);
    pa.y := round((pa.y - center.y)*cos(alpha) - (pa.x - center.x) * sin(alpha) + center.y);
    
    pb.X := round((pb.X - center.X)*cos(alpha) + (pb.y - center.Y) * sin(alpha) + center.X);
    pb.y := round((pb.y - center.y)*cos(alpha) - (pb.x - center.x) * sin(alpha) + center.y);
    
    pc.X := round((pc.X - center.X)*cos(alpha) + (pc.y - center.Y) * sin(alpha) + center.X);
    pc.y := round((pc.y - center.y)*cos(alpha) - (pc.x - center.x) * sin(alpha) + center.y);
  end
  else begin
    if alpha > 0 then alpha:=0-alpha;
    Go_right:=false;
    pa.X := round((pa.X - center.X)*cos(alpha) + (pa.y - center.Y) * sin(alpha) + center.X);
    pa.y := round((pa.y - center.y)*cos(alpha) - (pa.x - center.x) * sin(alpha) + center.y);
    
    pb.X := round((pb.X - center.X)*cos(alpha) + (pb.y - center.Y) * sin(alpha) + center.X);
    pb.y := round((pb.y - center.y)*cos(alpha) - (pb.x - center.x) * sin(alpha) + center.y);
    
    pc.X := round((pc.X - center.X)*cos(alpha) + (pc.y - center.Y) * sin(alpha) + center.X);
    pc.y := round((pc.y - center.y)*cos(alpha) - (pc.x - center.x) * sin(alpha) + center.y);
    
    {if (pa.X- pb.X) / 2 - center.x < 1e-1 then begin
      pa.X:=p.X - round(a/2); pa.Y:=p.Y + round(a/2);
      pb.X:=p.X + round(a/2); pb.Y:=p.Y + round(a/2);
    end;}
    if center.X - pb.X > len then begin
      Go_right:=true;
      alpha:=0-alpha;
    end;
  end;
  
  draw;
end;

constructor kite.create(var pen2:pen; x,y,a1,r1,m:integer; var g:graphics);
begin
  inherited create(pen2,x,y,a1,r1,m,g);
  pa.X:=p.X - round(a/2); pa.Y:=p.Y + round(a/100);
  pb.X:=p.X + round(a/2); pb.Y:=p.Y + round(a/100);
  pc.x:=center.x;
  pc.y:=round(center.y + 3*a);
end;

end.