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
    public partial class frmDoChoi : Form
    {
        bool Them = false;
        DBDanhMucDoChoi dmdcbusiness = new DBDanhMucDoChoi();
        DBNhaSanXuat nsxbusiness = new DBNhaSanXuat();
        DBNganKe nkbusiness = new DBNganKe();
        DBDoChoi dcbusiness = new DBDoChoi();

        public frmDoChoi()
        {
            InitializeComponent();
        }
       

        private void frmDoChoi_Load(object sender, EventArgs e)
        {
            LoadDoChoi();
            LoadDanhMucDoChoi();
            LoadNhaSanXuat();
            LoadNganKe();
            LoadComboboxMaLoaiDoChoi();
        }

        void LoadDoChoi()
        {
            try
            {
                // Đưa dữ liệu lên DataGridView  
                this.dgvDoChoi.DataSource = dcbusiness.LayDoChoi().Tables[0];
                this.dgvDoChoi.Columns[3].Visible = false;
                this.dgvDoChoi.Columns[4].Visible = false;
                this.dgvDoChoi.Columns[5].Visible = false;
                // Thay đổi độ rộng cột 
                this.dgvDoChoi.AutoResizeColumns();
                // Đặt tên cột
                dgvDoChoi.Columns[0].HeaderText = "Mã đồ chơi ";
                dgvDoChoi.Columns[1].HeaderText = "Tên đồ chơi";
                dgvDoChoi.Columns[2].HeaderText = "Giá tiền";

                // Xóa trống các đối tượng trong Panel 
                this.txtMaDoChoi.ResetText();
                this.txtTenDoChoi.ResetText();
                this.txtGiaTien.ResetText();
                this.cbxMaLoaiDoChoi.ResetText();
                this.txtNhaSanXuat.ResetText();
                this.txtMaNganKe.ResetText();

                this.panel.Enabled = false;


                // Không cho thao tác trên các nút Lưu / Hủy 
                this.btnLuu.Enabled = false;
                this.btnHuyBo.Enabled = false;
                //this.panel.Enabled = false;
                // Cho thao tác trên các nút Thêm / Sửa / Xóa /Thoát 
                this.btnThem.Enabled = true;
                this.btnCapNhat.Enabled = true;
                this.btnXoa.Enabled = true;
                this.btnTroVe.Enabled = true;
                //
                dgvDoChoi_CellClick(null, null);
            }
            catch (SqlException)
            {
                MessageBox.Show("Không lấy được nội dung đồ chơi. Đã xảy ra lỗi!");
            }
        }

        void LoadDanhMucDoChoi()
        {
            try
            {
                // Đưa dữ liệu lên DataGridView  
                this.dgvLoaiDoChoi.DataSource = dmdcbusiness.LayDanhMucDoChoi().Tables[0];

                // Thay đổi độ rộng cột 
                this.dgvLoaiDoChoi.AutoResizeColumns();

                // Đặt tên cột
                dgvLoaiDoChoi.Columns[0].HeaderText = "Mã loại đồ chơi";
                dgvLoaiDoChoi.Columns[1].HeaderText = "Tên loại đồ chơi";
                // Sự kiện click chuột
                dgvLoaiDoChoi_CellClick(null, null);
            }
            catch (SqlException)
            {
                MessageBox.Show("Không lấy được nội dung loại đồ chơi. Đã xảy ra lỗi!");
            }
        }

        
        public void LoadComboboxMaLoaiDoChoi()
        {
            try
            {
                // Load MaLoaiDoChoi
                this.cbxMaLoaiDoChoi.DataSource = dmdcbusiness.LayDanhMucDoChoi().Tables[0];
                this.cbxMaLoaiDoChoi.ValueMember = "MaLoaiDoChoi";
                this.cbxMaLoaiDoChoi.DisplayMember = "Mã loại đồ chơi";
            }
            catch (SqlException error)  //bắt lỗi sql
            {
                MessageBox.Show("Không truy cập dữ liệu loại đồ chơi được!\rLỗi: " + error.Message, "Lỗi SQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (Exception er)    //bắt các lỗi khác
            {
                MessageBox.Show("Không truy cập dữ liệu loại đồ chơi được!\rLỗi: " + er.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
            this.cbxMaLoaiDoChoi.ResetText();
            this.txtTenLoaiDoChoi.ResetText();
            this.txtMaDoChoi.ResetText();
            this.txtTenDoChoi.ResetText();
            this.txtGiaTien.ResetText();
            this.txtNhaSanXuat.ResetText();

            // Cho thao tác trên các nút Lưu  
            this.btnLuu.Enabled = true;

            // Không cho thao tác trên các nút Thêm / Trở về 
            this.btnThem.Enabled = false;
            this.btnTroVe.Enabled = false;

            // Đưa con trỏ đến TextField txtMaLoaiDoChoi
            this.txtMaDoChoi.Focus();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            bool kq = false;
            string err = "";
            try
            {
                // Lấy thứ tự record hiện hành 
                int r = dgvDoChoi.CurrentCell.RowIndex;
                // Lấy MaDoChoi của record hiện hành 
                string strMaDoChoi =
                dgvDoChoi.Rows[r].Cells[0].Value.ToString();
                // Hiện thông báo xác nhận việc xóa mẫu tin 
                // Khai báo biến traloi 
                DialogResult traloi;
                // Hiện hộp thoại hỏi đáp 
                traloi = MessageBox.Show("Bạn có chắc muốn xoá đồ chơi này không?", "Trả lời",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                // Kiểm tra có nhắp chọn nút Ok không? 
                if (traloi == DialogResult.Yes)
                {
                    // Thực hiện câu lệnh SQL 
                    kq = dcbusiness.XoaDoChoi(ref err, txtMaDoChoi.Text);
                    if (kq)
                    {
                        // Cập nhật lại DataGridView 
                        LoadDoChoi();
                        // Thông báo 
                        MessageBox.Show("Đã xóa thành công!");
                    }
                }
                else
                {

                    // Thông báo 
                    MessageBox.Show("Huỷ bỏ việc xoá đồ chơi này!");
                }
            }
            catch (SqlException)
            {
                MessageBox.Show("Không xóa được đồ chơi này. Lỗi rồi!");
            }
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            // Kích hoạt biến Sửa 
            Them = false;
            // Cho phép thao tác trên Panel 
            this.panel.Enabled = true;
            dgvDoChoi_CellClick(null, null);
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
            // Đưa con trỏ đến TextField txtMaDoChoi
            this.txtMaDoChoi.Enabled = false;
        }

        private void btnHuyBo_Click(object sender, EventArgs e)
        {
            // Xóa trống các đối tượng 
            this.txtMaNganKe.ResetText();
            this.cbxMaLoaiDoChoi.ResetText();
            this.txtTenLoaiDoChoi.ResetText();
            this.txtMaDoChoi.ResetText();
            this.txtTenDoChoi.ResetText();
            this.txtGiaTien.ResetText();
            this.txtNhaSanXuat.ResetText();

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
            dgvDoChoi_CellClick(null, null);
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
                    kq = dcbusiness.ThemDoChoi(ref err, txtMaDoChoi.Text, txtTenDoChoi.Text, int.Parse(txtGiaTien.Text),
                        cbxMaLoaiDoChoi.Text, txtNhaSanXuat.Text, txtMaNganKe.Text);
                    if (kq)
                    {
                        // Load lại dữ liệu trên DataGridView 
                        LoadDoChoi();
                        // Thông báo 
                        MessageBox.Show("Đã thêm đồ chơi thành công!");
                    }

                }
                catch (SqlException)
                {
                    err = "Không thêm được đồ chơi. Lỗi rồi!";
                    MessageBox.Show(err);
                }
            }
            else
            {
                kq = false;
                // Thứ tự dòng hiện hành 
                int r = dgvDoChoi.CurrentCell.RowIndex;
                // MaDoChoi hiện hành 
                string strMaDoChoi =
                dgvDoChoi.Rows[r].Cells[0].Value.ToString();
                // Câu lệnh SQL 
                kq = dcbusiness.CapNhatDoChoi(ref err, txtMaDoChoi.Text, txtTenDoChoi.Text, int.Parse(txtGiaTien.Text),
                        cbxMaLoaiDoChoi.Text, txtNhaSanXuat.Text, txtMaNganKe.Text);
                if (kq)
                {
                    // Load lại dữ liệu trên DataGridView 
                    LoadDoChoi();
                    // Thông báo 
                    MessageBox.Show("Đã cập nhật xong!");
                }
            }
        }

        private void btnReLoad_Click(object sender, EventArgs e)
        {
            LoadDoChoi();
            LoadDanhMucDoChoi();
            LoadNhaSanXuat();
            LoadNganKe();
            LoadComboboxMaLoaiDoChoi();
        }

        private void dgvDoChoi_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {   //khi click record trong dgvDanhSachDoChoi thì thông tin sẽ đc đưa lên các textbox và combobox
                int r = dgvDoChoi.CurrentCell.RowIndex;
                //hiển thị 
                this.txtMaDoChoi.Text = dgvDoChoi.Rows[r].Cells[0].Value.ToString();
                this.txtTenDoChoi.Text = dgvDoChoi.Rows[r].Cells[1].Value.ToString();
                this.txtGiaTien.Text = dgvDoChoi.Rows[r].Cells[2].Value.ToString();
                this.cbxMaLoaiDoChoi.Text = dgvDoChoi.Rows[r].Cells[3].Value.ToString();
                this.txtNhaSanXuat.Text = dgvDoChoi.Rows[r].Cells[4].Value.ToString();
                this.txtMaNganKe.Text = dgvDoChoi.Rows[r].Cells[5].Value.ToString();
                //this.txtTenLoaiDoChoi 

                //this.cbxMaLoaiDoChoi.Text = dcbusiness.LayMaLoaiDoChoi_DoChoi(txtMaDoChoi.Text);              
            }
            catch   //TH click row ko có data
            {
                this.txtMaDoChoi.ResetText();
                this.txtTenDoChoi.ResetText();
                this.txtGiaTien.ResetText();
                this.txtTenLoaiDoChoi.ResetText();
                this.cbxMaLoaiDoChoi.ResetText();
                this.txtMaNganKe.ResetText();
                this.txtNhaSanXuat.ResetText();
            }
        }

        private void dgvLoaiDoChoi_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int r = dgvLoaiDoChoi.CurrentCell.RowIndex;
            // Chuyển thông tin lên panel 
            this.cbxMaLoaiDoChoi.Text = dgvLoaiDoChoi.Rows[r].Cells[0].Value.ToString();
            this.txtTenLoaiDoChoi.Text = dgvLoaiDoChoi.Rows[r].Cells[1].Value.ToString();
        }

        void LoadNhaSanXuat()
        {
            try
            {
                // Đưa dữ liệu lên DataGridView  
                this.dgvNhaSanXuat.DataSource = nsxbusiness.LayNhaSanXuat().Tables[0];

                // Thay đổi độ rộng cột 
                this.dgvLoaiDoChoi.AutoResizeColumns();

                // Đặt tên cột
                dgvNhaSanXuat.Columns[0].HeaderText = "Mã nhà sản xuất";
                dgvNhaSanXuat.Columns[1].HeaderText = "Tên nhà sản xuất";
                dgvNhaSanXuat.Columns[2].HeaderText = "Tên quốc gia";

                // Sự kiện click chuột
                dgvNhaSanXuat_CellClick(null, null);
            }
            catch (SqlException)
            {
                MessageBox.Show("Không lấy được nội dung nhà sản xuất. Đã xảy ra lỗi!");
            }
        }
        private void dgvNhaSanXuat_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            // Thứ tự dòng hiện hành 
            int r = dgvNhaSanXuat.CurrentCell.RowIndex;
            // Chuyển thông tin lên panel 
            this.txtNhaSanXuat.Text = dgvNhaSanXuat.Rows[r].Cells[0].Value.ToString();
        }

        void LoadNganKe()
        {
            try
            {
                // Đưa dữ liệu lên DataGridView  
                this.dgvNganKe.DataSource = nkbusiness.NgankeSucchuaSoluong().Tables[0];
                // Đặt tên cột
                dgvNganKe.Columns[0].HeaderText = "Mã ngăn kệ ";
                dgvNganKe.Columns[1].HeaderText = "Sức chứa";
                dgvNganKe.Columns[2].HeaderText = "Đang chứa";
                //
                dgvNganKe_CellClick(null, null);
            }
            catch (SqlException)
            {
                MessageBox.Show("Không lấy được nội dung ngăn kệ. Đã xảy ra lỗi!");
            }
        }

        private void dgvNganKe_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            // Thứ tự dòng hiện hành 
            int r = dgvNganKe.CurrentCell.RowIndex;
            // Chuyển thông tin lên panel 
            this.txtMaNganKe.Text = dgvNganKe.Rows[r].Cells[0].Value.ToString();
        }

        private void btnTimTen_Click(object sender, EventArgs e)
        {
            dgvThongTin.Refresh();
            this.dgvThongTin.DataSource = dcbusiness.TimDoChoiTheoTen(txtThongTin.Text).Tables[0];
        }

        private void btnTimMa_Click(object sender, EventArgs e)
        {
            dgvThongTin.Refresh();
            this.dgvThongTin.DataSource = dcbusiness.TimDoChoiTheoMa(txtThongTin.Text).Tables[0];
        }

        private void btnDaBan_Click(object sender, EventArgs e)
        {
            dgvDoChoi.DataSource = dcbusiness.DoChoiDaBan().Tables[0];
        }

        private void btnChuaBan_Click(object sender, EventArgs e)
        {
            dgvDoChoi.DataSource = dcbusiness.DoChoiChuaBan().Tables[0];
        }
    }
}
