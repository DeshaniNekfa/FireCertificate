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

        // Get one Fire application by its Certificate Id  
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
                        strSql = "SELECT * FROM tbl_firecertificate_application WHERE Id = '" + objApplication.Id +"';";
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
                                objFireAppDetails.DistanceFromCouncil = (int)dtRow["DistanceFromCouncil"];
                                objFireAppDetails.NatureOfBusiness = dtRow["NatureOfBusiness"].ToString().Trim();
                                objApplication.BuildingDescription = dtRow["BuildingDescription"].ToString().Trim();
                                objFireAppDetails.BuildingPlan = dtRow["BuildingPlan"].ToString().Trim();
                                objFireAppDetails.TotalLand = (int)dtRow["TotalLand"];
                                objFireAppDetails.RoadFromCouncil = dtRow["RoadFromCouncil"].ToString().Trim();
                                objFireAppDetails.OwnerName = dtRow["OwnerName"].ToString().Trim();
                                objFireAppDetails.CurrentFirePlan = dtRow["CurrentFirePlan"].ToString().Trim();
                                objFireAppDetails.Status = dtRow["Status"].ToString().Trim();
                                var appDate = (DateTime)dtRow["DateApplied"];
                                objFireAppDetails.DateApplied = appDate.ToString("yyyy-MM-dd");

                                var revDate = (DateTime)dtRow["DateReviewed"];
                                if (revDate == DateTime.MinValue)
                                {
                                    objFireAppDetails.DateReviewed = "";
                                }
                                else
                                {
                                    objFireAppDetails.DateReviewed = revDate.ToString("yyyy-MM-dd");

                                }

                                objFireAppDetails.Supervisor = dtRow["Supervisor"].ToString().Trim();
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

        // Get Application by Certificate Id
        public FireCertificateApplication GetApplicationByCertId(FireSupervisorApplication objApplication, ref ReturnMsgInfo returnMsg)
        {
            FireCertificateApplication objFireApplication = new FireCertificateApplication();
            this.objConMain = new Connection_Main();

            string connString = this.objConMain.Get_Main_Connection(objApplication.ClientID);

            if (connString == null || connString == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Connection not found";
            }
            else
            {
                try
                {
                    this.mySqlCon = new MySqlConnection(connString);
                    if (this.mySqlCon.State.ToString() != "Open")
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
                        strSql = "SELECT * FROM tbl_firecertificate_application WHERE CertificateId = '" + objApplication.CertificateId+"';";
                        da = new MySqlDataAdapter(strSql, this.mySqlCon);
                        ds = new DataSet();
                        da.Fill(ds, "FireApplication");
                        dt = ds.Tables["FireApplication"];
                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow dtRow in dt.Rows)
                            {
                                FireCertificateApplication objFireAppDetails = new Models.FireCertificateApplication();
                                objFireAppDetails.Id = (int)dtRow["Id"];
                                objFireAppDetails.CertificateId = dtRow["CertificateId"].ToString().Trim();
                                objFireAppDetails.CompanyName = dtRow["CompanyName"].ToString().Trim();
                                objFireAppDetails.Address = dtRow["Address"].ToString().Trim();
                                objFireAppDetails.Telephone = dtRow["Telephone"].ToString().Trim();
                                objFireAppDetails.DistanceFromCouncil = (int)dtRow["DistanceFromCouncil"];
                                objFireAppDetails.NatureOfBusiness = dtRow["NatureOfBusiness"].ToString().Trim();
                                objFireAppDetails.BuildingDescription = dtRow["BuildingDescription"].ToString().Trim();
                                objFireAppDetails.BuildingPlan = dtRow["BuildingPlan"].ToString().Trim();
                                objFireAppDetails.TotalLand = (int)dtRow["TotalLand"];
                                objFireAppDetails.RoadFromCouncil = dtRow["RoadFromCouncil"].ToString().Trim();
                                objFireAppDetails.OwnerName = dtRow["OwnerName"].ToString().Trim();
                                objFireAppDetails.CurrentFirePlan = dtRow["CurrentFirePlan"].ToString().Trim();
                                objFireAppDetails.Status = dtRow["Status"].ToString().Trim();
                                var appDate = (DateTime)dtRow["DateApplied"];
                                objFireAppDetails.DateApplied = appDate.ToString("yyyy-MM-dd");
                                var revDate = (DateTime)dtRow["DateReviewed"];
                                if (revDate == DateTime.MinValue)
                                {
                                    objFireAppDetails.DateReviewed = "";
                                }
                                else
                                {
                                    objFireAppDetails.DateReviewed = revDate.ToString("yyyy-MM-dd");

                                }
                                objFireAppDetails.Supervisor = dtRow["Supervisor"].ToString().Trim();

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

        // Get List of fire applications by its status(pending/approved/paid/rejected)
        public List<FireCertificateApplication> GetApplicationByStatus(FireCertificateApplication objFireApplication, ref ReturnMsgInfo returnMsg)
        {
            List<FireCertificateApplication> lstFireApplication = new List<FireCertificateApplication>();
            this.objConMain = new Connection_Main();

            string conString = this.objConMain.Get_Main_Connection(objFireApplication.ClientID);

            if (conString == null || conString == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Connection not found.";
            }
            else
            {
                try
                {
                    this.mySqlCon = new MySqlConnection(conString);
                    if (this.mySqlCon.State.ToString() != "Open")
                    {
                        this.mySqlCon.Open();
                    }
                    else
                    {
                        returnMsg.ReturnValue = "Error";
                        returnMsg.ReturnMessage = "Connection was already opened.";
                    }
                    if (this.mySqlCon != null)
                    {
                        strSql = "SELECT * FROM tbl_firecertificate_application WHERE Status ='" + objFireApplication.Status.ToString().Trim() + "';";
                        da = new MySqlDataAdapter(strSql, this.mySqlCon);
                        ds = new DataSet();
                        da.Fill(ds, "Application");
                        dt = ds.Tables["Application"];
                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow dtRow in dt.Rows)
                            {
                                FireCertificateApplication objFireAppDetails = new Models.FireCertificateApplication();
                                objFireAppDetails.Id = (int)dtRow["Id"];
                                objFireAppDetails.CertificateId = dtRow["CertificateId"].ToString().Trim();
                                objFireAppDetails.CompanyName = dtRow["CompanyName"].ToString().Trim();
                                objFireAppDetails.Address = dtRow["Address"].ToString().Trim();
                                objFireAppDetails.Telephone = dtRow["Telephone"].ToString().Trim();
                                objFireAppDetails.DistanceFromCouncil = (int)dtRow["DistanceFromCouncil"];
                                objFireAppDetails.NatureOfBusiness = dtRow["NatureOfBusiness"].ToString().Trim();
                                objFireAppDetails.BuildingDescription = dtRow["BuildingDescription"].ToString().Trim();
                                objFireAppDetails.BuildingPlan = dtRow["BuildingPlan"].ToString().Trim();
                                objFireAppDetails.TotalLand = (int)dtRow["TotalLand"];
                                objFireAppDetails.RoadFromCouncil = dtRow["RoadFromCouncil"].ToString().Trim();
                                objFireAppDetails.OwnerName = dtRow["OwnerName"].ToString().Trim();
                                objFireAppDetails.CurrentFirePlan = dtRow["CurrentFirePlan"].ToString().Trim();
                                objFireAppDetails.Status = dtRow["Status"].ToString().Trim();
                                var appDate = (DateTime)dtRow["DateApplied"];
                                objFireAppDetails.DateApplied = appDate.ToString("yyyy-MM-dd");
                                var revDate = (DateTime)dtRow["DateReviewed"];
                                if (revDate == DateTime.MinValue)
                                {
                                    objFireAppDetails.DateReviewed = "";
                                }
                                else
                                {
                                    objFireAppDetails.DateReviewed = revDate.ToString("yyyy-MM-dd");

                                }
                                objFireAppDetails.Supervisor = dtRow["Supervisor"].ToString().Trim();

                                lstFireApplication.Add(objFireAppDetails);
                            }
                            returnMsg.ReturnValue = "OK";
                            returnMsg.ReturnMessage = "Data found";
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
                finally
                {
                    if (this.mySqlCon != null)
                    {
                        this.mySqlCon.Close();
                    }
                }
            }
            return lstFireApplication;
        }

        // Get user details from user ID
        public string GetUserDetailsById(FireCertificateApplication objFireApplication, ref ReturnMsgInfo returnMsg) 
        {
            string strUsername = string.Empty;

            this.objConMain = new Connection_Main();
            string conString = this.objConMain.Get_Main_Connection(objFireApplication.ClientID);

            if (conString == null || conString == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Connection not found.";
            }
            else
            {
                try
                {
                    this.mySqlCon = new MySqlConnection(conString);
                    if (this.mySqlCon.State.ToString() != "Open")
                    {
                        this.mySqlCon.Open();
                    }
                    else
                    {
                        returnMsg.ReturnValue = "Error";
                        returnMsg.ReturnMessage = "Connection was already opened.";
                    }
                    if (this.mySqlCon != null)
                    {
                        strSql = "SELECT Name FROM tbl_user_info WHERE id='" + objFireApplication.ClientID + "';";
                        da = new MySqlDataAdapter(strSql, this.mySqlCon);
                        ds = new DataSet();
                        da.Fill(ds, "User");
                        dt = ds.Tables["User"];
                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow dtRow in dt.Rows)
                            {
                                strUsername = dtRow["Name"].ToString().Trim();
                            }

                            returnMsg.ReturnValue = "OK";
                            returnMsg.ReturnMessage = "Data found";
                        }
                        else
                        {
                            returnMsg.ReturnValue = "Error";
                            returnMsg.ReturnMessage = "No data found";
                        }
                    }
                }
                catch(Exception ex)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = ex.Message;
                }
                finally
                {
                    if (this.mySqlCon != null)
                    {
                        this.mySqlCon.Close();
                    }
                }
            }
            return strUsername;
        }

        // Get List of fire applications by username
        public List<FireCertificateApplication> GetAppDetailsByUsr(FireCertificateApplication objFireApplication, ref ReturnMsgInfo returnMsg)
        {
            List<FireCertificateApplication> lstFireApplication = new List<FireCertificateApplication>();
            this.objConMain = new Connection_Main();

            string conString = this.objConMain.Get_Main_Connection(objFireApplication.ClientID);
            if (conString == null || conString == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Connection not found.";
            }
            else
            {
                try
                {
                    this.mySqlCon = new MySqlConnection(conString);
                    if (this.mySqlCon.State.ToString() != "Open")
                    {
                        this.mySqlCon.Open();
                    }
                    else
                    {
                        returnMsg.ReturnValue = "Error";
                        returnMsg.ReturnMessage = "Connection was already opened.";
                    }
                    if (this.mySqlCon != null)
                    {
                        strSql = "SELECT * FROM tbl_firecertificate_application WHERE User = '" + objFireApplication.ClientID+"';";
                        da = new MySqlDataAdapter(strSql, this.mySqlCon);
                        ds = new DataSet();
                        da.Fill(ds, "Application");
                        dt = ds.Tables["Application"];
                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow dtRow in dt.Rows)
                            {
                                FireCertificateApplication objFireAppDetails = new Models.FireCertificateApplication();
                                objFireAppDetails.Id = (int)dtRow["Id"];
                                objFireAppDetails.CertificateId = dtRow["CertificateId"].ToString().Trim();
                                objFireAppDetails.CompanyName = dtRow["CompanyName"].ToString().Trim();
                                objFireAppDetails.Address = dtRow["Address"].ToString().Trim();
                                objFireAppDetails.Telephone = dtRow["Telephone"].ToString().Trim();
                                objFireAppDetails.DistanceFromCouncil = (int)dtRow["DistanceFromCouncil"];
                                objFireAppDetails.NatureOfBusiness = dtRow["NatureOfBusiness"].ToString().Trim();
                                objFireAppDetails.BuildingDescription = dtRow["BuildingDescription"].ToString().Trim();
                                objFireAppDetails.BuildingPlan = dtRow["BuildingPlan"].ToString().Trim();
                                objFireAppDetails.TotalLand = (int)dtRow["TotalLand"];
                                objFireAppDetails.RoadFromCouncil = dtRow["RoadFromCouncil"].ToString().Trim();
                                objFireAppDetails.OwnerName = dtRow["OwnerName"].ToString().Trim();
                                objFireAppDetails.CurrentFirePlan = dtRow["CurrentFirePlan"].ToString().Trim();
                                objFireAppDetails.Email = dtRow["Email"].ToString().Trim();
                                objFireAppDetails.Supervisor = dtRow["Supervisor"].ToString().Trim();
                                objFireAppDetails.Status = dtRow["Status"].ToString().Trim();
                                var appDate = (DateTime)dtRow["DateApplied"];
                                objFireAppDetails.DateApplied = appDate.ToString("yyyy-MM-dd");
                                var revDate = (DateTime)dtRow["DateReviewed"];
                                if (revDate == DateTime.MinValue)
                                {
                                    objFireAppDetails.DateReviewed = "";
                                }
                                else
                                {
                                    objFireAppDetails.DateReviewed = revDate.ToString("yyyy-MM-dd");

                                }
                                objFireAppDetails.Supervisor = dtRow["Supervisor"].ToString().Trim();

                                lstFireApplication.Add(objFireAppDetails);
                            }
                            returnMsg.ReturnValue = "OK";
                            returnMsg.ReturnMessage = "Data found";
                        }
                        else
                        {
                            returnMsg.ReturnValue = "Error";
                            returnMsg.ReturnMessage = "No data found";
                        }
                    }
                }
                catch(Exception ex)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = ex.Message;
                }
                finally
                {
                    if (this.mySqlCon != null)
                    {
                        this.mySqlCon.Close();
                    }
                }
            }
            return lstFireApplication;
        }
    
        // Get List of all fire applications
        public List<FireCertificateApplication> GetAllFireAppDetails(FireCertificateApplication objFireApplication, ref ReturnMsgInfo returnMsg)
        {
            List<FireCertificateApplication> lstFireApplication = new List<FireCertificateApplication>();
            this.objConMain = new Connection_Main();

            string conString = this.objConMain.Get_Main_Connection(objFireApplication.ClientID);
            if (conString == null || conString == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Connection not found.";
            }
            else
            {
                try
                {
                    this.mySqlCon = new MySqlConnection(conString);
                    if (this.mySqlCon.State.ToString() != "Open")
                    {
                        this.mySqlCon.Open();
                    }
                    else
                    {
                        returnMsg.ReturnValue = "Error";
                        returnMsg.ReturnMessage = "Connection was already opened.";
                    }
                    if (this.mySqlCon != null)
                    {
                        strSql = "SELECT * FROM tbl_firecertificate_application;";
                        da = new MySqlDataAdapter(strSql, this.mySqlCon);
                        ds = new DataSet();
                        da.Fill(ds, "Application");
                        dt = ds.Tables["Application"];
                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow dtRow in dt.Rows)
                            {
                                FireCertificateApplication objFireAppDetails = new Models.FireCertificateApplication();
                                objFireAppDetails.Id = (int)dtRow["Id"];
                                objFireAppDetails.CertificateId = dtRow["CertificateId"].ToString().Trim();
                                objFireAppDetails.CompanyName = dtRow["CompanyName"].ToString().Trim();
                                objFireAppDetails.Address = dtRow["Address"].ToString().Trim();
                                objFireAppDetails.Telephone = dtRow["Telephone"].ToString().Trim();
                                objFireAppDetails.DistanceFromCouncil = (int)dtRow["DistanceFromCouncil"];
                                objFireAppDetails.NatureOfBusiness = dtRow["NatureOfBusiness"].ToString().Trim();
                                objFireAppDetails.BuildingDescription = dtRow["BuildingDescription"].ToString().Trim();
                                objFireAppDetails.BuildingPlan = dtRow["BuildingPlan"].ToString().Trim();
                                objFireAppDetails.TotalLand = (int)dtRow["TotalLand"];
                                objFireAppDetails.RoadFromCouncil = dtRow["RoadFromCouncil"].ToString().Trim();
                                objFireAppDetails.OwnerName = dtRow["OwnerName"].ToString().Trim();
                                objFireAppDetails.CurrentFirePlan = dtRow["CurrentFirePlan"].ToString().Trim();
                                objFireAppDetails.Status = dtRow["Status"].ToString().Trim();
                                objFireAppDetails.Email = dtRow["Email"].ToString().Trim();
                                objFireAppDetails.Supervisor = dtRow["User"].ToString().Trim();
                                var appDate = (DateTime)dtRow["DateApplied"];
                                objFireAppDetails.DateApplied = appDate.ToString("yyyy-MM-dd");
                                var revDate = (DateTime)dtRow["DateReviewed"];
                                if (revDate == DateTime.MinValue)
                                {
                                    objFireAppDetails.DateReviewed = "";
                                }
                                else
                                {
                                    objFireAppDetails.DateReviewed = revDate.ToString("yyyy-MM-dd");

                                }
                                objFireAppDetails.Supervisor = dtRow["Supervisor"].ToString().Trim();

                                lstFireApplication.Add(objFireAppDetails);
                            }
                            returnMsg.ReturnValue = "OK";
                            returnMsg.ReturnMessage = "Data found";
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
                finally
                {
                    if (this.mySqlCon != null)
                    {
                        this.mySqlCon.Close();
                    }
                }
            }
            return lstFireApplication;
        }

        // Get Supervisor Application by Certificate Id
        public FireSupervisorApplication GetSupervisorApplicationByFireAppID(FireSupervisorApplication objSuperApp, ref ReturnMsgInfo returnMsg)
        {
            FireSupervisorApplication objSuperApplication = new FireSupervisorApplication();
            this.objConMain = new Connection_Main();

            string connString = this.objConMain.Get_Main_Connection(objSuperApp.ClientID);

            if (connString == null || connString == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Connection not found";
            }
            else
            {
                try
                {
                    this.mySqlCon = new MySqlConnection(connString);
                    if (this.mySqlCon.State.ToString() != "Open")
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
                        strSql = "SELECT * FROM tbl_firecertificate_supervisor_application WHERE CertificateId = '" + objSuperApp.CertificateId +"';";
                        da = new MySqlDataAdapter(strSql, this.mySqlCon);
                        ds = new DataSet();
                        da.Fill(ds, "FireApplication");
                        dt = ds.Tables["FireApplication"];
                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow dtRow in dt.Rows)
                            {
                                FireSupervisorApplication objSuperAppDetails = new FireSupervisorApplication();
                                objSuperAppDetails.Id = (int)dtRow["Id"];
                                objSuperAppDetails.CertificateId = dtRow["CertificateId"].ToString().Trim();
                                objSuperAppDetails.ApplicantName = dtRow["ApplicantName"].ToString().Trim();
                                objSuperAppDetails.BOwnerName = dtRow["OwnerName"].ToString().Trim();
                                objSuperAppDetails.LesseeName = dtRow["LesseeName"].ToString().Trim();
                                objSuperAppDetails.EmergencyContact = dtRow["EmergencyContact"].ToString().Trim();
                                objSuperAppDetails.BAddress = dtRow["Address"].ToString().Trim();
                                objSuperAppDetails.OtherAddresses = dtRow["OtherAddresses"].ToString().Trim();
                                objSuperAppDetails.DistRoadSigns = dtRow["DistRoadSigns"].ToString().Trim();
                                objSuperAppDetails.ShortestRoad = dtRow["ShortestRoad"].ToString().Trim();
                                objSuperAppDetails.BTelephone = dtRow["Telephone"].ToString().Trim();
                                objSuperAppDetails.Mobile = dtRow["Mobile"].ToString().Trim();
                                objSuperAppDetails.LandArea = (int)dtRow["LandArea"];
                                objSuperAppDetails.Capacity = (int)dtRow["Capacity"];
                                objSuperAppDetails.Stories = (int)dtRow["Stories"];
                                objSuperAppDetails.Construction = dtRow["Construction"].ToString().Trim();
                                objSuperAppDetails.BuildType = dtRow["BuildType"].ToString().Trim();
                                objSuperAppDetails.UnapprovedBuildings = dtRow["UnapprovedBuildings"].ToString().Trim();
                                objSuperAppDetails.PlanAvailability = dtRow["PlanAvailability"].ToString().Trim();
                                objSuperAppDetails.Exitways = dtRow["Exitways"].ToString().Trim();
                                objSuperAppDetails.EmergencyExits = dtRow["EmergencyExits"].ToString().Trim();
                                objSuperAppDetails.DayManpower = (int)dtRow["DayManpower"];
                                objSuperAppDetails.NightManpower = (int)dtRow["NightManpower"];
                                objSuperAppDetails.TankCapacity = (int)dtRow["TankCapacity"];
                                objSuperAppDetails.CommonTank = dtRow["CommonTank"].ToString().Trim();
                                objSuperAppDetails.FirehoseLocation = dtRow["FirehoseLocation"].ToString().Trim();
                                objSuperAppDetails.ElecPhase = dtRow["ElecPhase"].ToString().Trim();
                                objSuperAppDetails.Generator = dtRow["Generator"].ToString().Trim();
                                objSuperAppDetails.CurrentCircuit = dtRow["CurrentCircuit"].ToString().Trim();

                                objSuperApplication = objSuperAppDetails;
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
            return objSuperApplication;
        }

        // Get All supervisor applications
        public List<FireSupervisorApplication> GetAllSuperAppDetails(FireSupervisorApplication objSuperApp, ref ReturnMsgInfo returnMsg)
        {
            List<FireSupervisorApplication> lstFireSuperApp = new List<FireSupervisorApplication>();

            this.objConMain = new Connection_Main();
            string conString = this.objConMain.Get_Main_Connection(objSuperApp.ClientID);
            if (conString == null || conString == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Connection not found.";
            }
            else
            {
                try
                {
                    this.mySqlCon = new MySqlConnection(conString);
                    if (this.mySqlCon.State.ToString() != "Open")
                    {
                        this.mySqlCon.Open();
                    }
                    else
                    {
                        returnMsg.ReturnValue = "Error";
                        returnMsg.ReturnMessage = "Connection was already opened.";
                    }
                    if (this.mySqlCon != null)
                    {
                        strSql = "SELECT * FROM tbl_firecertificate_supervisor_application;";
                        da = new MySqlDataAdapter(strSql, this.mySqlCon);
                        ds = new DataSet();
                        da.Fill(ds, "Application");
                        dt = ds.Tables["Application"];
                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow dtRow in dt.Rows)
                            {
                                FireSupervisorApplication objSuperAppDetails = new Models.FireSupervisorApplication();
                                objSuperAppDetails.Id = (int)dtRow["Id"];
                                objSuperAppDetails.CertificateId = dtRow["CertificateId"].ToString().Trim();
                                objSuperAppDetails.ApplicantName = dtRow["ApplicantName"].ToString().Trim();
                                objSuperAppDetails.BOwnerName = dtRow["OwnerName"].ToString().Trim();
                                objSuperAppDetails.LesseeName = dtRow["LesseeName"].ToString().Trim();
                                objSuperAppDetails.EmergencyContact = dtRow["EmergencyContact"].ToString().Trim();
                                objSuperAppDetails.BAddress = dtRow["Address"].ToString().Trim();
                                objSuperAppDetails.OtherAddresses = dtRow["OtherAddresses"].ToString().Trim();
                                objSuperAppDetails.DistRoadSigns = dtRow["DistRoadSigns"].ToString().Trim();
                                objSuperAppDetails.ShortestRoad = dtRow["ShortestRoad"].ToString().Trim();
                                objSuperAppDetails.BTelephone = dtRow["Telephone"].ToString().Trim();
                                objSuperAppDetails.Mobile = dtRow["Mobile"].ToString().Trim();
                                objSuperAppDetails.LandArea = (int)dtRow["LandArea"];
                                objSuperAppDetails.Capacity = (int)dtRow["Capacity"];
                                objSuperAppDetails.Stories = (int)dtRow["Stories"];
                                objSuperAppDetails.Construction = dtRow["Construction"].ToString().Trim();
                                objSuperAppDetails.BuildType = dtRow["BuildType"].ToString().Trim();
                                objSuperAppDetails.UnapprovedBuildings = dtRow["UnapprovedBuildings"].ToString().Trim();
                                objSuperAppDetails.PlanAvailability = dtRow["PlanAvailability"].ToString().Trim();
                                objSuperAppDetails.Exitways = dtRow["Exitways"].ToString().Trim();
                                objSuperAppDetails.EmergencyExits = dtRow["EmergencyExits"].ToString().Trim();
                                objSuperAppDetails.DayManpower = (int)dtRow["DayManpower"];
                                objSuperAppDetails.NightManpower = (int)dtRow["NightManpower"];
                                objSuperAppDetails.TankCapacity = (int)dtRow["TankCapacity"];
                                objSuperAppDetails.CommonTank = dtRow["CommonTank"].ToString().Trim();
                                objSuperAppDetails.FirehoseLocation = dtRow["FirehoseLocation"].ToString().Trim();
                                objSuperAppDetails.ElecPhase = dtRow["ElecPhase"].ToString().Trim();
                                objSuperAppDetails.Generator = dtRow["Generator"].ToString().Trim();
                                objSuperAppDetails.CurrentCircuit = dtRow["CurrentCircuit"].ToString().Trim();

                                lstFireSuperApp.Add(objSuperAppDetails);
                            }
                            returnMsg.ReturnValue = "OK";
                            returnMsg.ReturnMessage = "Data found";
                        }
                    }
                }
                catch (Exception ex)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = ex.Message;
                }
                finally
                {
                    if (this.mySqlCon != null)
                    {
                        this.mySqlCon.Close();
                    }
                }
            }
            
            return lstFireSuperApp;
        }
    
        // Get All charges 
        public List<Charges> GetAllCharges(FireCertificateApplication objFireApp, ref ReturnMsgInfo returnMsg)
        {
            List<Charges> lstCharges = new List<Charges>();
            this.objConMain = new Connection_Main();

            string conString = this.objConMain.Get_Main_Connection(objFireApp.ClientID);
            if (conString == null || conString == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Connection not found.";
            }
            else
            {
                try
                {
                    this.mySqlCon = new MySqlConnection(conString);
                    if (this.mySqlCon.State.ToString() != "Open")
                    {
                        this.mySqlCon.Open();
                    }
                    else
                    {
                        returnMsg.ReturnValue = "Error";
                        returnMsg.ReturnMessage = "Connection was already opened.";
                    }
                    if (this.mySqlCon != null)
                    {
                        strSql = "SELECT Id, ChargeName, Amount FROM tbl_firecertificate_charges;";
                        da = new MySqlDataAdapter(strSql, this.mySqlCon);
                        ds = new DataSet();
                        da.Fill(ds, "Application");
                        dt = ds.Tables["Application"];
                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow dtRow in dt.Rows)
                            {
                                Charges objcharges = new Charges();
                                objcharges.Id = (int)dtRow["Id"];
                                objcharges.Amount = Convert.ToDecimal(dtRow["Amount"]);
                                objcharges.ChargeName = dtRow["ChargeName"].ToString().Trim();

                                lstCharges.Add(objcharges);
                            }
                            returnMsg.ReturnValue = "OK";
                            returnMsg.ReturnMessage = "Data found";
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
                finally
                {
                    if (this.mySqlCon != null)
                    {
                        this.mySqlCon.Close();
                    }
                }
            }


            return lstCharges;
        }
    
        //Get Charges by Id
        public Charges GetChargeById(Charges objCharge, ref ReturnMsgInfo returnMsg)
        {
            Charges objCharges = new Charges();
            this.objConMain = new Connection_Main();

            string connString = this.objConMain.Get_Main_Connection(objCharge.ClientID);

            if (connString == null || connString == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Connection not found";
            }
            else
            {
                try
                {
                    this.mySqlCon = new MySqlConnection(connString);
                    if (this.mySqlCon.State.ToString() != "Open")
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
                        strSql = "SELECT * FROM tbl_firecertificate_charges Where Id = '"+objCharge.Id+"'; ";
                        da = new MySqlDataAdapter(strSql, this.mySqlCon);
                        ds = new DataSet();
                        da.Fill(ds, "FireApplication");
                        dt = ds.Tables["FireApplication"];
                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow dtRow in dt.Rows)
                            {
                                Charges objChargeDetails = new Charges();
                                objChargeDetails.Id = (int)dtRow["Id"];
                                objChargeDetails.Amount = Convert.ToDecimal(dtRow["Amount"]);
                                objChargeDetails.ChargeName = dtRow["ChargeName"].ToString().Trim();

                                objCharges = objChargeDetails;
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
                catch(Exception ex)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = ex.Message;
                }
                finally
                {
                    this.mySqlCon.Close();
                }
            }
            return objCharges;
        }

        // Get payment details
        public PaymentDetails GetPaymentDetails(FireCertificateApplication objFireApp, ref ReturnMsgInfo returnMsg)
        {
            PaymentDetails objPaymentDetails = new PaymentDetails();
            this.objConMain = new Connection_Main();

            string connString = this.objConMain.Get_Main_Connection(objFireApp.ClientID);

            if (connString == null || connString == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Connection not found";
            }
            else
            {
                try
                {
                    this.mySqlCon = new MySqlConnection(connString);
                    if (this.mySqlCon.State.ToString() != "Open")
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
                        string strSql = "SELECT * FROM tbl_firecertificate_payment_details WHERE CertificateId = '"+objFireApp.CertificateId+"';";
                        da = new MySqlDataAdapter(strSql, this.mySqlCon);
                        ds = new DataSet();
                        da.Fill(ds, "FireApplication");
                        dt = ds.Tables["FireApplication"];
                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow dtRow in dt.Rows)
                            {
                                PaymentDetails objPayment = new Models.PaymentDetails();
                                objPayment.Id = (int)dtRow["Id"];
                                objPayment.CertificateId = dtRow["CertificateId"].ToString().Trim();
                                objPayment.Note = dtRow["Note"].ToString().Trim();
                                objPayment.TotAmt = Convert.ToDecimal(dtRow["TotAmt"]);
                                objPayment.ClientID = dtRow["User"].ToString().Trim();
                                objPayment.Date = dtRow["Date"].ToString().Trim();
                                objPayment.PaymentType = dtRow["PaymentType"].ToString().Trim();
                                objPayment.PaidDescription = dtRow["PaidDescription"].ToString().Trim();
                                objPayment.PaymentID = dtRow["PaymentID"].ToString().Trim();
                                objPayment.BillNo = dtRow["BillNo"].ToString().Trim();

                                objPaymentDetails = objPayment;
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
            }
            return objPaymentDetails; 
        }
    
        // Get applications to date
        public List<FireCertificateApplication> GetAppDetailsByDate(FireCertificateApplication objFireApp, ref ReturnMsgInfo returnMsg)
        {
            List<FireCertificateApplication> lstFireApplication = new List<FireCertificateApplication>();
            this.objConMain = new Connection_Main();

            string conString = this.objConMain.Get_Main_Connection(objFireApp.ClientID);

            if (conString == null || conString == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Connection not found.";
            }
            else
            {
                try
                {
                    this.mySqlCon = new MySqlConnection(conString);
                    if (this.mySqlCon.State.ToString() != "Open")
                    {
                        this.mySqlCon.Open();
                    }
                    else
                    {
                        returnMsg.ReturnValue = "Error";
                        returnMsg.ReturnMessage = "Connection was already opened.";
                    }
                    if (this.mySqlCon != null)
                    {
                        strSql = "SELECT * FROM tbl_firecertificate_application WHERE Status ='" + objFireApp.Status + "' AND DateApplied BETWEEN '" + objFireApp.StartDate + "' AND '" + objFireApp.EndDate + "';";
                        da = new MySqlDataAdapter(strSql, this.mySqlCon);
                        ds = new DataSet();
                        da.Fill(ds, "Application");
                        dt = ds.Tables["Application"];
                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow dtRow in dt.Rows)
                            {
                                FireCertificateApplication objFireAppDetails = new Models.FireCertificateApplication();
                                objFireAppDetails.Id = (int)dtRow["Id"];
                                objFireAppDetails.CertificateId = dtRow["CertificateId"].ToString().Trim();
                                objFireAppDetails.CompanyName = dtRow["CompanyName"].ToString().Trim();
                                objFireAppDetails.Address = dtRow["Address"].ToString().Trim();
                                objFireAppDetails.Telephone = dtRow["Telephone"].ToString().Trim();
                                objFireAppDetails.DistanceFromCouncil = (int)dtRow["DistanceFromCouncil"];
                                objFireAppDetails.NatureOfBusiness = dtRow["NatureOfBusiness"].ToString().Trim();
                                objFireAppDetails.BuildingDescription = dtRow["BuildingDescription"].ToString().Trim();
                                objFireAppDetails.BuildingPlan = dtRow["BuildingPlan"].ToString().Trim();
                                objFireAppDetails.TotalLand = (int)dtRow["TotalLand"];
                                objFireAppDetails.RoadFromCouncil = dtRow["RoadFromCouncil"].ToString().Trim();
                                objFireAppDetails.OwnerName = dtRow["OwnerName"].ToString().Trim();
                                objFireAppDetails.CurrentFirePlan = dtRow["CurrentFirePlan"].ToString().Trim();
                                objFireAppDetails.Status = dtRow["Status"].ToString().Trim();
                                var appDate = (DateTime)dtRow["DateApplied"];
                                objFireAppDetails.DateApplied = appDate.ToString("yyyy-MM-dd");
                                var revDate = (DateTime)dtRow["DateReviewed"];
                                if (revDate == DateTime.MinValue)
                                {
                                    objFireAppDetails.DateReviewed = "";
                                }
                                else
                                {
                                    objFireAppDetails.DateReviewed = revDate.ToString("yyyy-MM-dd");
                                }
                                objFireAppDetails.Supervisor = dtRow["Supervisor"].ToString().Trim();

                                lstFireApplication.Add(objFireAppDetails);
                            }
                            returnMsg.ReturnValue = "OK";
                            returnMsg.ReturnMessage = "Data found";
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
                finally
                {
                    if (this.mySqlCon != null)
                    {
                        this.mySqlCon.Close();
                    }
                }
            }
            return lstFireApplication;
        }
    }
}