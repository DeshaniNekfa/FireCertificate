﻿using System;
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

        // Validate Municipal Council Application
        public bool ValidateApplication(FireCertificateApplication objFireAppDetails, ref ReturnMsgInfo returnMsg)
        {
            bool IsSuccess = true;
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

            if (objFireAppDetails.DistanceFromCouncil == null || objFireAppDetails.DistanceFromCouncil < 0)
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

            if (objFireAppDetails.RoadFromCouncil == null || objFireAppDetails.RoadFromCouncil == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Road from Council is required.";
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
            // Email Validation
            if (objFireAppDetails.Email != null && objFireAppDetails.Email != "" && objFireAppDetails.Email.Length > 0)
            {
                if (objCmnFunctions.IsValidEmail(objFireAppDetails.Email) == false)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = "Invalid Applicant's Email Address.";
                    IsSuccess = false;
                }
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

        // Submit Municipal Council Application
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
                        strSql = "INSERT INTO tbl_firecertificate_application(CertificateId, CompanyName, Address, Telephone, DistanceFromCouncil, NatureOfBusiness, BuildingPlan, TotalLand, RoadFromCouncil, OwnerName, CurrentFirePlan, Status, DateApplied, DateReviewed) VALUES (@CertificateId, @CompanyName, @Address, @Telephone, @DistanceFromCouncil, @NatureOfBusiness, @BuildingPlan, TotalLand, RoadFromCouncil, @OwnerName, @CurrentFirePlan, @Status, @DateApplied, @DateReviewed); UPDATE tbl_firecertificate_index SET NextApplicationId=(NextApplicationId + 1);";
                        cmd = new MySqlCommand(strSql, this.mySqlCon, this.mySqlTrans);

                        cmd.Parameters.Add("@CertificateId", objFireAppDetails.CertificateId);
                        cmd.Parameters.Add("@CompanyName", objFireAppDetails.CompanyName);
                        cmd.Parameters.Add("@Address", objFireAppDetails.Address);
                        cmd.Parameters.Add("@Telephone", objFireAppDetails.Telephone);
                        cmd.Parameters.Add("@DistanceFromCouncil", objFireAppDetails.DistanceFromCouncil);
                        cmd.Parameters.Add("@NatureOfBusiness", objFireAppDetails.NatureOfBusiness);
                        cmd.Parameters.Add("@BuildingPlan", objFireAppDetails.BuildingPlan);
                        cmd.Parameters.Add("@TotalLand", objFireAppDetails.TotalLand);
                        cmd.Parameters.Add("@RoadFromCouncil", objFireAppDetails.RoadFromCouncil);
                        cmd.Parameters.Add("@OwnerName", objFireAppDetails.OwnerName);
                        cmd.Parameters.Add("@CurrentFirePlan", objFireAppDetails.CurrentFirePlan);
                        cmd.Parameters.Add("@Status", objFireAppDetails.Status);
                        cmd.Parameters.Add("@DateApplied", objFireAppDetails.DateApplied);
                        cmd.Parameters.Add("@DateReviewed", objFireAppDetails.DateReviewed);
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

        // Validate Fire Department Application
        public bool ValidateSupervisorApplication(FireSupervisorApplication objFireSuperApp, ReturnMsgInfo returnMsg)
        {
            bool IsSuccess = true;
            objCmnFunctions = new CommonFunctions();

            // ClientID
            if (objFireSuperApp.ClientID == null || objFireSuperApp.ClientID == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Client ID.";
                IsSuccess = false;
            }

            // CertificateId
            if (objFireSuperApp.CertificateId == null || objFireSuperApp.CertificateId == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Certificate ID.";
                IsSuccess = false;
            }

            // Applicant Name
            if (objFireSuperApp.ApplicantName == null || objFireSuperApp.ApplicantName == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Applicant Name.";
                IsSuccess = false;
            }

            // Owner Name
            if (objFireSuperApp.OwnerName == null || objFireSuperApp.OwnerName == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Owner Name.";
                IsSuccess = false;
            }

            // Emergency Number
            if (objFireSuperApp.EmergencyContact == null || objFireSuperApp.EmergencyContact == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Emergency number.";
                IsSuccess = false;
            }
            else
            {
                if (objFireSuperApp.EmergencyContact.ToString().Trim().Length != 10)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = "Applicant's Emergency Number length should be 10.";
                    IsSuccess = false;
                }
                else if (objFireSuperApp.EmergencyContact.ToString().Trim().StartsWith("0") == false)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = "Invalid format in Applicant's Emergency Number. (0XXXXXXXXX)";
                    IsSuccess = false;
                }
                else if (objCmnFunctions.ValidatePhoneNoDigits(objFireSuperApp.EmergencyContact.ToString().Trim()) == false)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = "Applicant's Emergency Number should contain only digits.";
                    IsSuccess = false;
                }
            }

            // Address
            if (objFireSuperApp.Address == null || objFireSuperApp.Address == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid telephone number.";
                IsSuccess = false;
            }

            // Telephone
            if (objFireSuperApp.Telephone == null || objFireSuperApp.Telephone == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid telephone number.";
                IsSuccess = false;
            }
            else
            {
                if (objFireSuperApp.Telephone.ToString().Trim().Length != 10)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = "Applicant's Telephoone Number length should be 10.";
                    IsSuccess = false;
                }
                else if (objFireSuperApp.Telephone.ToString().Trim().StartsWith("0") == false)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = "Invalid format in Applicant's Telephone Number. (0XXXXXXXXX)";
                    IsSuccess = false;
                }
                else if (objCmnFunctions.ValidatePhoneNoDigits(objFireSuperApp.Telephone.ToString().Trim()) == false)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = "Applicant's Telephone Number should contain only digits.";
                    IsSuccess = false;
                }
            }

            // Mobile
            if (objFireSuperApp.Mobile == null || objFireSuperApp.Mobile == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid mobile number.";
                IsSuccess = false;
            }
            else
            {
                if (objFireSuperApp.Mobile.ToString().Trim().Length != 10)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = "Applicant's Mobile Number length should be 10.";
                    IsSuccess = false;
                }
                else if (objFireSuperApp.Mobile.ToString().Trim().StartsWith("0") == false)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = "Invalid format in Applicant's Mobile Number. (0XXXXXXXXX)";
                    IsSuccess = false;
                }
                else if (objCmnFunctions.ValidatePhoneNoDigits(objFireSuperApp.Mobile.ToString().Trim()) == false)
                {
                    returnMsg.ReturnValue = "Error";
                    returnMsg.ReturnMessage = "Applicant's Mobile Number should contain only digits.";
                    IsSuccess = false;
                }
            }

            // Land Area
            if (objFireSuperApp.LandArea == null || objFireSuperApp.LandArea <= 0)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Land Area.";
                IsSuccess = false;
            }

            // Capacity
            if (objFireSuperApp.Capacity == null || objFireSuperApp.Capacity <= 0)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Capacity.";
                IsSuccess = false;
            }

            // Stories
            if (objFireSuperApp.Stories == null || objFireSuperApp.Stories <= 1)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Number of stories.";
                IsSuccess = false;
            }

            // Plan Availability
            if (objFireSuperApp.PlanAvailability == null || objFireSuperApp.PlanAvailability == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Plan information.";
                IsSuccess = false;
            }

            // Exitways
            if (objFireSuperApp.Exitways == null || objFireSuperApp.Exitways == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Exitway information.";
                IsSuccess = false;
            }
             
            // Emergency Exits
            if (objFireSuperApp.EmergencyExits == null || objFireSuperApp.EmergencyExits == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Emergency Exit Information.";
                IsSuccess = false;
            }

            // Day Manpower
            if (objFireSuperApp.DayManpower == null || objFireSuperApp.DayManpower < 0)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Capacity.";
                IsSuccess = false;
            }

            // Night manpower
            if (objFireSuperApp.NightManpower == null || objFireSuperApp.NightManpower < 0)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Capacity.";
                IsSuccess = false;
            }

            // Tank Capacity
            if (objFireSuperApp.TankCapacity == null || objFireSuperApp.TankCapacity <= 0)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Capacity.";
                IsSuccess = false;
            }

            // Fire hose location
            if (objFireSuperApp.FirehoseLocation == null || objFireSuperApp.FirehoseLocation == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Fire hose location Information.";
                IsSuccess = false;
            }

            // Electricity phase
            if (objFireSuperApp.ElecPhase == null || objFireSuperApp.ElecPhase == "")
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Electricity phase Information.";
                IsSuccess = false;
            }
            

            return IsSuccess;
        }

        // Submit Fire Department Application
        public bool SaveSupervisorApplication(FireSupervisorApplication objFireSuperApp, ReturnMsgInfo returnMsg)
        {
            bool isSaved = false;
            this.objConMain = new Connection_Main();

            try
            {
                string conString = this.objConMain.Get_Main_Connection(objFireSuperApp.ClientID);
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
                        strSql = "INSERT INTO tbl_firecertificate_supervisor_application(CertificateId ,ApplicantName ,OwnerName ,LesseeName ,EmergencyContact ,Address ,OtherAddresses ,DistRoadSigns ,ShortestRoad ,Telephone ,Mobile ,LandArea ,Capacity ,Stories ,Construction ,BuildType ,UnapprovedBuildings ,PlanAvailability ,Exitways ,EmergencyExits ,DayManpower ,NightManpower ,TankCapacity ,CommonTank ,FirehoseLocation ,ElecPhase ,Generator ,CurrentCircuit) VALUES ( @CertificateId, @ApplicantName, @OwnerName, @LesseeName, @EmergencyContact, @Address, @OtherAddresses, @DistRoadSigns, @ShortestRoad, @Telephone, @Mobile, @LandArea, @Capacity, @Stories, @Construction, @BuildType, @UnapprovedBuildings, @PlanAvailability, @Exitways, @EmergencyExits, @DayManpower, @NightManpower, @TankCapacity, @CommonTank, @FirehoseLocation, @ElecPhase, @Generator, @CurrentCircuit);";
                        cmd = new MySqlCommand(strSql, this.mySqlCon, this.mySqlTrans);

                        cmd.Parameters.Add("@CertificateId", objFireSuperApp.CertificateId);
                        cmd.Parameters.Add("@ApplicantName", objFireSuperApp.ApplicantName);
                        cmd.Parameters.Add("@OwnerName", objFireSuperApp.OwnerName);
                        cmd.Parameters.Add("@LesseeName", objFireSuperApp.LesseeName);
                        cmd.Parameters.Add("@EmergencyContact", objFireSuperApp.EmergencyContact);
                        cmd.Parameters.Add("@Address", objFireSuperApp.Address);
                        cmd.Parameters.Add("@OtherAddresses", objFireSuperApp.OtherAddresses);
                        cmd.Parameters.Add("@DistRoadSigns", objFireSuperApp.DistRoadSigns);
                        cmd.Parameters.Add("@ShortestRoad", objFireSuperApp.ShortestRoad);
                        cmd.Parameters.Add("@Telephone", objFireSuperApp.Telephone);
                        cmd.Parameters.Add("@Mobile", objFireSuperApp.Mobile);
                        cmd.Parameters.Add("@LandArea", objFireSuperApp.LandArea);
                        cmd.Parameters.Add("@Capacity", objFireSuperApp.Capacity);
                        cmd.Parameters.Add("@Stories", objFireSuperApp.Stories);
                        cmd.Parameters.Add("@Construction", objFireSuperApp.Construction);
                        cmd.Parameters.Add("@BuildType", objFireSuperApp.BuildType);
                        cmd.Parameters.Add("@UnapprovedBuildings", objFireSuperApp.UnapprovedBuildings);
                        cmd.Parameters.Add("@PlanAvailability", objFireSuperApp.PlanAvailability);
                        cmd.Parameters.Add("@Exitways", objFireSuperApp.Exitways);
                        cmd.Parameters.Add("@EmergencyExits", objFireSuperApp.EmergencyExits);
                        cmd.Parameters.Add("@DayManpower", objFireSuperApp.DayManpower);
                        cmd.Parameters.Add("@NightManpower", objFireSuperApp.NightManpower);
                        cmd.Parameters.Add("@TankCapacity", objFireSuperApp.TankCapacity);
                        cmd.Parameters.Add("@CommonTank", objFireSuperApp.CommonTank);
                        cmd.Parameters.Add("@ElecPhase", objFireSuperApp.ElecPhase);
                        cmd.Parameters.Add("@Generator", objFireSuperApp.Generator);
                        cmd.Parameters.Add("@CurrentCircuit", objFireSuperApp.CurrentCircuit);

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