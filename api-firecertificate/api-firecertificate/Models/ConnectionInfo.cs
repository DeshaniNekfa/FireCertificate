using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class ConnectionInfo
    {
        public static string Host { get; set; }
        public static string Database { get; set; }
        public static string Password { get; set; }
        public static string UserName { get; set; }
        public static DatabaseDetailsInfo DBInfo { get; set; }
        public static BankAPIInfo BankAPIInfo { get; set; }
    }
}