procedure InitializeComponent;
    begin
        self.pictureBox1 := new System.Windows.Forms.PictureBox();
        self.textBox1 := new System.Windows.Forms.TextBox();
        self.label1 := new System.Windows.Forms.Label();
        self.button1 := new System.Windows.Forms.Button();
        self.label2 := new System.Windows.Forms.Label();
        self.textBox2 := new System.Windows.Forms.TextBox();
        self.button2 := new System.Windows.Forms.Button();
        (System.ComponentModel.ISupportInitialize(self.pictureBox1)).BeginInit();
        self.SuspendLayout();
        // 
        // pictureBox1
        // 
        self.pictureBox1.BorderStyle := System.Windows.Forms.BorderStyle.FixedSingle;
        self.pictureBox1.Location := new System.Drawing.Point(12, 12);
        self.pictureBox1.Name := 'pictureBox1';
        self.pictureBox1.Size := new System.Drawing.Size(723, 522);
        self.pictureBox1.TabIndex := 0;
        self.pictureBox1.TabStop := false;
        self.pictureBox1.MouseClick += pictureBox1_MouseClick;
        // 
        // textBox1
        // 
        self.textBox1.Location := new System.Drawing.Point(784, 70);
        self.textBox1.Name := 'textBox1';
        self.textBox1.Size := new System.Drawing.Size(100, 20);
        self.textBox1.TabIndex := 1;
        // 
        // label1
        // 
        self.label1.Location := new System.Drawing.Point(763, 30);
        self.label1.Name := 'label1';
        self.label1.Size := new System.Drawing.Size(143, 23);
        self.label1.TabIndex := 2;
        self.label1.Text := 'Введите размер квадрата';
        // 
        // button1
        // 
        self.button1.Location := new System.Drawing.Point(798, 110);
        self.button1.Name := 'button1';
        self.button1.Size := new System.Drawing.Size(75, 23);
        self.button1.TabIndex := 3;
        self.button1.Text := 'Ввод';
        self.button1.UseVisualStyleBackColor := true;
        self.button1.Click += button1_Click;
        // 
        // label2
        // 
        self.label2.Location := new System.Drawing.Point(763, 176);
        self.label2.Name := 'label2';
        self.label2.Size := new System.Drawing.Size(143, 23);
        self.label2.TabIndex := 4;
        self.label2.Text := 'Введите размер окна в %';
        // 
        // textBox2
        // 
        self.textBox2.Location := new System.Drawing.Point(784, 218);
        self.textBox2.Name := 'textBox2';
        self.textBox2.Size := new System.Drawing.Size(100, 20);
        self.textBox2.TabIndex := 5;
        // 
        // button2
        // 
        self.button2.Location := new System.Drawing.Point(798, 264);
        self.button2.Name := 'button2';
        self.button2.Size := new System.Drawing.Size(75, 23);
        self.button2.TabIndex := 6;
        self.button2.Text := 'Ввод';
        self.button2.UseVisualStyleBackColor := true;
        self.button2.Click += button2_Click;
        // 
        // Form1
        // 
        self.ClientSize := new System.Drawing.Size(939, 552);
        self.Controls.Add(self.button2);
        self.Controls.Add(self.textBox2);
        self.Controls.Add(self.label2);
        self.Controls.Add(self.button1);
        self.Controls.Add(self.label1);
        self.Controls.Add(self.textBox1);
        self.Controls.Add(self.pictureBox1);
        self.Name := 'Form1';
        self.Text := 'Графический редактор';
        (System.ComponentModel.ISupportInitialize(self.pictureBox1)).EndInit();
        self.ResumeLayout(false);
        self.PerformLayout();
    end;
