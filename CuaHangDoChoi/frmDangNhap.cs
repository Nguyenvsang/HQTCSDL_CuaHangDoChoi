using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DataAccessLayer;
using BusinessLogicLayer;
using System.Configuration;

namespace CuaHangDoChoi
{
    public partial class frmDangNhap : Form
    {
        DBTaiKhoan tk = new DBTaiKhoan();

        public frmDangNhap()
        {
            InitializeComponent();
        }
        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            lblThongBao.ResetText();
            string err = "Sai tên người dùng hoặc mật khẩu! Vui lòng nhập lại!";
            // Thông tin đăng nhập (Tên người dùng/ Mật khẩu)
            int check = tk.DangNhap(txtTenNguoiDung.Text.Trim(), txtMatKhau.Text.Trim());
            if (check == 1)
            {
                frmAdminHome ad = new frmAdminHome();
                ad.ShowDialog();
                txtTenNguoiDung.ResetText();
                txtMatKhau.Focus();
            }
            else if(check == 2)
            {
                frmUserHome usr = new frmUserHome();
                usr.ShowDialog();
                txtTenNguoiDung.ResetText();
                txtMatKhau.Focus();
            }
            else // không đúng thì xuất ra thông báo!
            {
                lblThongBao.Text = err;
                txtTenNguoiDung.ResetText();
                txtMatKhau.ResetText();
                txtTenNguoiDung.Focus();
            }
        }

        private void txtTenNguoiDung_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chuyển xuống nhập Mật khẩu
            if (e.KeyChar == 13)
                txtMatKhau.Focus();
        }

        private void formDangNhap_Load(object sender, EventArgs e)
        {
            txtTenNguoiDung.Clear();
            txtTenNguoiDung.Focus();
            txtMatKhau.Clear();
        }

        private void txtMatKhau_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Đăng nhập
            if (e.KeyChar == 13)
                btnDangNhap_Click(null, null);
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            // Xóa Tên người dùng và mật khẩu
            this.txtTenNguoiDung.Clear();
            this.txtMatKhau.Clear();
            this.txtTenNguoiDung.Focus();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            // Thoát khỏi FormDangNhap
            DialogResult traloi;
            traloi = MessageBox.Show("Bạn có chắc chắn muốn thoát không?", "Trả lời",
            MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (traloi == DialogResult.OK)
                Application.Exit();
        }
    }
}
