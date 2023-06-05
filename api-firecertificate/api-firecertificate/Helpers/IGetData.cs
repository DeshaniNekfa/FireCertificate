using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using api_rate.Models;

namespace api_rate.Helpers
{
    public interface IGetData
    {
        FireCertificateApplication GetApplicationById(FireCertificateApplication objApplication, ref ReturnMsgInfo returnMsg);

        List<FireCertificateApplication> GetApplicationByStatus(FireCertificateApplication objApplication, ref ReturnMsgInfo returnMsg);

        string GetUserDetailsById(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg);

        List<FireCertificateApplication> GetAppDetailsByUsr(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg);
    }
}