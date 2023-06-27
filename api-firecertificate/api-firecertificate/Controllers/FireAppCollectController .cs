using api_rate.Filters;
using api_rate.Models;
using api_rate.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Configuration;

namespace api_rate.Controllers
{
    [JwtCustomAuth]
    public class FireAppCollectController  : ApiController
    {
        private IAppSubmit _appSubmit = null;
        private IGetData _getData = null;
        private IEmail _email = null;
        private ISMS _sms = null;

        public FireAppCollectController(IAppSubmit IAppSubmit, IGetData IGetData, IEmail IEmail, ISMS ISMS)
        {
            _appSubmit = IAppSubmit;
            _getData = IGetData;
            _email = IEmail;
            _sms = ISMS;
        }

        // POST /api/FireAppCollect
        public ReturnMsgInfo Post([FromBody]FireCertificateApplication objFireApp) 
        {
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
            FireCertificateApplication objFireCert = new FireCertificateApplication();

            try
            {
                if (objFireApp.ClientID == null || objFireApp.ClientID == "")
                {
                    throw new Exception("Invalid Client ID.");
                }
                else if (objFireApp.Id == null)
                {
                    throw new Exception("Application id is required");
                }
                else if (objFireApp.CollectMethod == null || objFireApp.CollectMethod == "")
                {
                    throw new Exception("Collect Method is required");
                }
                else
                {
                    // Approving Application
                    _appSubmit.SetCollectMethod(objFireApp, ref objReturnMsg);
                                            
                    if (objReturnMsg.ReturnValue == "OK")
                    {
                        objReturnMsg.ReturnValue = "OK";
                        objReturnMsg.ReturnMessage = "Application Collection method set.";
          
                    }
                    else
                    {
                        throw new Exception("Error occured");
                    }
                    
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
