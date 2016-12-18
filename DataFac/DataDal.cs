using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataFac
{
    public class DataDal : bookdbEntities
    {
        bookdbEntities conn = new bookdbEntities();

        public bool doLogin(string user, string pwd)
        {
            var re = conn.S_Admin.Where(u => u.name == user && u.pwd == pwd).FirstOrDefault();
            return re == null ? false : true;
        }

        public List<S_BookType> getBookTypes()
        {
            var re = conn.S_BookType.ToList();
            return re;
        }
    }
}
