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
        private DataTable dt;
        private DataSet ds;
        private MySqlDataAdapter da;
        private string strSql;
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

            //if (objFireAppDetails.CertificateId == null || objFireAppDetails.CertificateId == "")
            //{
            //    returnMsg.ReturnValue = "Error";
            //    returnMsg.ReturnMessage = "Invalid Certificate ID.";
            //    IsSuccess = false;
            //}

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

            //if (objFireAppDetails.Status == null || objFireAppDetails.Status == "")
            //{
            //    returnMsg.ReturnValue = "Error";
            //    returnMsg.ReturnMessage = "Status missing.";
            //    IsSuccess = false;
            //}
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

            //if (objFireAppDetails.DateApplied == null)
            //{
            //    returnMsg.ReturnValue = "Error";
            //    returnMsg.ReturnMessage = "Date Applied Date is required.";
            //    IsSuccess = false;
            //}
            //else if (objFireAppDetails.DateApplied.ToString().Trim() == "")
            //{
            //    returnMsg.ReturnValue = "Error";
            //    returnMsg.ReturnMessage = "Date Applied Date is required.";
            //    IsSuccess = false;
            //}
            //else if (objCmnFunctions.IsValidDate(objFireAppDetails.DateApplied.ToString().Trim()) == false)
            //{
            //    returnMsg.ReturnValue = "Error";
            //    returnMsg.ReturnMessage = "Invalid Applied Date.";
            //    IsSuccess = false;
            //}

            //if (objFireAppDetails.DateReviewed != null)
            //{
            //    if (objFireAppDetails.DateReviewed.ToString().Trim() == "")
            //    {
            //        returnMsg.ReturnValue = "Error";
            //        returnMsg.ReturnMessage = "Date Applied Date is required.";
            //        IsSuccess = false;
            //    }
            //    else if (objCmnFunctions.IsValidDate(objFireAppDetails.DateReviewed.ToString().Trim()) == false)
            //    {
            //        returnMsg.ReturnValue = "Error";
            //        returnMsg.ReturnMessage = "Invalid Reviewed Date.";
            //        IsSuccess = false;
            //    }
            //}

            return IsSuccess;
        }

        // Submit Municipal Council Application
        public bool SaveApplication(FireCertificateApplication objFireAppDetails, ref ReturnMsgInfo returnMsg)
        {
            bool isSaved = false;
            Index objIndex = new Index();
            this.objConMain = new Connection_Main();

            objIndex = GetIndexes(objFireAppDetails, ref returnMsg);
            var certId = objIndex.Code.ToString().Trim() + objIndex.NextId.ToString().Trim();

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
                        strSql = "INSERT INTO tbl_firecertificate_application(CertificateId, CompanyName, Address, Telephone, DistanceFromCouncil, NatureOfBusiness, BuildingDescription ,BuildingPlan, TotalLand, RoadFromCouncil, OwnerName, CurrentFirePlan, Status, Email, Supervisor, DateApplied, DateReviewed, user) VALUES (@CertificateId, @CompanyName, @Address, @Telephone, @DistanceFromCouncil, @NatureOfBusiness, @BuildingDescription,@BuildingPlan, @TotalLand, @RoadFromCouncil, @OwnerName, @CurrentFirePlan, @Status, @Email, @Supervisor, @DateApplied, @DateReviewed, @user); UPDATE tbl_firecertificate_index SET NextApplicationId=(NextApplicationId + 1);";
                        cmd = new MySqlCommand(strSql, this.mySqlCon, this.mySqlTrans);
                        cmd.Parameters.AddWithValue("@CertificateId", certId.ToString().Trim());
                        cmd.Parameters.AddWithValue("@CompanyName", objFireAppDetails.CompanyName);
                        cmd.Parameters.AddWithValue("@Address", objFireAppDetails.Address);
                        cmd.Parameters.AddWithValue("@Telephone", objFireAppDetails.Telephone);
                        cmd.Parameters.AddWithValue("@DistanceFromCouncil", objFireAppDetails.DistanceFromCouncil);
                        cmd.Parameters.AddWithValue("@NatureOfBusiness", objFireAppDetails.NatureOfBusiness);
                        cmd.Parameters.AddWithValue("@BuildingDescription", objFireAppDetails.BuildingDescription);
                        cmd.Parameters.AddWithValue("@BuildingPlan", objFireAppDetails.BuildingPlan);
                        cmd.Parameters.AddWithValue("@TotalLand", objFireAppDetails.TotalLand);
                        cmd.Parameters.AddWithValue("@RoadFromCouncil", objFireAppDetails.RoadFromCouncil);
                        cmd.Parameters.AddWithValue("@OwnerName", objFireAppDetails.OwnerName);
                        cmd.Parameters.AddWithValue("@CurrentFirePlan", objFireAppDetails.CurrentFirePlan);
                        cmd.Parameters.AddWithValue("@Status", Globals.PENDING.ToString().Trim());
                        cmd.Parameters.AddWithValue("@Email", objFireAppDetails.Email);
                        cmd.Parameters.AddWithValue("@Supervisor", "");
                        cmd.Parameters.AddWithValue("@DateApplied", DateTime.Now.ToString("yyyy-MM-dd").Trim());
                        cmd.Parameters.AddWithValue("@DateReviewed", "");
                        cmd.Parameters.AddWithValue("@user", objFireAppDetails.ClientID);
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
        public bool ValidateSupervisorApplication(FireSupervisorApplication objFireSuperApp, ref ReturnMsgInfo returnMsg)
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
            //if (objFireSuperApp.CertificateId == null || objFireSuperApp.CertificateId == "")
            //{
            //    returnMsg.ReturnValue = "Error";
            //    returnMsg.ReturnMessage = "Invalid Certificate ID.";
            //    IsSuccess = false;
            //}

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
            if (objFireSuperApp.LandArea <= 0)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Land Area.";
                IsSuccess = false;
            }

            // Capacity
            if (objFireSuperApp.Capacity <= 0)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Capacity.";
                IsSuccess = false;
            }

            // Stories
            if (objFireSuperApp.Stories < 1)
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
            if (objFireSuperApp.DayManpower < 0)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Capacity.";
                IsSuccess = false;
            }

            // Night manpower
            if (objFireSuperApp.NightManpower < 0)
            {
                returnMsg.ReturnValue = "Error";
                returnMsg.ReturnMessage = "Invalid Capacity.";
                IsSuccess = false;
            }

            // Tank Capacity
            if (objFireSuperApp.TankCapacity <= 0)
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
        public bool SaveSupervisorApplication(FireSupervisorApplication objFireSuperApp, ref ReturnMsgInfo returnMsg)
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
                        cmd.Parameters.Add("@FirehoseLocation", objFireSuperApp.FirehoseLocation);
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
    
        // Set Application status Approved
        public bool SetStatusApprove(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg)
        {
            bool isApporoved = false;
            this.objConMain = new Connection_Main();

            try
            {
                string conString = this.objConMain.Get_Main_Connection(objFireApp.ClientID);
                if (conString == null || conString == "")
                {
                    objReturnMsg.ReturnValue = "Error";
                    objReturnMsg.ReturnMessage = "Connection not found.";
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
                        objReturnMsg.ReturnValue = "Error";
                        objReturnMsg.ReturnMessage = "Connection was already opened.";
                    }

                    if (this.mySqlCon != null)
                    {
                        strSql = "UPDATE tbl_firecertificate_application SET Status = 'Approved' WHERE CertificateId = '"+objFireApp.CertificateId+"';";
                        cmd = new MySqlCommand(strSql, this.mySqlCon, this.mySqlTrans);
                        cmd.ExecuteNonQuery();
                        isApporoved = true;

                        objReturnMsg.ReturnValue = "OK";
                        objReturnMsg.ReturnMessage = "Submitted successfully";
                    }
                }
            }
            catch (Exception ex)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = ex.Message;
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

            return isApporoved;
        }
    
        // Set Application status Rejected
        public bool SetStatusReject(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg)
        {
            bool isRejected = false;
            this.objConMain = new Connection_Main();

            try
            {
                string conString = this.objConMain.Get_Main_Connection(objFireApp.ClientID);
                if (conString == null || conString == "")
                {
                    objReturnMsg.ReturnValue = "Error";
                    objReturnMsg.ReturnMessage = "Connection not found.";
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
                        objReturnMsg.ReturnValue = "Error";
                        objReturnMsg.ReturnMessage = "Connection was already opened.";
                    }

                    if (this.mySqlCon != null)
                    {
                        strSql = "UPDATE tbl_firecertificate_application SET Status = 'Rejected' WHERE CertificateId = '" + objFireApp.CertificateId + "';";
                        cmd = new MySqlCommand(strSql, this.mySqlCon, this.mySqlTrans);
                        cmd.ExecuteNonQuery();
                        isRejected = true;

                        objReturnMsg.ReturnValue = "OK";
                        objReturnMsg.ReturnMessage = "Submitted successfully";
                    }
                }
            }
            catch (Exception ex)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = ex.Message;
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

            return isRejected;
        }

        // Assign Supervisor
        public bool AssignSupervisor(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg)
        {
            bool isAssigned = false;
            objCmnFunctions = new CommonFunctions();
            this.objConMain = new Connection_Main();

            if (objFireApp.Supervisor == null || objFireApp.Supervisor == "")
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = "Invalid Supervisor.";
                isAssigned = false;
            }
            else if(objFireApp.DateReviewed == null || objFireApp.DateReviewed == "")
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = "Invalid Review";
                isAssigned = false;
            }
            else if (objFireApp.DateReviewed.ToString().Trim() == "")
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = "Date Applied Date is required.";
                isAssigned = false;
            }
            else if (objCmnFunctions.IsValidDate(objFireApp.DateReviewed.ToString().Trim()) == false)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = "Invalid Reviewed Date.";
                isAssigned = false;
            }
            else
            {
                try
                {
                    string conString = this.objConMain.Get_Main_Connection(objFireApp.ClientID);
                    if (conString == null || conString == "")
                    {
                        objReturnMsg.ReturnValue = "Error";
                        objReturnMsg.ReturnMessage = "Connection not found.";
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
                            objReturnMsg.ReturnValue = "Error";
                            objReturnMsg.ReturnMessage = "Connection was already opened.";
                        }

                        if (this.mySqlCon != null)
                        {
                            string strSql = "UPDATE tbl_firecertificate_application SET Supervisor = '" + objFireApp.Supervisor + "', DateReviewed ='" + objFireApp.DateReviewed + "' WHERE CertificateId = '" + objFireApp.CertificateId + "';";
                            cmd = new MySqlCommand(strSql, this.mySqlCon, this.mySqlTrans);
                            cmd.ExecuteNonQuery();
                            isAssigned = true;

                            objReturnMsg.ReturnValue = "OK";
                            objReturnMsg.ReturnMessage = "Submitted successfully";
                        }

                    }
                }
                catch (Exception ex)
                {
                    objReturnMsg.ReturnValue = "Error";
                    objReturnMsg.ReturnMessage = ex.Message;
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
            }
            return isAssigned;
        }
    
        // Validate Payment
        public bool ValidatePayment(PaymentDetails objPayment, ref ReturnMsgInfo objReturnMsg)
        {
            bool isValid = true;
            objCmnFunctions = new CommonFunctions();

            // Client Id
            if (objPayment.ClientID == null || objPayment.ClientID == "")
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = "Invalid Client ID.";
                isValid = false;
            }

            // CertificateId
            if (objPayment.CertificateId == null || objPayment.CertificateId == "")
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = "Invalid Certificate ID.";
                isValid = false;
            }

            // Total Amount 
            if (objPayment.TotAmt == null || objPayment.TotAmt <= 0)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = "Invalid Amount.";
                isValid = false;
            }

            // Date
            if (objPayment.Date == null || objPayment.Date == "")
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = "Invalid Date";
                isValid = false;
            }
            else if (objPayment.Date.ToString().Trim() == "")
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = "Date is required.";
                isValid = false;
            }
            else if (objCmnFunctions.IsValidDate(objPayment.Date.ToString().Trim()) == false)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = "Invalid Date.";
                isValid = false;
            }

            // payment type
            if (objPayment.PaymentType == null || objPayment.PaymentType == "")
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = "Invalid payment type.";
                isValid = false;
            }

            // Payment Description
            if (objPayment.BillNo == null || objPayment.BillNo == "")
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = "Invalid Bill No.";
                isValid = false;
            }

            return isValid;
        }

        // Add payment
        public bool AddPayment(PaymentDetails objPayment, ref ReturnMsgInfo objReturnMsg)
        {
            bool isSaved = false;

            this.objConMain = new Connection_Main();
            try
            {
                string conString = this.objConMain.Get_Main_Connection(objPayment.ClientID);
                if (conString == null || conString == "")
                {
                    objReturnMsg.ReturnValue = "Error";
                    objReturnMsg.ReturnMessage = "Connection not found.";
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
                        objReturnMsg.ReturnValue = "Error";
                        objReturnMsg.ReturnMessage = "Connection was already opened.";
                    }

                    if (this.mySqlCon != null)
                    {
                        if (objPayment.PaidDescription == Globals.INSPECTION.ToString().Trim())
                        {
                            strSql = "INSERT INTO tbl_firecertificate_payment_details( CertificateId ,Note ,TotAmt ,User ,Date ,PaymentType ,PaidDescription ,PaymentID ,BillNo)VALUES( @CertificateId ,@Note ,@TotAmt ,@User ,@Date ,@PaymentType ,@PaidDescription ,@PaymentID ,@BillNo); UPDATE tbl_firecertificate_application SET Status = '" + Globals.PAID.ToString().Trim() + "' WHERE CertificateId = @CertificateId;";
                        }
                        else if (objPayment.PaidDescription == Globals.ANNUAL.ToString().Trim())
                        {
                            strSql = "INSERT INTO tbl_firecertificate_payment_details( CertificateId ,Note ,TotAmt ,User ,Date ,PaymentType ,PaidDescription ,PaymentID ,BillNo)VALUES( @CertificateId ,@Note ,@TotAmt ,@User ,@Date ,@PaymentType ,@PaidDescription ,@PaymentID ,@BillNo); UPDATE tbl_firecertificate_application SET Status = '" + Globals.ISSUED.ToString().Trim() + "' WHERE CertificateId = @CertificateId;";
                        }

                        cmd = new MySqlCommand(strSql, this.mySqlCon, this.mySqlTrans);
                        cmd.Parameters.AddWithValue("@CertificateId", objPayment.CertificateId);
                        cmd.Parameters.AddWithValue("@Note", objPayment.Note);
                        cmd.Parameters.AddWithValue("@TotAmt", objPayment.TotAmt);
                        cmd.Parameters.AddWithValue("@User", objPayment.ClientID);
                        cmd.Parameters.AddWithValue("@Date", objPayment.Date);
                        cmd.Parameters.AddWithValue("@PaymentType", objPayment.PaymentType);
                        cmd.Parameters.AddWithValue("@PaidDescription", objPayment.PaidDescription);
                        cmd.Parameters.AddWithValue("@PaymentID", objPayment.PaymentID);
                        cmd.Parameters.AddWithValue("@BillNo", objPayment.BillNo);
                        cmd.ExecuteNonQuery();
                        isSaved = true;

                        objReturnMsg.ReturnValue = "OK";
                        objReturnMsg.ReturnMessage = "Submitted successfully";

                    }
                }
            }
            catch (Exception ex)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = ex.Message;
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

        // Get data from Indexes table
        public Index GetIndexes(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg)
        {
            Index objIndexes = new Index();
            this.objConMain = new Connection_Main();

            string conString = this.objConMain.Get_Main_Connection(objFireApp.ClientID);
            if (conString == null || conString == "")
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = "Connection not found.";
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
                        objReturnMsg.ReturnValue = "Error";
                        objReturnMsg.ReturnMessage = "Connection was already opened.";
                    }
                    if (this.mySqlCon != null)
                    {
                        strSql = "SELECT * FROM tbl_firecertificate_index;";
                        da = new MySqlDataAdapter(strSql, this.mySqlCon);
                        ds = new DataSet();
                        da.Fill(ds, "Application");
                        dt = ds.Tables["Application"];
                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow dtRow in dt.Rows)
                            {
                                Index objIndex = new Index();
                                objIndex.Code = dtRow["Code"].ToString().Trim();
                                objIndex.NextId = (int)dtRow["NextApplicationId"];

                                objIndexes = objIndex;
                            }
                            objReturnMsg.ReturnValue = "OK";
                            objReturnMsg.ReturnMessage = "Data found";
                        }
                        else
                        {
                            objReturnMsg.ReturnValue = "Error";
                            objReturnMsg.ReturnMessage = "No data found";
                        }
                    }
                }
                catch (Exception ex)
                {
                    objReturnMsg.ReturnValue = "Error";
                    objReturnMsg.ReturnMessage = ex.Message;
                }
                finally
                {
                    if (this.mySqlCon != null)
                    {
                        this.mySqlCon.Close();
                    }
                }
            }


            return objIndexes;
        }
    
        // Update Municipal certificate
        public bool UpdateFireCertificate(FireCertificateApplication objFireApp, ref ReturnMsgInfo objReturnMsg)
        {
            bool isUpdated = false;
            this.objConMain = new Connection_Main();

            try
            {
                string conString = this.objConMain.Get_Main_Connection(objFireApp.ClientID);
                if (conString == null || conString == "")
                {
                    objReturnMsg.ReturnValue = "Error";
                    objReturnMsg.ReturnMessage = "Connection not found.";
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
                        objReturnMsg.ReturnValue = "Error";
                        objReturnMsg.ReturnMessage = "Connection was already opened.";
                    }

                    if (this.mySqlCon != null)
                    {
                        strSql = "UPDATE tbl_firecertificate_application SET CompanyName='" + objFireApp.CompanyName + "',Address='" + objFireApp.Address + "',Telephone='" + objFireApp.Telephone + "',DistanceFromCouncil='" + objFireApp.DistanceFromCouncil + "',NatureOfBusiness='" + objFireApp.NatureOfBusiness + "', BuildingDescription = '"+objFireApp.BuildingDescription+"' ,BuildingPlan = '" + objFireApp.BuildingPlan + "',TotalLand='" + objFireApp.TotalLand + "' ,RoadFromCouncil='" + objFireApp.RoadFromCouncil + "',OwnerName='" + objFireApp.OwnerName + "' ,CurrentFirePlan='" + objFireApp.CurrentFirePlan + "',Email='" + objFireApp.Email + "' ,Supervisor='' ,DateApplied='" + DateTime.Now.ToString("yyyy-MM-dd").Trim() + "',DateReviewed='' ,user = '" + objFireApp.ClientID + "' WHERE CertificateId = '" + objFireApp.CertificateId + "';";
                        cmd = new MySqlCommand(strSql, this.mySqlCon, this.mySqlTrans);
                        cmd.ExecuteNonQuery();
                        isUpdated = true;

                        objReturnMsg.ReturnValue = "OK";
                        objReturnMsg.ReturnMessage = "updated successfully";
                    }
                }
            }
            catch (Exception ex)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = ex.Message;
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

            return isUpdated; 
        }
    }
}