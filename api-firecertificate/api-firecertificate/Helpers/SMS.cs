using api_rate.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace api_rate.Helpers
{
    public class SMS : ISMS
    {
        // Send SMS
        public bool SendSMS(string strMsg, string strMobile, ref string strErMsg)
        {
            bool IsSuccess = false;
            try
            {
                SMSInfo smsInfo = new SMSInfo();
                smsInfo.ToMobile = strMobile;
                smsInfo.Message = strMsg;
                smsInfo.ModuleName = "lgsweb";
                smsInfo.cUSer = "nekfa";
                smsInfo.ClientMask = ConnectionInfo.DBInfo.ClientMask;
                com.nekfa.service.sms.NekfaSMS_API ss = new com.nekfa.service.sms.NekfaSMS_API();
                ss.SendSMS(smsInfo.ToMobile, smsInfo.Message, "Auto", smsInfo.ClientMask, smsInfo.cUSer, smsInfo.ModuleName, 0);
                ss.Dispose();
                IsSuccess = true;
            }
            catch (Exception ex)
            {
                IsSuccess = false;
                strErMsg = ex.Message.ToString().Trim();
            }

            return IsSuccess;
        }
    }
}