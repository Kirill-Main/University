Unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms, classes;

type
  Form1 = class(Form)
    procedure pictureBox1_MouseClick(sender: Object; e: MouseEventArgs);
    procedure button1_Click(sender: Object; e: EventArgs);
    procedure button2_Click(sender: Object; e: EventArgs);
  {$region FormDesigner}
  private
    {$resource Unit1.Form1.resources}
    textBox1: TextBox;
    label1: &Label;
    button1: Button;
    label2: &Label;
    textBox2: TextBox;
    button2: Button;
    pictureBox1: PictureBox;
    {$include Unit1.Form1.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
      textbox1.Text:='100';
      textbox2.Text:='50';
    end;
  end;

implementation
var
  graph: graphics;
  bmp: bitmap := new Bitmap(723, 522);
  pen1:pen;
  p:point;
  sq:square;
  h:house;
  a:integer:=100;
  percent:real:=50;
  
procedure Form1.pictureBox1_MouseClick(sender: Object; e: MouseEventArgs);
begin
  if e.Button = System.Windows.Forms.MouseButtons.Left then begin
    p := pictureBox1.PointToClient(System.Windows.Forms.Cursor.Position);
    graph := Graphics.fromimage(bmp);
    pen1 := new Pen(color.black);
    pictureBox1.Image := bmp;
    sq := new square;
    sq.init(a, p.x, p.y, graph);
    sq.draw(pen1);
  end
  else if e.Button = System.Windows.Forms.MouseButtons.Right then begin
    p := pictureBox1.PointToClient(System.Windows.Forms.Cursor.Position);
    graph := Graphics.fromimage(bmp);
    pen1 := new Pen(color.black);
    pictureBox1.Image := bmp;
    h := new house;
    h.init(a, p.x, p.y, graph, percent);
    h.draw(pen1);
  end;
end;

procedure Form1.button1_Click(sender: Object; e: EventArgs);
begin
  if textbox1.Text<>'' then
    a:=strtoint(textbox1.Text);
end;

procedure Form1.button2_Click(sender: Object; e: EventArgs);
begin
  if textbox2.Text<>'' then
    percent:=strtofloat(textbox2.Text);
end;

end.
