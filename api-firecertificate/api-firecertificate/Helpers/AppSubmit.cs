using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using api_rate.Models;
using MySql.Data.MySqlClient;
using System.Data;

namespace api_rate.Helpers
{
    public class AppSubmit : IAppSubmit
    {
        private MySqlConnection mySqlCon = null;
        private MySqlTransaction mySqlTrans;
        private string strSql;
        private DataTable dt;
        private DataSet ds;
        private MySqlDataAdapter da;
        private Connection_Main objConMain;
        private CommonFunctions objCmnFunctions = null;
        private MySqlCommand cmd = null;

        public bool ValidateApplication(FireCertificateApplication objFireAppDetails, ref ReturnMsgInfo returnMsg)
        {
            bool IsSuccess = true;
            DateTime dt;
            objCmnFunctions = new CommonFunctions();

            // ClientID
            if (objFireAppDetails.ClientID == null || objFireAppDetails.ClientID == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Client ID.";
                IsSuccess = false;
            }

            if (objFireAppDetails.CertificateId == null || objFireAppDetails.CertificateId == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Certificate ID.";
                IsSuccess = false;
            }

            if (objFireAppDetails.CompanyName == null || objFireAppDetails.CompanyName == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Company Name.";
                IsSuccess = false;
            }


            if (objFireAppDetails.Address == null || objFireAppDetails.Address == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Address.";
                IsSuccess = false;
            }

            if (objFireAppDetails.Telephone == null || objFireAppDetails.Telephone == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid telephone number.";
                IsSuccess = false;
            }
            else
            {
                if (objFireAppDetails.Telephone.ToString().Trim().Length != 10)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = "Applicant's Mobile Number length should be 10.";
                    IsSuccess = false;
                }
                else if (objFireAppDetails.Telephone.ToString().Trim().StartsWith("0") == false)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = "Invalid format in Applicant's Mobile Number. (0XXXXXXXXX)";
                    IsSuccess = false;
                }
                else if (objCmnFunctions.ValidatePhoneNoDigits(objFireAppDetails.Telephone.ToString().Trim()) == false)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = "Applicant's Mobile Number should contain only digits.";
                    IsSuccess = false;
                }
            }

            if (objFireAppDetails.DistanceFromNegambo == null || objFireAppDetails.DistanceFromNegambo < 0)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Distance value.";
                IsSuccess = false;
            }

            if (objFireAppDetails.NatureOfBusiness == null || objFireAppDetails.NatureOfBusiness == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Nature of Business.";
                IsSuccess = false;
            }

            if (objFireAppDetails.BuildingPlan == null || objFireAppDetails.BuildingPlan == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Building Plan is required.";
                IsSuccess = false;
            }

            if (objFireAppDetails.TotalLand == null || objFireAppDetails.TotalLand < 0)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Land value.";
                IsSuccess = false;
            }

            if (objFireAppDetails.RoadFromNegambo == null || objFireAppDetails.RoadFromNegambo == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Road from Negambo is required.";
                IsSuccess = false;
            }

            if (objFireAppDetails.OwnerName == null || objFireAppDetails.OwnerName == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Owner name is required.";
                IsSuccess = false;
            }

            if (objFireAppDetails.Status == null || objFireAppDetails.Status == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Status missing.";
                IsSuccess = false;
            }

            if (objFireAppDetails.DateApplied == null)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Date Applied Date is required.";
                IsSuccess = false;
            }
            else if (objFireAppDetails.DateApplied.ToString().Trim() == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Date Applied Date is required.";
                IsSuccess = false;
            }
            else if (objCmnFunctions.IsValidDate(objFireAppDetails.DateApplied.ToString().Trim()) == false)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Applied Date.";
                IsSuccess = false;
            }

            if (objFireAppDetails.DateReviewed == null)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Date Applied Date is required.";
                IsSuccess = false;
            }
            else if (objFireAppDetails.DateReviewed.ToString().Trim() == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Date Applied Date is required.";
                IsSuccess = false;
            }
            else if (objCmnFunctions.IsValidDate(objFireAppDetails.DateReviewed.ToString().Trim()) == false)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Reviewed Date.";
                IsSuccess = false;
            }

            return IsSuccess;
        }
        public bool SaveApplication(FireCertificateApplication objFireAppDetails, ref ReturnMsgInfo returnMsg)
        {
            bool isSaved = false;
            this.objConMain = new Connection_Main();
            try
            {
                string conString = this.objConMain.Get_Main_Connection(objFireAppDetails.ClientID);
                if (conString == null || conString == "")
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = "Connection not found.";
                }
                else
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
                        strSql = "INSERT INTO tbl_firecertificate_application(CertificateId,CompanyName,Address,Telephone,DistanceFromNegambo,NatureOfBusiness,BuildingPlan,TotalLand,RoadFromNegambo,OwnerName,CurrentFirePlan,Status,DateApplied,DateReviewed) VALUES ('" + objFireAppDetails.CertificateId + "','" + objFireAppDetails.CompanyName + "','" + objFireAppDetails.Address + "','" + objFireAppDetails.Telephone + "'," + objFireAppDetails.DistanceFromNegambo + ",'" + objFireAppDetails.NatureOfBusiness + "','" + objFireAppDetails.BuildingPlan + "'," + objFireAppDetails.TotalLand + ",'" + objFireAppDetails.RoadFromNegambo + "','" + objFireAppDetails.OwnerName + "','" + objFireAppDetails.CurrentFirePlan + "','" + objFireAppDetails.Status + "','" + objFireAppDetails.DateApplied + "','" + objFireAppDetails.DateReviewed + "'); UPDATE tbl_firecertificate_index SET NextApplicationId=(NextApplicationId + 1);";
                        cmd = new MySqlCommand(strSql, this.mySqlCon, this.mySqlTrans);
                        cmd.ExecuteNonQuery();
                        isSaved = true;

                        returnMsg.ReturnValue = "OK";
                        returnMsg.ReturnMessage = "Submitted successfully";
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
                    if (this.mySqlCon.State.ToString() == "Open")
                    {
                        this.mySqlCon.Close();
                    }
                }
            }
            return isSaved;
        }
    }
}