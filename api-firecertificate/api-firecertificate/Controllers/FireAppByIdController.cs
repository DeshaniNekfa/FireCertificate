using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using api_rate.Models;
using api_rate.Helpers;
using api_rate.Filters;
using System.Web.Http;
using System.Net.Http;

namespace api_rate.Controllers
{
    [JwtCustomAuth]
    public class FireAppByIdController : ApiController
    {
        private IGetData _getData = null;

        public FireAppByIdController(IGetData IGetData)
        {
            _getData = IGetData;
        }

        // POST api/FireAppById
        public FireAppByIdOutput Post([FromBody]FireCertificateApplication objFireApplication)
        {
            FireAppByIdOutput objFireAppByIdOutput = new FireAppByIdOutput();
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
            PaymentDetails objPayment = new PaymentDetails();
            FireCertificateApplication objFireApp = new FireCertificateApplication();

            try
            {

                if (objFireApplication.ClientID == null || objFireApplication.ClientID == "")
                {
                    throw new Exception("Invalid Client ID.");
                }
                else if (objFireApplication.Id == null || objFireApplication.Id == 0)
                {
                    throw new Exception("Application id is required");
                }
                else
                {
                    objFireApp = _getData.GetApplicationById(objFireApplication, ref objReturnMsg);
                    objFireApplication.CertificateId = objFireApp.CertificateId;
                    objPayment = _getData.GetPaymentDetails(objFireApplication, ref objReturnMsg);
                    if (objReturnMsg.ReturnValue != "OK")
                    {
                        throw new Exception("Error occurred when retrieve application details. " + objReturnMsg.ReturnMessage.ToString().Trim());
                    }
                }
            }
            catch (Exception ex)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = ex.Message.ToString().Trim();
            }

            objFireAppByIdOutput.FireApplication = objFireApp;
            objFireAppByIdOutput.PaymentDetails = objPayment;

            return objFireAppByIdOutput;
        }
    }
}