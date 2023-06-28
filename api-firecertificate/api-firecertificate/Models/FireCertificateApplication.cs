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
        public string BuildingDescription { get; set; }
        public int TotalLand { get; set; }
        public string RoadFromCouncil { get; set; }
        public string OwnerName { get; set; }
        public string CurrentFirePlan { get; set; }
        public string Status { get; set; }
        public string Email { get; set; }
        public string DateApplied { get; set; }
        public string DateReviewed { get; set; }
        public string DateIssued { get; set; }
        public string DateAppRej { get; set; }        
        public string ClientID { get; set; }
        public string Supervisor { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string RejectReason { get; set; }
        public string CollectMethod { get; set; }
        //Second application

        // Building Ownership
        public string ApplicantName { get; set; }
        public string BOwnerName { get; set; }
        public string LesseeName { get; set; }
        public string EmergencyContact { get; set; }

        // Building Contact Deatalis
        public string BAddress { get; set; } 
        public string OtherAddresses { get; set; }
        public string DistRoadSigns { get; set; }
        public string ShortestRoad { get; set; }
        public string BTelephone { get; set; }
        public string Mobile { get; set; }

        // Building Details
        public int LandArea { get; set; }
        public int Capacity { get; set; }
        public int Stories { get; set; }
        public string Construction { get; set; }
        public string BuildType { get; set; }

        // Building Approval Details
        public string UnapprovedBuildings { get; set; }
        public string PlanAvailability { get; set; }

        // Current Fire Protection System
        public string Exitways { get; set; }
        public string EmergencyExits { get; set; }

        // Total Manpower
        public int DayManpower { get; set; }
        public int NightManpower { get; set; }

        // Building Water Supply 
        public int TankCapacity { get; set; }
        public string CommonTank { get; set; }
        public string FirehoseLocation { get; set; }

        // Electricity Power Supply 
        public string ElecPhase { get; set; }
        public string Generator { get; set; }
        public string CurrentCircuit { get; set; }
        public string SupervisorVisited { get; set; }
        public string user { get; set; }
    }
}