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
    public class AssignSupervisorController : ApiController
    {
        private IAppSubmit _appSubmit = null;
        private IGetData _getData = null;
        private IEmail _email = null;
        private ISMS _sms = null;

        public AssignSupervisorController(IAppSubmit IAppSubmit, IGetData IGetData, IEmail IEmail, ISMS ISMS)
        {
            _appSubmit = IAppSubmit;
            _getData = IGetData;
            _email = IEmail;
            _sms = ISMS;
        }

        // POST /api/AssignSupervisor
        public ReturnMsgInfo Post([FromBody]FireCertificateApplication objFireApp)
        {
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();

            try
            {
                if (objFireApp.ClientID == null || objFireApp.ClientID == "")
                {
                    throw new Exception("Invalid Client ID.");
                }
                else if (objFireApp.CertificateId == null || objFireApp.CertificateId == "")
                {
                    throw new Exception("Application Id");
                }
                else
                {
                    _appSubmit.AssignSupervisor(objFireApp, ref objReturnMsg);

                    if (objReturnMsg.ReturnValue == "OK")
                    {
                        objReturnMsg.ReturnValue = "OK";
                        objReturnMsg.ReturnMessage = "Supervisor Successfully Assigned.";

                        // Sending Email 
                        if (string.IsNullOrEmpty(objFireApp.Email) == false)
                        {
                            string strMsg = _email.GetEmailMsgBody("Supervisor");
                            string strErMsg = string.Empty;
                            _email.SendEmail(strMsg, objFireApp.Email.ToString().Trim(), ref strErMsg);
                        }

                        // Sending SMS 
                        string strSMSSending = ConfigurationManager.AppSettings["SMSSending"].ToString().Trim();
                        if (string.IsNullOrEmpty(objFireApp.CertificateId) == false && string.IsNullOrEmpty(objFireApp.Telephone) == false && strSMSSending.ToString().Trim() == "1")
                        {
                            string strMsg = "Dear Customer, \n a supervisor was assigned to inspect your company. \n Reference No : " + objFireApp.CertificateId.Trim() + " \n Thank You.";
                            string strErMsg = string.Empty;
                            _sms.SendSMS(strMsg, objFireApp.Telephone.ToString().Trim(), ref strErMsg);
                        }

                    }
                    else
                    {
                        throw new Exception("Error occured Assigning Supervisor");
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
