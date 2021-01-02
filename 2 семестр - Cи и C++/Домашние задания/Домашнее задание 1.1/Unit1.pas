unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms,figures;
var 
  pen2:pen;
  sb:solidbrush;
type
  Form1 = class(Form)
    procedure richTextBox1_MouseDown(sender: Object; e: MouseEventArgs);
    procedure richTextBox1_MouseMove(sender: Object; e: MouseEventArgs);
    procedure richTextBox1_MouseUp(sender: Object; e: MouseEventArgs);
    procedure pictureBox1_Click(sender: Object; e: EventArgs);
    procedure pictureBox1_MouseUp(sender: Object; e: MouseEventArgs);
    procedure pictureBox1_MouseMove(sender: Object; e: MouseEventArgs);
    procedure pictureBox1_MouseDown(sender: Object; e: MouseEventArgs);
    procedure button1_Click(sender: Object; e: EventArgs);
    procedure radioButton1_Click(sender: Object; e: EventArgs);
    procedure radioButton2_CheckedChanged(sender: Object; e: EventArgs);
    procedure radioButton1_CheckedChanged(sender: Object; e: EventArgs);
    procedure radioButton3_CheckedChanged(sender: Object; e: EventArgs);
    procedure button2_Click(sender: Object; e: EventArgs);
  {$region FormDesigner}
  private
    {$resource Unit1.Form1.resources}
    label1: &Label;
    button1: Button;
    label2: &Label;
    textBox1: TextBox;
    colorDialog1: ColorDialog;
    button2: Button;
    pictureBox1: PictureBox;
    {$include Unit1.Form1.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
      pen2:=new Pen(color.Red);
      sb:=new SolidBrush(color.Red);
    end;
  end;


implementation

var
  prov: boolean := false;
  prov1: boolean := false;
  graph: graphics;
  bmp: bitmap := new Bitmap(643, 451);
  pen1:pen;
  p, p1: point;
  c:circle;
  rect1:rect;
  alpha:real:=0;
  
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
    pen1.Color := SystemColors.Control;
    rect1.draw(pen1,p1);
    pictureBox1.Image := bmp;
    p1 := pictureBox1.PointToClient(System.Windows.Forms.Cursor.Position);
    pen1.Color:=pen2.color;
    rect1.drawend(pen1,p1,sb);
    pictureBox1.Image := bmp;
    prov := false;
  end
  else if prov1 then begin
    pen1.Color := SystemColors.Control;
    c.draw(pen1,p1);
    pictureBox1.Image := bmp;
    pen1.Color:=pen2.color;
    p1 := pictureBox1.PointToClient(System.Windows.Forms.Cursor.Position);
    c.drawend(pen1,p1,sb);
    pictureBox1.Image := bmp;
    prov1 := false;
  end;
end;

procedure Form1.pictureBox1_MouseMove(sender: Object; e: MouseEventArgs);
begin
  if prov then begin
    pen1.Color := SystemColors.Control;
    rect1.draw(pen1,p1);
    pictureBox1.Image := bmp;
    p1 := pictureBox1.PointToClient(System.Windows.Forms.Cursor.Position);
    pen1.Color := color.black;
    rect1.draw(pen1,p1);
    pictureBox1.Image := bmp;
  end
  else if prov1 then begin
    pen1.Color := SystemColors.Control;
    c.draw(pen1,p1);
    pictureBox1.Image := bmp;
    pen1.Color := color.black;
    p1 := pictureBox1.PointToClient(System.Windows.Forms.Cursor.Position);
    c.draw(pen1,p1);
    pictureBox1.Image := bmp;
  end;
end;

procedure Form1.pictureBox1_MouseDown(sender: Object; e: MouseEventArgs);
begin
  if (e.Button = System.Windows.Forms.MouseButtons.Right) then begin
    p := pictureBox1.PointToClient(System.Windows.Forms.Cursor.Position);
    graph := Graphics.fromimage(bmp);
    pen1 := new Pen(color.black);
    p1 := p;
    pictureBox1.Image := bmp;
    prov := true;
    rect1:=new rect;
    rect1.init(p,graph,alpha);
  end
  else if (e.Button = System.Windows.Forms.MouseButtons.Left) then begin
    p := pictureBox1.PointToClient(System.Windows.Forms.Cursor.Position);
    graph := Graphics.fromimage(bmp);
    pen1 := new Pen(color.black);
    p1 := p;
    pictureBox1.Image := bmp;
    prov1 := true;
    c:=new circle;
    c.init(p.x,p.y,graph);
  end;
end;

procedure Form1.button1_Click(sender: Object; e: EventArgs);
begin
  if (textbox1.Text = '') then exit;
    alpha:=strtofloat(textbox1.Text);
  textbox1.Text := '';
end;

procedure Form1.radioButton1_Click(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.radioButton2_CheckedChanged(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.radioButton1_CheckedChanged(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.radioButton3_CheckedChanged(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.button2_Click(sender: Object; e: EventArgs);
begin
  colordialog1.ShowDialog();
  pen2.color:=colordialog1.Color;
  sb.Color:=colordialog1.Color;
end;

end.
