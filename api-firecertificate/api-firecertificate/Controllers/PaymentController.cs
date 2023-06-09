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
    public class PaymentController : ApiController
    {
        private IAppSubmit _appsubmit = null;
        private IGetData _getData = null;
        private IGetDate _getDate = null;
        private ISMS _sms = null;
        private IEmail _email = null;

        public PaymentController(IAppSubmit IAppSubmit, IGetDate IGetDate, ISMS ISMS, IEmail IEmail, IGetData IGetData)
        {
            _appsubmit = IAppSubmit;
            _getDate = IGetDate;
            _getData = IGetData;
            _sms = ISMS;
            _email = IEmail;
        }

        // POST api/Payment
        public ReturnMsgInfo Post([FromBody]PaymentDetails objPayment)
        {
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
            FireCertificateApplication objFireApp = new FireCertificateApplication();

            try
            {
                // Validation
                if(_appsubmit.ValidatePayment(objPayment, ref objReturnMsg)){
                    // Payment submit
                    _appsubmit.AddPayment(objPayment, ref objReturnMsg);

                    if (objReturnMsg.ReturnValue == "OK")
                    {
                        objFireApp.CertificateId = objPayment.CertificateId;
                        objFireApp.ClientID = objPayment.ClientID;
                        FireCertificateApplication objFireAppDetails = _getData.GetApplicationById(objFireApp, ref objReturnMsg);
                        // Sending Email 
                        if (string.IsNullOrEmpty(objFireAppDetails.Email) == false)
                        {
                            string strMsg = _email.GetEmailMsgBody(Globals.PENDING.ToString().Trim());
                            string strErMsg = string.Empty;
                            _email.SendEmail(strMsg, objFireAppDetails.Email.ToString().Trim(), ref strErMsg);
                        }

                        // Sending SMS 
                        string strSMSSending = ConfigurationManager.AppSettings["SMSSending"].ToString().Trim();
                        if (string.IsNullOrEmpty(objFireAppDetails.CertificateId) == false && string.IsNullOrEmpty(objFireAppDetails.Telephone) == false && strSMSSending.ToString().Trim() == "1")
                        {
                            string strMsg = "Dear Customer, \n Your fire cerificate application request successfully submitted. \n Reference No : " + objFireAppDetails.CertificateId.Trim() + " \n Thank You.";
                            string strErMsg = string.Empty;
                            _sms.SendSMS(strMsg, objFireAppDetails.Telephone.ToString().Trim(), ref strErMsg);
                        }

                        objReturnMsg.ReturnValue = "OK";
                        objReturnMsg.ReturnMessage = "Payment Successfully submitted.";

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
            catch(Exception ex)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = ex.Message.ToString().Trim();
            }

            return objReturnMsg;

        }

    }
}
