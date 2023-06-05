using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class DatabaseDetailsInfo
    {
        public string EncriptedLocationID { get; set; }
        public string DecriptedLocationID { get; set; }
        public string CouncilName { get; set; }
        public string BranchName { get; set; }
        public string LocationID { get; set; }
        public string BranchID { get; set; }
        public decimal ConvenienceFeePercentage { get; set; }
        public decimal ViewPercentage { get; set; }
        public string ClientMask { get; set; }
        public BankAPIInfo BankAPIInfo { get; set; }
        public string FromEmail { get; set; }
        public string EmailContactNo { get; set; }
        public string ID { get; set; }
        public decimal FixedAmount { get; set; }
        public decimal MinAmount { get; set; }
        public string Type { get; set; }
        public string URL { get; set; }
    }
}