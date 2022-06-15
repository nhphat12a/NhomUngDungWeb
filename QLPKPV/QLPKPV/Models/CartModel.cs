using QLPKPV.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;

namespace QLPKPV.Models
{
    public class CartModel
    {
        public Product  Product { get; set; }
        public int Quantity { get; set; }
    }
}