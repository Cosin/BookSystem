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

        public List<S_BookShelf> getBookShelfs()
        {
            var re = conn.S_BookShelf.ToList();
            return re;
        }

        public List<S_BookType> delBookType(string name)
        {
            var re = conn.S_BookType.Where(t => t.name == name).FirstOrDefault();
            conn.S_BookType.Remove(re);
            conn.SaveChanges();
            return getBookTypes();
        }

        public List<S_BookShelf> delBookShelf(string name)
        {
            var re = conn.S_BookShelf.Where(t => t.name == name).FirstOrDefault();
            conn.S_BookShelf.Remove(re);
            conn.SaveChanges();
            return getBookShelfs();
        }

        public Tuple<int, List<S_BookType>, object> addBookType(S_BookType model)
        {
            var re = conn.S_BookType.Where(t => t.name == model.name).FirstOrDefault();
            if (re != null)
                return new Tuple<int, List<S_BookType>, object>(-1, null, "已存在");
            conn.S_BookType.Add(model);
            conn.SaveChanges();
            return new Tuple<int, List<S_BookType>, object>(1, getBookTypes(),null);
        }

        public Tuple<int, List<S_BookShelf>, object> addBookShelf(S_BookShelf model)
        {
            var re = conn.S_BookShelf.Where(t => t.name == model.name).FirstOrDefault();
            if (re != null)
                return new Tuple<int, List<S_BookShelf>, object>(-1, null, "已存在");
            conn.S_BookShelf.Add(model);
            conn.SaveChanges();
            return new Tuple<int, List<S_BookShelf>, object>(1, getBookShelfs(), null);
        }

        public Tuple<int, List<S_Book>, object> addBook(S_Book model)
        {
            var re = conn.S_Book.Where(t => t.name == model.name).FirstOrDefault();
            if (re != null)
                return new Tuple<int, List<S_Book>, object>(-1, null, "已存在");
            conn.S_Book.Add(model);
            conn.SaveChanges();
            return new Tuple<int, List<S_Book>, object>(1, getBooks(), null);
        }

        public List<S_Book> getBooks()
        {
            var re = conn.S_Book.ToList();
            return re;
        }


    }
}
