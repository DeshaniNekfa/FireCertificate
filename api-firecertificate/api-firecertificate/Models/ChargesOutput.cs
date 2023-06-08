using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class ChargesOutput
    {
        public List<Charges> Listcharges { get; set; }
        public ReturnMsgInfo ReturnMsgInfo { get; set; }
    }
}