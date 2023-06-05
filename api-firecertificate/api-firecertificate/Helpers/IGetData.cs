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
    }
}