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
    public class FireAppByStatusController : ApiController
    {
        private IGetData _getData = null;

        public FireAppByStatusController(IGetData IGetData)
        {
            _getData = IGetData;
        }

        // POST api/FireAppByStatus
        public FireAppDetailsOutput Post([FromBody]FireCertificateApplication objFireApplication)
        {
            FireAppDetailsOutput objAppListOutput = new FireAppDetailsOutput();
            List<PaymentDetails> lstPayment = new List<PaymentDetails>();
            PaymentDetails objPayment = new PaymentDetails();
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
            ReturnMsgInfo objPayReturnMsg = new ReturnMsgInfo();
            List<FireCertificateApplication> lstFireApplication = new List<FireCertificateApplication>();

            try
            {
                if (objFireApplication.ClientID == null || objFireApplication.ClientID == "")
                {
                    throw new Exception("Invalid Client ID.");
                }
                else if (objFireApplication.Status == null || objFireApplication.Status == "")
                {
                    throw new Exception("Status is required.");
                }
                else if (!(objFireApplication.Status == Globals.PENDING.ToString().Trim() || objFireApplication.Status == Globals.APPROVED.ToString().Trim() || objFireApplication.Status == Globals.REJECTED.ToString().Trim() || objFireApplication.Status == Globals.PAID.ToString().Trim()))
                {
                    throw new Exception("Invalid Status.");
                }
                else
                {
                    // get application list
                    lstFireApplication = _getData.GetApplicationByStatus(objFireApplication, ref objReturnMsg);

                    // get payment list
                    foreach (FireCertificateApplication FireApp in lstFireApplication)
                    {
                        FireApp.ClientID = objFireApplication.ClientID;
                        objPayment = _getData.GetPaymentDetails(FireApp, ref objPayReturnMsg);
                        lstPayment.Add(objPayment);
                    }

                    if (objReturnMsg.ReturnValue != "OK")
                    {
                        throw new Exception(objReturnMsg.ReturnMessage.ToString().Trim());
                    }
                }
            }
            catch (Exception e)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = e.Message.ToString().Trim();
            }


            objAppListOutput.ListFireApplication = lstFireApplication;
            objAppListOutput.ListPayment = lstPayment;
            objAppListOutput.ReturnMessageInfo = objReturnMsg;

            return objAppListOutput;
        }

    }
}
