using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using api_rate.Models;

namespace api_rate.Helpers
{
    public interface IGetData
    {
        // Get one Fire application by its unique Id  
        FireCertificateApplication GetApplicationById(FireCertificateApplication objApplication, ref ReturnMsgInfo returnMsg);

        // Get Application by Certificate Id
        public FireCertificateApplication GetApplicationByCertId(FireSupervisorApplication objApplication, ref ReturnMsgInfo returnMsg)

        // Get List of fire applications by its status(pending/approved/paid/rejected)
        List<FireCertificateApplication> GetApplicationByStatus(FireCertificateApplication objApplication, ref ReturnMsgInfo returnMsg);

        // Get user details from user ID
        string GetUserDetailsById(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg);

        // Get List of fire applications by username
        List<FireCertificateApplication> GetAppDetailsByUsr(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg);

        // Get List of all fire applications
        List<FireCertificateApplication> GetAllFireAppDetails(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg);

        // Get Supervisor Application by Fire application Id
        FireSupervisorApplication GetSupervisorApplicationByFireAppID(FireSupervisorApplication objSuperApp, ref ReturnMsgInfo returnMsg);

        // Get All supervisor applications
        List<FireSupervisorApplication> GetAllSuperAppDetails(FireSupervisorApplication objSuperApp, ref ReturnMsgInfo returnMsg);
    }
}