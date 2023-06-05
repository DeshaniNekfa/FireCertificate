using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace api_rate.Helpers
{
    public interface IUtility
    {
        string IssueJwtToken(Claim[] claims);
        string ValidateToken(string token);
    }
}
