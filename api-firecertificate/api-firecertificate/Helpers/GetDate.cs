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
    public class GetDate : IGetDate
    {
        // Get Date after apply relevant time difference mention in web config
        public DateTime GetFormattedDate(DateTime dt)
        {
            string strTimeDiff = ConfigurationManager.AppSettings["TimeDifference"].ToString().Trim();
            string strSign = strTimeDiff.ToString().Trim().Substring(0, 1);
            strTimeDiff = strTimeDiff.Remove(0, 1);

            string strHrs = "0";
            string strMins = "0";

            if (strTimeDiff.ToString().Trim().Contains(".") == true)
            {
                int intIndex = strTimeDiff.ToString().Trim().IndexOf(".");
                strHrs = strSign + strTimeDiff.ToString().Trim().Substring(0, intIndex);
                strMins = strSign + strTimeDiff.ToString().Trim().Substring((intIndex + 1));
            }
            else
            {
                strHrs = strSign + strTimeDiff.ToString().Trim();
            }

            dt = dt.AddHours(Convert.ToDouble(strHrs)).AddMinutes(Convert.ToDouble(strMins));
            return dt;
        }

    }
}