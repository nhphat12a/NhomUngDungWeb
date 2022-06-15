using PagedList;
using QLPKPV.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLPKPV.Controllers
{
    public class CategoryController : Controller
    {
        QLPKPVEntities objQLPKPVEntities = new QLPKPVEntities();
        
        // GET: Category
        public ActionResult Index()
        {
            var listCategory = objQLPKPVEntities.Categories.ToList();
            return View(listCategory);
        }
        public ActionResult ProductCategory(int Id, string CurrentFilter, string SearchString, int? page)
        {
            List<Product> listProduct = new List<Product>();
            listProduct = objQLPKPVEntities.Products.Where(n => n.CategoryId == Id).ToList();
      
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
                listProduct = objQLPKPVEntities.Products.Where(n => n.Name.Contains(SearchString)).ToList();

            }
            else
            {
                listProduct = objQLPKPVEntities.Products.ToList();

            }
            ViewBag.CurrentFilter = SearchString;
            // SO luong item = 4
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            // san phham moi dua len dau tien
            listProduct = listProduct.OrderByDescending(n => n.Id).ToList();

            return View(listProduct.ToPagedList(pageNumber, pageSize));
            
        }
        
       
    }
}