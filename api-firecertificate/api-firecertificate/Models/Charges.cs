using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class Charges
    {
        public int Id { get; set; }
        public string ChargeName { get; set; }
        public double Amount { get; set; }
    }
}