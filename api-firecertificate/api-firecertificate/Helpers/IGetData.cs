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
        FireCertificateApplication GetApplicationByCertId(FireSupervisorApplication objApplication, ref ReturnMsgInfo returnMsg);

        // Get List of fire applications by username
        List<FireCertificateApplication> GetAppDetailsByUsr(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg);

        // Get List of all fire applications
        List<FireCertificateApplication> GetAllFireAppDetails(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg);

        // Get Supervisor Application by Certificate Id
        FireSupervisorApplication GetSupervisorApplicationByFireAppID(FireSupervisorApplication objSuperApp, ref ReturnMsgInfo returnMsg);

        // Get All supervisor applications
        List<FireSupervisorApplication> GetAllSuperAppDetails(FireSupervisorApplication objSuperApp, ref ReturnMsgInfo returnMsg);
        
        // Get All charges 
        List<Charges> GetAllCharges(FireCertificateApplication objFireApp, ref ReturnMsgInfo returnMsg);

        //Get charge by Id
        Charges GetChargeById(Charges objCharge, ref ReturnMsgInfo returnMsg);

        // Get payment details
        PaymentDetails GetPaymentDetails(FireCertificateApplication objFireApp, ref ReturnMsgInfo returnMsg);

        // Get applications to date
        List<FireCertificateApplication> GetAppDetailsByDate(FireCertificateApplication objFireApp, ref ReturnMsgInfo returnMsg);
    }
}