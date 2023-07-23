using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
// ADO.NET
using System.Data;
using System.Data.SqlClient;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class DBTaiKhoan
    {
        DAL db = null;

        public DBTaiKhoan()
        {
            db = new DAL();
        }
        // Load danh sách tài khoản
        public DataSet LayTaiKhoan()
        {
            return db.ExecuteQueryDataSet("USP_LayTaiKhoan", CommandType.StoredProcedure);
        }
        // Thêm tài khoản 
        public bool ThemTaiKhoan(ref string err, string TenNguoiDung, string MatKhau, string LoaiNguoiDung)
        {
            return db.MyExecuteNonQuery("USP_ThemTaiKhoan", CommandType.StoredProcedure, ref err,
                new SqlParameter("@ten_nguoi_dung", TenNguoiDung),
                new SqlParameter("@mat_khau", MatKhau),
                new SqlParameter("@loai_nguoi_dung", LoaiNguoiDung));
        }
        // Xoá tài khoản 
        public bool XoaTaiKhoan(ref string err, string TenNguoiDung)
        {
            return db.MyExecuteNonQuery("USP_XoaTaiKhoan", CommandType.StoredProcedure, ref err,
                new SqlParameter("@TenNguoiDung", TenNguoiDung));
        }
        // Cập nhật tài khoản 
        public bool CapNhatTaiKhoan(ref string err, string TenNguoiDung, string MatKhau, string LoaiNguoiDung)
        {
            return db.MyExecuteNonQuery("USP_CapNhatTaiKhoan", CommandType.StoredProcedure, ref err,
                new SqlParameter("@tennguoidung", TenNguoiDung),
                new SqlParameter("@matkhau", MatKhau),
                new SqlParameter("@loainguoidung", LoaiNguoiDung));
        }
        public int DangNhap(string TenNguoiDung, string MatKhau)
        {
            DataSet tk = db.ExecuteQueryDataSet($"SELECT * FROM UDF_XacThucTaiKhoan('{TenNguoiDung}','{MatKhau}')", CommandType.Text);
            if (tk.Tables[0].Rows.Count == 0)
                return 0; // Sai
            else if (tk.Tables[0].Rows[0].Field<string>("LoaiNguoiDung") == "Admin")
                return 1; // Admin
            else
                return 2; // User
        }
    }
}
