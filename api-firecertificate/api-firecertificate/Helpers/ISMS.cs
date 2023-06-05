using api_rate.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace api_rate.Helpers
{
    public interface ISMS
    {
        // Send SMS
        bool SendSMS(string strMsg, string strMobile, ref string strErMsg);
    }
}
