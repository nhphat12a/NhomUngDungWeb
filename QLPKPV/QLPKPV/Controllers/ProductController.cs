using PagedList;
using QLPKPV.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLPKPV.Controllers
{
    public class ProductController : Controller
    {
        QLPKPVEntities objQLPKPVEntities = new QLPKPVEntities();
        // GET: Product
        public ActionResult Details(int Id, string SearchString)
        {
            var objProduct = objQLPKPVEntities.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
        
    }
}