procedure InitializeComponent;
    begin
        self.components := new System.ComponentModel.Container();
        self.pictureBox1 := new System.Windows.Forms.PictureBox();
        self.timer1 := new System.Windows.Forms.Timer(self.components);
        self.button1 := new System.Windows.Forms.Button();
        self.button2 := new System.Windows.Forms.Button();
        (System.ComponentModel.ISupportInitialize(self.pictureBox1)).BeginInit();
        self.SuspendLayout();
        // 
        // pictureBox1
        // 
        self.pictureBox1.BackColor := System.Drawing.Color.White;
        self.pictureBox1.BorderStyle := System.Windows.Forms.BorderStyle.FixedSingle;
        self.pictureBox1.Location := new System.Drawing.Point(12, 12);
        self.pictureBox1.Name := 'pictureBox1';
        self.pictureBox1.Size := new System.Drawing.Size(973, 592);
        self.pictureBox1.TabIndex := 0;
        self.pictureBox1.TabStop := false;
        // 
        // timer1
        // 
        self.timer1.Interval := 50;
        self.timer1.Tick += timer1_Tick;
        // 
        // button1
        // 
        self.button1.Location := new System.Drawing.Point(364, 619);
        self.button1.Name := 'button1';
        self.button1.Size := new System.Drawing.Size(109, 33);
        self.button1.TabIndex := 1;
        self.button1.Text := 'Начать';
        self.button1.UseVisualStyleBackColor := true;
        self.button1.Click += button1_Click;
        // 
        // button2
        // 
        self.button2.Location := new System.Drawing.Point(522, 619);
        self.button2.Name := 'button2';
        self.button2.Size := new System.Drawing.Size(109, 33);
        self.button2.TabIndex := 2;
        self.button2.Text := 'Закончить';
        self.button2.UseVisualStyleBackColor := true;
        self.button2.Click += button2_Click;
        // 
        // Form1
        // 
        self.ClientSize := new System.Drawing.Size(997, 688);
        self.Controls.Add(self.button2);
        self.Controls.Add(self.button1);
        self.Controls.Add(self.pictureBox1);
        self.Name := 'Form1';
        self.Text := 'Полиморфное наследование';
        (System.ComponentModel.ISupportInitialize(self.pictureBox1)).EndInit();
        self.ResumeLayout(false);
    end;
