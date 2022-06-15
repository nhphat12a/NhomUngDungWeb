using PagedList;
using QLPKPV.Context;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using static QLPKPV.Common;

namespace QLPKPV.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        QLPKPVEntities objQLPKPVEntities = new QLPKPVEntities();
        // GET: Admin/Product
        public ActionResult Index(string CurrentFilter,string SearchString, int? page)
        {
            List<Product> listProduct = new List<Product>();
            listProduct = objQLPKPVEntities.Products.ToList();
            if(SearchString!=null)
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

            return View(listProduct.ToPagedList(pageNumber,pageSize));
        }
        public ActionResult Details(int Id)
        {
            var objProduct = objQLPKPVEntities.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
       
        [HttpGet]
        public ActionResult Create()
        {
            Common objCommon = new Common();
            var lstCat = objQLPKPVEntities.Categories.ToList();
            // chuyen doi anh 
            ListtoDataTableConverter converter = new ListtoDataTableConverter();
            DataTable dtCategory = converter.ToDataTable(lstCat);
            ViewBag.ListCategory = objCommon.ToSelectList(dtCategory, "Id", "Name");

            var lstBrand = objQLPKPVEntities.Brands.ToList();
            // chuyen doi anh 
         
            DataTable dtBrand = converter.ToDataTable(lstBrand);
            ViewBag.ListBrand = objCommon.ToSelectList(dtBrand, "Id", "Name");
            //Loai san pham
            List<ProductType> lstProductType = new List<ProductType>();
            ProductType objProductType = new ProductType();
            objProductType.Id = 01;
            objProductType.Name = "Giảm giá sốc";
            lstProductType.Add(objProductType);
             objProductType = new ProductType();
            objProductType.Id = 02;
            objProductType.Name = "Đề xuất";
            lstProductType.Add(objProductType);
            DataTable dtProductType = converter.ToDataTable(lstProductType);
            ViewBag.ProductType = objCommon.ToSelectList(dtProductType, "Id", "Name");
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(Product objProduct)
        {
            if(ModelState.IsValid)
            {
                try
                {
                    if (objProduct.ImageUpload != null)
                    {
                        // lay hinh
                        string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                        string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                        fileName = fileName + extension;
                        objProduct.Avatar = fileName;
                        objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/Phone"), fileName));

                    }
                    objProduct.CreatedOnUtc = DateTime.Now;
                    objQLPKPVEntities.Products.Add(objProduct);
                    objQLPKPVEntities.SaveChanges();
                    
                    return RedirectToAction("Index");
                }
                catch
                {
                    return View();

                }

            }
            return View(objProduct);
        }
        [HttpGet]
        public ActionResult Delete(int Id)
        {
            var objProduct = objQLPKPVEntities.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpPost]
        public ActionResult Delete(Product objPro)
        {
            var objProduct = objQLPKPVEntities.Products.Where(n => n.Id == objPro.Id).FirstOrDefault();
            objQLPKPVEntities.Products.Remove(objProduct);
            objQLPKPVEntities.SaveChanges();
            return RedirectToAction("Index");
        }
        // edit

        // GET: NhanViens/Edit/5

        public ActionResult Edit(int Id)
        {
            var objProduct = objQLPKPVEntities.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpPost]
        public ActionResult Edit(int Id, Product objProduct)
        {
            if (objProduct.ImageUpload != null)
            {
                // lay hinh
                string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                fileName = fileName + extension;
                objProduct.Avatar = fileName;
                objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/Phone"), fileName));
              
            }
            
            objQLPKPVEntities.Entry(objProduct).State = EntityState.Modified;
           objProduct.UpdateOnUtc = DateTime.Now;
            
            objQLPKPVEntities.SaveChanges();
            return RedirectToAction("Index");
        }
    }

}