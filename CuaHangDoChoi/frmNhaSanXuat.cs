using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
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
    public partial class frmNhaSanXuat : Form
    {
        bool Them = false;
        DBNhaSanXuat nsxbusiness = new DBNhaSanXuat();
        public frmNhaSanXuat()
        {
            InitializeComponent();
        }

        private void frmNhaSanXuat_Load(object sender, EventArgs e)
        {
            LoadNhaSanXuat();
        }
        void LoadNhaSanXuat()
        {
            try
            {
                // Đưa dữ liệu lên DataGridView  
                dgvDanhSachNhaSanXuat.DataSource = nsxbusiness.LayNhaSanXuat().Tables[0];

                // Thay đổi độ rộng cột 
                dgvDanhSachNhaSanXuat.AutoResizeColumns();

                // Xóa trống các đối tượng trong Panel 
                this.txtMaNhaSanXuat.ResetText();
                this.txtTenNhaSanXuat.ResetText();
                this.txtTenQuocGia.ResetText();

                //this.dtp.ResetText();
                this.panel.ResetText();

                // Không cho thao tác trên các nút Lưu / Hủy 
                this.btnLuu.Enabled = false;
                this.btnHuyBo.Enabled = false;
                this.panel.Enabled = false;
                // Cho thao tác trên các nút Thêm / Sửa / Xóa /Thoát 
                this.btnThem.Enabled = true;
                this.btnCapNhat.Enabled = true;
                this.btnTroVe.Enabled = true;

                // Đặt tên cột
                dgvDanhSachNhaSanXuat.Columns[0].HeaderText = "Mã nhà sản xuất";
                dgvDanhSachNhaSanXuat.Columns[1].HeaderText = "Tên nhà sản xuất";
                dgvDanhSachNhaSanXuat.Columns[2].HeaderText = "Tên quốc gia";

                // Sự kiện click chuột
                dgvDanhSachNhaSanXuat_CellClick(null, null);
            }
            catch (SqlException)
            {
                MessageBox.Show("Không lấy được nhà sản xuất. Đã xảy ra lỗi!");
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
            this.txtMaNhaSanXuat.ResetText();
            this.txtTenNhaSanXuat.ResetText();
            this.txtTenQuocGia.ResetText();

            // Cho thao tác trên các nút Lưu  
            this.btnLuu.Enabled = true;

            // Không cho thao tác trên các nút Thêm / Trở về 
            this.btnThem.Enabled = false;
            this.btnTroVe.Enabled = false;
            // Đưa con trỏ đến TextField txtMaNhaSanXuat
            this.txtMaNhaSanXuat.Focus();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            bool kq = false;
            string err = "";
            try
            {
                // Lấy thứ tự record hiện hành 
                int r = dgvDanhSachNhaSanXuat.CurrentCell.RowIndex;
                // Lấy MaNhaSanXuat của record hiện hành 
                string strMaNhaSanXuat =
                dgvDanhSachNhaSanXuat.Rows[r].Cells[0].Value.ToString();
                // Hiện thông báo xác nhận việc xóa mẫu tin 
                // Khai báo biến traloi 
                DialogResult traloi;
                // Hiện hộp thoại hỏi đáp 
                traloi = MessageBox.Show("Bạn có chắc muốn xoá nhà sản xuất này không?", "Trả lời",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                // Kiểm tra có nhắp chọn nút Ok không? 
                if (traloi == DialogResult.Yes)
                {
                    // Thực hiện câu lệnh SQL 
                    kq = nsxbusiness.XoaNhaSanXuat(ref err, txtMaNhaSanXuat.Text);
                    if (kq)
                    {
                        // Cập nhật lại DataGridView 
                        LoadNhaSanXuat();
                        // Thông báo 
                        MessageBox.Show("Đã xóa thành công!");
                    }
                }
                else
                {

                    // Thông báo 
                    MessageBox.Show("Huỷ bỏ việc xoá nhà sản xuất này!");
                }
            }
            catch (SqlException)
            {
                MessageBox.Show("Không xóa được nhà sán xuất này. Lỗi rồi!");
            }
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            // Kích hoạt biến Sửa 
            Them = false;
            // Cho phép thao tác trên Panel 
            this.panel.Enabled = true;
            dgvDanhSachNhaSanXuat_CellClick(null, null);
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
            // Đưa con trỏ đến TextField txtMaNhaSanXuat
            this.txtMaNhaSanXuat.Enabled = false;
        }

        private void btnHuyBo_Click(object sender, EventArgs e)
        {
            // Xóa trống các đối tượng 
            this.txtMaNhaSanXuat.ResetText();
            this.txtTenNhaSanXuat.ResetText();
            this.txtTenQuocGia.ResetText();

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
            dgvDanhSachNhaSanXuat_CellClick(null, null);
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
                    kq = nsxbusiness.ThemNhaSanXuat(ref err, txtMaNhaSanXuat.Text, txtTenNhaSanXuat.Text, txtTenQuocGia.Text);
                    if (kq)
                    {
                        // Load lại dữ liệu trên DataGridView 
                        LoadNhaSanXuat();
                        // Thông báo 
                        MessageBox.Show("Đã thêm nhà sản xuất thành công!");
                    }

                }
                catch (SqlException)
                {
                    err = "Không thêm được nhà sản xuất. Lỗi rồi!";
                    MessageBox.Show(err);
                }
            }
            else
            {
                kq = false;
                // Thứ tự dòng hiện hành 
                int r = dgvDanhSachNhaSanXuat.CurrentCell.RowIndex;
                // MaNhaSanXuat hiện hành 
                string strMaNhaSanXuat =
                dgvDanhSachNhaSanXuat.Rows[r].Cells[0].Value.ToString();
                // Câu lệnh SQL 
                kq = nsxbusiness.CapNhatNhaSanXuat(ref err, txtMaNhaSanXuat.Text, txtTenNhaSanXuat.Text, txtTenQuocGia.Text);
                if (kq)
                {
                    // Load lại dữ liệu trên DataGridView 
                    LoadNhaSanXuat();
                    // Thông báo 
                    MessageBox.Show("Đã cập nhật xong!");
                }
            }
        }

        private void btnReLoad_Click(object sender, EventArgs e)
        {
            LoadNhaSanXuat();
        }

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

        private void dgvDanhSachNhaSanXuat_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            // Thứ tự dòng hiện hành 
            int r = dgvDanhSachNhaSanXuat.CurrentCell.RowIndex;
            // Chuyển thông tin lên panel 
            this.txtMaNhaSanXuat.Text = dgvDanhSachNhaSanXuat.Rows[r].Cells[0].Value.ToString();
            this.txtTenNhaSanXuat.Text = dgvDanhSachNhaSanXuat.Rows[r].Cells[1].Value.ToString();
            this.txtTenQuocGia.Text = dgvDanhSachNhaSanXuat.Rows[r].Cells[2].Value.ToString();
        }
    }
}
