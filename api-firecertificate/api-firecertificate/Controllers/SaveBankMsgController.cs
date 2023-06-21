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
    public class SaveBankMsgController : ApiController
    {
        private IAppSubmit _appsubmit = null;
        private IGetDate _getDate = null;
        private IGetData _getData = null;
        private ISMS _sms = null;
        private IEmail _email = null;

        public SaveBankMsgController(IAppSubmit IAppSubmit, IGetDate IGetDate, ISMS ISMS, IEmail IEmail, IGetData IGetData)
        {
            _appsubmit = IAppSubmit;
            _getDate = IGetDate;
            _sms = ISMS;
            _email = IEmail;
            _getData = IGetData;
        }

        // POST /api/SaveBankMsg
        public PaidDetailsOutput Post([FromBody]BankReturnMessage objBankReturn)
        {
            PaidDetailsOutput objPaidOutput = new PaidDetailsOutput();
            PaidDetails objPaidDetails = new PaidDetails();
            PaymentDetails objPayment = new PaymentDetails();
            FireCertificateApplication objFireApp = new FireCertificateApplication();
            BankReturnMessage bankReturn = new BankReturnMessage();
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
 
            try
            {
                if (objBankReturn.ClientID == null || objBankReturn.ClientID == "")
                {
                    throw new Exception("Invalid Client ID.");
                }
                else
                {
                    // validate request
                    if (_appsubmit.ValidateBankReturn(objBankReturn, ref objReturnMsg))
                    {
                        bankReturn = _appsubmit.SubmitBankReturn(objBankReturn, ref objReturnMsg);

                        if (objReturnMsg.ReturnValue == "OK")
                        {
                            // get payment data
                            objPayment = _getData.GetPaymentByPaymentId(objBankReturn, ref objReturnMsg);
                            objFireApp.CertificateId = objPayment.CertificateId;
                            objFireApp.ClientID = objBankReturn.ClientID;

                            //Set Status paid or issued
                            if (objPayment.AnnualCertificate > 0)
                            {
                                _appsubmit.SetStatusIssued(objFireApp, ref objReturnMsg);

                            }
                            else
                            {
                                _appsubmit.SetStatusPaid(objFireApp, ref objReturnMsg);
                            }

                            // get application data
                            objFireApp = _getData.GetApplicationByCertId(objFireApp, ref objReturnMsg);

                            // set paid details
                            objPaidDetails.OrderID = objBankReturn.OrderID;
                            objPaidDetails.CertificateId = objFireApp.CertificateId;
                            objPaidDetails.ServiceName = "Fire Certificate";
                            objPaidDetails.ApplicantName = bankReturn.BillToFirstName + bankReturn.BillToLastName;
                            objPaidDetails.ApplicantAddress = objFireApp.Address;
                            objPaidDetails.ApplicantMobile = objFireApp.Telephone;
                            objPaidDetails.BankCharges = objPayment.BankCharges;
                            objPaidDetails.ConsultantFee = objPayment.ConsultantFee;
                            objPaidDetails.InspectionFees = objPayment.InspectionFees;
                            objPaidDetails.TotalPayment = objPayment.TotAmt;
                            objPaidDetails.AnnualCertificate = objPayment.AnnualCertificate;

                            objReturnMsg.ReturnValue = "OK";
                            objReturnMsg.ReturnMessage = "Payment Success.";

                            objPaidOutput.PaidDetails = objPaidDetails;
                            objPaidOutput.ReturnMsg = objReturnMsg;
                        }
                    }
                    else
                    {
                        objReturnMsg.ReturnValue = "Error";
                        objReturnMsg.ReturnMessage = "Invalid Application";
                    }
                }
            }
            catch (Exception ex)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = ex.Message.ToString().Trim();
            }



            return objPaidOutput;
        }

    }
}
