using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;
using QLPKPV.Context;

namespace QLPKPV.Areas.Admin.Controllers
{
    public class CategoriesController : Controller
    {
        QLPKPVEntities objQLPKPVEntities = new QLPKPVEntities();

        // GET: Admin/Categories
        public ActionResult Index(string CurrentFilter, string SearchString, int? page)
        {
            List<Category> listCategory = new List<Category>();
            listCategory = objQLPKPVEntities.Categories.ToList();
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
                listCategory = objQLPKPVEntities.Categories.Where(n => n.Name.Contains(SearchString)).ToList();

            }
            else
            {
                listCategory = objQLPKPVEntities.Categories.ToList();

            }
            ViewBag.CurrentFilter = SearchString;
            // SO luong item = 4
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            // san phham moi dua len dau tien
            listCategory = listCategory.OrderByDescending(n => n.Id).ToList();

            return View(listCategory.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/Categories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = objQLPKPVEntities.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: Admin/Categories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Categories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Avatar,Slug,ShowOnHomePage,DisplayOrder,Deleted,CreatedOnUtc,UpdateOnUtc")] Category category)
        {
            if (ModelState.IsValid)
            {
                objQLPKPVEntities.Categories.Add(category);
                
                objQLPKPVEntities.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(category);
        }

        // GET: Admin/Categories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = objQLPKPVEntities.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Admin/Categories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Avatar,Slug,ShowOnHomePage,DisplayOrder,Deleted,CreatedOnUtc,UpdateOnUtc")] Category category)
        {
            if (ModelState.IsValid)
            {
                objQLPKPVEntities.Entry(category).State = EntityState.Modified;
                objQLPKPVEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(category);
        }

        // GET: Admin/Categories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = objQLPKPVEntities.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Admin/Categories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Category category = objQLPKPVEntities.Categories.Find(id);
            objQLPKPVEntities.Categories.Remove(category);
            objQLPKPVEntities.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                objQLPKPVEntities.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
