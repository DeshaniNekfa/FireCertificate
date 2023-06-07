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
    public class SuperAppSubmitController : ApiController
    {
        private IAppSubmit _appsubmit = null;
        private IGetDate _getDate = null;
        private ISMS _sms = null;
        private IEmail _email = null;
        private IGetData _getData = null;

        public SuperAppSubmitController(IAppSubmit IAppSubmit, IGetDate IGetDate, ISMS ISMS, IEmail IEmail, IGetData IGetData)
        {
            _appsubmit = IAppSubmit;
            _getDate = IGetDate;
            _sms = ISMS;
            _email = IEmail;
            _getData = IGetData;
        }

        // POST api/SuperAppSubmit
        public ReturnMsgInfo Post([FromBody]FireSupervisorApplication objSuperApp)
        {
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();

            try
            {
                //validation
                if (_appsubmit.ValidateSupervisorApplication(objSuperApp, ref objReturnMsg))
                {
                    //application submit
                    _appsubmit.SaveSupervisorApplication(objSuperApp, ref objReturnMsg);
                    if (objReturnMsg.ReturnValue == "OK")
                    {
                        objReturnMsg.ReturnValue = "OK";
                        objReturnMsg.ReturnMessage = "Application Successfully submitted.";

                        // get details by Certificate
                        var objFireAppDetails = _getData.GetApplicationByCertId(objSuperApp, ref objReturnMsg);

                        // Sending Email 
                        if (string.IsNullOrEmpty(objFireAppDetails.Email) == false)
                        {
                            string strMsg = _email.GetEmailMsgBody(Globals.PENDING.ToString().Trim());
                            string strErMsg = string.Empty;
                            _email.SendEmail(strMsg, objFireAppDetails.Email.ToString().Trim(), ref strErMsg);
                        }

                        // Sending SMS 
                        string strSMSSending = ConfigurationManager.AppSettings["SMSSending"].ToString().Trim();
                        if (string.IsNullOrEmpty(objSuperApp.CertificateId) == false && string.IsNullOrEmpty(objFireAppDetails.Telephone) == false && strSMSSending.ToString().Trim() == "1")
                        {
                            string strMsg = "Dear Customer, \n Your fire cerificate application request successfully submitted. \n Reference No : " + objSuperApp.CertificateId.Trim() + " \n Thank You.";
                            string strErMsg = string.Empty;
                            _sms.SendSMS(strMsg, objFireAppDetails.Telephone.ToString().Trim(), ref strErMsg);
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
