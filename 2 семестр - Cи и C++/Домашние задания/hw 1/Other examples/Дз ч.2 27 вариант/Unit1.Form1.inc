procedure InitializeComponent;
    begin
        self.components := new System.ComponentModel.Container();
        self.pictureBox1 := new System.Windows.Forms.PictureBox();
        self.button1 := new System.Windows.Forms.Button();
        self.button2 := new System.Windows.Forms.Button();
        self.timer1 := new System.Windows.Forms.Timer(self.components);
        (System.ComponentModel.ISupportInitialize(self.pictureBox1)).BeginInit();
        self.SuspendLayout();
        // 
        // pictureBox1
        // 
        self.pictureBox1.BackColor := System.Drawing.Color.White;
        self.pictureBox1.BorderStyle := System.Windows.Forms.BorderStyle.FixedSingle;
        self.pictureBox1.Location := new System.Drawing.Point(13, 13);
        self.pictureBox1.Name := 'pictureBox1';
        self.pictureBox1.Size := new System.Drawing.Size(832, 487);
        self.pictureBox1.TabIndex := 0;
        self.pictureBox1.TabStop := false;
        // 
        // button1
        // 
        self.button1.Location := new System.Drawing.Point(303, 516);
        self.button1.Name := 'button1';
        self.button1.Size := new System.Drawing.Size(101, 37);
        self.button1.TabIndex := 1;
        self.button1.Text := 'Начать';
        self.button1.UseVisualStyleBackColor := true;
        self.button1.Click += button1_Click;
        // 
        // button2
        // 
        self.button2.Location := new System.Drawing.Point(468, 516);
        self.button2.Name := 'button2';
        self.button2.Size := new System.Drawing.Size(101, 37);
        self.button2.TabIndex := 2;
        self.button2.Text := 'Закончить';
        self.button2.UseVisualStyleBackColor := true;
        self.button2.Click += button2_Click;
        // 
        // timer1
        // 
        self.timer1.Tick += timer1_Tick;
        // 
        // Form1
        // 
        self.ClientSize := new System.Drawing.Size(857, 578);
        self.Controls.Add(self.button2);
        self.Controls.Add(self.button1);
        self.Controls.Add(self.pictureBox1);
        self.Name := 'Form1';
        self.Text := 'Полиморфное наследование';
        (System.ComponentModel.ISupportInitialize(self.pictureBox1)).EndInit();
        self.ResumeLayout(false);
    end;
