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
    public class DBThongKe
    {
        DAL db = null;

        public DBThongKe()
        {
            db = new DAL();
        }

        // Doanh thu theo tháng vừa rồi: UDF_DoanhThuThang
        public int DoanhThuThang()
        {
            return db.MyExecuteScalarFunction("SELECT dbo.UDF_DoanhThuThang()");
        }

        // Lợi nhuận tháng vừa rồi: UDF_LoiNhuanThang 
        public int LoiNhuanThang()
        {
            return db.MyExecuteScalarFunction("SELECT dbo.UDF_LoiNhuanThang()");
        }

        // Tổng doanh thu từ trước đến nay: UDF_TongDoanhThu
        public int TongDoanhThu()
        {
            return db.MyExecuteScalarFunction("SELECT dbo.UDF_TongDoanhThu()");
        }

        //Tổng lợi nhuận từ trước đến nay: UDF_TongLoiNhuan
        public int TongLoiNhuan()
        {
            return db.MyExecuteScalarFunction("SELECT dbo.UDF_TongLoiNhuan()");
        }

        // Lợi nhuận theo năm: UDF_LoiNhuanNam
        public int LoiNhuanNam(string nam)
        {
            return db.MyExecuteScalarFunction($"SELECT dbo.UDF_LoiNhuanNam({nam})");
        }

        // Doanh thu theo năm: UDF_DoanhThuNam 
        public int DoanhThuNam(string nam)
        {
            return db.MyExecuteScalarFunction($"SELECT dbo.UDF_DoanhThuNam({nam})");
        }
        // Loại đồ chơi bán chạy nhất
        public DataSet BanChayNhat()
        {
            return db.ExecuteQueryDataSet("USP_LoaiDoChoiBanChayNhat", CommandType.StoredProcedure);
        }

        // Lấy ra năm
        public DataSet Nam()
        {
            return db.ExecuteQueryDataSet("SELECT DISTINCT YEAR(NgayBan) AS NAM FROM HoaDonBan", CommandType.Text);
        }

        // Thống kê tiền lời của mỗi đồ chơi: UDF_TienLoi
        public DataSet TienLoi()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM UDF_TienLoi()", CommandType.Text);
        }

        // Thống kê tiền lỗ của mỗi đồ chơi: UDF_TienLo
        public DataSet TienLo()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM UDF_TienLo()", CommandType.Text);
        }

        // Thống kê đồ chơi đã nhập tháng vừa rồi: UDF_ThongKeDoChoiNhapThangVuaQua
        public DataSet ThongKeDoChoiNhapThangVuaQua()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM UDF_ThongKeDoChoiNhapThangVuaQua()",
                CommandType.Text);
        }

        // Thống kê đồ chơi đã bán tháng vừa rồi: UDF_ThongKeDoChoiBanThangVuaQua
        public DataSet ThongKeDoChoiBanThangVuaQua()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM UDF_ThongKeDoChoiBanThangVuaQua()",
                CommandType.Text);
        }

        // Tổng chi phí nhập theo từng loại đồ chơi: USP_TongDoanhThuLoaiDoChoi
        public DataSet TongChiPhiNhapLoaiDoChoi()
        {
            return db.ExecuteQueryDataSet("USP_TongChiPhiNhapLoaiDoChoi",
                CommandType.StoredProcedure);
        }

        // Doanh thu theo từng loại đồ chơi: USP_TongDoanhThuLoaiDoChoi
        public DataSet TongDoanhThuLoaiDoChoi()
        {
            return db.ExecuteQueryDataSet("USP_TongDoanhThuLoaiDoChoi",
                CommandType.StoredProcedure);
        }

        // Doanh thu lợi nhuận: UDF_DoanhThuLoi
        public DataSet DoanhThuLoiNhuan()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM UDF_DoanhThuLoiNhuan()",
                CommandType.Text);
        }
    }
}
