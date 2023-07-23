using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CuaHangDoChoi
{
    public partial class frmAdminHome : Form
    {
        public frmAdminHome()
        {
            InitializeComponent();
        }

        private void btnNhanVien_Click(object sender, EventArgs e)
        {
            frmNhanVien nv = new frmNhanVien();
            nv.ShowDialog();
        }

        private void btnDanhMuc_Click(object sender, EventArgs e)
        {
            frmDanhMucDoChoi dmdc = new frmDanhMucDoChoi();
            dmdc.ShowDialog();
        }

        private void btnDoChoi_Click(object sender, EventArgs e)
        {
            frmDoChoi dc = new frmDoChoi();
            dc.ShowDialog();
        }

        private void btnNganKe_Click(object sender, EventArgs e)
        {
            frmNganKe nk = new frmNganKe();
            nk.ShowDialog();
        }

        private void btnNhaSanXuat_Click(object sender, EventArgs e)
        {
            frmNhaSanXuat nsx = new frmNhaSanXuat();
            nsx.ShowDialog();
        }

        private void btnHoaDonNhap_Click(object sender, EventArgs e)
        {
            frmNhap n = new frmNhap();
            n.ShowDialog();
        }

        private void btnHoaDonBan_Click(object sender, EventArgs e)
        {
            frmBan b = new frmBan();
            b.ShowDialog();
        }

        private void btnThongKe_Click(object sender, EventArgs e)
        {
            frmThongKe tk = new frmThongKe();
            tk.ShowDialog();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            // Khai báo biến traloi 
            DialogResult traloi;
            // Hiện hộp thoại hỏi đáp 
            traloi = MessageBox.Show("Bạn có muốn thoát ứng dụng?", "Trả lời",
                MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            // Kiểm tra có nhắp chọn nút Ok không? 
            if (traloi == DialogResult.OK)
                Environment.Exit(0);

        }

        private void btnDangXuat_Click(object sender, EventArgs e)
        {
            // Khai báo biến traloi 
            DialogResult traloi;
            // Hiện hộp thoại hỏi đáp 
            traloi = MessageBox.Show("Bạn có muốn đăng xuất?", "Trả lời",
                MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            // Kiểm tra có nhắp chọn nút Ok không? 
            if (traloi == DialogResult.OK)
                this.Close();
        }

        private void btnThongTin_Click(object sender, EventArgs e)
        {
            frmThongTin tt = new frmThongTin();
            tt.ShowDialog();
        }

        private void btnTaiKhoan_Click(object sender, EventArgs e)
        {
            frmTaiKhoan tk = new frmTaiKhoan();
            tk.ShowDialog();
        }

        //private void btnTaiKhoan_Click(object sender, EventArgs e)
        //{
        //    frmTaiKhoan tk = new frmTaiKhoan();
        //    tk.ShowDialog();
        //}
    }
}
