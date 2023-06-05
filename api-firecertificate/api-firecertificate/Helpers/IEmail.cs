using api_rate.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace api_rate.Helpers
{
    public interface IEmail
    {
        // Send Email
        bool SendEmail(string strMsg, string strEmail, ref string strErMsg);
        // Get Email Message Body according to status
        string GetEmailMsgBody(string strStatus, FireCertificateApplication objApp = null);

    }
}
