using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using DataAccessLayer;
using BusinessLogicLayer;

namespace CuaHangDoChoi
{
    public partial class frmHoaDonNhap : Form
    {
        bool Them = false;
        DBHoaDonNhap hdnbusiness = new DBHoaDonNhap();

        public frmHoaDonNhap()
        {
            InitializeComponent();
        }

        private void frmHoaDonNhap_Load(object sender, EventArgs e)
        {
            LoadHoaDonNhap();
        }

        void LoadHoaDonNhap()
        {
            try
            {
                // Đưa dữ liệu lên DataGridView  
                dgvDanhSachHoaDonNhap.DataSource = hdnbusiness.LayHoaDonNhap().Tables[0];

                // Thay đổi độ rộng cột 
                dgvDanhSachHoaDonNhap.AutoResizeColumns();

                // Xóa trống các đối tượng trong Panel 
                this.txtMaHoaDonNhap.ResetText();
                this.txtMaNhanVien.ResetText();
                this.txtNgayNhap.ResetText();

                //this.dtp.ResetText();
                //this.panel.ResetText();

                // Không cho thao tác trên các nút Lưu / Hủy 
                this.btnLuu.Enabled = false;
                this.btnHuyBo.Enabled = false;
                this.panel.Enabled = false;
                // Cho thao tác trên các nút Thêm / Sửa / Xóa /Thoát 
                this.btnThem.Enabled = true;
                this.btnCapNhat.Enabled = true;
                this.btnTroVe.Enabled = true;

                // Đặt tên cột
                dgvDanhSachHoaDonNhap.Columns[0].HeaderText = "Mã hóa đơn nhập";
                dgvDanhSachHoaDonNhap.Columns[1].HeaderText = "Ngày nhập";
                dgvDanhSachHoaDonNhap.Columns[2].HeaderText = "Mã nhân viên";

                // Sự kiện click chuột
                dgvDanhSachHoaDonNhap_CellClick(null, null);
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

        private void btnThem_Click(object sender, EventArgs e)
        {
            // Kich hoạt biến Them 
            Them = true;

            // Xóa trống các đối tượng trong Panel 
            this.panel.ResetText();
            this.panel.Enabled = true;


            //this.dtp.ResetText();
            this.txtMaHoaDonNhap.ResetText();
            this.txtNgayNhap.ResetText();
            this.txtMaNhanVien.ResetText();

            // Cho thao tác trên các nút Lưu  
            this.btnLuu.Enabled = true;

            // Không cho thao tác trên các nút Thêm / Trở về 
            this.btnThem.Enabled = false;
            this.btnTroVe.Enabled = false;
            // Đưa con trỏ đến TextField txtMaNhanVien
            this.txtMaHoaDonNhap.Focus();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            bool kq = false;
            string err = "";
            try
            {
                // Lấy thứ tự record hiện hành 
                int r = dgvDanhSachHoaDonNhap.CurrentCell.RowIndex;
                // Lấy MaLoaiDoChoi của record hiện hành 
                string strMaHoaDonNhap =
                dgvDanhSachHoaDonNhap.Rows[r].Cells[0].Value.ToString();
                // Hiện thông báo xác nhận việc xóa mẫu tin 
                // Khai báo biến traloi 
                DialogResult traloi;
                // Hiện hộp thoại hỏi đáp 
                traloi = MessageBox.Show("Bạn có chắc muốn xoá loại hóa đơn nhập này không?", "Trả lời",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                // Kiểm tra có nhắp chọn nút Ok không? 
                if (traloi == DialogResult.Yes)
                {
                    // Thực hiện câu lệnh SQL 
                    kq = hdnbusiness.XoaHoaDonNhap(ref err, txtMaHoaDonNhap.Text);
                    if (kq)
                    {
                        // Cập nhật lại DataGridView 
                        LoadHoaDonNhap();
                        // Thông báo 
                        MessageBox.Show("Đã xóa thành công!");
                    }
                }
                else
                {

                    // Thông báo 
                    MessageBox.Show("Huỷ bỏ việc xoá hóa đơn nhập này!");
                }
            }
            catch (SqlException)
            {
                MessageBox.Show("Không xóa được hóa đơn nhập này. Lỗi rồi!");
            }
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            // Kích hoạt biến Sửa 
            Them = false;
            // Cho phép thao tác trên Panel 
            this.panel.Enabled = true;
            dgvDanhSachHoaDonNhap_CellClick(null, null);
            // Cho thao tác trên các nút Lưu / Hủy / Panel 
            this.btnLuu.Enabled = true;
            this.btnHuyBo.Enabled = true;
            this.panel.Enabled = true;
            // Không cho thao tác trên các nút Thêm / Xóa / Thoát 
            this.btnThem.Enabled = false;
            this.btnCapNhat.Enabled = false;
            this.btnXoa.Enabled = false;
            this.btnTroVe.Enabled = false;
            this.btnReLoad.Enabled = false;

            // Đưa con trỏ đến TextField txtNgayNhap 
            this.txtMaHoaDonNhap.Enabled = false;
            this.txtNgayNhap.Focus();
        }

        private void btnHuyBo_Click(object sender, EventArgs e)
        {
            // Xóa trống các đối tượng 
            this.txtMaHoaDonNhap.ResetText();
            this.txtMaNhanVien.ResetText();
            this.txtNgayNhap.ResetText();
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
            dgvDanhSachHoaDonNhap_CellClick(null, null);
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
                    kq = hdnbusiness.ThemHoaDonNhap(ref err, txtMaHoaDonNhap.Text, txtNgayNhap.Text, txtMaNhanVien.Text);
                    if (kq)
                    {
                        // Load lại dữ liệu trên DataGridView 
                        LoadHoaDonNhap();
                        // Thông báo 
                        MessageBox.Show("Đã thêm hóa đơn nhập thành công!");
                    }

                }
                catch (SqlException)
                {
                    err = "Không thêm được hóa đơn nhập này. Lỗi rồi!";
                    MessageBox.Show(err);
                }
            }
            else
            {
                kq = false;
                // Thứ tự dòng hiện hành 
                int r = dgvDanhSachHoaDonNhap.CurrentCell.RowIndex;
                // MaHoaDonNhap hiện hành 
                string strMaHoaDonNhap =
                dgvDanhSachHoaDonNhap.Rows[r].Cells[0].Value.ToString();
                // Câu lệnh SQL 
                kq = hdnbusiness.CapNhatHoaDonNhap(ref err, txtMaHoaDonNhap.Text, txtNgayNhap.Text, txtMaNhanVien.Text);
                if (kq)
                {
                    // Load lại dữ liệu trên DataGridView 
                    LoadHoaDonNhap();
                    // Thông báo 
                    MessageBox.Show("Đã cập nhật xong!");
                }
            }
        }

        private void btnReLoad_Click(object sender, EventArgs e)
        {
            LoadHoaDonNhap();
        }

        private void dgvDanhSachHoaDonNhap_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            // Thứ tự dòng hiện hành 
            int r = dgvDanhSachHoaDonNhap.CurrentCell.RowIndex;
            // Chuyển thông tin lên panel 
            this.txtMaHoaDonNhap.Text = dgvDanhSachHoaDonNhap.Rows[r].Cells[0].Value.ToString();
            this.txtNgayNhap.Text = dgvDanhSachHoaDonNhap.Rows[r].Cells[1].Value.ToString();
            this.txtMaNhanVien.Text = dgvDanhSachHoaDonNhap.Rows[r].Cells[2].Value.ToString();
        }
    }
}
