using api_rate.Filters;
using api_rate.Models;
using api_rate.Helpers; 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace api_rate.Controllers
{
    [JwtCustomAuth]
    public class SuperAppAllController : ApiController
    {
        private IGetData _getData = null;
        public SuperAppAllController(IGetData IGetData)
        {
            _getData = IGetData;
        }

        // POST /api/SuperAppAll
        public SuperAppDetailsOutput Post([FromBody]FireSupervisorApplication objSuperApp)
        {
            SuperAppDetailsOutput objSuperAppDetailsOutput = new SuperAppDetailsOutput();
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
            List<FireSupervisorApplication> lstSuperApplication = new List<FireSupervisorApplication>();

            try
            {
                if (objSuperApp.ClientID == null || objSuperApp.ClientID == "")
                {
                    throw new Exception("Invalid Client ID.");
                }
                else
                {
                    // get second application list
                    lstSuperApplication = _getData.GetAllSuperAppDetails(objSuperApp, ref objReturnMsg);
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

            objSuperAppDetailsOutput.ListSuperApplication = lstSuperApplication;
            objSuperAppDetailsOutput.ReturnMessageInfo = objReturnMsg;
            return objSuperAppDetailsOutput; 
        }
    }
}
