using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class UserInfo
    {
        public int id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Tel { get; set; }
        public string Mail { get; set; }
        public string Pword { get; set; }
        public string State { get; set; }
        public DateTime CreatedTime { get; set; }
        public string ClientID { get; set; }
    }
}