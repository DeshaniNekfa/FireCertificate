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
    public class SuperAppByFireIdController : ApiController
    {
        private IGetData _getData = null;

        public SuperAppByFireIdController(IGetData IGetData)
        {
            _getData = IGetData;
        }

        // POST api/SuperAppByFireId

        public SuperAppByIdOutput Post([FromBody]FireSupervisorApplication objSuperApp)
        {
            SuperAppByIdOutput objSuperAppByIdOutput = new SuperAppByIdOutput();
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
            FireSupervisorApplication objFireApp = new FireSupervisorApplication();

            try
            {
                if (objSuperApp.ClientID == null || objSuperApp.ClientID == "")
                {
                    throw new Exception("Invalid Client ID.");
                }
                else if (objSuperApp.CertificateId == null || objSuperApp.CertificateId == "")
                {
                    throw new Exception("Invalid Certificate ID.");
                }
                else
                {
                    objSuperApp = _getData.GetSupervisorApplicationByFireAppID(objSuperApp, ref objReturnMsg);
                    if (objReturnMsg.ReturnValue != "OK")
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

            objSuperAppByIdOutput.FireSuperApplication = objSuperApp;
            return objSuperAppByIdOutput;
        }
    }
}
