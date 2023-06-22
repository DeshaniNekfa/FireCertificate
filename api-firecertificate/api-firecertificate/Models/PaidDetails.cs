using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class PaidDetails
    {
        public string OrderID  { get; set; }
        public string CertificateId { get; set; }
        public string ServiceName { get; set; }
        public string ApplicantName { get; set; }
        public string ApplicantAddress {get; set;}
        public string ApplicantMobile { get; set; }
        //public string ApplicantNIC { get; set; }
        public decimal BankCharges { get; set; }
        public decimal ConsultantFee { get; set; }
        public decimal InspectionFees { get; set; }
        public decimal TotalPayment { get; set; }
        public decimal AnnualCertificate { get; set; }
        public string ClientID { get; set; }
        public int ApplicantionId { get; set; }
        public string Email { get; set; }
        public int ResponseCode { get; set; }
        public int ReasonCode { get; set; }
        public string ReferenceNo { get; set; }
        public string BillToFirstName { get; set; }
        public string BillToMiddleName { get; set; }
        public string BillToLastName { get; set; }
        public string PaddedCardNo { get; set; }
        public string ResultTime { get; set; }

    }
}