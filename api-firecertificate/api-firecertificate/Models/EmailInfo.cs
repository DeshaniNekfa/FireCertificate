using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class EmailInfo
    {
        public string ToMail { get; set; }
        public string CouncilName { get; set; }
        public string OrderID { get; set; }
        public string CustomNo { get; set; }
        public string OwnerName { get; set; }
        public string PayDate { get; set; }
        public string PayAmount { get; set; }
        public string ConvenienceFee { get; set; }
        public string TotalPaidAmount { get; set; }
        public string PayBy { get; set; }
        public string NameOnCard { get; set; }
        public string ReferenceNo { get; set; }
        public string FromEmail { get; set; }
        public string EmailContactNo { get; set; } 
    }
}