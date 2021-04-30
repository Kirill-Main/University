procedure InitializeComponent;
    begin
        self.pictureBox1 := new System.Windows.Forms.PictureBox();
        self.label1 := new System.Windows.Forms.Label();
        self.button1 := new System.Windows.Forms.Button();
        self.label2 := new System.Windows.Forms.Label();
        self.textBox1 := new System.Windows.Forms.TextBox();
        self.colorDialog1 := new System.Windows.Forms.ColorDialog();
        (System.ComponentModel.ISupportInitialize(self.pictureBox1)).BeginInit();
        self.SuspendLayout();
        // 
        // pictureBox1
        // 
        self.pictureBox1.BorderStyle := System.Windows.Forms.BorderStyle.FixedSingle;
        self.pictureBox1.Location := new System.Drawing.Point(12, 12);
        self.pictureBox1.Name := 'pictureBox1';
        self.pictureBox1.Size := new System.Drawing.Size(643, 451);
        self.pictureBox1.TabIndex := 3;
        self.pictureBox1.TabStop := false;
        self.pictureBox1.Click += pictureBox1_Click;
        self.pictureBox1.MouseDown += pictureBox1_MouseDown;
        self.pictureBox1.MouseMove += pictureBox1_MouseMove;
        self.pictureBox1.MouseUp += pictureBox1_MouseUp;
        // 
        // label1
        // 
        self.label1.Location := new System.Drawing.Point(671, 36);
        self.label1.Name := 'label1';
        self.label1.Size := new System.Drawing.Size(186, 56);
        self.label1.TabIndex := 4;
        self.label1.Text := 'Нажмете на левую кнопку и нарисуете прямоугольник, на правую - круг';
        // 
        // button1
        // 
        self.button1.Location := new System.Drawing.Point(691, 192);
        self.button1.Name := 'button1';
        self.button1.Size := new System.Drawing.Size(75, 23);
        self.button1.TabIndex := 5;
        self.button1.Text := 'Ввести';
        self.button1.UseVisualStyleBackColor := true;
        self.button1.Click += button1_Click;
        // 
        // label2
        // 
        self.label2.Location := new System.Drawing.Point(691, 128);
        self.label2.Name := 'label2';
        self.label2.Size := new System.Drawing.Size(100, 23);
        self.label2.TabIndex := 6;
        self.label2.Text := 'Введите угол';
        // 
        // textBox1
        // 
        self.textBox1.Location := new System.Drawing.Point(691, 154);
        self.textBox1.Name := 'textBox1';
        self.textBox1.Size := new System.Drawing.Size(100, 20);
        self.textBox1.TabIndex := 8;
        // 
        // Form1
        // 
        self.ClientSize := new System.Drawing.Size(869, 509);
        self.Controls.Add(self.textBox1);
        self.Controls.Add(self.label2);
        self.Controls.Add(self.button1);
        self.Controls.Add(self.label1);
        self.Controls.Add(self.pictureBox1);
        self.Name := 'Form1';
        self.Text := 'Рисование';
        (System.ComponentModel.ISupportInitialize(self.pictureBox1)).EndInit();
        self.ResumeLayout(false);
        self.PerformLayout();
    end;
