using PagedList;
using QLPKPV.Context;
using QLPKPV.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using User = QLPKPV.Context.User;

namespace QLPKPV.Controllers
{
    public class HomeController : Controller
    {
        QLPKPVEntities objQLPKPVEntities = new QLPKPVEntities();
        public ActionResult Index(string SearchString)
        {
            HomeModel objHomeModel = new HomeModel();
            objHomeModel.ListCategory = objQLPKPVEntities.Categories.ToList();
            objHomeModel.ListProducts = objQLPKPVEntities.Products.ToList();
            return View(objHomeModel);

         
        }
        [HttpGet]
        public ActionResult TimKiem(string SearchString, string CurrentFilter, int? page)
        {
            List<Product> timkiem = new List<Product>();
             timkiem=objQLPKPVEntities.Products.ToList();
            if (SearchString != null)
            {
                page = 1;
            }
            else
            {
                SearchString = CurrentFilter;

            }
            if (!string.IsNullOrEmpty(SearchString))
            {
                //lay san pham theo tu khoa tim kiem
                timkiem = objQLPKPVEntities.Products.Where(n => n.Name.Contains(SearchString)).ToList();

            }
            else
            {
                timkiem = objQLPKPVEntities.Products.ToList();

            }
            ViewBag.CurrentFilter = SearchString;
            // SO luong item = 4
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            // san phham moi dua len dau tien
            timkiem= timkiem.OrderByDescending(n => n.Id).ToList();
            return View(timkiem.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Register()
        {
           

            return View();
        }
        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(User _user)
        {
            if (ModelState.IsValid)
            {
                var check = objQLPKPVEntities.Users.FirstOrDefault(s => s.Email == _user.Email);
                if (check == null)
                {
                    _user.Password = GetMD5(_user.Password);
                    objQLPKPVEntities.Configuration.ValidateOnSaveEnabled = false;
                    objQLPKPVEntities.Users.Add(_user);
                    objQLPKPVEntities.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Email already exists";
                    return View();
                }


            }
            return View();


        }

        //create a string MD5
        // ma hoa
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string email, string password)
        {
            if (ModelState.IsValid)
            {


                var f_password = GetMD5(password);
                var data = objQLPKPVEntities.Users.Where(s => s.Email.Equals(email) && s.Password.Equals(f_password)).ToList();
                if (data.Count() > 0)
                {
                    //add session
                    Session["FullName"] = data.FirstOrDefault().FirstName + " " + data.FirstOrDefault().LastName;
                    Session["Email"] = data.FirstOrDefault().Email;
                    Session["idUser"] = data.FirstOrDefault().Id;

                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Login failed";
                    return RedirectToAction("Login");
                }
            }
            return View();
        }


        //Logout
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }
    }
}