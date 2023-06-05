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
        bool ValidateApplication(FireCertificateApplication objAppDetails, ref ReturnMsgInfo returnMsg);
        bool SaveApplication(FireCertificateApplication objAppDetails, ref ReturnMsgInfo returnMsg);
    }
}
