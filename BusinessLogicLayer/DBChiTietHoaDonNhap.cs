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
    public class DBChiTietHoaDonNhap
    {
        DAL db = null;
        public DBChiTietHoaDonNhap()
        {
            db = new DAL();
        }
        //load ds chi tiết hóa đơn nhập 
        public DataSet LayChiTietHoaDonNhap()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM UDF_LayChiTietHoaDonNhap()", CommandType.Text);
        }
        //Thêm chi tiết hóa đơn nhập
        public bool ThemChiTietHoaDonNhap(ref string err, string manhap, string mahoadonnhap, string madochoi, string gianhap)
        {
            return db.MyExecuteNonQuery("USP_ThemChiTietHoaDonNhap", CommandType.StoredProcedure, ref err,
                new SqlParameter("@MaNhap", manhap),
                new SqlParameter("@MaHoaDonNhap", mahoadonnhap),
                new SqlParameter("@MaDoChoi", madochoi),
                new SqlParameter("@GiaNhap", Int32.Parse(gianhap)));
        }
        //Cập nhật chi tiết hóa đơn nhập
        public bool CapNhatChiTietHoaDonNhap(ref string err, string manhap, string mahoadonnhap, string madochoi, string gianhap)
        {
            return db.MyExecuteNonQuery("USP_CapNhatChiTietHoaDonNhap", CommandType.StoredProcedure, ref err,
                new SqlParameter("@manhap", manhap),
                new SqlParameter("@mahoadonnhap", mahoadonnhap),
                new SqlParameter("@madochoi", madochoi),
                new SqlParameter("@gianhap", Int32.Parse(gianhap)));
        }
        //Xoá chi tiết hoá đơn nhập
        public bool XoaChiTietHoaDonNhap(ref string err, string manhap)
        {
            return db.MyExecuteNonQuery("USP_XoaChiTietHoaDonNhap", CommandType.StoredProcedure, ref err,
                new SqlParameter("@ma_nhap", manhap));
        }
        //Thống kê chi tiết hoá đơn nhập tháng vừa rồi
        public DataSet ThongKeCTHDNThangVuaQua()
        {
            return db.ExecuteQueryDataSet("UDF_ThongKeCTHDNThangVuaQua", CommandType.StoredProcedure);
        }
    }
}
