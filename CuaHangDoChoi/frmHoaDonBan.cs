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
    public partial class frmHoaDonBan : Form
    {
        bool Them = false;
        DBHoaDonBan hdbbusiness = new DBHoaDonBan();

        public frmHoaDonBan()
        {
            InitializeComponent();
        }

        private void frmHoaDonBan_Load(object sender, EventArgs e)
        {
            LoadHoaDonBan();
        }

        void LoadHoaDonBan()
        {
            try
            {
                // Đưa dữ liệu lên DataGridView  
                dgvDanhSachHoaDonBan.DataSource = hdbbusiness.LayHoaDonBan().Tables[0];

                // Thay đổi độ rộng cột 
                dgvDanhSachHoaDonBan.AutoResizeColumns();

                // Xóa trống các đối tượng trong Panel 
                this.txtMaHoaDonBan.ResetText();
                this.txtNgayBan.ResetText();
                this.txtMaNhanVien.ResetText();

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

        private void btnThem_Click(object sender, EventArgs e)
        {
            // Kich hoạt biến Them 
            Them = true;

            // Xóa trống các đối tượng trong Panel 
            this.panel.ResetText();
            this.panel.Enabled = true;


            //this.dtp.ResetText();
            this.txtMaHoaDonBan.ResetText();
            this.txtNgayBan.ResetText();
            this.txtMaNhanVien.ResetText();

            // Cho thao tác trên các nút Lưu  
            this.btnLuu.Enabled = true;

            // Không cho thao tác trên các nút Thêm / Trở về 
            this.btnThem.Enabled = false;
            this.btnTroVe.Enabled = false;
            // Đưa con trỏ đến TextField txtMaNhanVien
            this.txtMaHoaDonBan.Focus();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            bool kq = false;
            string err = "";
            try
            {
                // Lấy thứ tự record hiện hành 
                int r = dgvDanhSachHoaDonBan.CurrentCell.RowIndex;
                // Lấy MaLoaiDoChoi của record hiện hành 
                string strMaHoaDonBan =
                dgvDanhSachHoaDonBan.Rows[r].Cells[0].Value.ToString();
                // Hiện thông báo xác nhận việc xóa mẫu tin 
                // Khai báo biến traloi 
                DialogResult traloi;
                // Hiện hộp thoại hỏi đáp 
                traloi = MessageBox.Show("Bạn có chắc muốn xoá loại hóa đơn bán này không?", "Trả lời",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                // Kiểm tra có nhắp chọn nút Ok không? 
                if (traloi == DialogResult.Yes)
                {
                    // Thực hiện câu lệnh SQL 
                    kq = hdbbusiness.XoaHoaDonBan(ref err, txtMaHoaDonBan.Text);
                    if (kq)
                    {
                        // Cập nhật lại DataGridView 
                        LoadHoaDonBan();
                        // Thông báo 
                        MessageBox.Show("Đã xóa thành công!");
                    }
                }
                else
                {

                    // Thông báo 
                    MessageBox.Show("Huỷ bỏ việc xoá hóa đơn bán này!");
                }
            }
            catch (SqlException)
            {
                MessageBox.Show("Không xóa được hóa đơn bán này. Lỗi rồi!");
            }
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            // Kích hoạt biến Sửa 
            Them = false;
            // Cho phép thao tác trên Panel 
            this.panel.Enabled = true;
            dgvDanhSachHoaDonBan_CellClick(null, null);
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

            // Đưa con trỏ đến TextField txtMaHoaDonBan 
            this.txtMaHoaDonBan.Enabled = false;
            this.txtNgayBan.Focus();
        }

        private void btnHuyBo_Click(object sender, EventArgs e)
        {
            // Xóa trống các đối tượng 
            this.txtMaHoaDonBan.ResetText();
            this.txtMaNhanVien.ResetText();
            this.txtNgayBan.ResetText();
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
            dgvDanhSachHoaDonBan_CellClick(null, null);
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
                    kq = hdbbusiness.ThemHoaDonBan(ref err, txtMaHoaDonBan.Text, txtNgayBan.Text, txtMaNhanVien.Text);
                    if (kq)
                    {
                        // Load lại dữ liệu trên DataGridView 
                        LoadHoaDonBan();
                        // Thông báo 
                        MessageBox.Show("Đã thêm hóa đơn bán thành công!");
                    }

                }
                catch (SqlException)
                {
                    err = "Không thêm được hóa đơn bán này. Lỗi rồi!";
                    MessageBox.Show(err);
                }
            }
            else
            {
                kq = false;
                // Thứ tự dòng hiện hành 
                int r = dgvDanhSachHoaDonBan.CurrentCell.RowIndex;
                // MaHoaDonBan hiện hành 
                string strMaHoaDonBan =
                dgvDanhSachHoaDonBan.Rows[r].Cells[0].Value.ToString();
                // Câu lệnh SQL 
                kq = hdbbusiness.CapNhatHoaDonBan(ref err, txtMaHoaDonBan.Text, txtNgayBan.Text, txtMaNhanVien.Text);
                if (kq)
                {
                    // Load lại dữ liệu trên DataGridView 
                    LoadHoaDonBan();
                    // Thông báo 
                    MessageBox.Show("Đã cập nhật xong!");
                }
            }

        }

        private void btnReLoad_Click(object sender, EventArgs e)
        {
            LoadHoaDonBan();
        }

        private void dgvDanhSachHoaDonBan_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            // Thứ tự dòng hiện hành 
            int r = dgvDanhSachHoaDonBan.CurrentCell.RowIndex;
            // Chuyển thông tin lên panel 
            this.txtMaHoaDonBan.Text = dgvDanhSachHoaDonBan.Rows[r].Cells[0].Value.ToString();
            this.txtNgayBan.Text = dgvDanhSachHoaDonBan.Rows[r].Cells[1].Value.ToString();
            this.txtMaNhanVien.Text = dgvDanhSachHoaDonBan.Rows[r].Cells[2].Value.ToString();
        }
    }
}
