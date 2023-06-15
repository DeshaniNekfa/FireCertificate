using api_rate.Filters;
using api_rate.Helpers;
using api_rate.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace api_rate.Controllers
{
    [JwtCustomAuth]
    public class FireAppRejectController : ApiController
    {
        private IAppSubmit _appSubmit = null;
        private IGetData _getData = null;
        private IEmail _email = null;
        private ISMS _sms = null;

        public FireAppRejectController(IAppSubmit IAppSubmit, IGetData IGetData, IEmail IEmail, ISMS ISMS)
        {
            _appSubmit = IAppSubmit;
            _getData = IGetData;
            _email = IEmail;
            _sms = ISMS;
        }

        // POST /api/FireAppReject
        public ReturnMsgInfo Post([FromBody]FireSupervisorApplication objSuperApplication)
        {
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
            FireCertificateApplication objFireApp = new FireCertificateApplication();

            try
            {
                if (objSuperApplication.ClientID == null || objSuperApplication.ClientID == "")
                {
                    throw new Exception("Invalid Client ID.");
                }
                else if (objSuperApplication.CertificateId == null || objSuperApplication.CertificateId == "")
                {
                    throw new Exception("Application id is required");
                }
                else
                {
                    objFireApp = _getData.GetApplicationByCertId(objSuperApplication, ref objReturnMsg);

                    objFireApp.ClientID = objSuperApplication.ClientID;

                    // Rejecting Application
                    _appSubmit.SetStatusReject(objFireApp, ref objReturnMsg);

                    if (objReturnMsg.ReturnValue == "OK")
                    {
                        objReturnMsg.ReturnValue = "OK";
                        objReturnMsg.ReturnMessage = "Application Successfully rejected.";

                        // Sending Email 
                        if (string.IsNullOrEmpty(objFireApp.Email) == false)
                        {
                            string strMsg = _email.GetEmailMsgBody(Globals.APPROVED.ToString().Trim());
                            string strErMsg = string.Empty;
                            _email.SendEmail(strMsg, objFireApp.Email.ToString().Trim(), ref strErMsg);
                        }

                        // Sending SMS 
                        string strSMSSending = ConfigurationManager.AppSettings["SMSSending"].ToString().Trim();
                        if (string.IsNullOrEmpty(objFireApp.CertificateId) == false && string.IsNullOrEmpty(objFireApp.Telephone) == false && strSMSSending.ToString().Trim() == "1")
                        {
                            string strMsg = "Dear Customer, \n Your fire cerificate application request rejected. \n Reference No : " + objFireApp.CertificateId.Trim() + " \n Thank You.";
                            string strErMsg = string.Empty;
                            _sms.SendSMS(strMsg, objFireApp.Telephone.ToString().Trim(), ref strErMsg);
                        }

                    }
                    else
                    {
                        throw new Exception("Error occured rejecting application");
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
