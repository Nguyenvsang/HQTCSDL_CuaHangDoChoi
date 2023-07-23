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
    public partial class frmNhap : Form
    {
        public frmNhap()
        {
            InitializeComponent();
        }

        private void btnHoaDonNhap_Click(object sender, EventArgs e)
        {
            this.Hide();
            frmHoaDonNhap hdn = new frmHoaDonNhap();
            hdn.ShowDialog();
            this.Close();
        }

        private void btnCTHDN_Click(object sender, EventArgs e)
        {
            this.Hide();
            frmChiTietHoaDonNhap cthdn = new frmChiTietHoaDonNhap();
            cthdn.ShowDialog();
            this.Close();
        }
    }
}
