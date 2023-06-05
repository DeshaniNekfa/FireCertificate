using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using System.Net.Http;
using api_rate.Helpers;
using api_rate.Models;
using Newtonsoft.Json;

namespace api_rate.Filters
{
    public class JwtCustomAuth : AuthorizationFilterAttribute
    {
        public override void OnAuthorization(HttpActionContext actionContext)
        {
            string userId = "";
            string userData = "";
            if (actionContext.Request.Headers.Authorization == null)
            {
                actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.Unauthorized);
            }
            else
            {
                string authenticationToken = actionContext.Request.Headers.Authorization.Parameter;
                foreach (var param in actionContext.Request.GetQueryNameValuePairs())
                {
                    if (param.Key == "userId")
                    {
                        userId = param.Value;
                        break;
                    }
                }

                if (!string.IsNullOrEmpty(userId))
                {
                    Utility _utility = new Utility();
                    userData = _utility.ValidateToken(authenticationToken);
                    if (!string.IsNullOrEmpty(userData))
                    {
                        SignupInfo userModel = JsonConvert.DeserializeObject<SignupInfo>(userData);
                        if (userModel != null)
                        {
                            if (userModel.userName != userId)
                            {
                                actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.BadRequest);
                            }
                        }
                    }
                    else
                    {
                        actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.Unauthorized);
                    }
                }
                else
                {
                    actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.BadRequest);
                }
            }
        }
    }
}