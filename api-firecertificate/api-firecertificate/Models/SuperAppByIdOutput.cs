using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_rate.Models
{
    public class SuperAppByIdOutput
    {
        public FireSupervisorApplication FireSuperApplication { get; set; }
        public ReturnMsgInfo ReturnMessageInfo { get; set; }

    }
}