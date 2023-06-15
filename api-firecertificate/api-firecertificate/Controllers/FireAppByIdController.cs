using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using api_rate.Models;
using api_rate.Helpers;
using api_rate.Filters;
using System.Web.Http;
using System.Net.Http;

namespace api_rate.Controllers
{
    [JwtCustomAuth]
    public class FireAppByIdController : ApiController
    {
        private IGetData _getData = null;

        public FireAppByIdController(IGetData IGetData)
        {
            _getData = IGetData;
        }

        // POST /api/FireAppById
        public FireAppByIdOutput Post([FromBody]FireCertificateApplication objFireApplication)
        {
            FireAppByIdOutput objFireAppByIdOutput = new FireAppByIdOutput();
            FireSupervisorApplication objSuperApp = new FireSupervisorApplication();
            ReturnMsgInfo objReturnMsg = new ReturnMsgInfo();
            ReturnMsgInfo objPayReturnMsg = new ReturnMsgInfo();
            PaymentDetails objPayment = new PaymentDetails();
            FireCertificateApplication objFireApp = new FireCertificateApplication();

            try
            {
                if (objFireApplication.ClientID == null || objFireApplication.ClientID == "")
                {
                    throw new Exception("Invalid Client ID.");
                }
                else if (objFireApplication.Id == null || objFireApplication.Id == 0)
                {
                    throw new Exception("Application id is required");
                }
                else
                {
                    // get first application
                    objFireApp = _getData.GetApplicationById(objFireApplication, ref objReturnMsg);

                    // assign certId for payment
                    objFireApplication.CertificateId = objFireApp.CertificateId;

                    // get payment details
                    objPayment = _getData.GetPaymentDetails(objFireApplication, ref objPayReturnMsg);

                    // assign cert Id for second application
                    objSuperApp.CertificateId = objFireApplication.CertificateId;

                    // assign client id for second application 
                    objSuperApp.ClientID = objFireApplication.ClientID;

                    // get second application
                    objSuperApp = _getData.GetSupervisorApplicationByFireAppID(objSuperApp, ref objReturnMsg);

                    objFireApp.ClientID = objSuperApp.ClientID;
                    objFireApp.CertificateId = objSuperApp.CertificateId;
                    objFireApp.ApplicantName = objSuperApp.ApplicantName;
                    objFireApp.BOwnerName = objSuperApp.BOwnerName;
                    objFireApp.LesseeName = objSuperApp.LesseeName;
                    objFireApp.EmergencyContact = objSuperApp.EmergencyContact;
                    objFireApp.BAddress = objSuperApp.BAddress;
                    objFireApp.OtherAddresses = objSuperApp.OtherAddresses;
                    objFireApp.DistRoadSigns = objSuperApp.DistRoadSigns;
                    objFireApp.ShortestRoad = objSuperApp.ShortestRoad;
                    objFireApp.BTelephone = objSuperApp.BTelephone;
                    objFireApp.Mobile = objSuperApp.Mobile;
                    objFireApp.LandArea = objSuperApp.LandArea;
                    objFireApp.Capacity = objSuperApp.Capacity;
                    objFireApp.Stories = objSuperApp.Stories;
                    objFireApp.Construction = objSuperApp.Construction;
                    objFireApp.BuildType = objSuperApp.BuildType;
                    objFireApp.UnapprovedBuildings = objSuperApp.UnapprovedBuildings;
                    objFireApp.PlanAvailability = objSuperApp.PlanAvailability;
                    objFireApp.Exitways = objSuperApp.Exitways;
                    objFireApp.EmergencyExits = objSuperApp.EmergencyExits;
                    objFireApp.DayManpower = objSuperApp.DayManpower;
                    objFireApp.NightManpower = objSuperApp.NightManpower;
                    objFireApp.TankCapacity = objSuperApp.TankCapacity;
                    objFireApp.CommonTank = objSuperApp.CommonTank;
                    objFireApp.FirehoseLocation = objSuperApp.FirehoseLocation;
                    objFireApp.ElecPhase = objSuperApp.ElecPhase;
                    objFireApp.Generator = objSuperApp.Generator;
                    objFireApp.CurrentCircuit = objSuperApp.CurrentCircuit;

                    if (objReturnMsg.ReturnValue != "OK")
                    {
                        throw new Exception("Error occurred when retrieve application details. " + objReturnMsg.ReturnMessage.ToString().Trim());
                    }
                }
            }
            catch (Exception ex)
            {
                objReturnMsg.ReturnValue = "Error";
                objReturnMsg.ReturnMessage = ex.Message.ToString().Trim();
            }

            objFireAppByIdOutput.FireApplication = objFireApp;
            objFireAppByIdOutput.PaymentDetails = objPayment;
            objFireAppByIdOutput.ReturnMessageInfo = objReturnMsg;

            return objFireAppByIdOutput;
        }
    }
}