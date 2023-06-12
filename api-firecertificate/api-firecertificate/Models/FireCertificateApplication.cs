using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class FireCertificateApplication
    {
        public int Id { get; set; }
        public string CertificateId { get; set; }
        public string CompanyName { get; set; }
        public string Address { get; set; }
        public string Telephone { get; set; }
        public int DistanceFromCouncil { get; set; }
        public string NatureOfBusiness { get; set; }
        public string BuildingPlan { get; set; }
        public int TotalLand { get; set; }
        public string RoadFromCouncil { get; set; }
        public string OwnerName { get; set; }
        public string CurrentFirePlan { get; set; }
        public string Status { get; set; }
        public string Email { get; set; }
        public string DateApplied { get; set; }
        public string DateReviewed { get; set; }
        public string ClientID { get; set; }
        public string Supervisor { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
    }
}