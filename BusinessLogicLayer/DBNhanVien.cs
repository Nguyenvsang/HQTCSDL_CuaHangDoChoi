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
    public class DBNhanVien
    {
        DAL db = null;

        public DBNhanVien()
        {
            db = new DAL();
        }
        // Load danh sách nhân viên
        public DataSet LayNhanVien()
        {
            return db.ExecuteQueryDataSet("USP_LayNhanVien", CommandType.StoredProcedure);
        }
        // Load danh sách nhân viên đang làm việc
        public DataSet NhanVienDangLamViec()
        {
            return db.ExecuteQueryDataSet("USP_NhanVienDangLamViec", CommandType.StoredProcedure);
        }
        // Thêm nhân viên
        public bool ThemNhanVien(ref string err, string MaNhanVien, string CCCD, string TenNhanVien, string GioiTinh,
            int NamSinh, string QueQuan, int Luong, DateTime NgayVaoLam, int TrangThai)
        {
            return db.MyExecuteNonQuery("USP_ThemNhanVien", CommandType.StoredProcedure, ref err,
                new SqlParameter("@manhanvien", MaNhanVien),
                new SqlParameter("@cccd", CCCD),
                new SqlParameter("@tennhanvien", TenNhanVien),
                new SqlParameter("@gioitinh", GioiTinh),
                new SqlParameter("@namsinh", NamSinh),
                new SqlParameter("@quequan", QueQuan),
                new SqlParameter("@luong", Luong),
                new SqlParameter("@ngayvaolam", NgayVaoLam),
                new SqlParameter("@trangthai", TrangThai));
        }
        // Xoá nhân viên
        public bool XoaNhanVien(ref string err, string MaNhanVien)
        {
            return db.MyExecuteNonQuery("USP_XoaNhanVien", CommandType.StoredProcedure, ref err,
                new SqlParameter("@manhanvien", MaNhanVien));
        }
        // Cập nhật nhân viên
        public bool CapNhatNhanVien(ref string err, string MaNhanVien, string CCCD, string TenNhanVien, string GioiTinh,
            int NamSinh, string QueQuan, int Luong, DateTime NgayVaoLam, int TrangThai)
        {
            return db.MyExecuteNonQuery("USP_CapNhatNhanVien", CommandType.StoredProcedure, ref err,
                new SqlParameter("@MaNhanVien", MaNhanVien),
                new SqlParameter("@CCCD", CCCD),
                new SqlParameter("@TenNhanVien", TenNhanVien),
                new SqlParameter("@GioiTinh", GioiTinh),
                new SqlParameter("@NamSinh", NamSinh),
                new SqlParameter("@QueQuan", QueQuan),
                new SqlParameter("@Luong", Luong),
                new SqlParameter("@NgayVaoLam", NgayVaoLam),
                new SqlParameter("@TrangThai", TrangThai));
        }
    }
}
