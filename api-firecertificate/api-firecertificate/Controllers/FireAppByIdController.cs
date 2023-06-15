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

        // POST /api/FireAppById
        public FireAppByIdOutput Post([FromBody]FireCertificateApplication objFireApplication)
        {
            FireAppByIdOutput objFireAppByIdOutput = new FireAppByIdOutput();
            FireSupervisorApplication objSuperApp = new FireSupervisorApplication();
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
            ReturnMsgInfo objPayReturnMsg = new ReturnMsgInfo();
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
                    // get first application
                    objFireApp = _getData.GetApplicationById(objFireApplication, ref objReturnMsg);

                    // assign certId for payment
                    objFireApplication.CertificateId = objFireApp.CertificateId;

                    //get payment details
                    objPayment = _getData.GetPaymentDetails(objFireApplication, ref objPayReturnMsg);

                    // assign cert Id for second application
                    objSuperApp.CertificateId = objFireApplication.CertificateId;

                    //assign client id for second application 
                    objSuperApp.ClientID = objFireApplication.ClientID;

                    // get second application
                    objSuperApp = _getData.GetSupervisorApplicationByFireAppID(objSuperApp, ref objReturnMsg);

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
            objFireAppByIdOutput.SuperApplication = objSuperApp;
            objFireAppByIdOutput.ReturnMessageInfo = objReturnMsg;

            return objFireAppByIdOutput;
        }
    }
}