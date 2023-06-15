using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class FireSupervisorApplication
    {
        // Building Ownership
        public int SId { get; set; }
        public string ApplicantName { get; set; }
        public string OwnerName { get; set; }
        public string LesseeName { get; set; }
        public string EmergencyContact { get; set; }

        // Building Contact Deatalis
        public string BAddress { get; set; } // from first form
        public string OtherAddresses { get; set; }
        public string DistRoadSigns { get; set; }
        public string ShortestRoad { get; set; }
        public string BTelephone { get; set; } // from first form
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

        public string ClientID { get; set; }
        public string CertificateId { get; set; }
    }
}