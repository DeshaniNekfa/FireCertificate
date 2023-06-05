using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Web;
using System.Threading.Tasks;


namespace api_rate.Helpers
{
    public class Utility:IUtility
    {
        public string IssueJwtToken(Claim[] claims)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            byte[] tokenKey = Encoding.ASCII.GetBytes(ConfigurationManager.AppSettings["SecurityKey"].ToString());
            int tokenExpiryHours = Convert.ToInt32(ConfigurationManager.AppSettings["TokenExpiryHours"]);
            //claims.Append(new Claim("expires_at", tokenExpiryTime.ToString()));
            var tokenDescriptor = new SecurityTokenDescriptor()
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.UtcNow.AddDays(tokenExpiryHours),
                SigningCredentials = new SigningCredentials(
                    new SymmetricSecurityKey(tokenKey), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }

        public string ValidateToken(string token)
        {
            if (token == null)
                return null;

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(ConfigurationManager.AppSettings["SecurityKey"].ToString());
            try
            {
                SecurityToken validatedToken;
                tokenHandler.ValidateToken(token, new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    ClockSkew = TimeSpan.Zero
                }, out validatedToken);

                var jwtToken = (JwtSecurityToken)validatedToken;
                string userData = jwtToken.Claims.First(x => x.Type == "userData").Value;
                return userData;
            }
            catch
            {
                return null;
            }
        }
    }
}