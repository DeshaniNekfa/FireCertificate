using api_rate.Filters;
using api_rate.Models;
using api_rate.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace api_rate.Controllers
{
    [JwtCustomAuth]
    public class FireAppApproveController : ApiController
    {
        private IAppSubmit _appSubmit = null;
        private IGetData _getData = null;
        
        public FireAppApproveController(IAppSubmit IAppSubmit, IGetData IGetData)
        {
            _appSubmit = IAppSubmit;
            _getData = IGetData;
        }

        public ReturnMsgInfo Post() 
        {
            return null;
        }
    }
}
