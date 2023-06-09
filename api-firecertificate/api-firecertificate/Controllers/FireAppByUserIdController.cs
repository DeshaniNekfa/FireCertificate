using api_rate.Filters;
using api_rate.Helpers;
using api_rate.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace api_rate.Controllers
{
    [JwtCustomAuth]
    public class FireAppByUserIdController : ApiController
    {
        private IGetData _getData = null;

        public FireAppByUserIdController(IGetData IGetData)
        {
            _getData = IGetData;
        }

        //POST api/FireAppByUserId
        public FireAppDetailsOutput Post([FromBody]FireCertificateApplication objFireApp)
        {
            FireAppDetailsOutput objFireAppDetaitsOutput = new FireAppDetailsOutput();
            List<PaymentDetails> lstPayment = new List<PaymentDetails>();
            PaymentDetails objPayment = new PaymentDetails();
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
            List<FireCertificateApplication> lstFireApplication = new List<FireCertificateApplication>();

            try
            {
                if (objFireApp.ClientID == null || objFireApp.ClientID == "")
                {
                    throw new Exception("Invalid Client ID.");
                }
                else
                {
                    // get fire applications list
                    lstFireApplication = _getData.GetAppDetailsByUsr(objFireApp, ref objReturnMsg);

                    // get payment details list
                    foreach (FireCertificateApplication FireApp in lstFireApplication)
                    {
                        FireApp.ClientID = objFireApp.ClientID;
                        objPayment = _getData.GetPaymentDetails(FireApp, ref objReturnMsg);
                        lstPayment.Add(objPayment);
                    }
                    if (objReturnMsg.ReturnValue != "OK")
                    {
                        throw new Exception(objReturnMsg.ReturnMessage.ToString().Trim());
                    }                
                }
            }
            catch (Exception ex)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = ex.Message.ToString().Trim();
            }

            objFireAppDetaitsOutput.ListFireApplication = lstFireApplication;
            objFireAppDetaitsOutput.ListPayment = lstPayment;
            objFireAppDetaitsOutput.ReturnMessageInfo = objReturnMsg;

            return objFireAppDetaitsOutput;
        }
    }
}
