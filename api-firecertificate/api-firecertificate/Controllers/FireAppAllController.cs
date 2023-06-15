using api_rate.Filters;
using api_rate.Helpers;
using api_rate.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace api_rate.Controllers
{
    [JwtCustomAuth]
    public class FireAppAllController : ApiController
    {
        private IGetData _getData = null;

        public FireAppAllController(IGetData IGetData)
        {
            _getData = IGetData;
        }

        // POST /api/FireAppAll
        public FireAppDetailsOutput Post([FromBody]FireCertificateApplication objFireApp)
        {
            FireAppDetailsOutput objFireAppDetaitsOutput = new FireAppDetailsOutput();
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
            List<FireCertificateApplication> lstFireApplication = new List<FireCertificateApplication>();

            try
            {
                if (objFireApp.ClientID == null || objFireApp.ClientID == "")
                {
                    throw new Exception("Invalid Client ID.");
                }
                else
                {
                    lstFireApplication = _getData.GetAllFireAppDetails(objFireApp, ref objReturnMsg);
                    if (objReturnMsg.ReturnValue != "OK")                                                                                                                              if (objReturnMsg.ReturnValue != "OK")
                    {
                        throw new Exception("Error occurred when retrieve application details. " + objReturnMsg.ReturnMessage.ToString().Trim());
                    }
                }

            }
            catch(Exception ex)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = ex.Message.ToString().Trim();
            }

            objFireAppDetaitsOutput.ListFireApplication = lstFireApplication;
            objFireAppDetaitsOutput.ReturnMessageInfo = objReturnMsg;

            return objFireAppDetaitsOutput;
        }
    }
}
