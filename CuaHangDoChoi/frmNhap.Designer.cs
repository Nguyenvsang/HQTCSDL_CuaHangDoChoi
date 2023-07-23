namespace CuaHangDoChoi
{
    partial class frmNhap
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmNhap));
            this.btnCTHDN = new System.Windows.Forms.Button();
            this.btnHoaDonNhap = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnCTHDN
            // 
            this.btnCTHDN.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(177)))), ((int)(((byte)(106)))));
            this.btnCTHDN.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btnCTHDN.FlatAppearance.BorderSize = 0;
            this.btnCTHDN.FlatAppearance.MouseDownBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(230)))), ((int)(((byte)(237)))), ((int)(((byte)(183)))));
            this.btnCTHDN.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCTHDN.Font = new System.Drawing.Font("Constantia", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCTHDN.ForeColor = System.Drawing.Color.White;
            this.btnCTHDN.Image = global::CuaHangDoChoi.Properties.Resources.Detail;
            this.btnCTHDN.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCTHDN.Location = new System.Drawing.Point(0, 66);
            this.btnCTHDN.Margin = new System.Windows.Forms.Padding(4);
            this.btnCTHDN.Name = "btnCTHDN";
            this.btnCTHDN.Size = new System.Drawing.Size(293, 73);
            this.btnCTHDN.TabIndex = 1;
            this.btnCTHDN.Text = "Chi tiết";
            this.btnCTHDN.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCTHDN.UseVisualStyleBackColor = false;
            this.btnCTHDN.Click += new System.EventHandler(this.btnCTHDN_Click);
            // 
            // btnHoaDonNhap
            // 
            this.btnHoaDonNhap.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(177)))), ((int)(((byte)(106)))));
            this.btnHoaDonNhap.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btnHoaDonNhap.FlatAppearance.BorderSize = 0;
            this.btnHoaDonNhap.FlatAppearance.MouseDownBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(230)))), ((int)(((byte)(237)))), ((int)(((byte)(183)))));
            this.btnHoaDonNhap.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnHoaDonNhap.Font = new System.Drawing.Font("Constantia", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnHoaDonNhap.ForeColor = System.Drawing.Color.White;
            this.btnHoaDonNhap.Image = global::CuaHangDoChoi.Properties.Resources.Import;
            this.btnHoaDonNhap.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnHoaDonNhap.Location = new System.Drawing.Point(0, 0);
            this.btnHoaDonNhap.Margin = new System.Windows.Forms.Padding(4, 9, 9, 4);
            this.btnHoaDonNhap.Name = "btnHoaDonNhap";
            this.btnHoaDonNhap.Size = new System.Drawing.Size(293, 66);
            this.btnHoaDonNhap.TabIndex = 0;
            this.btnHoaDonNhap.Text = "Hoá đơn nhập";
            this.btnHoaDonNhap.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnHoaDonNhap.UseVisualStyleBackColor = false;
            this.btnHoaDonNhap.Click += new System.EventHandler(this.btnHoaDonNhap_Click);
            // 
            // frmNhap
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(293, 139);
            this.Controls.Add(this.btnCTHDN);
            this.Controls.Add(this.btnHoaDonNhap);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmNhap";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Danh mục hóa đơn nhập";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnHoaDonNhap;
        private System.Windows.Forms.Button btnCTHDN;
    }
}