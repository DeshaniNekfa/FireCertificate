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
    public class Email : IEmail
    {

        // Send Email
        public bool SendEmail(string strMsg, string strEmail, ref string strErMsg)
        {
            bool IsSuccess = false;
            try
            {
                EmailInfo mailInfo = new EmailInfo();
                mailInfo.CouncilName = ConnectionInfo.DBInfo.CouncilName;
                mailInfo.EmailContactNo = ConnectionInfo.DBInfo.EmailContactNo;

                // 2023/May/18
                mailInfo.FromEmail = ConnectionInfo.DBInfo.FromEmail;
                //mailInfo.FromEmail = "no-reply@nekop.com";

                mailInfo.ToMail = strEmail;

                string toAdd = mailInfo.ToMail;

                // 2023/May/18
                // const string fromPassword = "Nekfa@2020";
                string fromPassword = ConfigurationManager.AppSettings["fromPassword"].ToString().Trim();

                string fromAddress = mailInfo.FromEmail;
                string subject = "" + mailInfo.CouncilName + "| Regarding the Photoshoot Service Request";
                string body = strMsg;

                MailMessage msg = new MailMessage(fromAddress, toAdd, subject, body);
                msg.IsBodyHtml = true;

                var smtp = new System.Net.Mail.SmtpClient();
                {
                    // 2023/May/18
                    //smtp.Host = "relay-hosting.secureserver.net";
                    //smtp.Port = 25;
                    //smtp.EnableSsl = false;
                    smtp.Host = ConfigurationManager.AppSettings["Host"].ToString().Trim();
                    smtp.Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"]);
                    smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);

                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                    smtp.UseDefaultCredentials = false;
                }
                smtp.Send(msg);
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