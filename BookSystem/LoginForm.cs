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
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string user = textBox1.Text;
            string pwd = textBox2.Text;
            if (user.Length < 5 || pwd.Length < 5)
                MessageBox.Show("用户名或密码不能小于5位");
            else
            {
                DataDal dal = new DataDal();
                var re = dal.doLogin(user, pwd);
                if (re)
                {
                    Hide();
                    new MainForm().Show();
                }
                else
                    MessageBox.Show("用户名或密码错误");
            }
        }
    }
}
