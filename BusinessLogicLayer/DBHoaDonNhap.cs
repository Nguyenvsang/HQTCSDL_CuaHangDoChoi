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
    public class DBHoaDonNhap
    {
        DAL db = null;
        public DBHoaDonNhap()
        {
            db = new DAL();
        }
        //load ds hóa đơn nhập 
        public DataSet LayHoaDonNhap()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM UDF_LayHoaDonNhap()", CommandType.Text);
        }
        //Thêm hóa đơn nhập
        public bool ThemHoaDonNhap(ref string err, string mahoadonnhap, string ngaynhap, string manhanvien)
        {
            return db.MyExecuteNonQuery("USP_ThemHoaDonNhap", CommandType.StoredProcedure, ref err,
                new SqlParameter("@ma_hoa_don_nhap", mahoadonnhap),
                new SqlParameter("@ngay_nhap", DateTime.Parse(ngaynhap)),
                new SqlParameter("@ma_nhan_vien", manhanvien));
        }
        //Cập nhật hoá đơn nhập
        public bool CapNhatHoaDonNhap(ref string err, string mahoadonnhap, string ngaynhap, string manhanvien)
        {
            return db.MyExecuteNonQuery("USP_CapNhatHoaDonNhap", CommandType.StoredProcedure, ref err,
                new SqlParameter("@mahoadonnhap", mahoadonnhap),
                new SqlParameter("@ngaynhap", DateTime.Parse(ngaynhap)),
                new SqlParameter("@manhanvien", manhanvien));
        }
        //Xoá hoá đơn nhập
        public bool XoaHoaDonNhap(ref string err, string mahoadonnhap)
        {
            return db.MyExecuteNonQuery("USP_XoaHoaDonNhap", CommandType.StoredProcedure, ref err,
                new SqlParameter("@MaHoaDonNhap", mahoadonnhap));
        }

        // Tìm kiếm hoá đơn nhập: UDF_TimHoaDonNhap
        public DataSet TimHoaDonNhap(string mahoadonnhap)
        {
            return db.ExecuteQueryDataSet("SELECT * FROM UDF_TimHoaDonNhap(@mahoadonnhap)", CommandType.Text);
        }

    }
}
