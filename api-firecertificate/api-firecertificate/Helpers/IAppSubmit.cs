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
    }
}
