using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class Globals
    {
        // Application Status
        public static string PENDING = "Pending";
        public static string PAID = "Paid";
        public static string ASSIGNED = "Assigned";
        public static string HOLD = "Hold";
        public static string APPROVED = "Approved";
        public static string REJECTED = "Rejected";
        public static string ISSUED = "Issued";

        // Payment Description
        public static string INSPECTION = "Inspection";
        public static string ANNUAL = "Certificate";
        public static string Counseling = "Counseling";
    }
}