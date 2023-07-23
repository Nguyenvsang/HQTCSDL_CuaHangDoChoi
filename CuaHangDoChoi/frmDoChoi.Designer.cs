namespace CuaHangDoChoi
{
    partial class frmDoChoi
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmDoChoi));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.dgvDoChoi = new System.Windows.Forms.DataGridView();
            this.panel = new System.Windows.Forms.Panel();
            this.txtNhaSanXuat = new System.Windows.Forms.TextBox();
            this.cbxMaLoaiDoChoi = new System.Windows.Forms.ComboBox();
            this.txtTenLoaiDoChoi = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.txtMaNganKe = new System.Windows.Forms.TextBox();
            this.txtGiaTien = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtTenDoChoi = new System.Windows.Forms.TextBox();
            this.txtMaDoChoi = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.btnCapNhat = new System.Windows.Forms.Button();
            this.btnXoa = new System.Windows.Forms.Button();
            this.btnThem = new System.Windows.Forms.Button();
            this.btnTroVe = new System.Windows.Forms.Button();
            this.btnHuyBo = new System.Windows.Forms.Button();
            this.btnLuu = new System.Windows.Forms.Button();
            this.label7 = new System.Windows.Forms.Label();
            this.btnReLoad = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.dgvLoaiDoChoi = new System.Windows.Forms.DataGridView();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.txtThongTin = new System.Windows.Forms.TextBox();
            this.btnTimMa = new System.Windows.Forms.Button();
            this.btnTimTen = new System.Windows.Forms.Button();
            this.dgvThongTin = new System.Windows.Forms.DataGridView();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.dgvNhaSanXuat = new System.Windows.Forms.DataGridView();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.dgvNganKe = new System.Windows.Forms.DataGridView();
            this.label9 = new System.Windows.Forms.Label();
            this.btnDaBan = new System.Windows.Forms.Button();
            this.btnChuaBan = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDoChoi)).BeginInit();
            this.panel.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvLoaiDoChoi)).BeginInit();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvThongTin)).BeginInit();
            this.groupBox4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvNhaSanXuat)).BeginInit();
            this.groupBox5.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvNganKe)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.groupBox1.Controls.Add(this.dgvDoChoi);
            this.groupBox1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(10, 293);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(2);
            this.groupBox1.Size = new System.Drawing.Size(504, 184);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Danh sách đồ chơi";
            // 
            // dgvDoChoi
            // 
            this.dgvDoChoi.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvDoChoi.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDoChoi.Location = new System.Drawing.Point(11, 19);
            this.dgvDoChoi.Margin = new System.Windows.Forms.Padding(2);
            this.dgvDoChoi.Name = "dgvDoChoi";
            this.dgvDoChoi.RowHeadersWidth = 51;
            this.dgvDoChoi.RowTemplate.Height = 24;
            this.dgvDoChoi.Size = new System.Drawing.Size(483, 152);
            this.dgvDoChoi.TabIndex = 0;
            this.dgvDoChoi.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvDoChoi_CellClick);
            // 
            // panel
            // 
            this.panel.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel.Controls.Add(this.txtNhaSanXuat);
            this.panel.Controls.Add(this.cbxMaLoaiDoChoi);
            this.panel.Controls.Add(this.txtTenLoaiDoChoi);
            this.panel.Controls.Add(this.label8);
            this.panel.Controls.Add(this.txtMaNganKe);
            this.panel.Controls.Add(this.txtGiaTien);
            this.panel.Controls.Add(this.label6);
            this.panel.Controls.Add(this.label5);
            this.panel.Controls.Add(this.label4);
            this.panel.Controls.Add(this.label3);
            this.panel.Controls.Add(this.txtTenDoChoi);
            this.panel.Controls.Add(this.txtMaDoChoi);
            this.panel.Controls.Add(this.label2);
            this.panel.Controls.Add(this.label1);
            this.panel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel.Location = new System.Drawing.Point(9, 46);
            this.panel.Margin = new System.Windows.Forms.Padding(2);
            this.panel.Name = "panel";
            this.panel.Size = new System.Drawing.Size(504, 186);
            this.panel.TabIndex = 2;
            // 
            // txtNhaSanXuat
            // 
            this.txtNhaSanXuat.Location = new System.Drawing.Point(400, 103);
            this.txtNhaSanXuat.Margin = new System.Windows.Forms.Padding(2);
            this.txtNhaSanXuat.Name = "txtNhaSanXuat";
            this.txtNhaSanXuat.Size = new System.Drawing.Size(84, 23);
            this.txtNhaSanXuat.TabIndex = 15;
            // 
            // cbxMaLoaiDoChoi
            // 
            this.cbxMaLoaiDoChoi.FormattingEnabled = true;
            this.cbxMaLoaiDoChoi.Location = new System.Drawing.Point(400, 18);
            this.cbxMaLoaiDoChoi.Margin = new System.Windows.Forms.Padding(2);
            this.cbxMaLoaiDoChoi.Name = "cbxMaLoaiDoChoi";
            this.cbxMaLoaiDoChoi.Size = new System.Drawing.Size(84, 24);
            this.cbxMaLoaiDoChoi.TabIndex = 14;
            // 
            // txtTenLoaiDoChoi
            // 
            this.txtTenLoaiDoChoi.Location = new System.Drawing.Point(400, 60);
            this.txtTenLoaiDoChoi.Margin = new System.Windows.Forms.Padding(2);
            this.txtTenLoaiDoChoi.Name = "txtTenLoaiDoChoi";
            this.txtTenLoaiDoChoi.Size = new System.Drawing.Size(84, 23);
            this.txtTenLoaiDoChoi.TabIndex = 13;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(286, 63);
            this.label8.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(109, 17);
            this.label8.TabIndex = 12;
            this.label8.Text = "Tên loại đồ chơi";
            // 
            // txtMaNganKe
            // 
            this.txtMaNganKe.Location = new System.Drawing.Point(400, 144);
            this.txtMaNganKe.Margin = new System.Windows.Forms.Padding(2);
            this.txtMaNganKe.Name = "txtMaNganKe";
            this.txtMaNganKe.Size = new System.Drawing.Size(84, 23);
            this.txtMaNganKe.TabIndex = 11;
            // 
            // txtGiaTien
            // 
            this.txtGiaTien.Location = new System.Drawing.Point(86, 98);
            this.txtGiaTien.Margin = new System.Windows.Forms.Padding(2);
            this.txtGiaTien.Name = "txtGiaTien";
            this.txtGiaTien.Size = new System.Drawing.Size(135, 23);
            this.txtGiaTien.TabIndex = 8;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(286, 144);
            this.label6.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(82, 17);
            this.label6.TabIndex = 7;
            this.label6.Text = "Mã ngăn kệ";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(286, 103);
            this.label5.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(112, 17);
            this.label5.TabIndex = 6;
            this.label5.Text = "Mã nhà sản xuất";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(286, 18);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(103, 17);
            this.label4.TabIndex = 5;
            this.label4.Text = "Mã loại đồ chơi";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(2, 101);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(57, 17);
            this.label3.TabIndex = 4;
            this.label3.Text = "Giá tiền";
            // 
            // txtTenDoChoi
            // 
            this.txtTenDoChoi.Location = new System.Drawing.Point(86, 58);
            this.txtTenDoChoi.Margin = new System.Windows.Forms.Padding(2);
            this.txtTenDoChoi.Name = "txtTenDoChoi";
            this.txtTenDoChoi.Size = new System.Drawing.Size(196, 23);
            this.txtTenDoChoi.TabIndex = 3;
            // 
            // txtMaDoChoi
            // 
            this.txtMaDoChoi.Location = new System.Drawing.Point(86, 18);
            this.txtMaDoChoi.Margin = new System.Windows.Forms.Padding(2);
            this.txtMaDoChoi.Name = "txtMaDoChoi";
            this.txtMaDoChoi.Size = new System.Drawing.Size(86, 23);
            this.txtMaDoChoi.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(2, 61);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(83, 17);
            this.label2.TabIndex = 1;
            this.label2.Text = "Tên đồ chơi";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(2, 18);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(77, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Mã đồ chơi";
            // 
            // btnCapNhat
            // 
            this.btnCapNhat.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.btnCapNhat.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCapNhat.Location = new System.Drawing.Point(220, 245);
            this.btnCapNhat.Margin = new System.Windows.Forms.Padding(2);
            this.btnCapNhat.Name = "btnCapNhat";
            this.btnCapNhat.Size = new System.Drawing.Size(84, 35);
            this.btnCapNhat.TabIndex = 7;
            this.btnCapNhat.Text = "Cập nhật";
            this.btnCapNhat.UseVisualStyleBackColor = false;
            this.btnCapNhat.Click += new System.EventHandler(this.btnCapNhat_Click);
            // 
            // btnXoa
            // 
            this.btnXoa.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.btnXoa.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXoa.Location = new System.Drawing.Point(115, 245);
            this.btnXoa.Margin = new System.Windows.Forms.Padding(2);
            this.btnXoa.Name = "btnXoa";
            this.btnXoa.Size = new System.Drawing.Size(84, 35);
            this.btnXoa.TabIndex = 6;
            this.btnXoa.Text = "Xóa";
            this.btnXoa.UseVisualStyleBackColor = false;
            this.btnXoa.Click += new System.EventHandler(this.btnXoa_Click);
            // 
            // btnThem
            // 
            this.btnThem.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.btnThem.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThem.Location = new System.Drawing.Point(10, 245);
            this.btnThem.Margin = new System.Windows.Forms.Padding(2);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(84, 35);
            this.btnThem.TabIndex = 5;
            this.btnThem.Text = "Thêm";
            this.btnThem.UseVisualStyleBackColor = false;
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // btnTroVe
            // 
            this.btnTroVe.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.btnTroVe.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTroVe.Location = new System.Drawing.Point(810, 631);
            this.btnTroVe.Margin = new System.Windows.Forms.Padding(2);
            this.btnTroVe.Name = "btnTroVe";
            this.btnTroVe.Size = new System.Drawing.Size(69, 35);
            this.btnTroVe.TabIndex = 8;
            this.btnTroVe.Text = "Trở về";
            this.btnTroVe.UseVisualStyleBackColor = false;
            this.btnTroVe.Click += new System.EventHandler(this.btnTroVe_Click);
            // 
            // btnHuyBo
            // 
            this.btnHuyBo.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.btnHuyBo.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnHuyBo.Location = new System.Drawing.Point(327, 245);
            this.btnHuyBo.Margin = new System.Windows.Forms.Padding(2);
            this.btnHuyBo.Name = "btnHuyBo";
            this.btnHuyBo.Size = new System.Drawing.Size(84, 35);
            this.btnHuyBo.TabIndex = 9;
            this.btnHuyBo.Text = "Hủy bỏ";
            this.btnHuyBo.UseVisualStyleBackColor = false;
            this.btnHuyBo.Click += new System.EventHandler(this.btnHuyBo_Click);
            // 
            // btnLuu
            // 
            this.btnLuu.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.btnLuu.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLuu.Location = new System.Drawing.Point(430, 245);
            this.btnLuu.Margin = new System.Windows.Forms.Padding(2);
            this.btnLuu.Name = "btnLuu";
            this.btnLuu.Size = new System.Drawing.Size(84, 35);
            this.btnLuu.TabIndex = 10;
            this.btnLuu.Text = "Lưu";
            this.btnLuu.UseVisualStyleBackColor = false;
            this.btnLuu.Click += new System.EventHandler(this.btnLuu_Click);
            // 
            // label7
            // 
            this.label7.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.label7.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label7.Cursor = System.Windows.Forms.Cursors.AppStarting;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(8, 7);
            this.label7.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(506, 43);
            this.label7.TabIndex = 11;
            this.label7.Text = "Thông tin đồ chơi";
            this.label7.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // btnReLoad
            // 
            this.btnReLoad.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.btnReLoad.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReLoad.Location = new System.Drawing.Point(721, 631);
            this.btnReLoad.Margin = new System.Windows.Forms.Padding(2);
            this.btnReLoad.Name = "btnReLoad";
            this.btnReLoad.Size = new System.Drawing.Size(68, 35);
            this.btnReLoad.TabIndex = 12;
            this.btnReLoad.Text = "ReLoad";
            this.btnReLoad.UseVisualStyleBackColor = false;
            this.btnReLoad.Click += new System.EventHandler(this.btnReLoad_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.groupBox2.Controls.Add(this.dgvLoaiDoChoi);
            this.groupBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.Location = new System.Drawing.Point(530, 65);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(2);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(2);
            this.groupBox2.Size = new System.Drawing.Size(349, 180);
            this.groupBox2.TabIndex = 4;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Loại đồ chơi";
            // 
            // dgvLoaiDoChoi
            // 
            this.dgvLoaiDoChoi.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvLoaiDoChoi.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvLoaiDoChoi.Location = new System.Drawing.Point(10, 20);
            this.dgvLoaiDoChoi.Margin = new System.Windows.Forms.Padding(2);
            this.dgvLoaiDoChoi.Name = "dgvLoaiDoChoi";
            this.dgvLoaiDoChoi.RowHeadersWidth = 51;
            this.dgvLoaiDoChoi.RowTemplate.Height = 24;
            this.dgvLoaiDoChoi.Size = new System.Drawing.Size(326, 150);
            this.dgvLoaiDoChoi.TabIndex = 0;
            this.dgvLoaiDoChoi.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvLoaiDoChoi_CellClick);
            // 
            // groupBox3
            // 
            this.groupBox3.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.groupBox3.Controls.Add(this.txtThongTin);
            this.groupBox3.Controls.Add(this.btnTimMa);
            this.groupBox3.Controls.Add(this.btnTimTen);
            this.groupBox3.Controls.Add(this.dgvThongTin);
            this.groupBox3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox3.Location = new System.Drawing.Point(10, 488);
            this.groupBox3.Margin = new System.Windows.Forms.Padding(2);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Padding = new System.Windows.Forms.Padding(2);
            this.groupBox3.Size = new System.Drawing.Size(504, 178);
            this.groupBox3.TabIndex = 5;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Tìm kiếm thông tin";
            // 
            // txtThongTin
            // 
            this.txtThongTin.Font = new System.Drawing.Font("Microsoft Sans Serif", 12.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtThongTin.Location = new System.Drawing.Point(10, 135);
            this.txtThongTin.Name = "txtThongTin";
            this.txtThongTin.Size = new System.Drawing.Size(144, 27);
            this.txtThongTin.TabIndex = 18;
            // 
            // btnTimMa
            // 
            this.btnTimMa.BackColor = System.Drawing.Color.White;
            this.btnTimMa.FlatAppearance.BorderSize = 0;
            this.btnTimMa.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTimMa.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTimMa.Image = ((System.Drawing.Image)(resources.GetObject("btnTimMa.Image")));
            this.btnTimMa.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnTimMa.Location = new System.Drawing.Point(374, 134);
            this.btnTimMa.Name = "btnTimMa";
            this.btnTimMa.Size = new System.Drawing.Size(119, 28);
            this.btnTimMa.TabIndex = 17;
            this.btnTimMa.Text = "Mã";
            this.btnTimMa.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnTimMa.UseVisualStyleBackColor = false;
            this.btnTimMa.Click += new System.EventHandler(this.btnTimMa_Click);
            // 
            // btnTimTen
            // 
            this.btnTimTen.BackColor = System.Drawing.Color.White;
            this.btnTimTen.FlatAppearance.BorderSize = 0;
            this.btnTimTen.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTimTen.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTimTen.Image = ((System.Drawing.Image)(resources.GetObject("btnTimTen.Image")));
            this.btnTimTen.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnTimTen.Location = new System.Drawing.Point(203, 134);
            this.btnTimTen.Name = "btnTimTen";
            this.btnTimTen.Size = new System.Drawing.Size(119, 28);
            this.btnTimTen.TabIndex = 16;
            this.btnTimTen.Text = "Tên";
            this.btnTimTen.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnTimTen.UseVisualStyleBackColor = false;
            this.btnTimTen.Click += new System.EventHandler(this.btnTimTen_Click);
            // 
            // dgvThongTin
            // 
            this.dgvThongTin.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvThongTin.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvThongTin.Location = new System.Drawing.Point(10, 19);
            this.dgvThongTin.Margin = new System.Windows.Forms.Padding(2);
            this.dgvThongTin.Name = "dgvThongTin";
            this.dgvThongTin.RowHeadersWidth = 51;
            this.dgvThongTin.RowTemplate.Height = 24;
            this.dgvThongTin.Size = new System.Drawing.Size(483, 101);
            this.dgvThongTin.TabIndex = 0;
            // 
            // groupBox4
            // 
            this.groupBox4.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.groupBox4.Controls.Add(this.dgvNhaSanXuat);
            this.groupBox4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox4.Location = new System.Drawing.Point(530, 261);
            this.groupBox4.Margin = new System.Windows.Forms.Padding(2);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Padding = new System.Windows.Forms.Padding(2);
            this.groupBox4.Size = new System.Drawing.Size(349, 160);
            this.groupBox4.TabIndex = 5;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Nhà sản xuất";
            // 
            // dgvNhaSanXuat
            // 
            this.dgvNhaSanXuat.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvNhaSanXuat.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvNhaSanXuat.Location = new System.Drawing.Point(10, 19);
            this.dgvNhaSanXuat.Margin = new System.Windows.Forms.Padding(2);
            this.dgvNhaSanXuat.Name = "dgvNhaSanXuat";
            this.dgvNhaSanXuat.RowHeadersWidth = 51;
            this.dgvNhaSanXuat.RowTemplate.Height = 24;
            this.dgvNhaSanXuat.Size = new System.Drawing.Size(326, 130);
            this.dgvNhaSanXuat.TabIndex = 0;
            this.dgvNhaSanXuat.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvNhaSanXuat_CellClick);
            // 
            // groupBox5
            // 
            this.groupBox5.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.groupBox5.Controls.Add(this.dgvNganKe);
            this.groupBox5.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox5.Location = new System.Drawing.Point(530, 436);
            this.groupBox5.Margin = new System.Windows.Forms.Padding(2);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Padding = new System.Windows.Forms.Padding(2);
            this.groupBox5.Size = new System.Drawing.Size(349, 185);
            this.groupBox5.TabIndex = 6;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Ngăn kệ";
            // 
            // dgvNganKe
            // 
            this.dgvNganKe.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvNganKe.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvNganKe.Location = new System.Drawing.Point(10, 19);
            this.dgvNganKe.Margin = new System.Windows.Forms.Padding(2);
            this.dgvNganKe.Name = "dgvNganKe";
            this.dgvNganKe.RowHeadersWidth = 51;
            this.dgvNganKe.RowTemplate.Height = 24;
            this.dgvNganKe.Size = new System.Drawing.Size(326, 151);
            this.dgvNganKe.TabIndex = 0;
            this.dgvNganKe.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvNganKe_CellClick);
            // 
            // label9
            // 
            this.label9.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.label9.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label9.Cursor = System.Windows.Forms.Cursors.AppStarting;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(529, 7);
            this.label9.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(350, 43);
            this.label9.TabIndex = 13;
            this.label9.Text = "Thông tin liên quan";
            this.label9.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // btnDaBan
            // 
            this.btnDaBan.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.btnDaBan.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDaBan.Location = new System.Drawing.Point(529, 631);
            this.btnDaBan.Margin = new System.Windows.Forms.Padding(2);
            this.btnDaBan.Name = "btnDaBan";
            this.btnDaBan.Size = new System.Drawing.Size(66, 35);
            this.btnDaBan.TabIndex = 14;
            this.btnDaBan.Text = "Đã bán";
            this.btnDaBan.UseVisualStyleBackColor = false;
            this.btnDaBan.Click += new System.EventHandler(this.btnDaBan_Click);
            // 
            // btnChuaBan
            // 
            this.btnChuaBan.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.btnChuaBan.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnChuaBan.Location = new System.Drawing.Point(619, 631);
            this.btnChuaBan.Margin = new System.Windows.Forms.Padding(2);
            this.btnChuaBan.Name = "btnChuaBan";
            this.btnChuaBan.Size = new System.Drawing.Size(78, 35);
            this.btnChuaBan.TabIndex = 15;
            this.btnChuaBan.Text = "Chưa bán";
            this.btnChuaBan.UseVisualStyleBackColor = false;
            this.btnChuaBan.Click += new System.EventHandler(this.btnChuaBan_Click);
            // 
            // frmDoChoi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.AliceBlue;
            this.ClientSize = new System.Drawing.Size(892, 677);
            this.Controls.Add(this.btnChuaBan);
            this.Controls.Add(this.btnDaBan);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.btnReLoad);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.btnLuu);
            this.Controls.Add(this.btnHuyBo);
            this.Controls.Add(this.btnTroVe);
            this.Controls.Add(this.btnCapNhat);
            this.Controls.Add(this.btnXoa);
            this.Controls.Add(this.btnThem);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.panel);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "frmDoChoi";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Đồ chơi";
            this.Load += new System.EventHandler(this.frmDoChoi_Load);
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDoChoi)).EndInit();
            this.panel.ResumeLayout(false);
            this.panel.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvLoaiDoChoi)).EndInit();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvThongTin)).EndInit();
            this.groupBox4.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvNhaSanXuat)).EndInit();
            this.groupBox5.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvNganKe)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.DataGridView dgvDoChoi;
        private System.Windows.Forms.Panel panel;
        private System.Windows.Forms.TextBox txtTenDoChoi;
        private System.Windows.Forms.TextBox txtMaDoChoi;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtMaNganKe;
        private System.Windows.Forms.TextBox txtGiaTien;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnCapNhat;
        private System.Windows.Forms.Button btnXoa;
        private System.Windows.Forms.Button btnThem;
        private System.Windows.Forms.Button btnTroVe;
        private System.Windows.Forms.Button btnHuyBo;
        private System.Windows.Forms.Button btnLuu;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button btnReLoad;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.DataGridView dgvLoaiDoChoi;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.DataGridView dgvThongTin;
        private System.Windows.Forms.TextBox txtTenLoaiDoChoi;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.ComboBox cbxMaLoaiDoChoi;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.DataGridView dgvNhaSanXuat;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.DataGridView dgvNganKe;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtNhaSanXuat;
        private System.Windows.Forms.Button btnTimTen;
        private System.Windows.Forms.Button btnTimMa;
        private System.Windows.Forms.TextBox txtThongTin;
        private System.Windows.Forms.Button btnDaBan;
        private System.Windows.Forms.Button btnChuaBan;
    }
}