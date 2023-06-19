using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class PaidDetailsOutput
    {
        public PaidDetails PaidDetails { get; set; }
        public ReturnMsgInfo ReturnMsg { get; set; }
    }
}