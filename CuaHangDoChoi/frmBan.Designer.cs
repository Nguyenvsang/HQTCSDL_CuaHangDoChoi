namespace CuaHangDoChoi
{
    partial class frmBan
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmBan));
            this.btnCTHDB = new System.Windows.Forms.Button();
            this.btnHoaDonBan = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnCTHDB
            // 
            this.btnCTHDB.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(177)))), ((int)(((byte)(106)))));
            this.btnCTHDB.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btnCTHDB.FlatAppearance.BorderSize = 0;
            this.btnCTHDB.FlatAppearance.MouseDownBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(230)))), ((int)(((byte)(237)))), ((int)(((byte)(183)))));
            this.btnCTHDB.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCTHDB.Font = new System.Drawing.Font("Constantia", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCTHDB.ForeColor = System.Drawing.Color.White;
            this.btnCTHDB.Image = global::CuaHangDoChoi.Properties.Resources.Detail;
            this.btnCTHDB.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCTHDB.Location = new System.Drawing.Point(0, 66);
            this.btnCTHDB.Margin = new System.Windows.Forms.Padding(4);
            this.btnCTHDB.Name = "btnCTHDB";
            this.btnCTHDB.Size = new System.Drawing.Size(293, 73);
            this.btnCTHDB.TabIndex = 3;
            this.btnCTHDB.Text = "Chi tiết ";
            this.btnCTHDB.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCTHDB.UseVisualStyleBackColor = false;
            this.btnCTHDB.Click += new System.EventHandler(this.btnCTHDB_Click);
            // 
            // btnHoaDonBan
            // 
            this.btnHoaDonBan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(177)))), ((int)(((byte)(106)))));
            this.btnHoaDonBan.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btnHoaDonBan.FlatAppearance.BorderSize = 0;
            this.btnHoaDonBan.FlatAppearance.MouseDownBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(230)))), ((int)(((byte)(237)))), ((int)(((byte)(183)))));
            this.btnHoaDonBan.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnHoaDonBan.Font = new System.Drawing.Font("Constantia", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnHoaDonBan.ForeColor = System.Drawing.Color.White;
            this.btnHoaDonBan.Image = global::CuaHangDoChoi.Properties.Resources.Sell;
            this.btnHoaDonBan.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnHoaDonBan.Location = new System.Drawing.Point(0, 0);
            this.btnHoaDonBan.Margin = new System.Windows.Forms.Padding(4, 9, 9, 4);
            this.btnHoaDonBan.Name = "btnHoaDonBan";
            this.btnHoaDonBan.Size = new System.Drawing.Size(293, 66);
            this.btnHoaDonBan.TabIndex = 2;
            this.btnHoaDonBan.Text = "Hoá đơn bán";
            this.btnHoaDonBan.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnHoaDonBan.UseVisualStyleBackColor = false;
            this.btnHoaDonBan.Click += new System.EventHandler(this.btnHoaDonBan_Click);
            // 
            // frmBan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(293, 139);
            this.Controls.Add(this.btnCTHDB);
            this.Controls.Add(this.btnHoaDonBan);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmBan";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Danh mục hóa đơn bán";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnCTHDB;
        private System.Windows.Forms.Button btnHoaDonBan;
    }
}