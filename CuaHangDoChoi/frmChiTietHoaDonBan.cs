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
using DataAccessLayer;
using BusinessLogicLayer;

namespace CuaHangDoChoi
{
    public partial class frmChiTietHoaDonBan : Form
    {
        bool Them = false;
        DBHoaDonBan hdbbusiness = new DBHoaDonBan();
        DBChiTietHoaDonBan cthdbbusiness = new DBChiTietHoaDonBan();
        public frmChiTietHoaDonBan()
        {
            InitializeComponent();
        }

        private void frmChiTietHoaDonBan_Load(object sender, EventArgs e)
        {
            LoadChiTietHoaDonBan();
            LoadHoaDonBan();
        }

        void LoadChiTietHoaDonBan()
        {
            try
            {
                // Đưa dữ liệu lên DataGridView  
                this.dgvDanhSachChiTietHoaDonBan.DataSource = cthdbbusiness.LayChiTietHoaDonBan().Tables[0];

                // Thay đổi độ rộng cột 
                this.dgvDanhSachChiTietHoaDonBan.AutoResizeColumns();
                // Đặt tên cột
                dgvDanhSachChiTietHoaDonBan.Columns[0].HeaderText = "Mã bán";
                dgvDanhSachChiTietHoaDonBan.Columns[1].HeaderText = "Mã hóa đơn bán";
                dgvDanhSachChiTietHoaDonBan.Columns[2].HeaderText = "Mã đồ chơi";
                dgvDanhSachChiTietHoaDonBan.Columns[3].HeaderText = "Giá bán";

                // Xóa trống các đối tượng trong Panel 
                this.txtGiaBan.ResetText();
                this.txtMaBan.ResetText();
                this.txtMaHoaDonBan.ResetText();
                this.txtNgayBan.ResetText();
                this.txtMaDoChoi.ResetText();
                this.txtMaNhanVien.ResetText();
                this.panel.ResetText();

                // Không cho thao tác trên các nút Lưu / Hủy 
                this.btnLuu.Enabled = false;
                this.btnHuyBo.Enabled = false;
                this.panel.Enabled = false;
                // Cho thao tác trên các nút Thêm / Sửa / Xóa /Thoát 
                this.btnThem.Enabled = true;
                this.btnCapNhat.Enabled = true;
                this.btnXoa.Enabled = true;
                this.btnTroVe.Enabled = true;
                //
                dgvDanhSachChiTietHoaDonBan_CellClick(null, null);
            }
            catch (SqlException)
            {
                MessageBox.Show("Không lấy được nội dung đồ chơi. Đã xảy ra lỗi!");
            }
        }

        void LoadHoaDonBan()
        {
            try
            {
                // Đưa dữ liệu lên DataGridView  
                dgvDanhSachHoaDonBan.DataSource = hdbbusiness.LayHoaDonBan().Tables[0];

                // Thay đổi độ rộng cột 
                dgvDanhSachHoaDonBan.AutoResizeColumns();

                // Đặt tên cột
                dgvDanhSachHoaDonBan.Columns[0].HeaderText = "Mã hóa đơn bán";
                dgvDanhSachHoaDonBan.Columns[1].HeaderText = "Ngày bán";
                dgvDanhSachHoaDonBan.Columns[2].HeaderText = "Mã nhân viên";

                // Sự kiện click chuột
                dgvDanhSachHoaDonBan_CellClick(null, null);
            }
            catch (SqlException)
            {
                MessageBox.Show("Không lấy được nội dung hóa đơn nhập. Đã xảy ra lỗi!");
            }
        }

        // Nút trở về
        private void btnTroVe_Click(object sender, EventArgs e)
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

        private void dgvDanhSachChiTietHoaDonBan_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {   //khi click record trong dgvCTDV thì thông tin sẽ đc đưa lên các textbox và combobox
                int r = dgvDanhSachChiTietHoaDonBan.CurrentCell.RowIndex;
                //hiển thị 
                this.txtMaBan.Text = dgvDanhSachChiTietHoaDonBan.Rows[r].Cells[0].Value.ToString();
                this.txtMaHoaDonBan.Text = dgvDanhSachChiTietHoaDonBan.Rows[r].Cells[1].Value.ToString();
                this.txtMaDoChoi.Text = dgvDanhSachChiTietHoaDonBan.Rows[r].Cells[2].Value.ToString();
                this.txtGiaBan.Text = dgvDanhSachChiTietHoaDonBan.Rows[r].Cells[3].Value.ToString();
            }
            catch   //TH click row ko có data
            {
                this.txtMaBan.ResetText();
                this.txtMaHoaDonBan.ResetText();
                this.txtMaDoChoi.ResetText();
                this.txtGiaBan.ResetText();
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            // Kich hoạt biến Them 
            Them = true;

            // Xóa trống các đối tượng trong Panel 
            this.panel.ResetText();
            this.panel.Enabled = true;


            //this.dtp.ResetText();
            this.txtMaNhanVien.ResetText();
            this.txtGiaBan.ResetText();
            this.txtMaDoChoi.ResetText();
            this.txtMaBan.ResetText();
            this.txtMaHoaDonBan.ResetText();
            this.txtNgayBan.ResetText();

            // Cho thao tác trên các nút Lưu  
            this.btnLuu.Enabled = true;

            // Không cho thao tác trên các nút Thêm / Trở về 
            this.btnThem.Enabled = false;
            this.btnTroVe.Enabled = false;
            this.btnHuyBo.Enabled = true;
            this.btnXoa.Enabled = false;
            // Đưa con trỏ đến TextField txtMaLoaiDoChoi
            this.txtMaBan.Focus();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            bool kq = false;
            string err = "";
            try
            {
                // Lấy thứ tự record hiện hành 
                int r = dgvDanhSachChiTietHoaDonBan.CurrentCell.RowIndex;
                // Lấy MaDoChoi của record hiện hành 
                string strMaBan =
                dgvDanhSachChiTietHoaDonBan.Rows[r].Cells[0].Value.ToString();
                // Hiện thông báo xác nhận việc xóa mẫu tin 
                // Khai báo biến traloi 
                DialogResult traloi;
                // Hiện hộp thoại hỏi đáp 
                traloi = MessageBox.Show("Bạn có chắc muốn xoá chi tiết hóa đơn bán này không?", "Trả lời",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                // Kiểm tra có nhắp chọn nút Ok không? 
                if (traloi == DialogResult.Yes)
                {
                    // Thực hiện câu lệnh SQL 
                    kq = cthdbbusiness.XoaChiTietHoaDonBan(ref err, txtMaBan.Text);
                    if (kq)
                    {
                        // Cập nhật lại DataGridView 
                        LoadChiTietHoaDonBan();
                        // Thông báo 
                        MessageBox.Show("Đã xóa thành công!");
                    }
                }
                else
                {

                    // Thông báo 
                    MessageBox.Show("Huỷ bỏ việc xoá chi tiết hóa đơn bán này!");
                }
            }
            catch (SqlException)
            {
                MessageBox.Show("Không xóa được chi tiết hóa đơn bán này. Lỗi rồi!");
            }
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            // Kích hoạt biến Sửa 
            Them = false;
            // Cho phép thao tác trên Panel 
            this.panel.Enabled = true;
            dgvDanhSachChiTietHoaDonBan_CellClick(null, null);
            // Cho thao tác trên các nút Lưu / Hủy / Panel 
            this.btnLuu.Enabled = true;
            this.btnHuyBo.Enabled = true;
            this.panel.Enabled = true;
            // Không cho thao tác trên các nút Thêm / Xóa / Thoát 
            this.btnThem.Enabled = false;
            this.btnCapNhat.Enabled = false;
            this.btnXoa.Enabled = false;
            this.btnTroVe.Enabled = false;
            // Đưa con trỏ đến TextField txtMaBan
            this.txtMaBan.Enabled = false;
            this.txtMaHoaDonBan.Focus();
        }

        private void btnHuyBo_Click(object sender, EventArgs e)
        {
            // Xóa trống các đối tượng 
            this.txtMaHoaDonBan.ResetText();
            this.txtMaDoChoi.ResetText();
            this.txtGiaBan.ResetText();
            this.txtMaNhanVien.ResetText();
            this.txtNgayBan.ResetText();
            this.txtMaBan.ResetText();

            this.panel.ResetText();

            // Cho thao tác trên các nút Thêm / Sửa / Xóa / Thoát / Reload
            this.btnThem.Enabled = true;
            this.btnCapNhat.Enabled = true;
            this.btnXoa.Enabled = true;
            this.btnTroVe.Enabled = true;
            this.btnReLoad.Enabled = true;
            // Không cho thao tác trên các nút Lưu / Hủy / Panel 
            this.btnLuu.Enabled = false;
            this.btnHuyBo.Enabled = false;
            this.panel.Enabled = false;
            dgvDanhSachChiTietHoaDonBan_CellClick(null, null);
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            bool kq = false;
            string err = "";
            // Thêm dữ liệu 
            if (Them)
            {
                try
                {
                    kq = cthdbbusiness.ThemChiTietHoaDonBan(ref err, txtMaBan.Text, txtMaHoaDonBan.Text, txtMaDoChoi.Text, txtGiaBan.Text);
                    if (kq)
                    {
                        // Load lại dữ liệu trên DataGridView 
                        LoadChiTietHoaDonBan();
                        // Thông báo 
                        MessageBox.Show("Đã thêm chi tiết hóa đơn bán thành công!");
                    }

                }
                catch (SqlException)
                {
                    err = "Không thêm được chi tiết hóa đơn bán. Lỗi rồi!";
                    MessageBox.Show(err);
                }
            }
            else
            {
                kq = false;
                // Thứ tự dòng hiện hành 
                int r = dgvDanhSachChiTietHoaDonBan.CurrentCell.RowIndex;
                // MaChiTietHoaDonBan hiện hành 
                string strMaBan =
                dgvDanhSachChiTietHoaDonBan.Rows[r].Cells[0].Value.ToString();
                // Câu lệnh SQL 
                kq = cthdbbusiness.CapNhatChiTietHoaDonBan(ref err, txtMaBan.Text, txtMaHoaDonBan.Text, txtMaDoChoi.Text, txtGiaBan.Text);
                if (kq)
                {
                    // Load lại dữ liệu trên DataGridView 
                    LoadChiTietHoaDonBan();
                    // Thông báo 
                    MessageBox.Show("Đã cập nhật xong!");
                }
            }
        }

        private void btnReLoad_Click(object sender, EventArgs e)
        {
            LoadChiTietHoaDonBan();
            LoadHoaDonBan();
        }

        private void dgvDanhSachHoaDonBan_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                // Thứ tự dòng hiện hành 
                int r = dgvDanhSachHoaDonBan.CurrentCell.RowIndex;
                // Chuyển thông tin lên panel 
                this.txtMaHoaDonBan.Text = dgvDanhSachHoaDonBan.Rows[r].Cells[0].Value.ToString();
                this.txtNgayBan.Text = dgvDanhSachHoaDonBan.Rows[r].Cells[1].Value.ToString();
                this.txtMaNhanVien.Text = dgvDanhSachHoaDonBan.Rows[r].Cells[2].Value.ToString();
            }
            catch
            {
                this.txtMaHoaDonBan.ResetText();
                this.txtNgayBan.ResetText();
                this.txtMaNhanVien.ResetText();
            }
        }
    }
}
