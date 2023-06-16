﻿using api_rate.Filters;
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
    public class FireAppApproveController : ApiController
    {
        private IAppSubmit _appSubmit = null;
        private IGetData _getData = null;
        private IEmail _email = null;
        private ISMS _sms = null;
        
        public FireAppApproveController(IAppSubmit IAppSubmit, IGetData IGetData, IEmail IEmail, ISMS ISMS)
        {
            _appSubmit = IAppSubmit;
            _getData = IGetData;
            _email = IEmail;
            _sms = ISMS;
        }
        // POST /api/FireAppApprove
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
                    // Approving Application
                    _appSubmit.SetStatusApprove(objFireApp, ref objReturnMsg);
                                            
                    if (objReturnMsg.ReturnValue == "OK")
                    {
                        objReturnMsg.ReturnValue = "OK";
                        objReturnMsg.ReturnMessage = "Application Successfully approved.";

                        objFireCert = _getData.GetApplicationById(objFireApp, ref objReturnMsg);
                        // Sending Email 
                        if (string.IsNullOrEmpty(objFireCert.Email) == false)
                        {
                            string strMsg = _email.GetEmailMsgBody(Globals.APPROVED.ToString().Trim());
                            string strErMsg = string.Empty;
                            _email.SendEmail(strMsg, objFireCert.Email.ToString().Trim(), ref strErMsg);
                        }

                        // Sending SMS 
                        string strSMSSending = ConfigurationManager.AppSettings["SMSSending"].ToString().Trim();
                        if (string.IsNullOrEmpty(objFireCert.CertificateId) == false && string.IsNullOrEmpty(objFireCert.Telephone) == false && strSMSSending.ToString().Trim() == "1")
                        {
                            string strMsg = "Dear Customer, \n Your fire cerificate application request successfully approved. \n Reference No : " + objFireCert.CertificateId.Trim() + " \n Thank You.";
                            string strErMsg = string.Empty;
                            _sms.SendSMS(strMsg, objFireCert.Telephone.ToString().Trim(), ref strErMsg);
                        }
          
                    }
                    else
                    {
                        throw new Exception("Error occured approve application");
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
