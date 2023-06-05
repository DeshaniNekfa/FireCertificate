using api_rate.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using Unity;
using Unity.Extension;
using Unity.Lifetime;

namespace api_rate.App_Start
{
    public static class UnityConfig
    {
        public static void RegisterComponents(HttpConfiguration config)
        {
            var container = new UnityContainer();

            container.RegisterType<INLogService, NLogService>();
            container.RegisterType<IUtility, Utility>();
            container.RegisterType<IGetData, GetData>();
            container.RegisterType<IGetDate, GetDate>();
            container.RegisterType<IAppSubmit, AppSubmit>();
            container.RegisterType<ISMS, SMS>();
            container.RegisterType<IEmail, Email>();
            config.DependencyResolver = new UnityResolver(container);
        }
    }
}