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
        // Validate Municipal Council Application
        bool ValidateApplication(FireCertificateApplication objAppDetails, ref ReturnMsgInfo returnMsg);

        // Submit Municipal Council Application 
        bool SaveApplication(FireCertificateApplication objAppDetails, ref ReturnMsgInfo returnMsg);

        // Validate Fire Department Application
        bool ValidateSupervisorApplication(FireSupervisorApplication objSuperAppDetails, ref ReturnMsgInfo returnMsg);

        // Submit Fire Department Application
        bool SaveSupervisorApplication(FireSupervisorApplication objSuperAppDetails, ref ReturnMsgInfo returnMsg);

        // Set Application status Approved
        bool SetStatusApprove(FireCertificateApplication objFireApp, ReturnMsgInfo objReturnMsg);

        // Set Application status Rejected
        bool SetStatusReject(FireCertificateApplication objFireApp, ReturnMsgInfo objReturnMsg);
    }
}
