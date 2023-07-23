using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
// ADO.NET
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class DAL
    {
        SqlConnection cnn = null;
        SqlCommand cmd = null;
        SqlDataAdapter adp = null;

        string strConnect = "Data Source = (local); Initial Catalog = CuaHangDoChoi; Integrated Security = True";

        public DAL()
        {
            cnn = new SqlConnection(strConnect);
            cmd = cnn.CreateCommand();
        }

        // Thủ tục và hàm lấy danh sách
        public DataSet ExecuteQueryDataSet(string strSQL, CommandType ct)
        {
            if (cnn.State == ConnectionState.Open)
                cnn.Close();
            cnn.Open();
            cmd.CommandText = strSQL;
            cmd.CommandType = ct;
            cmd.Parameters.Clear();
            adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            return ds;
        }

        // Insert, Update, Delete
        public bool MyExecuteNonQuery(string strSQL, CommandType ct, ref string error, params SqlParameter[] param)
        {
            bool f = false;
            if (cnn.State == ConnectionState.Open)
                cnn.Close();
            cnn.Open();
            //Command
            cmd.Parameters.Clear();
            cmd.CommandText = strSQL;
            cmd.CommandType = ct;
            //Command
            foreach (SqlParameter p in param)
                cmd.Parameters.Add(p);
            //Run command
            try
            {
                cmd.ExecuteNonQuery();
                f = true;
            }
            catch (SqlException ex)
            {
                error = ex.Message;
            }
            finally
            {
                cnn.Close();
            }
            return f;
        }
        // Hàm trả về 1 giá trị
        public int MyExecuteScalarFunction(string strSQL)
        {
            if (cnn.State == ConnectionState.Open)
                cnn.Close();
            cnn.Open();
            // cmd
            cmd.Parameters.Clear();
            cmd.CommandText = strSQL;
            cmd.CommandType = CommandType.Text;

            // Phòng trường hợp null
            int result = 0;

            int? count = cmd.ExecuteScalar() as int?; // Thực hiện lệnh, cast sang int
            if (count != null)
                result = count.Value;

            return result;
        }

        public string ExecuteQueryXML(string strSQL, CommandType ct, params SqlParameter[] p)
        {
            cmd.CommandText = strSQL;
            cmd.CommandType = ct;
            adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            return ds.GetXml();
        }
    }
}
