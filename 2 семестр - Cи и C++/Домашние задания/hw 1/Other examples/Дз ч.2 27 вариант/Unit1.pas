Unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms, figures;

type
  Form1 = class(Form)
    procedure button1_Click(sender: Object; e: EventArgs);
    procedure button2_Click(sender: Object; e: EventArgs);
    procedure timer1_Tick(sender: Object; e: EventArgs);
  {$region FormDesigner}
  private
    {$resource Unit1.Form1.resources}
    button1: Button;
    button2: Button;
    timer1: Timer;
    components: System.ComponentModel.IContainer;
    pictureBox1: PictureBox;
    {$include Unit1.Form1.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
      timer1.Enabled:=false;
    end;
  end;

implementation
var
  pen1:pen := new Pen(color.black);
  bmp:bitmap := new Bitmap(832, 487);
  graph:graphics:= Graphics.fromimage(bmp);
  c:circle := new circle(pen1, 150, 250, 90, 50, 10, graph);
  tr:triangle := new triangle(pen1, 425, 250, 80, 60, 20, graph);
  k:kite := new kite(pen1, 650, 250, 90, 70, 25, graph);
  
procedure Form1.button1_Click(sender: Object; e: EventArgs);
begin
  button1.Text:='Начать';
  pictureBox1.Image := bmp;
  timer1.enabled:=true;
  button1.Enabled:=false;
  button2.Enabled:=true;
end;

procedure Form1.button2_Click(sender: Object; e: EventArgs);
begin
  timer1.enabled:=false;
  button1.Text:='Продолжить';
  button1.Enabled:=true;
  button2.Enabled:=false;
end;

procedure Form1.timer1_Tick(sender: Object; e: EventArgs);
begin
  pen1.color:=color.white;
  c.draw;
  tr.draw;
  k.draw;
  pictureBox1.Image := bmp;
  pen1.color:=color.Black;
  c.move;
  tr.move;
  k.move;
  pictureBox1.Image := bmp;
end;

end.
