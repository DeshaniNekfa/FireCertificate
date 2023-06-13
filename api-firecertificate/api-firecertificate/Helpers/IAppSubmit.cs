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
        bool SetStatusApprove(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg);

        // Set Application status Rejected
        bool SetStatusReject(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg);

        // Assign Supervisor
        bool AssignSupervisor(FireCertificateApplication objFireApp, ref ReturnMsgInfo objRetuenMsg);

        // Validate Payment
        bool ValidatePayment(PaymentDetails objPayment, ref ReturnMsgInfo objReturnMsg);

        // Add payment
        bool AddPayment(PaymentDetails objPayment, ref ReturnMsgInfo objReturnMsg);

        // Update Municipal Application
        bool UpdateFireCertificate(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg);
    }
}
