using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class Index
    {
        public string Code { get; set; }
        public int NextId { get; set; }
        public int NextPayment { get; set; }
        public string ClientID { get; set; }
    }
}