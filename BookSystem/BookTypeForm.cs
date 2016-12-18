using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DataFac;

namespace BookSystem
{
    public partial class BookTypeForm : Form
    {
        DataDal dal = new DataDal();

        public BookTypeForm()
        {
            InitializeComponent();
        }

        private void BookTypeForm_Load(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            var list = dal.getBookTypes();
            foreach(var item in list)
            {
                listBox1.Items.Add(item.name);
            }
        }

        private void listBox1_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            int index = listBox1.IndexFromPoint(e.Location);
            if (index != ListBox.NoMatches)
            {
                var list = dal.delBookType(listBox1.Items[index].ToString());
                listBox1.Items.Clear();
                foreach (var item in list)
                {
                    listBox1.Items.Add(item.name);
                }
                MessageBox.Show("删除成功");
            }
        }
    }
}
