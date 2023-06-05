using api_rate.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace api_rate
{
    public partial class Help_doc : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = this.ConvertToEncode("KelaniyaPS/1");
        }
        public string ConvertToEncode(string sInput)
        {
            return Convert.ToBase64String(Encoding.UTF8.GetBytes(sInput));
        }
    }
}