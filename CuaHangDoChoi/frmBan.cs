using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CuaHangDoChoi
{
    public partial class frmBan : Form
    {
        public frmBan()
        {
            InitializeComponent();
        }

        private void btnHoaDonBan_Click(object sender, EventArgs e)
        {
            this.Hide();
            frmHoaDonBan hdb = new frmHoaDonBan();
            hdb.ShowDialog();
            this.Close();
        }

        private void btnCTHDB_Click(object sender, EventArgs e)
        {
            this.Hide();
            frmChiTietHoaDonBan cthdb = new frmChiTietHoaDonBan();
            cthdb.ShowDialog();
            this.Close();
        }
    }
}

