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
                        //Set result date
                        objBankReturn.ResultTime = _getDate.GetFormattedDate(DateTime.Now).ToString("yyyy/MM/dd HH:mm").Trim();

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
                                _appsubmit.SetStatusPaidForCert(objFireApp, ref objReturnMsg);

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
                            objPaidDetails.ApplicantName = objFireApp.OwnerName;
                            objPaidDetails.ApplicantAddress = objFireApp.Address;
                            objPaidDetails.ApplicantMobile = objFireApp.Telephone;
                            objPaidDetails.BankCharges = objPayment.BankCharges;
                            objPaidDetails.ConsultantFee = objPayment.ConsultantFee;
                            objPaidDetails.InspectionFees = objPayment.InspectionFees;
                            objPaidDetails.TotalPayment = objPayment.TotAmt;
                            objPaidDetails.AnnualCertificate = objPayment.AnnualCertificate;
                            objPaidDetails.Postal = objPayment.Postal;
                            objPaidDetails.ClientID = objPayment.ClientID;
                            objPaidDetails.ApplicantionId = objFireApp.Id;
                            objPaidDetails.Email = objFireApp.Email;
                            objPaidDetails.ResponseCode = objBankReturn.ResponseCode;
                            objPaidDetails.ReasonCode = objBankReturn.ReasonCode;
                            objPaidDetails.ReferenceNo = objBankReturn.ReferenceNo;
                            objPaidDetails.BillToFirstName = objBankReturn.BillToFirstName;
                            objPaidDetails.BillToMiddleName = objBankReturn.BillToMiddleName;
                            objPaidDetails.BillToLastName = objBankReturn.BillToLastName;
                            objPaidDetails.PaddedCardNo = objBankReturn.PaddedCardNo;
                            objPaidDetails.ResultTime = objBankReturn.ResultTime;

                            objReturnMsg.ReturnValue = "OK";
                            objReturnMsg.ReturnMessage = "Payment Success.";

                            objPaidOutput.PaidDetails = objPaidDetails;
                            objPaidOutput.ReturnMsg = objReturnMsg;

                            if (objReturnMsg.ReturnValue == "OK")
                            {
                                // Sending Email 
                                if (string.IsNullOrEmpty(objFireApp.Email) == false)
                                {
                                    string strMsg = _email.GetEmailMsgBody(Globals.PENDING.ToString().Trim());
                                    string strErMsg = string.Empty;
                                    _email.SendEmail(strMsg, objFireApp.Email.ToString().Trim(), ref strErMsg);
                                }

                                // Sending SMS 
                                string strSMSSending = ConfigurationManager.AppSettings["SMSSending"].ToString().Trim();
                                if (string.IsNullOrEmpty(objFireApp.CertificateId) == false && string.IsNullOrEmpty(objFireApp.Telephone) == false && strSMSSending.ToString().Trim() == "1")
                                {
                                    string strMsg = "Dear Customer,\n Your payment successfully submitted.\n Reference No : " + objFireApp.CertificateId.Trim() + "\n Order Id : " + objPaidDetails.OrderID + "\n Thank You.";
                                    string strErMsg = string.Empty;
                                    _sms.SendSMS(strMsg, objFireApp.Telephone.ToString().Trim(), ref strErMsg);
                                }
                            }                            
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
