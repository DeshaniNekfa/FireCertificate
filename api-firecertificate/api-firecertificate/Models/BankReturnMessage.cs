using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class BankReturnMessage
    {
        public string OrderID { get; set; }
        public string ClientID { get; set; }
        public int ResponseCode { get; set; }
        public int ReasonCode { get; set; }
        public string ReasonCodeDesc { get; set; }
        public string ReferenceNo { get; set; }
        public string PaddedCardNo { get; set; }
        public string AuthCode { get; set; }
        public string BillToFirstName { get; set; }
        public string BillToMiddleName { get; set; }
        public string BillToLastName { get; set; }
        public string Signature { get; set; }
        public string SignatureMethod { get; set; }

    }
}