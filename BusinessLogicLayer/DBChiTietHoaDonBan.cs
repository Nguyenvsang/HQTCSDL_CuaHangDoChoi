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
    public class DBChiTietHoaDonBan
    {
        DAL db = null;
        public DBChiTietHoaDonBan()
        {
            db = new DAL();
        }
        //load ds chi tiết hóa đơn bán
        public DataSet LayChiTietHoaDonBan()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM UDF_LayChiTietHoaDonBan()", CommandType.Text);
        }
        //Thêm chi tiết hóa đơn bán
        public bool ThemChiTietHoaDonBan(ref string err, string maban, string mahoadonban, string madochoi, string giaban)
        {
            return db.MyExecuteNonQuery("USP_ThemChiTietHoaDonBan", CommandType.StoredProcedure, ref err,
                new SqlParameter("@maban", maban),
                new SqlParameter("@mahoadon", mahoadonban),
                new SqlParameter("@madochoi", madochoi),
                new SqlParameter("@giaban", Int32.Parse(giaban)));
        }
        //Cập nhật chi tiết hóa đơn bán
        public bool CapNhatChiTietHoaDonBan(ref string err, string maban, string mahoadonban, string madochoi, string giaban)
        {
            return db.MyExecuteNonQuery("USP_CapNhatChiTietHoaDonBan", CommandType.StoredProcedure, ref err,
                new SqlParameter("@MaBan", maban),
                new SqlParameter("@MaHoaDonBan", mahoadonban),
                new SqlParameter("@MaDoChoi", madochoi),
                new SqlParameter("@GiaBan", Int32.Parse(giaban)));
        }
        //Xoá chi tiết hóa đơn bán
        public bool XoaChiTietHoaDonBan(ref string err, string maban)
        {
            return db.MyExecuteNonQuery("USP_XoaChiTietHoaDonBan", CommandType.StoredProcedure, ref err,
                new SqlParameter("@maban", maban));
        }
        //Thống kê chi tiết hoá đơn bán tháng vừa rồi
        public DataSet ThongKeCTHDBThangVuaQua()
        {
            return db.ExecuteQueryDataSet("UDF_ThongKeCTHDBThangVuaQua", CommandType.StoredProcedure);
        }
    }
}
