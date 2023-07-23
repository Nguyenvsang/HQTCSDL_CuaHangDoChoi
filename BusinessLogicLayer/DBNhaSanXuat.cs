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
    public class DBNhaSanXuat
    {
        DAL db = null;

        public DBNhaSanXuat()
        {
            db = new DAL();
        }
        // Load danh sách nhà sản xuất
        public DataSet LayNhaSanXuat()
        {
            return db.ExecuteQueryDataSet("USP_LayNhaSanXuat", CommandType.StoredProcedure);
        }
        // Thêm nhà sản xuất
        public bool ThemNhaSanXuat(ref string err, string MaNSX, string TenNSX, string TenQuocGia)
        {
            return db.MyExecuteNonQuery("USP_ThemNhaSanXuat", CommandType.StoredProcedure, ref err,
                new SqlParameter("@mansx", MaNSX),
                new SqlParameter("@tennsx", TenNSX),
                new SqlParameter("@tenquocgia", TenQuocGia));
        }
        // Xoá nhà sản xuất
        public bool XoaNhaSanXuat(ref string err, string MaNSX)
        {
            return db.MyExecuteNonQuery("USP_XoaNhaSanXuat", CommandType.StoredProcedure, ref err,
                new SqlParameter("@maNSX", MaNSX));
        }
        // Cập nhật nhà sản xuất
        public bool CapNhatNhaSanXuat(ref string err, string MaNSX, string TenNSX, string TenQuocGia)
        {
            return db.MyExecuteNonQuery("USP_CapNhatNhaSanXuat", CommandType.StoredProcedure, ref err,
                new SqlParameter("@ma_nsx", MaNSX),
                new SqlParameter("@ten_nsx", TenNSX),
                new SqlParameter("@ten_quoc_gia", TenQuocGia));
        }
    }
}
