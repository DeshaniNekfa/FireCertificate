using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class BankAPIInfo
    {
        public string Version { get; set; }
        public string MerID { get; set; }
        public string AcqID { get; set; }
        public string PurchaseCurrency { get; set; }
        public string PurchaseCurrencyExponent { get; set; }
        public string SignatureMethod { get; set; }
        public string Password { get; set; }
      
        
    }
}