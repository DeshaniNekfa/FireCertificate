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
    public class ChargesController : ApiController
    {
        private IGetData _getData = null;

        public ChargesController(IGetData IGetData)
        {
            _getData = IGetData;
        }

        // POST /api/Charges
        public Charges Post([FromBody]Charges objCharge)
        {
            Charges objCharges = new Charges();            
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();

            try
            {
                if (objCharge.ClientID == null || objCharge.ClientID == "")
                {
                    throw new Exception("Invalid Client ID.");
                }
                else
                {
                    // get a charge by Id
                    objCharges = _getData.GetChargeById(objCharge, ref objReturnMsg);
                    if (objReturnMsg.ReturnValue != "OK") if (objReturnMsg.ReturnValue != "OK")
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

            return objCharges;
        }
    }
}
