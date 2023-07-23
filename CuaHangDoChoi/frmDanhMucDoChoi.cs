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
    public partial class frmDanhMucDoChoi : Form
    {
        bool Them = false;
        DBDanhMucDoChoi dmdcbusiness = new DBDanhMucDoChoi();
        public frmDanhMucDoChoi()
        {
            InitializeComponent();
        }

        private void frmDanhMucDoChoi_Load(object sender, EventArgs e)
        {
            LoadDanhMucDoChoi();
        }
        void LoadDanhMucDoChoi()
        {
            try
            {
                // Đưa dữ liệu lên DataGridView  
                this.dgvDanhMucDoChoi.DataSource = dmdcbusiness.LayDanhMucDoChoi().Tables[0];

                // Xóa trống các đối tượng trong Panel 
                this.txtMaLoaiDoChoi.ResetText();
                this.txtTenLoaiDoChoi.ResetText();

                //this.dtp.ResetText();
                this.panel.ResetText();

                // Không cho thao tác trên các nút Lưu / Hủy 
                this.btnLuu.Enabled = false;
                this.btnHuyBo.Enabled = false;
                // Cho thao tác trên các nút Thêm / Sửa / Xóa /Thoát 
                this.btnThem.Enabled = true;
                this.btnCapNhat.Enabled = true;
                this.btnTroVe.Enabled = true;
                this.panel.Enabled = false;
                // Đặt tên cột
                dgvDanhMucDoChoi.Columns[0].HeaderText = "Mã loại đồ chơi";
                dgvDanhMucDoChoi.Columns[1].HeaderText = "Tên loại đồ chơi";

                // Sự kiện click chuột
                dgvDanhMucDoChoi_CellClick(null, null);
            }
            catch (SqlException)
            {
                MessageBox.Show("Không lấy được nội dung loại đồ chơi. Đã xảy ra lỗi!");
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
            this.txtMaLoaiDoChoi.ResetText();
            this.txtTenLoaiDoChoi.ResetText();

            // Cho thao tác trên các nút Lưu  
            this.btnLuu.Enabled = true;

            // Không cho thao tác trên các nút Thêm / Trở về 
            this.btnThem.Enabled = false;
            this.btnTroVe.Enabled = false;
            this.btnHuyBo.Enabled = true;
            this.btnXoa.Enabled = false;
            // Đưa con trỏ đến TextField txtMaLoaiDoChoi
            this.txtMaLoaiDoChoi.Focus();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            bool kq = false;
            string err = "";
            try
            {
                // Lấy thứ tự record hiện hành 
                int r = dgvDanhMucDoChoi.CurrentCell.RowIndex;
                // Lấy MaLoaiDoChoi của record hiện hành 
                string strMaLoaiDoChoi =
                dgvDanhMucDoChoi.Rows[r].Cells[0].Value.ToString();
                // Hiện thông báo xác nhận việc xóa mẫu tin 
                // Khai báo biến traloi 
                DialogResult traloi;
                // Hiện hộp thoại hỏi đáp 
                traloi = MessageBox.Show("Bạn có chắc muốn xoá loại đồ chơi này không?", "Trả lời",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                // Kiểm tra có nhắp chọn nút Ok không? 
                if (traloi == DialogResult.Yes)
                {
                    // Thực hiện câu lệnh SQL 
                    kq = dmdcbusiness.XoaDanhMucDoChoi(ref err, strMaLoaiDoChoi);
                    if (kq)
                    {
                        // Cập nhật lại DataGridView 
                        LoadDanhMucDoChoi();
                        // Thông báo 
                        MessageBox.Show("Đã xóa thành công!");
                    }
                    else 
                        MessageBox.Show(txtMaLoaiDoChoi.Text);
                }
                else
                {

                    // Thông báo 
                    MessageBox.Show("Huỷ bỏ việc xoá loại đồ chơi này!");
                }
             }
            catch (SqlException)
            {
                MessageBox.Show("Không xóa được loại đồ chơi này. Lỗi rồi!");
            }
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            // Kích hoạt biến Sửa 
            Them = false;
            // Cho phép thao tác trên Panel 
            this.panel.Enabled = true;
            dgvDanhMucDoChoi_CellClick(null, null);
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
            // Đưa con trỏ đến TextField txtMaNV 
            this.txtMaLoaiDoChoi.Enabled = false;
        }

        private void btnHuyBo_Click(object sender, EventArgs e)
        {
            // Xóa trống các đối tượng 
            this.txtMaLoaiDoChoi.ResetText();
            this.txtTenLoaiDoChoi.ResetText();
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
            dgvDanhMucDoChoi_CellClick(null, null);
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
                    kq = dmdcbusiness.ThemDanhMucDoChoi(ref err, txtMaLoaiDoChoi.Text, txtTenLoaiDoChoi.Text);
                    if (kq)
                    {
                        // Load lại dữ liệu trên DataGridView 
                        LoadDanhMucDoChoi();
                        // Thông báo 
                        MessageBox.Show("Đã thêm loại đồ chơi thành công!");
                    }

                }
                catch (SqlException)
                {
                    err = "Không thêm được loại đồ chơi này. Lỗi rồi!";
                    MessageBox.Show(err);
                }
            }
            else
            {
                kq = false;
                // Thứ tự dòng hiện hành 
                int r = dgvDanhMucDoChoi.CurrentCell.RowIndex;
                // MaLoaiDoChoi hiện hành 
                string strMaLoaiDoChoi =
                dgvDanhMucDoChoi.Rows[r].Cells[0].Value.ToString();
                // Câu lệnh SQL 
                kq = dmdcbusiness.CapNhatDanhMucDoChoi(ref err, txtMaLoaiDoChoi.Text, txtTenLoaiDoChoi.Text);
                if (kq)
                {
                    // Load lại dữ liệu trên DataGridView 
                    LoadDanhMucDoChoi();
                    // Thông báo 
                    MessageBox.Show("Đã cập nhật xong!");
                }
            }
        }

        private void btnReLoad_Click(object sender, EventArgs e)
        {
            LoadDanhMucDoChoi();
        }

        private void dgvDanhMucDoChoi_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            // Thứ tự dòng hiện hành 
            int r = dgvDanhMucDoChoi.CurrentCell.RowIndex;
            // Chuyển thông tin lên panel 
            this.txtMaLoaiDoChoi.Text = dgvDanhMucDoChoi.Rows[r].Cells[0].Value.ToString();
            this.txtTenLoaiDoChoi.Text = dgvDanhMucDoChoi.Rows[r].Cells[1].Value.ToString();
        }
    }
}
