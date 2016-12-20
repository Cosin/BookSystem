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
    public partial class AddBookForm : Form
    {
        DataDal dal = new DataDal();
        private MainForm mf = null;
        public AddBookForm(MainForm mf)
        {
            InitializeComponent();
            this.mf = mf;
        }

        private void AddBookForm_Load(object sender, EventArgs e)
        {

            var type_list = dal.getBookTypes();
            var shelf_list = dal.getBookShelfs();

            comboBox1.DataSource = type_list;
            comboBox1.DisplayMember = "name";
            comboBox1.ValueMember = "id";

            comboBox2.DataSource = shelf_list;
            comboBox2.DisplayMember = "name";
            comboBox2.ValueMember = "id";

            comboBox1.SelectedIndex = 0;
            comboBox2.SelectedIndex = 0;

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string name = textBox1.Text;
            string author = textBox2.Text;
            int type_id = Convert.ToInt32(comboBox1.SelectedValue);
            int shelf_id = Convert.ToInt32(comboBox2.SelectedValue);
            var model = new S_Book()
            {
                name = name,
                author = author,
                type_id = type_id,
                shelf_id = shelf_id
            };
            var t = dal.addBook(model);
            if (t.Item1 == 1)
            {
                mf.book_lv.Items.Clear();
                foreach (var item in t.Item2)
                {
                    mf.book_lv.Items.Add(new ListViewItem(new string[] { item.id.ToString(), item.name, item.author, item.S_BookType.name }));
                }
                MessageBox.Show("添加成功");
            }
            else
                MessageBox.Show(t.Item3.ToString());
        }

    }
}
