using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using api_rate.Models;
using api_rate.Filters;
using api_rate.Helpers;
using System.Configuration;

namespace api_rate.Controllers
{
    [JwtCustomAuth]
    public class AppSubmitController : ApiController
    {
        private IAppSubmit _appsubmit = null;
        private IGetDate _getDate = null;
        private ISMS _sms = null;
        private IEmail _email = null;

        public AppSubmitController(IAppSubmit IAppSubmit, IGetDate IGetDate, ISMS ISMS, IEmail IEmail)
        {
            _appsubmit = IAppSubmit;
            _getDate = IGetDate;
            _sms = ISMS;
            _email = IEmail;
        }

        // POST api/AppSubmit
        public ReturnMsgInfo Post([FromBody]FireCertificateApplication objApplicationDetails)
        {
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
            try
            {
                //validation
                if (_appsubmit.ValidateApplication(objApplicationDetails, ref objReturnMsg))
                {
                    //application submit
                    _appsubmit.SaveApplication(objApplicationDetails, ref objReturnMsg);
                    if (objReturnMsg.ReturnValue == "OK")
                    {
                        objReturnMsg.ReturnValue = "OK";
                        objReturnMsg.ReturnMessage = "Application Successfully submitted.";

                        // Sending Email 
                        if (string.IsNullOrEmpty(objApplicationDetails.Email) == false)
                        {
                            string strMsg = _email.GetEmailMsgBody(Globals.PENDING.ToString().Trim());
                            string strErMsg = string.Empty;
                            _email.SendEmail(strMsg, objApplicationDetails.Email.ToString().Trim(), ref strErMsg);
                        }

                        // Sending SMS 
                        string strSMSSending = ConfigurationManager.AppSettings["SMSSending"].ToString().Trim();
                        if (string.IsNullOrEmpty(objApplicationDetails.CertificateId) == false && string.IsNullOrEmpty(objApplicationDetails.Telephone) == false && strSMSSending.ToString().Trim() == "1")
                        {
                            string strMsg = "Dear Customer, \n Your fire cerificate application request successfully submitted. \n Reference No : " + objApplicationDetails.CertificateId.Trim() + " \n Thank You.";
                            string strErMsg = string.Empty;
                            _sms.SendSMS(strMsg, objApplicationDetails.Telephone.ToString().Trim(), ref strErMsg);
                        } 
          
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
