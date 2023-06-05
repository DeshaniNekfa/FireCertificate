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
    public class FireAppByUserIdController : ApiController
    {
        private IGetData _getData = null;

        public FireAppByUserIdController(IGetData IGetData)
        {
            _getData = IGetData;
        }

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
                    string strUsername = _getData.GetUserDetailsById(objFireApp, ref objReturnMsg);
                    if (objReturnMsg.ReturnValue == "OK")
                    {
                        objFireApp.User = strUsername.Trim();
                        lstFireApplication = _getData.GetAppDetailsByUsr(objFireApp, ref objReturnMsg);
                        if (objReturnMsg.ReturnValue != "OK")
                        {
                            throw new Exception(objReturnMsg.ReturnMessage.ToString().Trim());
                        }
                    }
                    else
                    {
                        throw new Exception("Error occurred when retrieve user info. " + objReturnMsg.ReturnMessage.ToString().Trim());
                    }
                }
            }
            catch (Exception ex)
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
