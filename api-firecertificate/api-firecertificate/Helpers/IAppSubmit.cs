using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using api_rate.Models;

namespace api_rate.Helpers
{
    public interface IAppSubmit
    {
        // Validate values before submitting application
        bool ValidateApplication(FireCertificateApplication objAppDetails, ref ReturnMsgInfo returnMsg);
        // Save application to database tbl_firecertificate_application table 
        bool SaveApplication(FireCertificateApplication objAppDetails, ref ReturnMsgInfo returnMsg);
        // Validate supervisor application values before submitting
        bool ValidateSupervisorApplication(FireSupervisorApplication objSuperAppDetails, ref ReturnMsgInfo returnMsg);
        // Submit and save supervisor application in database
        bool SaveSupervisorApplication(FireSupervisorApplication objSuperAppDetails, ref ReturnMsgInfo returnMsg);
    }
}
