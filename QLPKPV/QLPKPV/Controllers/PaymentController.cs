using QLPKPV.Context;
using QLPKPV.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.SqlClient;


namespace QLPKPV.Controllers
{
    public class PaymentController : Controller
    {
        QLPKPVEntities objQLPKPVEntities = new QLPKPVEntities();
       
        // GET: Payment
        public ActionResult Index( Product product)
        {

            if (Session["idUser"]==null)
            {
                return RedirectToAction("Login", "Home");
            }
            else
            {
                //lấy thông tin giỏ hàng từ biến session
                var lstCart = (List<CartModel>)Session["cart"];
                // gan du lieu cho Order
                Order objOrder = new Order();
                objOrder.Name = "Đơn hàng-"+ product.Name + DateTime.Now.ToString("yyyyMMddHHmmss");
                objOrder.UserId = int.Parse(Session["idUser"].ToString());
                objOrder.CreatedOnUtc = DateTime.Now;
                objOrder.Status = 1;
                objQLPKPVEntities.Orders.Add(objOrder);
                objQLPKPVEntities.SaveChanges();
                //lay OrderId vua moi tao luu vao bnag Order Detail
                int intOrderId = objOrder.Id;
                List<OrderDetail> lstOrderDetail = new List<OrderDetail>();
                foreach(var item in lstCart)
                {
                    OrderDetail objOrderD = new OrderDetail();
                    objOrderD.OrderId = intOrderId;
                    objOrderD.Quantity = item.Quantity;
                    objOrderD.ProductId = item.Product.Id;
                    lstOrderDetail.Add(objOrderD);

                }
                objQLPKPVEntities.OrderDetails.AddRange(lstOrderDetail);
                objQLPKPVEntities.SaveChanges();
            }
            return View();
        }
    }
}