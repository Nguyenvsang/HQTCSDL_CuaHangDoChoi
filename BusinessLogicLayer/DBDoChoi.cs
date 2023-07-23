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
    public class DBDoChoi
    {
        DAL db = null;

        public DBDoChoi()
        {
            db = new DAL();
        }
        // Load danh sách đồ chơi
        public DataSet LayDoChoi()
        {
            return db.ExecuteQueryDataSet("USP_LayDoChoi", CommandType.StoredProcedure);
        }
        // Load danh sách đồ chơi
        public DataSet DoChoiDaBan()
        {
            return db.ExecuteQueryDataSet("USP_DoChoiDaBan", CommandType.StoredProcedure);
        }
        // Load danh sách đồ chơi
        public DataSet DoChoiChuaBan()
        {
            return db.ExecuteQueryDataSet("USP_DoChoiChuaBan", CommandType.StoredProcedure);
        }
        // Thêm đồ chơi
        public bool ThemDoChoi(ref string err, string MaDoChoi, string TenDoChoi, int GiaTien, string MaLoaiDoChoi, string MaNSX, string MaNganKe)
        {
            return db.MyExecuteNonQuery("USP_ThemDoChoi", CommandType.StoredProcedure, ref err,
                new SqlParameter("@ma_do_choi", MaDoChoi),
                new SqlParameter("@ten_do_choi", TenDoChoi),
                new SqlParameter("@gia_tien", GiaTien),
                new SqlParameter("@ma_loai_do_choi", MaLoaiDoChoi),
                new SqlParameter("@ma_nsx", MaNSX),
                new SqlParameter("@ma_ngan_ke", MaNganKe));
        }
        // Xoá đồ chơi
        public bool XoaDoChoi(ref string err, string MaDoChoi)
        {
            return db.MyExecuteNonQuery("USP_XoaDoChoi", CommandType.StoredProcedure, ref err,
                new SqlParameter("@MaDoChoi", MaDoChoi));
        }
        // Cập nhật đồ chơi
        public bool CapNhatDoChoi(ref string err, string MaDoChoi, string TenDoChoi, int GiaTien, string MaLoaiDoChoi, string MaNSX, string MaNganKe)
        {
            return db.MyExecuteNonQuery("USP_CapNhatDoChoi", CommandType.StoredProcedure, ref err,
                new SqlParameter("@madochoi", MaDoChoi),
                new SqlParameter("@tendochoi", TenDoChoi),
                new SqlParameter("@giatien", GiaTien),
                new SqlParameter("@maloaidochoi", MaLoaiDoChoi),
                new SqlParameter("@maNSX", MaNSX),
                new SqlParameter("@manganke", MaNganKe));
        }

        // Tìm kiếm đồ chơi theo mã: UDF_TimDoChoiTheoMa
        public DataSet TimDoChoiTheoMa(string madochoi)
        {
            return db.ExecuteQueryDataSet($"SELECT * FROM UDF_TimDoChoiTheoMa('{madochoi}')", CommandType.Text);        
        }

        // Tìm kiếm đồ chơi theo tên: UDF_TimDoChoiTheoTen 
        public DataSet TimDoChoiTheoTen(string tendochoi)
        {
            return db.ExecuteQueryDataSet($"SELECT * FROM UDF_TimDoChoiTheoTen('{tendochoi}')", CommandType.Text);
        }

    }
}
