using api_rate.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

namespace api_rate.Helpers
{
    public class Connection_Main
    {  
        private ConnectionInfo conInfo;   
        public  string ErrorMessage { set; get; }

        public string GetMainConnection_suing_subOfficeCode(string brachID)
        {
            string mainOfficeKey = "";
            DataTable dt1 = null;
            MySqlConnection con = null;
            try
            {
                string conString = ConfigurationManager.ConnectionStrings["DB_Details"].ConnectionString;
                if (conString != null || conString != "")
                {
                    con = new MySqlConnection(conString);
                    if (con.State.ToString() != "Open")
                    {
                        con.Open();
                    }                   
                    if (con != null)
                    {
                        string sqlUser = "SELECT * from all_keys where branch_key=@branch_key;";
                        MySqlCommand command = new MySqlCommand(sqlUser, con);
                        command.Parameters.Add(new MySqlParameter("@branch_key", brachID));
                        MySqlDataAdapter da = new MySqlDataAdapter(command);                        
                        DataSet ds = new DataSet();
                        da.Fill(ds, "DT");
                        dt1 = ds.Tables["DT"];
                    }
                }
            }
            catch (MySqlException myEx)
            {
                this.ErrorMessage = myEx.Message;

            }
            catch (Exception ee)
            {

                this.ErrorMessage = ee.Message;
            }
            finally
            {
                if (con != null)
                {
                    if (con.State.ToString() == "Open")
                    {
                        con.Close();
                    }
                }
            }
            if (dt1.Rows.Count > 0)
            {
                foreach (DataRow r in dt1.Rows)
                {
                    mainOfficeKey = r["council_key"].ToString();                    
                }
            }
            return this.Get_Connection(mainOfficeKey);
        }
        public string Get_Connection(string locationID)
        {
            String conString = "";
            if (locationID == null)
            {
                ErrorMessage = "Loction Identifiction Number(LIN) cannot be null";
            }
            else
            {
                if (locationID == "")
                {
                    ErrorMessage = "Loction Identifiction Number(LIN) cannot be empty";
                }
                else
                {
                    ConnectionStringSettingsCollection connections = ConfigurationManager.ConnectionStrings;
                    if (connections.Count != 0)
                    {
                        foreach (ConnectionStringSettings c in ConfigurationManager.ConnectionStrings)
                        {
                            string conName = c.Name.ToString();
                            if (conName == locationID)
                            {
                                conString = c.ConnectionString;
                                ErrorMessage = "Success";
                            }
                        }
                    }
                    else
                    {
                        ErrorMessage = "Cannot found any connection string details. Please update the web.config";
                    }
                }
            }
            if (conString.Length == 0)
            {
                ErrorMessage = "Cannot found any connection string details. Please update the web.config";
            }
            return conString;
        }
        public string Get_Main_Connection(string locationID)
        {
            String conString = "";
            if (locationID == null)
            {
                ErrorMessage = "Loction Identifiction Number(LIN) cannot be null";
            }
            else
            {
                if (locationID == "")
                {
                    ErrorMessage = "Loction Identifiction Number(LIN) cannot be empty";
                }
                else
                {
                    ConnectionStringSettingsCollection connections = ConfigurationManager.ConnectionStrings;
                    if (connections.Count != 0)
                    {
                        foreach (ConnectionStringSettings c in ConfigurationManager.ConnectionStrings)
                        {
                            string conName = c.Name.ToString();
                            if (conName == locationID)
                            {
                                conString = c.ConnectionString;
                                DatabaseDetailsInfo dbInfo = this.GetConnectionInfoForLocationID(locationID);
                                ConnectionInfo.DBInfo = dbInfo;
                                ConnectionInfo.BankAPIInfo = dbInfo.BankAPIInfo;
                                ErrorMessage = "Success";
                            }

                        }
                        if (conString == "" || conString == "")
                        {
                            ErrorMessage = "Cannot found any connection string details. Please update the web.config";
                        }
                    }
                    else
                    {
                        ErrorMessage = "Cannot found any connection string details. Please update the web.config";
                    }
                }
            }

            return conString;
        }   

        private DatabaseDetailsInfo GetConnectionInfoForLocationID(string LocationID)
        {
            DatabaseDetailsInfo dbInfo = new DatabaseDetailsInfo();
            dbInfo = new DatabaseDetailsInfo();
            BankAPIInfo bankAPIInfo = new BankAPIInfo();
            DataTable dt1 = null;
            MySqlConnection con = null;
            MySqlTransaction trans;
            try
            {
                string conString = ConfigurationManager.ConnectionStrings["DB_Details"].ConnectionString;
                if (conString != null || conString != "")
                {
                    con = new MySqlConnection(conString);
                    if (con.State.ToString() != "Open")
                    {
                        con.Open();
                    }
                    else
                    {
                        trans = con.BeginTransaction();
                        this.ErrorMessage = "Connection  was already  opened.";
                    }
                    if (con != null)
                    {
                        string sqlUser = "SELECT * from all_keys where branch_key='" + LocationID + "';";
                        MySqlDataAdapter da = new MySqlDataAdapter(sqlUser, con);
                        DataSet ds = new DataSet();
                        da.Fill(ds, "DT");
                        dt1 = ds.Tables["DT"];
                    }
                }
            }
            catch (MySqlException myEx)
            {
                this.ErrorMessage = myEx.Message;

            }
            catch (Exception ee)
            {

                this.ErrorMessage = ee.Message;
            }
            finally
            {
                if (con != null)
                {
                    if (con.State.ToString() == "Open")
                    {
                        con.Close();
                    }
                }
            }
            if (dt1.Rows.Count > 0)
            {
                foreach (DataRow r in dt1.Rows)
                {
                    dbInfo.BranchName = r["branch_name"].ToString();
                    dbInfo.CouncilName = r["council_name"].ToString();
                    dbInfo.LocationID = LocationID;
                    bankAPIInfo = new BankAPIInfo();
                    bankAPIInfo.MerID = r["MerID"].ToString();
                    bankAPIInfo.AcqID = r["AcqID"].ToString();
                    bankAPIInfo.Password = r["BankPassword"].ToString();
                    bankAPIInfo.Version = System.Web.Configuration.WebConfigurationManager.AppSettings["Version"];
                    bankAPIInfo.PurchaseCurrency = System.Web.Configuration.WebConfigurationManager.AppSettings["PurchaseCurrency"];
                    bankAPIInfo.PurchaseCurrencyExponent = System.Web.Configuration.WebConfigurationManager.AppSettings["PurchaseCurrencyExponent"];
                    bankAPIInfo.SignatureMethod = System.Web.Configuration.WebConfigurationManager.AppSettings["SignatureMethod"];
                    string conPercentage = r["ConvenienceFeePercentage"].ToString();
                    string viewPercentage = r["ViewPercentage"].ToString();
                    dbInfo.ConvenienceFeePercentage = decimal.Parse(conPercentage);
                    dbInfo.ViewPercentage = decimal.Parse(viewPercentage);
                    dbInfo.ClientMask = r["ClientMask"].ToString();
                    dbInfo.FromEmail = r["FromEmail"].ToString();
                    dbInfo.EmailContactNo = r["EmailContactNo"].ToString();
                    dbInfo.ID = r["id"].ToString();

                    string fixedamt = r["FixedAmount"].ToString();
                    string minamt = r["MinAmount"].ToString();
                    dbInfo.FixedAmount = decimal.Parse(fixedamt);
                    dbInfo.MinAmount = decimal.Parse(minamt);
                    if (dbInfo.MinAmount > 0 && dbInfo.ConvenienceFeePercentage == 0)
                    {
                        dbInfo.Type = "Fixed";
                    }
                    else if (dbInfo.MinAmount > 0 && dbInfo.ConvenienceFeePercentage > 0)
                    {
                        dbInfo.Type = "Both";
                    }
                    else if (dbInfo.MinAmount == 0 && dbInfo.ConvenienceFeePercentage > 0)
                    {
                        dbInfo.Type = "Percentage";
                    }

                    dbInfo.URL = r["URL"].ToString().Trim();
                }
            }
            else
            {
                this.ErrorMessage = "Invalid Location ID";
            }


            dbInfo.BankAPIInfo = bankAPIInfo;
            return dbInfo;

        }

     
    }
}