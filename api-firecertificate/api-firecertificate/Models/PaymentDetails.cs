using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class PaymentDetails
    {
        public int Id { get; set; }
        public string CertificateId { get; set; }
        public string Note { get; set; }
        public decimal TotAmt { get; set; }
        public string User { get; set; }
        public DateTime Date { get; set; }
        public string PaymentType { get; set; }
        public string PaidDescription { get; set; }
        public string PaymentID { get; set; }
        public string BillNo { get; set; }
    }
}