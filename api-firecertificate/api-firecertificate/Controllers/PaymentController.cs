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

        // POST /api/Payment
        public ReturnMsgPayment Post([FromBody]PaymentDetails objPayment)
        {
            ReturnMsgPayment objReturnPayment = new ReturnMsgPayment();
            PaymentInfo objPaymentInfo = new PaymentInfo();
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
            FireCertificateApplication objFireApp = new FireCertificateApplication();
            List<Charges> lstCharges = new List<Charges>();

            try
            {
                if (objPayment.ClientID == null || objPayment.ClientID == "")
                {
                    throw new Exception("Invalid Client ID.");
                }

                // Validation
                if(_appsubmit.ValidatePayment(objPayment, ref objReturnMsg))
                {
                    objFireApp.Id = objPayment.Id;
                    objFireApp.ClientID = objPayment.ClientID;

                    // Get all charges
                    lstCharges = _getData.GetAllCharges(objFireApp, ref objReturnMsg);

                    // Get application by Id
                    objFireApp = _getData.GetApplicationById(objFireApp, ref objReturnMsg);

                    objPayment.CertificateId = objFireApp.CertificateId;
                    objPayment.BillNo = "";
                    objPayment.PaymentID = "";
                    objPayment.Note = "";
                    objPayment.Date = DateTime.Now.ToString("yyyy/MM/dd HH:mm");

                    if (objFireApp.Status == Globals.PENDING.ToString().Trim())
                    {
                        // add paid description
                        objPayment.PaidDescription = Globals.INSPECTION.ToString().Trim();

                        //Add amount
                        foreach (Charges objCharge in lstCharges)
                        {
                            if (objCharge.ChargeName != Globals.ANNUAL.ToString().Trim())
                            {
                                objPayment.TotAmt = objPayment.TotAmt + objCharge.Amount;
                            }

                            //Set return info
                            if (objCharge.ChargeName == Globals.Bank.ToString().Trim())
                            {
                                objPayment.BankCharges = objCharge.Amount;
                                objPaymentInfo.BankCharges = objCharge.Amount;
                            }
                            if (objCharge.ChargeName == Globals.Counseling.ToString().Trim())
                            {
                                objPayment.ConsultantFee = objCharge.Amount;
                                objPaymentInfo.ConsultantFee = objCharge.Amount;
                            }
                            if (objCharge.ChargeName == Globals.INSPECTION.ToString().Trim())
                            {
                                objPayment.InspectionFees = objCharge.Amount;
                                objPaymentInfo.InspectionFees = objCharge.Amount;
                            }
                        }

                        // Payment submit
                        objPayment = _appsubmit.AddPayment(objPayment, ref objReturnMsg);

                        // return values setting
                        objPaymentInfo.TotalPayment = objPayment.TotAmt;
                        objPaymentInfo.ClientID = objPayment.ClientID;
                        objPaymentInfo.PaymentID = objPayment.PaymentID;

                    }
                    else if (objFireApp.Status == Globals.APPROVED.ToString().Trim())
                    {
                        // add paid description
                        objPayment.PaidDescription = Globals.ANNUAL.ToString().Trim();

                        //Add amount
                        foreach (Charges objCharge in lstCharges)
                        {
                            if (objCharge.ChargeName == Globals.ANNUAL.ToString().Trim() || objCharge.ChargeName == Globals.Bank.ToString().Trim())
                            {
                                objPayment.TotAmt = objPayment.TotAmt + objCharge.Amount;

                            }
                            if (objCharge.ChargeName == Globals.ANNUAL.ToString().Trim())
                            {
                                objPayment.AnnualCertificate = objCharge.Amount;
                                objPaymentInfo.AnnualCertificate = objCharge.Amount;
                            }
                            if (objCharge.ChargeName == Globals.Bank.ToString().Trim())
                            {
                                objPayment.BankCharges = objCharge.Amount;
                                objPaymentInfo.BankCharges = objCharge.Amount;
                            }
                        }

                        // Payment submit
                        objPayment = _appsubmit.AddPayment(objPayment, ref objReturnMsg);

                        // return values setting
                        objPaymentInfo.TotalPayment = objPayment.TotAmt;
                        objPaymentInfo.ClientID = objPayment.ClientID;
                        objPaymentInfo.PaymentID = objPayment.PaymentID;

                    }
                    else
                    {
                        objReturnMsg.ReturnValue = "Error";
                        objReturnMsg.ReturnMessage = "Invalid Payment";
                    }

                    if (objReturnMsg.ReturnValue == "OK")
                    {
                        objFireApp.CertificateId = objPayment.CertificateId;
                        objFireApp.ClientID = objPayment.ClientID;
                        
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
                            string strMsg = "Dear Customer, \n Your fire cerificate application request successfully submitted. \n Reference No : " + objFireApp.CertificateId.Trim() + " \n Thank You.";
                            string strErMsg = string.Empty;
                            _sms.SendSMS(strMsg, objFireApp.Telephone.ToString().Trim(), ref strErMsg);
                        }

                        objReturnMsg.ReturnValue = "OK";
                        objReturnMsg.ReturnMessage = "Success.";

                    }
                    else
                    {
                        throw new Exception("Error occured saving application");
                    }
                }
                else
                {
                    objReturnMsg.ReturnValue = "Error";
                    objReturnMsg.ReturnMessage = "Invalid Payment";
                }

            }
            catch(Exception ex)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = ex.Message.ToString().Trim();
            }

            objReturnPayment.ReturnMessageInfo = objReturnMsg;
            objReturnPayment.PaymentDetails = objPaymentInfo;

            return objReturnPayment;

        }

    }
}
