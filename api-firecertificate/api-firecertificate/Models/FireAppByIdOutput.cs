using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class FireAppByIdOutput
    {
        public FireCertificateApplication FireApplication { get; set; }
        public PaymentDetails PaymentDetails { get; set; }
        public FireSupervisorApplication SuperApplication { get; set; }
        public ReturnMsgInfo ReturnMessageInfo { get; set; }

    }
}