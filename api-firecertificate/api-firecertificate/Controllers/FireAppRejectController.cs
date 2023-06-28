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
                else
                {
                    // Rejecting Application
                    _appSubmit.SetStatusReject(objFireApp, ref objReturnMsg);

                    if (objReturnMsg.ReturnValue == "OK")
                    {
                        // Get application data for email and mobile 
                        objFireCert = _getData.GetApplicationById(objFireApp, ref objReturnMsg);

                        // Sending Email 
                        if (string.IsNullOrEmpty(objFireCert.Email) == false)
                        {
                            string strMsg = _email.GetEmailMsgBody(Globals.REJECTED.ToString().Trim(), objFireApp);
                            string strErMsg = string.Empty;
                            _email.SendEmail(strMsg, objFireCert.Email.ToString().Trim(), ref strErMsg);
                        }

                        // Sending SMS 
                        string strSMSSending = ConfigurationManager.AppSettings["SMSSending"].ToString().Trim();
                        if (string.IsNullOrEmpty(objFireCert.CertificateId) == false && string.IsNullOrEmpty(objFireCert.Telephone) == false && strSMSSending.ToString().Trim() == "1")
                        {
                            string strMsg = "Dear Customer,\n Your fire cerificate application request rejected.\n Reason for rejection: " + objFireCert.RejectReason+ "\n Reference No : " + objFireCert.CertificateId.Trim() + "\n Thank You.";
                            string strErMsg = string.Empty;
                            _sms.SendSMS(strMsg, objFireCert.Telephone.ToString().Trim(), ref strErMsg);
                        }

                        objReturnMsg.ReturnValue = "OK";
                        objReturnMsg.ReturnMessage = "Application Successfully rejected.";
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
