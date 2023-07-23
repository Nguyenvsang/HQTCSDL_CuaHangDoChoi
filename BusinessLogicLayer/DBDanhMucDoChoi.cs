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
    public class DBDanhMucDoChoi
    {
        DAL db = null;

        public DBDanhMucDoChoi()
        {
            db = new DAL();
        }
        // Load danh mục đồ chơi
        public DataSet LayDanhMucDoChoi()
        {
            return db.ExecuteQueryDataSet("USP_LayDanhMucDoChoi", CommandType.StoredProcedure);
        }
        // Thêm danh mục đồ chơi
        public bool ThemDanhMucDoChoi(ref string err, string MaLoaiDoChoi, string TenLoaiDoChoi)
        {
            return db.MyExecuteNonQuery("USP_ThemDanhMucDoChoi", CommandType.StoredProcedure,
                ref err, new SqlParameter("@maloai", MaLoaiDoChoi),
                new SqlParameter("@tenloai", TenLoaiDoChoi));
        }
        // Xoá danh mục đồ chơi
        public bool XoaDanhMucDoChoi(ref string err, string MaLoaiDoChoi)
        { 
            return db.MyExecuteNonQuery("USP_XoaDanhMucDoChoi", CommandType.StoredProcedure, ref err,
                new SqlParameter("@maloai", MaLoaiDoChoi));
        }
        // Cập nhật danh mục đồ chơi
        public bool CapNhatDanhMucDoChoi(ref string err, string MaLoaiDoChoi, string TenLoaiDoChoi)
        {
            return db.MyExecuteNonQuery("USP_CapNhatDanhMucDoChoi", CommandType.StoredProcedure, ref err,
                new SqlParameter("@MaLoaiDoChoi", MaLoaiDoChoi),
                new SqlParameter("@TenLoaiDoChoi", TenLoaiDoChoi));
        }



    }
}
