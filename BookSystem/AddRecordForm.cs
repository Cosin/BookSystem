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
    public partial class AddRecordForm : Form
    {
        DataDal dal = new DataDal();
        private MainForm mf = null;
        public AddRecordForm(MainForm mf)
        {
            InitializeComponent();
            this.mf = mf;
        }

        private void AddRecordForm_Load(object sender, EventArgs e)
        {
            var book_list = dal.getBookTypes();
            var person_list = dal.getPersons();

            comboBox1.DataSource = book_list;
            comboBox1.DisplayMember = "name";
            comboBox1.ValueMember = "id";

            comboBox2.DataSource = person_list;
            comboBox2.DisplayMember = "name";
            comboBox2.ValueMember = "id";

            comboBox1.SelectedIndex = 0;
            comboBox2.SelectedIndex = 0;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int book_name = Convert.ToInt32(comboBox1.SelectedValue);
            int reader = Convert.ToInt32(comboBox2.SelectedValue);
            var model = new S_Record()
            {
                reader_id = reader,
                book_id = book_name,
                dtime = DateTime.Now
            };
            var t = dal.addRecord(model);
            if (t.Item1 == 1)
            {
                mf.listView1.Items.Clear();
                foreach (var item in t.Item2)
                {
                    mf.listView1.Items.Add(new ListViewItem(new string[] { item.id.ToString(), item.S_Book.name, item.S_Person.name, item.dtime.ToString() }));
                }
                MessageBox.Show("添加成功");
            }
            else
                MessageBox.Show(t.Item3.ToString());
        }
    }
}
