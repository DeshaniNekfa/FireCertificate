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

        public FireAppDetailsOutput Post([FromBody]FireCertificateApplication objFireApplication)
        {
            FireAppDetailsOutput objAppListOutput = new FireAppDetailsOutput();
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
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
                    lstFireApplication = _getData.GetApplicationByStatus(objFireApplication, ref objReturnMsg);
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
            objAppListOutput.ReturnMessageInfo = objReturnMsg;

            return objAppListOutput;
        }

    }
}
