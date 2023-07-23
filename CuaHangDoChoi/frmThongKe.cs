using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;
using DataAccessLayer;
using BusinessLogicLayer;

namespace CuaHangDoChoi
{
    public partial class frmThongKe : Form
    {
        DBThongKe tk = new DBThongKe();

        public frmThongKe()
        {
            InitializeComponent();
        }

        void LoadForm()
        {
            lblDTT.Text = tk.DoanhThuThang().ToString();
            lblLNT.Text = tk.LoiNhuanThang().ToString();
            lblTongDoanhThu.Text = tk.TongDoanhThu().ToString();
            lblTongLoiNhuan.Text = tk.TongLoiNhuan().ToString();

            dgvTienLoi.DataSource = tk.TienLoi().Tables[0];
            dgvTienLo.DataSource = tk.TienLo().Tables[0];

            dgvDoChoiBan.DataSource = tk.ThongKeDoChoiBanThangVuaQua().Tables[0];
            dgvDoChoiNhap.DataSource = tk.ThongKeDoChoiNhapThangVuaQua().Tables[0];

            // Combo box năm
            cbxNam.DataSource = tk.Nam().Tables[0];
            cbxNam.ValueMember = "Nam";

            // Loại đồ chơi bán chạy nhất
            dgvBanChayNhat.DataSource = tk.BanChayNhat().Tables[0];

            // Đồ thị cột - doanh thu lợi nhuận
            chrDoanhThu.DataSource = tk.DoanhThuLoiNhuan().Tables[0];
            chrDoanhThu.Series[0].XValueMember = "Thang";
            chrDoanhThu.Series[0].YValueMembers = "DoanhThu";
            chrDoanhThu.Series[1].XValueMember = "Thang";
            chrDoanhThu.Series[1].YValueMembers = "LoiNhuan";
            chrDoanhThu.ChartAreas[0].AxisX.MajorGrid.Enabled = false;
            chrDoanhThu.ChartAreas[0].AxisX.Interval = 1;
            chrDoanhThu.Series[0].ChartType = SeriesChartType.Column;
            chrDoanhThu.Series[1].ChartType = SeriesChartType.Column;
            chrDoanhThu.ChartAreas[0].AxisX.LabelStyle.Angle = -45;

            // Đồ thị doanh thu theo từng loại đồ chơi
            chrDoanhThuTheoLoai.DataSource = tk.TongDoanhThuLoaiDoChoi().Tables[0];
            chrDoanhThuTheoLoai.Series[0].XValueMember = "TenLoaiDoChoi";
            chrDoanhThuTheoLoai.Series[0].YValueMembers = "TongDoanhThu";
            Title t1 = new Title("Doanh thu theo loại", Docking.Top, new Font("Verdana", 10), Color.Black);
            chrDoanhThuTheoLoai.Titles.Add(t1);
            //chrDoanhThuTheoLoai.Series[0].Label = "#PERCENT{P0}";
            chrDoanhThuTheoLoai.Series[0]["PieLabelStyle"] = "Disabled";

            // Đồ thị chi phí nhập theo từng loại đồ chơi
            chrChiPhiNhapTheoLoai.DataSource = tk.TongChiPhiNhapLoaiDoChoi().Tables[0];
            chrChiPhiNhapTheoLoai.Series[0].XValueMember = "TenLoaiDoChoi";
            chrChiPhiNhapTheoLoai.Series[0].YValueMembers = "TongNhap";
            Title t2 = new Title("Chi phí nhập theo loại", Docking.Top, new Font("Verdana", 10), Color.Black);
            chrChiPhiNhapTheoLoai.Titles.Add(t2);
            //chrChiPhiNhapTheoLoai.Series[0].Label = "#PERCENT{P0}";
            chrChiPhiNhapTheoLoai.Series[0]["PieLabelStyle"] = "Disabled";

            pnTongQuan.Show();
            pnChiTiet.Hide();


        }
        private void btnDoanhThuNam_Click(object sender, EventArgs e)
        {
            lblNam.Text = tk.DoanhThuNam(cbxNam.Text).ToString();
        }

        private void frmThongKe_Load(object sender, EventArgs e)
        {
            LoadForm();
        }

        private void btLoiNhuanNam_Click(object sender, EventArgs e)
        {
            lblNam.Text = tk.LoiNhuanNam(cbxNam.Text).ToString();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            // Khai báo biến traloi 
            DialogResult traloi;
            // Hiện hộp thoại hỏi đáp 
            traloi = MessageBox.Show("Bạn có muốn trở về trang chủ?", "Trả lời",
                MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            // Kiểm tra có nhắp chọn nút Ok không? 
            if (traloi == DialogResult.OK)
                this.Close();
        }

        private void btnTongQuan_Click(object sender, EventArgs e)
        {
            pnTongQuan.Show();
            pnChiTiet.Hide();
        }

        private void btnChiTiet_Click(object sender, EventArgs e)
        {
            pnChiTiet.Show();
            pnTongQuan.Hide();
        }
    }
}
