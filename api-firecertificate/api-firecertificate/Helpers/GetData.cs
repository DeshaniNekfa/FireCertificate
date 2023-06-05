using api_rate.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;


namespace api_rate.Helpers
{
    public class GetData : IGetData
    {
        private MySqlConnection mySqlCon = null;
        private string strSql;
        private DataTable dt;
        private DataSet ds;
        private MySqlDataAdapter da;
        private Connection_Main objConMain;

        public FireCertificateApplication GetApplicationById(FireCertificateApplication objApplication, ref ReturnMsgInfo returnMsg)
        {
            FireCertificateApplication objFireApplication = new FireCertificateApplication();
            this.objConMain = new Connection_Main();

            string connString = this.objConMain.Get_Main_Connection(objApplication.ClientID);

            if(connString == null || connString == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Connection not found";
            }
            else
            {
                try
                {
                    this.mySqlCon = new MySqlConnection(connString);
                    if(this.mySqlCon.State.ToString() != "Open")
                    {
                        this.mySqlCon.Open();
                    }
                    else
                    {
                        returnMsg.ReturnValue = "Error";
                        returnMsg.ReturnValue = "Connectoin was already opened.";
                    }
                    if (this.mySqlCon != null)
                    {
                        strSql = "SELECT Id, CertificateId, CompanyName, Address, Telephone, DistanceFromNegambo, NatureOfBusiness, BuildingPlan, TotalLand, RoadFromNegambo, OwnerName, CurrentFirePlan, Status, DateApplied, DateReviewed  FROM tbl_firecertificate_application WHERE Id = " + objApplication.Id;
                        da = new MySqlDataAdapter(strSql, this.mySqlCon);
                        ds = new DataSet();
                        da.Fill(ds, "FireApplication");
                        dt = ds.Tables["FireApplication"];
                        if(dt.Rows.Count > 0)
                        {
                            foreach (DataRow dtRow in dt.Rows)
                            {
                                FireCertificateApplication objFireAppDetails = new Models.FireCertificateApplication();
                                objFireAppDetails.Id = (int)dtRow["Id"];
                                objFireAppDetails.CertificateId = dtRow["CertificateId"].ToString().Trim();
                                objFireAppDetails.CompanyName = dtRow["CompanyName"].ToString().Trim();
                                objFireAppDetails.Address = dtRow["Address"].ToString().Trim();
                                objFireAppDetails.Telephone = dtRow["Telephone"].ToString().Trim();
                                objFireAppDetails.DistanceFromNegambo = (int)dtRow["DistanceFromNegambo"];
                                objFireAppDetails.NatureOfBusiness = dtRow["NatureOfBusiness"].ToString().Trim();
                                objFireAppDetails.BuildingPlan = dtRow["BuildingPlan"].ToString().Trim();
                                objFireAppDetails.TotalLand = (int)dtRow["TotalLand"];
                                objFireAppDetails.RoadFromNegambo = dtRow["RoadFromNegambo"].ToString().Trim();
                                objFireAppDetails.OwnerName = dtRow["OwnerName"].ToString().Trim();
                                objFireAppDetails.CurrentFirePlan = dtRow["CurrentFirePlan"].ToString().Trim();
                                objFireAppDetails.Status = dtRow["Status"].ToString().Trim();
                                objFireAppDetails.DateApplied = dtRow["DateApplied"].ToString().Trim();
                                objFireAppDetails.DateReviewed = dtRow["DateReviewed"].ToString().Trim();

                                objFireApplication = objFireAppDetails;
                            }
                            returnMsg.ReturnValue = "OK";
                            returnMsg.ReturnMessage = "Data Found";
                        }
                        else
                        {
                            returnMsg.ReturnValue = "Error";
                            returnMsg.ReturnMessage = "No data found";
                        }
                    }
                }
                catch (Exception ex)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = ex.Message;
                }
                if (this.mySqlCon != null)
                {
                    this.mySqlCon.Close();
                }
            }

            return objFireApplication;  
        }
    }
}