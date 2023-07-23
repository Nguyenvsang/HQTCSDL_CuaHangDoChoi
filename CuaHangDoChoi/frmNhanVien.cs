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
    public partial class frmNhanVien : Form
    {
        bool Them = false;
        DBNhanVien nvbusiness = new DBNhanVien();

        public frmNhanVien()
        {
            InitializeComponent();
        }


        private void frmNhanVien_Load(object sender, EventArgs e)
        {
            LoadNhanVien();
        }

        void LoadNhanVien()
        {
            try
            {
                // Đưa dữ liệu lên DataGridView  
                dgvDanhSachNhanVien.DataSource = nvbusiness.LayNhanVien().Tables[0];
                dgvDanhSachNhanVien.Columns[7].Visible = false;
                // Thay đổi độ rộng cột 
                dgvDanhSachNhanVien.AutoResizeColumns();
                // Xóa trống các đối tượng trong Panel 
                this.txtMaNhanVien.ResetText();
                this.txtCCCD.ResetText();
                this.panel.ResetText();
                this.txtTenNhanVien.ResetText();
                this.txtNamSinh.ResetText();
                this.txtQueQuan.ResetText();
                this.txtLuong.ResetText();
                this.dtpNgayVaoLam.ResetText();
                this.txtTrangThai.ResetText();
                // Không cho thao tác trên các nút Lưu / Hủy 
                this.btnLuu.Enabled = false;
                this.btnHuyBo.Enabled = false;
                this.panel.Enabled = false;
                // Cho thao tác trên các nút Thêm / Sửa / Xóa /Thoát 
                this.btnThem.Enabled = true;
                this.btnCapNhat.Enabled = true;
                this.btnXoa.Enabled = true;
                this.btnTroVe.Enabled = true;
                // Radio button
                this.rdNam.Refresh();
                this.rdNu.Refresh();
                // Đặt tên cột
                dgvDanhSachNhanVien.Columns[0].HeaderText = "Mã nhân viên";
                dgvDanhSachNhanVien.Columns[1].HeaderText = "CCCD";
                dgvDanhSachNhanVien.Columns[2].HeaderText = "Tên Nhân Viên";
                dgvDanhSachNhanVien.Columns[3].HeaderText = "Giới Tính";
                dgvDanhSachNhanVien.Columns[4].HeaderText = "Năm Sinh";
                dgvDanhSachNhanVien.Columns[5].HeaderText = "Quê Quán";
                dgvDanhSachNhanVien.Columns[6].HeaderText = "Lương";
                dgvDanhSachNhanVien.Columns[7].HeaderText = "Ngày Vào Làm";
                dgvDanhSachNhanVien.Columns[8].HeaderText = "Trạng Thái";

                // Sự kiện click chuột
                dgvDanhSachNhanVien_CellClick(null, null);
            }
            catch (SqlException)
            {
                MessageBox.Show("Không lấy được nội dung nhân viên.Đã xảy ra lỗi!");
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
            this.txtMaNhanVien.ResetText();
            this.txtTenNhanVien.ResetText();
            this.panel.ResetText();
            this.dtpNgayVaoLam.ResetText();
            this.txtNamSinh.ResetText();
            this.txtQueQuan.ResetText(); ;
            this.txtCCCD.ResetText();
            this.txtQueQuan.ResetText();
            this.txtLuong.ResetText();
            this.txtTrangThai.ResetText();
            this.rdNam.Refresh();
            this.rdNu.Refresh();
            // Cho thao tác trên các nút Lưu / Hủy / Panel 
            this.btnLuu.Enabled = true;
            this.btnHuyBo.Enabled = true;
            this.panel.Enabled = true;
            // Không cho thao tác trên các nút Thêm / Xóa / Thoát 
            this.btnThem.Enabled = false;
            this.btnCapNhat.Enabled = false;
            this.btnXoa.Enabled = false;
            this.btnTroVe.Enabled = false;
            // Đưa con trỏ đến TextField txtMaNhanVien
            this.txtMaNhanVien.Focus();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            bool kq = false;
            string err = "";
            try
            {

                // Lấy thứ tự record hiện hành 
                int r = dgvDanhSachNhanVien.CurrentCell.RowIndex;
                // Lấy MaNhanVien của record hiện hành 
                string strNhanVien =
                dgvDanhSachNhanVien.Rows[r].Cells[0].Value.ToString();

                // Hiện thông báo xác nhận việc xóa mẫu tin 
                // Khai báo biến traloi 
                DialogResult traloi;
                // Hiện hộp thoại hỏi đáp 
                traloi = MessageBox.Show("Bạn có chắc xóa nhân viên này không?", "Trả lời",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                // Kiểm tra có nhắp chọn nút Ok không? 
                if (traloi == DialogResult.Yes)
                {
                    // Thực hiện câu lệnh SQL 
                    kq = nvbusiness.XoaNhanVien(ref err, txtMaNhanVien.Text);
                    if (kq)
                    {
                        // Cập nhật lại DataGridView 
                        LoadNhanVien();
                        // Thông báo 
                        MessageBox.Show("Đã xóa xong!");
                    }
                }
                else
                {

                    // Thông báo 
                    MessageBox.Show("Không thực hiện việc xóa mẫu tin!");
                }
            }
            catch (SqlException)
            {
                MessageBox.Show("Không xóa được. Lỗi rồi!");
            }
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            // Kích hoạt biến Sửa 
            Them = false;
            // Cho phép thao tác trên Panel 
            this.panel.Enabled = true;
            dgvDanhSachNhanVien_CellClick(null, null);
            // Cho thao tác trên các nút Lưu / Hủy / Panel 
            this.btnLuu.Enabled = true;
            this.btnHuyBo.Enabled = true;
            this.panel.Enabled = true;
            // Không cho thao tác trên các nút Thêm / Xóa / Thoát 
            this.btnThem.Enabled = false;
            this.btnCapNhat.Enabled = false;
            this.btnXoa.Enabled = false;
            this.btnTroVe.Enabled = false;
            // Đưa con trỏ đến TextField txtMaNV 
            this.txtMaNhanVien.Enabled = false;
            this.txtCCCD.Focus();
        }

        private void btnHuyBo_Click(object sender, EventArgs e)
        {
            // Xóa trống các đối tượng trong Panel 
            this.txtMaNhanVien.ResetText();
            this.txtTenNhanVien.ResetText();
            this.panel.ResetText();
            this.dtpNgayVaoLam.ResetText();
            this.txtNamSinh.ResetText();
            this.txtQueQuan.ResetText();
            this.txtCCCD.ResetText();
            this.txtQueQuan.ResetText();
            this.txtLuong.ResetText();
            this.txtTrangThai.ResetText();
            this.rdNam.Refresh();
            this.rdNu.Refresh();
            // Cho thao tác trên các nút Thêm / Sửa / Xóa / Thoát 
            this.btnThem.Enabled = true;
            this.btnCapNhat.Enabled = true;
            this.btnXoa.Enabled = true;
            this.btnTroVe.Enabled = true;
            //this.btnReload.Enabled = true;
            // Không cho thao tác trên các nút Lưu / Hủy / Panel 
            this.btnLuu.Enabled = false;
            this.btnHuyBo.Enabled = false;
            this.panel.Enabled = false;
            dgvDanhSachNhanVien_CellClick(null, null);
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
                    kq = nvbusiness.ThemNhanVien(ref err, txtMaNhanVien.Text, txtCCCD.Text, txtTenNhanVien.Text, (rdNam.Checked ? rdNam.Text : rdNu.Text), int.Parse(txtNamSinh.Text),
                        txtQueQuan.Text, int.Parse(txtLuong.Text), DateTime.Parse(dtpNgayVaoLam.Text), int.Parse(txtTrangThai.Text));
                    if (kq)
                    {
                        // Load lại dữ liệu trên DataGridView 
                        LoadNhanVien();
                        // Thông báo 
                        MessageBox.Show("Đã thêm xong!");
                    }

                }
                catch (SqlException)
                {
                    err = "Không thêm được. Lỗi rồi!";
                    MessageBox.Show(err);
                }
            }
            else
            {
                kq = false;
                // Thứ tự dòng hiện hành 
                int r = dgvDanhSachNhanVien.CurrentCell.RowIndex;
                // MaNhanVien hiện hành 
                string strMaNhanVien =
                dgvDanhSachNhanVien.Rows[r].Cells[0].Value.ToString();

                // Câu lệnh SQL 
                kq = nvbusiness.CapNhatNhanVien(ref err, txtMaNhanVien.Text, txtCCCD.Text, txtTenNhanVien.Text, (rdNam.Checked ? rdNam.Text : rdNu.Text), int.Parse(txtNamSinh.Text),
                        txtQueQuan.Text, int.Parse(txtLuong.Text), DateTime.Parse(dtpNgayVaoLam.Text), int.Parse(txtTrangThai.Text));
                if (kq)
                {
                    // Load lại dữ liệu trên DataGridView 
                    LoadNhanVien();
                    // Thông báo 
                    MessageBox.Show("Đã cập nhật xong!");
                }
            }
        }

        private void btnReLoad_Click(object sender, EventArgs e)
        {
            LoadNhanVien();
        }

        private void dgvDanhSachNhanVien_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            // Thứ tự dòng hiện hành 
            int r = dgvDanhSachNhanVien.CurrentCell.RowIndex;
            // Chuyển thông tin lên panel 
            this.txtMaNhanVien.Text =
                dgvDanhSachNhanVien.Rows[r].Cells[0].Value.ToString();
            this.txtCCCD.Text =
                dgvDanhSachNhanVien.Rows[r].Cells[1].Value.ToString();
            this.txtTenNhanVien.Text =
                dgvDanhSachNhanVien.Rows[r].Cells[2].Value.ToString();
            if (dgvDanhSachNhanVien.Rows[r].Cells[3].Value.ToString() == "Nam")
                this.rdNam.Checked = true;
            else
                this.rdNu.Checked = true;
            this.txtNamSinh.Text =
                dgvDanhSachNhanVien.Rows[r].Cells[4].Value.ToString();
            this.txtQueQuan.Text =
                dgvDanhSachNhanVien.Rows[r].Cells[5].Value.ToString();
            this.txtLuong.Text =
                dgvDanhSachNhanVien.Rows[r].Cells[6].Value.ToString();
            this.dtpNgayVaoLam.Value = DateTime.Parse
                (dgvDanhSachNhanVien.Rows[r].Cells[7].Value.ToString());
            this.txtTrangThai.Text =
                dgvDanhSachNhanVien.Rows[r].Cells[8].Value.ToString();
        }

        private void btnLoc_Click(object sender, EventArgs e)
        {
            dgvDanhSachNhanVien.DataSource = nvbusiness.NhanVienDangLamViec().Tables[0];
        }

        private void rdNam_CheckedChanged(object sender, EventArgs e)
        {
            if(rdNam.Checked == true)
            {
                rdNu.Checked = false;
            }
        }

        private void rdNu_CheckedChanged(object sender, EventArgs e)
        {
            if(rdNu.Checked == true)
            {
                rdNam.Checked = false;
            }
        }
    }
}
