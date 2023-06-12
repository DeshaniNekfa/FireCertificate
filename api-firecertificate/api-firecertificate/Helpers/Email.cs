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
                string subject = "" + mailInfo.CouncilName + "| Regarding the Fire Certificate Request";
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
        

        //Get Email body
        public string GetEmailMsgBody(string strStatus, FireCertificateApplication objApp = null)
        {
            string strMsgBody = string.Empty;
            string strCouncil = ConnectionInfo.DBInfo.CouncilName;
            string strContactNo = ConnectionInfo.DBInfo.EmailContactNo;

            if(strStatus.Trim() == Globals.PENDING.ToString().Trim())
            {
                strMsgBody = "<html>" +
                              "<head>" +
                              "<meta http-equiv=Content-Type content=text/html; charset=utf-8 />" +
                              "<title> </title>" +

                              "<style> .divStyle1 { font-family: Arial; font-size: 12px; color: black; } </style>" +

                              "</head>" +

                              "<body>" +

                              "<div class='row divStyle1'>" +
                              "<pre>" +
                              "Hello, <br/>" +

                              "Your fire certificate application is successfully submitted. We will contact you regarding the inspections soon. <br/>" +


                              "Thank You. <br/>" +
                              "" + strCouncil + "" +
                              "</pre>" +
                              "<br/>" +
                              "</div>" +

                              "<span style='color:red;font-size:10px;'>Note: Please DO NOT REPLY to this mail</span>" +
                              "<span style='color:black;font-size:10px;'> as this automatically generated mail. For any clarification contact " + strContactNo + ".</span>" +
                              "</div>" +
                              "</body>" +
                              "</html>";
            }
            else if(strStatus.Trim() == Globals.APPROVED.ToString().Trim())
            {
                strMsgBody = "<html>" +
                              "<head>" +
                              "<meta http-equiv=Content-Type content=text/html; charset=utf-8 />" +
                              "<title> </title>" +

                              "<style> .divStyle1 { font-family: Arial; font-size: 12px; color: black; } </style>" +

                              "</head>" +

                              "<body>" +

                              "<div class='row divStyle1'>" +
                              "<pre>" +
                              "Hello, <br/>" +

                              "Your fire certificate application is approved. Please pay the Certificate fee to collect it <br/>" +


                              "Thank You. <br/>" +
                              "" + strCouncil + "" +
                              "</pre>" +
                              "<br/>" +
                              "</div>" +

                              "<span style='color:red;font-size:10px;'>Note: Please DO NOT REPLY to this mail</span>" +
                              "<span style='color:black;font-size:10px;'> as this automatically generated mail. For any clarification contact " + strContactNo + ".</span>" +
                              "</div>" +
                              "</body>" +
                              "</html>";
            }
            else if(strStatus.Trim() == Globals.REJECTED.ToString().Trim())
            {
                strMsgBody = "<html>" +
                              "<head>" +
                              "<meta http-equiv=Content-Type content=text/html; charset=utf-8 />" +
                              "<title> </title>" +

                              "<style> .divStyle1 { font-family: Arial; font-size: 12px; color: black; } </style>" +

                              "</head>" +

                              "<body>" +

                              "<div class='row divStyle1'>" +
                              "<pre>" +
                              "Hello, <br/>" +

                              "We are sorry to inform that your fire certificate application is rejected. Please contact the Administrator for more details. <br/>" +


                              "Thank You. <br/>" +
                              "" + strCouncil + "" +
                              "</pre>" +
                              "<br/>" +
                              "</div>" +

                              "<span style='color:red;font-size:10px;'>Note: Please DO NOT REPLY to this mail</span>" +
                              "<span style='color:black;font-size:10px;'> as this automatically generated mail. For any clarification contact " + strContactNo + ".</span>" +
                              "</div>" +
                              "</body>" +
                              "</html>";
            }
            else if(strStatus.Trim() == Globals.PAID.ToString().Trim())
            {
                strMsgBody = "Your Payment is received";
            }
            else if(strStatus == "Supervisor")
            {
                strMsgBody = "<html>" +
                              "<head>" +
                              "<meta http-equiv=Content-Type content=text/html; charset=utf-8 />" +
                              "<title> </title>" +

                              "<style> .divStyle1 { font-family: Arial; font-size: 12px; color: black; } </style>" +

                              "</head>" +

                              "<body>" +

                              "<div class='row divStyle1'>" +
                              "<pre>" +
                              "Hello, <br/>" +

                              "A supervisor is assigned to your fire certificate application and will be visiting the premises. <br/>" +


                              "Thank You. <br/>" +
                              "" + strCouncil + "" +
                              "</pre>" +
                              "<br/>" +
                              "</div>" +

                              "<span style='color:red;font-size:10px;'>Note: Please DO NOT REPLY to this mail</span>" +
                              "<span style='color:black;font-size:10px;'> as this automatically generated mail. For any clarification contact " + strContactNo + ".</span>" +
                              "</div>" +
                              "</body>" +
                              "</html>";
            }

            return strMsgBody;
        }
    }
}