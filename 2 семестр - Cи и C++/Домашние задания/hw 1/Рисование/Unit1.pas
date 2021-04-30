Unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms;

type
  Form1 = class(Form)
    procedure richTextBox1_MouseDown(sender: Object; e: MouseEventArgs);
    procedure richTextBox1_MouseMove(sender: Object; e: MouseEventArgs);
    procedure richTextBox1_MouseUp(sender: Object; e: MouseEventArgs);
    procedure pictureBox1_Click(sender: Object; e: EventArgs);
    procedure pictureBox1_MouseUp(sender: Object; e: MouseEventArgs);
    procedure pictureBox1_MouseMove(sender: Object; e: MouseEventArgs);
    procedure pictureBox1_MouseDown(sender: Object; e: MouseEventArgs);
  {$region FormDesigner}
  private
    {$resource Unit1.Form1.resources}
    label1: &Label;
    pictureBox1: PictureBox;
    {$include Unit1.Form1.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
    end;
  end;

implementation
var 
  prov:boolean:=false;
  prov1:boolean:=false;
  graph:graphics;
  bmp:bitmap:=new Bitmap(643,451);
  pen1:pen;
  p,p1:point;
  radius:integer;
procedure Form1.richTextBox1_MouseDown(sender: Object; e: MouseEventArgs);
begin
  
end;

procedure Form1.richTextBox1_MouseMove(sender: Object; e: MouseEventArgs);
begin
  
end;

procedure Form1.richTextBox1_MouseUp(sender: Object; e: MouseEventArgs);
begin
  
end;

procedure Form1.pictureBox1_Click(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.pictureBox1_MouseUp(sender: Object; e: MouseEventArgs);
begin
  if prov then begin
    pen1.Color:=SystemColors.Control;
    if (p1.X>p.x) and (p1.Y>p.Y) then
      graph.DrawRectangle(pen1,p.x,p.y,p1.x-p.x,p1.y-p.y)
    else if (p1.Y<p.Y) and (p1.X>p.x) then
      graph.DrawRectangle(pen1,p.x,p1.y,p1.x-p.x,p.y-p1.y)
    else if (p1.X<p.x) and (p1.Y>p.Y) then
      graph.DrawRectangle(pen1,p1.x,p.y,p.x-p1.x,p1.y-p.y)
    else if (p1.X<p.x) and (p1.Y<p.Y) then
      graph.DrawRectangle(pen1,p1.x,p1.y,p.x-p1.x,p.y-p1.y);
    pictureBox1.Image:=bmp;
    pen1.Color:=color.red;
    p1 := pictureBox1.PointToClient(System.Windows.Forms.Cursor.Position);
    if (p1.X>p.x) and (p1.Y>p.Y) then
      graph.DrawRectangle(pen1,p.x,p.y,p1.x-p.x,p1.y-p.y)
    else if (p1.Y<p.Y) and (p1.X>p.x) then
      graph.DrawRectangle(pen1,p.x,p1.y,p1.x-p.x,p.y-p1.y)
    else if (p1.X<p.x) and (p1.Y>p.Y) then
      graph.DrawRectangle(pen1,p1.x,p.y,p.x-p1.x,p1.y-p.y)
    else if (p1.X<p.x) and (p1.Y<p.Y) then
      graph.DrawRectangle(pen1,p1.x,p1.y,p.x-p1.x,p.y-p1.y);
    pictureBox1.Image:=bmp;
    prov:=false;
  end
  else if prov1 then begin
    pen1.Color:=SystemColors.Control;
    radius := round(sqrt(sqr(p1.x-p.x)+sqr(p1.y-p.y)));
    graph.Drawellipse(pen1,p.X-radius,p.Y-radius,2*radius,2*radius);
    pictureBox1.Image:=bmp;
    pen1.Color:=color.red;
    p1 := pictureBox1.PointToClient(System.Windows.Forms.Cursor.Position);
    radius := round(sqrt(sqr(p1.x-p.x)+sqr(p1.y-p.y)));
    graph.Drawellipse(pen1,p.X-radius,p.Y-radius,2*radius,2*radius);
    pictureBox1.Image:=bmp;
    prov1:=false;
  end;
end;

procedure Form1.pictureBox1_MouseMove(sender: Object; e: MouseEventArgs);
begin
  if prov then begin
    pen1.Color:=SystemColors.Control;
    if (p1.X>p.x) and (p1.Y>p.Y) then
      graph.DrawRectangle(pen1,p.x,p.y,p1.x-p.x,p1.y-p.y)
    else if (p1.Y<p.Y) and (p1.X>p.x) then
      graph.DrawRectangle(pen1,p.x,p1.y,p1.x-p.x,p.y-p1.y)
    else if (p1.X<p.x) and (p1.Y>p.Y) then
      graph.DrawRectangle(pen1,p1.x,p.y,p.x-p1.x,p1.y-p.y)
    else if (p1.X<p.x) and (p1.Y<p.Y) then
      graph.DrawRectangle(pen1,p1.x,p1.y,p.x-p1.x,p.y-p1.y);
    pictureBox1.Image:=bmp;
    pen1.Color:=color.black;
    p1 := pictureBox1.PointToClient(System.Windows.Forms.Cursor.Position);
    if (p1.X>p.x) and (p1.Y>p.Y) then
      graph.DrawRectangle(pen1,p.x,p.y,p1.x-p.x,p1.y-p.y)
    else if (p1.Y<p.Y) and (p1.X>p.x) then
      graph.DrawRectangle(pen1,p.x,p1.y,p1.x-p.x,p.y-p1.y)
    else if (p1.X<p.x) and (p1.Y>p.Y) then
      graph.DrawRectangle(pen1,p1.x,p.y,p.x-p1.x,p1.y-p.y)
    else if (p1.X<p.x) and (p1.Y<p.Y) then
      graph.DrawRectangle(pen1,p1.x,p1.y,p.x-p1.x,p.y-p1.y);
    pictureBox1.Image:=bmp;
  end
  else if prov1 then begin
    pen1.Color:=SystemColors.Control;
    radius := round(sqrt(sqr(p1.x-p.x)+sqr(p1.y-p.y)));
    graph.Drawellipse(pen1,p.X-radius,p.Y-radius,2*radius,2*radius);
    pictureBox1.Image:=bmp;
    pen1.Color:=color.black;
    p1 := pictureBox1.PointToClient(System.Windows.Forms.Cursor.Position);
    radius := round(sqrt(sqr(p1.x-p.x)+sqr(p1.y-p.y)));
    graph.Drawellipse(pen1,p.X-radius,p.Y-radius,2*radius,2*radius);
    pictureBox1.Image:=bmp;
  end;
end;

procedure Form1.pictureBox1_MouseDown(sender: Object; e: MouseEventArgs);
begin
   if (e.Button = System.Windows.Forms.MouseButtons.Left) then begin
    p := pictureBox1.PointToClient(System.Windows.Forms.Cursor.Position);
    graph:=Graphics.fromimage(bmp);
    pen1:=new Pen(color.black);
    p1:=p;
    pictureBox1.Image:=bmp;
    prov:=true;
   end
   else if (e.Button = System.Windows.Forms.MouseButtons.Right) then begin
    p := pictureBox1.PointToClient(System.Windows.Forms.Cursor.Position);
    graph:=Graphics.fromimage(bmp);
    pen1:=new Pen(color.black);
    p1:=p;
    pictureBox1.Image:=bmp;
    prov1:=true;
   end;
end;

end.
