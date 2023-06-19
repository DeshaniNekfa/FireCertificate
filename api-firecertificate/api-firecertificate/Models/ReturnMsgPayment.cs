using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class ReturnMsgPayment
    {
        public PaymentInfo PaymentDetails { get; set; }
        public ReturnMsgInfo ReturnMessageInfo { get; set; }
    }
}