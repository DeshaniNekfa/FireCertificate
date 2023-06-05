using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class SMSInfo
    {
        public string ToMobile { get; set; }
        public string Message { get; set; }
        public string ModuleName { get; set; }
        public string cUSer { get; set; }
        public string ClientMask { get; set; }
    }
}