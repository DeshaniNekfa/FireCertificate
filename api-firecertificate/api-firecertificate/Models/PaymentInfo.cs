using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class PaymentInfo
    {
        public decimal BankCharges { get; set; }
        public decimal ConsultantFee { get; set; }
        public decimal InspectionFees { get; set; }
        public decimal TotalPayment { get; set; }
        public decimal AnnualCertificate { get; set; }
        public string ClientID { get; set; }
        public string OrderID { get; set; }
    }
}