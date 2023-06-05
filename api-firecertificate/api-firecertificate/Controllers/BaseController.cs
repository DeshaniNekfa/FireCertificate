using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace api_rate.Controllers
{
    public class BaseController : ApiController
    {
        internal string LogException(string LocationID, Exception ex)
        {
            string errorMessage = LocationID + ":  " + "Exception in RP.Net API  Error: Message: {" + ex.Message + "}{Environment.NewLine}StackTrace: {" + ex.StackTrace + "}{Environment.NewLine}InnerException Message(if any): {" + ex.InnerException + "}";
            return errorMessage;
        }
    }
}
