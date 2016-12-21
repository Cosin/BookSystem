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
    public partial class MainForm : Form
    {
        DataDal dal = new DataDal();
        public MainForm()
        {
            InitializeComponent();
        }

        private void 关于ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Powered By Hm");
        }

        private void 书籍类型ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new BookTypeForm().Show();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            var book_list = dal.getBooks();
            var record_list = dal.getRecords();
            foreach(var item in book_list)
            {
                book_lv.Items.Add(new ListViewItem(new string[] { item.id.ToString(), item.name,item.author, item.S_BookType.name }));
            }
            foreach (var item in record_list)
            {
                listView1.Items.Add(new ListViewItem(new string[] { item.id.ToString(), item.S_Book.name, item.S_Person.name, item.dtime.ToString() }));
            }
        }

        private void 书架信息ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new BookShelfForm().Show();
        }

        private void 添加书籍ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new AddBookForm(this).Show();
        }

        private void 添加新借阅ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new AddRecordForm(this).Show();
        }
    }
}
