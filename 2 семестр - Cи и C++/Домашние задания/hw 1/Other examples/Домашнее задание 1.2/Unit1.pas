Unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms,Figures;

type
  Form1 = class(Form)
    procedure timer1_Tick(sender: Object; e: EventArgs);
    procedure button1_Click(sender: Object; e: EventArgs);
    procedure button2_Click(sender: Object; e: EventArgs);
  {$region FormDesigner}
  private
    {$resource Unit1.Form1.resources}
    timer1: Timer;
    components: System.ComponentModel.IContainer;
    button1: Button;
    button2: Button;
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
  pen1 := new Pen(color.black);
  bmp: bitmap := new Bitmap(973, 592);
  graph :graphics:= Graphics.fromimage(bmp);
  sq:squart:=new squart(pen1,200,500,graph,40,22);
  six:sixang:=new sixang(pen1,500,500,graph,60,17);
  eight:eightang:=new eightang(pen1,800,500,graph,80,12);

procedure Form1.timer1_Tick(sender: Object; e: EventArgs);
begin
  pen1.color:=color.white;
  sq.draw;
  six.draw;
  eight.draw;
  pictureBox1.Image := bmp;
  pen1.color:=color.Black;
  sq.move;
  six.move;
  eight.move;
  pictureBox1.Image := bmp;
end;

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

end.
