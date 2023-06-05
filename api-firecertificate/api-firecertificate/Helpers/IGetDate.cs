using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace api_rate.Helpers
{
    public interface IGetDate
    {
        // Get Date after apply relevant time difference mention in web config
        DateTime GetFormattedDate(DateTime dt);
    }
}
