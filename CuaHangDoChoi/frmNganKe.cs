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

    public partial class frmNganKe : Form
    {
        bool Them = false;
        DBNganKe nkbusiness = new DBNganKe();

        public frmNganKe()
        {
            InitializeComponent();
        }


        private void frmNganKe_Load(object sender, EventArgs e)
        {
            LoadNganKe();

        }

        void LoadNganKe()
        {
            try
            {
                // Đưa dữ liệu lên DataGridView  
                dgvDanhSachNganKe.DataSource = nkbusiness.LayNganKe().Tables[0];

                // Thay đổi độ rộng cột 
                dgvDanhSachNganKe.AutoResizeColumns();

                // Xóa trống các đối tượng trong Panel 
                this.txtMaNganKe.ResetText();
                this.txtViTri.ResetText();
                this.txtSucChua.ResetText();

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
                dgvDanhSachNganKe.Columns[0].HeaderText = "Mã ngăn kệ";
                dgvDanhSachNganKe.Columns[1].HeaderText = "Vị trí";
                dgvDanhSachNganKe.Columns[2].HeaderText = "Sức chứa";

                // Sự kiện click chuột
                dgvDanhSachNganKe_CellClick(null, null);
            }
            catch (SqlException)
            {
                MessageBox.Show("Không lấy được ngăn kệ. Đã xảy ra lỗi!");
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
            this.txtMaNganKe.ResetText();
            this.txtViTri.ResetText();
            this.txtSucChua.ResetText();

            // Cho thao tác trên các nút Lưu  
            this.btnLuu.Enabled = true;

            // Không cho thao tác trên các nút Thêm / Trở về 
            this.btnThem.Enabled = false;
            this.btnTroVe.Enabled = false;
            // Đưa con trỏ đến TextField txtMaNganKe
            this.txtMaNganKe.Focus();
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            bool kq = false;
            string err = "";
            try
            {
                // Lấy thứ tự record hiện hành 
                int r = dgvDanhSachNganKe.CurrentCell.RowIndex;
                // Lấy MaNganKe của record hiện hành 
                string strMaNganKe =
                dgvDanhSachNganKe.Rows[r].Cells[0].Value.ToString();
                // Hiện thông báo xác nhận việc xóa mẫu tin 
                // Khai báo biến traloi 
                DialogResult traloi;
                // Hiện hộp thoại hỏi đáp 
                traloi = MessageBox.Show("Bạn có chắc muốn xoá ngăn kệ này không?", "Trả lời",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                // Kiểm tra có nhắp chọn nút Ok không? 
                if (traloi == DialogResult.Yes)
                {
                    // Thực hiện câu lệnh SQL 
                    kq = nkbusiness.XoaNganKe(ref err, txtMaNganKe.Text);
                    if (kq)
                    {
                        // Cập nhật lại DataGridView 
                        LoadNganKe();
                        // Thông báo 
                        MessageBox.Show("Đã xóa thành công!");
                    }
                }
                else
                {

                    // Thông báo 
                    MessageBox.Show("Huỷ bỏ việc xoá ngăn kệ này!");
                }
            }
            catch (SqlException)
            {
                MessageBox.Show("Không xóa được ngăn kệ này. Lỗi rồi!");
            }
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            // Kích hoạt biến Sửa 
            Them = false;
            // Cho phép thao tác trên Panel 
            this.panel.Enabled = true;
            dgvDanhSachNganKe_CellClick(null, null);
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
            // Đưa con trỏ đến TextField txtMaNganKe
            this.txtMaNganKe.Enabled = false;
        }

        private void btnHuyBo_Click(object sender, EventArgs e)
        {
            // Xóa trống các đối tượng 
            this.txtMaNganKe.ResetText();
            this.txtViTri.ResetText();
            this.txtSucChua.ResetText();

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
            dgvDanhSachNganKe_CellClick(null, null);
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
                    kq = nkbusiness.ThemNganKe(ref err, txtMaNganKe.Text, txtViTri.Text, int.Parse(txtSucChua.Text));
                    if (kq)
                    {
                        // Load lại dữ liệu trên DataGridView 
                        LoadNganKe();
                        // Thông báo 
                        MessageBox.Show("Đã thêm ngăn kệ thành công!");
                    }

                }
                catch (SqlException)
                {
                    err = "Không thêm được ngăn kệ. Lỗi rồi!";
                    MessageBox.Show(err);
                }
            }
            else
            {
                kq = false;
                // Thứ tự dòng hiện hành 
                int r = dgvDanhSachNganKe.CurrentCell.RowIndex;
                // MaNganKe hiện hành 
                string strMaNganKe =
                dgvDanhSachNganKe.Rows[r].Cells[0].Value.ToString();
                // Câu lệnh SQL 
                kq = nkbusiness.CapNhatNganKe(ref err, txtMaNganKe.Text, txtViTri.Text, int.Parse(txtSucChua.Text));
                if (kq)
                {
                    // Load lại dữ liệu trên DataGridView 
                    LoadNganKe();
                    // Thông báo 
                    MessageBox.Show("Đã cập nhật xong!");
                }
            }
        }

        private void btnReLoad_Click(object sender, EventArgs e)
        {
            LoadNganKe();
        }

        private void dgvDanhSachNganKe_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            // Thứ tự dòng hiện hành 
            int r = dgvDanhSachNganKe.CurrentCell.RowIndex;
            // Chuyển thông tin lên panel 
            this.txtMaNganKe.Text = dgvDanhSachNganKe.Rows[r].Cells[0].Value.ToString();
            this.txtViTri.Text = dgvDanhSachNganKe.Rows[r].Cells[1].Value.ToString();
            this.txtSucChua.Text = dgvDanhSachNganKe.Rows[r].Cells[2].Value.ToString();
        }
    }
}
