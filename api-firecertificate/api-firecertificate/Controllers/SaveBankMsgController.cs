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
        private ISMS _sms = null;
        private IEmail _email = null;

        public SaveBankMsgController(IAppSubmit IAppSubmit, IGetDate IGetDate, ISMS ISMS, IEmail IEmail)
        {
            _appsubmit = IAppSubmit;
            _getDate = IGetDate;
            _sms = ISMS;
            _email = IEmail;
        }

        // POST /api/SaveBankMsg
        public PaidDetailsOutput Post([FromBody]BankReturnMessage objPaidDetails)
        {
            PaidDetailsOutput objPaidOutput = new PaidDetailsOutput();
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
 
            try
            {
                if (objPaidDetails.ClientID == null || objPaidDetails.ClientID == "")
                {
                    throw new Exception("Invalid Client ID.");
                }
                else
                {
                    _appsubmit.validateBankReturn(objPaidDetails, ref objReturnMsg);
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
