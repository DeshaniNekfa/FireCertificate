using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using api_rate.Models;
using api_rate.Filters;
using api_rate.Helpers;

namespace api_rate.Controllers
{
    [JwtCustomAuth]
    public class AppSubmitController : ApiController
    {
        private IAppSubmit _appsubmit = null;

        public AppSubmitController(IAppSubmit IAppSubmit)
        {
            _appsubmit = IAppSubmit;
        }

        public ReturnMsgInfo Post([FromBody]FireCertificateApplication objApplicationDetails)
        {
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
            try
            {
                if (_appsubmit.ValidateApplication(objApplicationDetails, ref objReturnMsg))
                {
                    _appsubmit.SaveApplication(objApplicationDetails, ref objReturnMsg);
                    if (objReturnMsg.ReturnValue == "OK")
                    {
                        objReturnMsg.ReturnValue = "OK";
                        objReturnMsg.ReturnMessage = "Application Successfully submitted.";


                    }
                    else
                    {
                        throw new Exception("Error occured saving application");
                    }
                }
                else
                {
                    objReturnMsg.ReturnValue = "Error";
                    objReturnMsg.ReturnMessage = "Invalid Application";
                }

            }
            catch (Exception ex)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = ex.Message.ToString().Trim();
            }

            return objReturnMsg;
        }
    }
}
