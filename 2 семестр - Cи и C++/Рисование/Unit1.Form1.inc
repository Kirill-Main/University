procedure InitializeComponent;
    begin
        self.pictureBox1 := new System.Windows.Forms.PictureBox();
        self.label1 := new System.Windows.Forms.Label();
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
        self.label1.Size := new System.Drawing.Size(186, 105);
        self.label1.TabIndex := 4;
        self.label1.Text := 'Нажмите на левую кнопку нарисуете прямоугольник, на правую - круг';
        // 
        // Form1
        // 
        self.ClientSize := new System.Drawing.Size(869, 509);
        self.Controls.Add(self.label1);
        self.Controls.Add(self.pictureBox1);
        self.Name := 'Form1';
        self.Text := 'Прмоугольники и круги';
        (System.ComponentModel.ISupportInitialize(self.pictureBox1)).EndInit();
        self.ResumeLayout(false);
    end;
