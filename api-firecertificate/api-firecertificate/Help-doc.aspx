
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Help-doc.aspx.cs" Inherits="api_rate.Help_doc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <style>
        .pre {
            display: block;
            padding: 9.5px;
            margin: 0 0 10px;
            font-size: 13px;
            line-height: 1.428571429;
            color: #a5a3a3;
            word-break: break-all;
            word-wrap: break-word;
            background-color: #f5f5f5;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .left-div {
            height: 80%;
            top: 0;
            bottom: 0;
            z-index: 3;
            position: fixed;
        }
        .right-div {
            border-left: solid 1px white;
            margin-left: 20%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-2 left-div" > <!--style="height: 7000px; overflow-y: scroll; overflow-x: hidden;"-->
                <div><asp:Label ID="lblGetData" runat="server" Text="To Get Data" Font-Bold="true" Font-Size="Larger"></asp:Label></div>
                <div><a href="#apiFireApp" style="color:orange!important; font-size:small">01. Get Municipal Applications List</a></div>
                <div><a href="#apiFireAppById" style="color:orange!important; font-size:small">02. Get Applications By Id</a></div>
                <div><a href="#apiFireAppUId" style="color:orange!important; font-size:small" >03. Get Applications By User</a></div>
                <div><a href="#apiSuperApp" style="color:orange!important; font-size:small" >04. Get All Fire Department Applications</a></div>
                <br />
                <div><a href="#apiFireAppSubmit" style=" font-size:small">05. Submit Application</a></div>                
                <div><a href="#apiFireAppUpdate" style=" font-size:small">06. Update Application</a></div>
                <br />
                <div><a href="#apiAppApprove" style="color:red!important; font-size:small" >07. Approve Application</a></div>
                <div><a href="#apiAppReject" style="color:red!important; font-size:small" >08. Reject Application</a></div>
                <div><a href="#apiAssignSupervisor" style="color:red!important; font-size:small" >09. Assign Supervisor</a></div>
                <br />
                <div><a href="#apiChargebyId" style=" font-size:small">10. Charges</a></div>
                <div><a href="#apiPaymentSubmit" style=" font-size:small">11. Submit Payment</a></div>
                <br />
                <div><a href="#apiPendingbyDate" style="color:orange!important; font-size:small" >12. Pending Municipal applications by date</a></div>
                <div><a href="#apiApprovedbyDate" style="color:orange!important; font-size:small" >13. Approved Municipal applications by date</a></div>
                <div><a href="#apiRejectedbyDate" style="color:orange!important; font-size:small" >14. Rejected Municipal applications by date</a></div>
                <div><a href="#apiHoldbyDate" style="color:orange!important; font-size:small" >15. Hold Municipal applications by date</a></div>           
                <div><a href="#apiAssignedbyDate" style="color:orange!important; font-size:small" >16. Assigned Municipal applications by date</a></div>           
                <div><a href="#apiPaidbyDate" style="color:orange!important; font-size:small" >17. Paid Municipal applications by date</a></div>           
            </div>
            <div class="col-md-8 right-div">
                <h3>API Help Document</h3>
                <hr />
                <%--=================================== 01. Get Municipal Applications List =====================================================--%>
                <div id="apiFireApp">
                    <h3 class="heading">Get Municipal Applications List</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get all municipal council applications</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/FireAppAll</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>

                            </div>

                            <br />
                        </div>
                    </div>
                    <div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    &nbsp;&nbsp;"ListFireApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": 1,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CompanyName": "Company1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": "Company1, Colombo 07.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": "0710859897",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DistanceFromCouncil": 7,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NatureOfBusiness": "Sales",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingPlan": "plan.pdf",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingDescription": "Building Description in text",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotalLand": 10,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"RoadFromCouncil": "Highlevel rd.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"OwnerName": "Owner Name",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CurrentFirePlan": "Fire Extinguishers",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Pending",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": "useremail@mail.com",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateApplied": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateReviewed": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Supervisor": ""
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"StartDate": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"EndDate": null
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />
                                    "ReturnMessageInfo": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnMessage": "Data found"
                                    <br />
                                     }
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 02. Get Applications By Id ==============================================================--%>
                <div id="apiFireAppById">
                    <h3 class="heading">Get Municipal Applications By Id</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get a municipal council application by Id</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/FireAppById</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                                <div class="row">
                                <div class="col-sm-2 ">Id</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Application id.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Id":1
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>

                            </div>

                            <br />
                        </div>
                    </div>
                    <div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    &nbsp;&nbsp;"FireApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CompanyName": "Company1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": "Company1, Colombo 07.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": "0710859897",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DistanceFromCouncil": 7,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NatureOfBusiness": "Sales",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingPlan": "plan.pdf",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingDescription": "Building Description in text",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotalLand": 10,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"RoadFromCouncil": "Highlevel rd.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"OwnerName": "Owner Name",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CurrentFirePlan": "Fire Extinguishers",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Pending",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": "useremail@mail.com",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateApplied": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateReviewed": "15/2/2023 1:00:00 PM"
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Supervisor": ""
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"StartDate": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"EndDate": null
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />
                                    &nbsp;&nbsp;"PaymentDetails": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Note": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotAmt": 1500.00,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "TstUser",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentType": "Bank",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaidDescription": "Description",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentID": "123",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BillNo": "B112",
                                    <br />   
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />
                                    &nbsp;&nbsp;"SuperApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ApplicantName": "App Name",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "BOwnerName": "Owner",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "LesseeName": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "EmergencyContact": "Emergency Contact Person",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "BAddress": "Highlevel rd., Colombo.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "OtherAddresses": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "DistRoadSigns": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ShortestRoad": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "BTelephone": "0710899898",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Mobile": "0710899898",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "LandArea": 10,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Capacity": 10,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Stories": 5,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Construction": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "BuildType": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "UnapprovedBuildings": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "PlanAvailability": "Avaliable",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Exitways": "Two Exit ways",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "EmergencyExits": "Front door",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "DayManpower": 50,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "NightManpower": 2,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "TankCapacity": 20,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "CommonTank": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "FirehoseLocation": "Locations",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ElecPhase": "Three phase",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Generator": "available",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "CurrentCircuit": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />                                                                                                                                             
                                    "ReturnMessageInfo": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnMessage": "Data found"
                                    <br />
                                     }
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 03. Get Applications By User ============================================================--%>
                <div id="apiFireAppUId">
                    <h3 class="heading">Get Municipal Applications By User Id</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get a list of municipal council applications by User Id</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/FireAppByUserId</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>

                            </div>

                            <br />
                        </div>
                    </div>
                    <div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    &nbsp;&nbsp;"ListFireApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CompanyName": "Company1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": "Company1, Colombo 07.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": "0710859897",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DistanceFromCouncil": 7,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NatureOfBusiness": "Sales",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingPlan": "plan.pdf",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingDescription": "Building Description in text",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotalLand": 10,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"RoadFromCouncil": "Highlevel rd.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"OwnerName": "Owner Name",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CurrentFirePlan": "Fire Extinguishers",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Pending",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": "useremail@mail.com",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateApplied": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateReviewed": "15/2/2023 1:00:00 PM"
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Supervisor": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"StartDate": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"EndDate": null
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />
                                    &nbsp;&nbsp;"ListPayment": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Note": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotAmt": 1500.00,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "TstUser",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentType": "Bank",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaidDescription": "Description",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentID": "123",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BillNo": "B112",
                                    <br />   
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />                                              
                                    "ReturnMessageInfo": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnMessage": "Data found"
                                    <br />
                                     }
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 04. Get All Fire Department Applications ================================================--%>
                <div id="apiSuperApp">
                    <h3 class="heading">Get All Fire Department Applications</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get all Fire Department applications</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/SuperAppAll</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>

                            </div>

                            <br />
                        </div>
                    </div>
                    <div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    &nbsp;&nbsp;"ListSuperApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ApplicantName": "App Name",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "BOwnerName": "Owner",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "LesseeName": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "EmergencyContact": "Emergency Contact Person",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "BAddress": "Highlevel rd., Colombo.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "OtherAddresses": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "DistRoadSigns": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ShortestRoad": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "BTelephone": "0710899898",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Mobile": "0710899898",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "LandArea": 10,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Capacity": 10,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Stories": 5,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Construction": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "BuildType": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "UnapprovedBuildings": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "PlanAvailability": "Avaliable",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Exitways": "Two Exit ways",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "EmergencyExits": "Front door",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "DayManpower": 50,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "NightManpower": 2,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "TankCapacity": 20,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "CommonTank": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "FirehoseLocation": "Locations",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ElecPhase": "Three phase",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Generator": "available",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "CurrentCircuit": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />
                                    "ReturnMessageInfo": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnMessage": "Data found"
                                    <br />
                                     }
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 05. Submit Application ==================================================================--%>
                <div id="apiFireAppSubmit">
                    <h3 class="heading">Submit Application</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to submit the complete Application with two parts </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/AppSubmit</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">CompanyName</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Company Name
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">string</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "CompanyName": "CompanyName"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Address</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Company Address
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">string</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Address": "CompanyName, Colombo"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">Telephone</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Telephone number
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">string</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Telephone": "0711898989"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">DistanceFromCouncil</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Distance From Council
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "DistanceFromCouncil": 10
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">NatureOfBusiness</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Nature Of Business
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "NatureOfBusiness": "Sales"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">BuildingPlan</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Building plan attachment
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "BuildingPlan": "plan.pdf"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">BuildingDescription</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Building plan Description
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">No</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "BuildingPlan": "Building Description in text"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">TotalLand</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Land Area
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">Int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "TotalLand": 10
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">RoadFromCouncil</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Description of Road From Council
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "RoadFromCouncil": "Road"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">OwnerName</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Name of Owner
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "OwnerName": "Owner"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">CurrentFirePlan</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Current fire protection plan description
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "CurrentFirePlan": "Plan"
                                    }
                                </div>
                            </div>
                            <br />                           

                            <div class="row">
                            <div class="col-sm-2 ">Email</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Email
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Email": "user@mail.com"
                                    }
                                </div>
                            </div>
                            <br />                           

                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>

                            </div>
                            <br />
                            <!------------------------------------------------------- SuperApp --------------------------------------------------------------------------------------->
                            <div class="row">
                                <div class="col-sm-2 ">ApplicantName</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Applicant Name
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ApplicantName": "Applicant Name"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">BOwnerName</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Building Owner Name
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "BOwnerName": "Owner Name"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">LesseeName</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Lessee Name
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">No</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "LesseeName": ""
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">EmergencyContact</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Emergency Contact Person
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "EmergencyContact": "Contact Person Name"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">BAddress</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Building Address
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "BAddress": "Company Name, Colombo rd."
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">OtherAddresses</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Other Addresses
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">No</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "OtherAddresses": ""
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">DistRoadSigns</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Distinguishing Road Signs
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">No</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "DistRoadSigns": ""
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ShortestRoad</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Shortest road to the company
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ShortestRoad": "road description"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">BTelephone</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Building Telephone
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "BTelephone": "0710457845"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Mobile</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Mobile
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Mobile": "0710457845"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">LandArea</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Land Area
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "LandArea": 5
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Capacity</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Building Capacity
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Capacity": 25
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Stories</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Number of Stories
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Stories": 5
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Construction</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Construction
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">No</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Construction": ""
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">BuildType</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    BuildType
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">No</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "BuildType": ""
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">UnapprovedBuildings</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    If there are Unapproved Buildings
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">No</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "UnapprovedBuildings": ""
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">PlanAvailability</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Plan Availability
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "PlanAvailability": "available"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Exitways</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Exit ways
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Exitways": "two exit ways"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">EmergencyExits</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Emergency Exits
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "EmergencyExits": "Description of exits"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">DayManpower</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Manpower in day time
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "DayManpower": 10
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">NightManpower</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Manpower in night time
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "NightManpower": 10
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">TankCapacity</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Water tank capacity
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "TankCapacity": 10
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">CommonTank</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Common tank
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "CommonTank": "Common tank info."
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">FirehoseLocation</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Fire hose location
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "FirehoseLocation": "Fire hose location info."
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ElecPhase</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Electricity Phase
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ElecPhase": "Electricity phase info."
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Generator</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Generator info
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Generator": "Generator info."
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">CurrentCircuit</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Current circuit info
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "CurrentCircuit": "Current circuit info."
                                    }
                                </div>

                            </div>
                            <br />
                        </div>
                    </div>
                    <div style="overflow-y: hidden; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReturnMessage": "Application details successfully submitted.",
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 06. Update Application ==================================================================--%>
                <div id="apiFireAppUpdate">
                    <h3 class="heading">Update Application</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to update an application by Certificate Id</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/AppSubmit</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">CertificateId</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Application id.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "CertificateId": "FC001"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">CompanyName</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Company Name
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">string</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "CompanyName": "CompanyName"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Address</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Company Address
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">string</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Address": "CompanyName, Colombo"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">Telephone</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Telephone number
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">string</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Telephone": "0711898989"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">DistanceFromCouncil</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Distance From Council
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "DistanceFromCouncil": 10
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">NatureOfBusiness</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Nature Of Business
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "NatureOfBusiness": "Sales"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">BuildingPlan</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Building plan attachment
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "BuildingPlan": "plan.pdf"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">BuildingDescription</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Building plan Description
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">No</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "BuildingPlan": "Building Description in text"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">TotalLand</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Land Area
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">Int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "TotalLand": 10
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">RoadFromCouncil</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Description of Road From Council
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "RoadFromCouncil": "Road"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">OwnerName</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Name of Owner
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "OwnerName": "Owner"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">CurrentFirePlan</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Current fire protection plan description
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "CurrentFirePlan": "Plan"
                                    }
                                </div>
                            </div>
                            <br />                           

                            <div class="row">
                            <div class="col-sm-2 ">Email</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Email
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Email": "user@mail.com"
                                    }
                                </div>
                            </div>
                            <br />                           

                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>

                            </div>
                            <br />
                            <!------------------------------------------------------- SuperApp --------------------------------------------------------------------------------------->
                            <div class="row">
                                <div class="col-sm-2 ">ApplicantName</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Applicant Name
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ApplicantName": "Applicant Name"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">BOwnerName</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Building Owner Name
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "BOwnerName": "Owner Name"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">LesseeName</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Lessee Name
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">No</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "LesseeName": ""
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">EmergencyContact</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Emergency Contact Person
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "EmergencyContact": "Emergency Contact Person"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">BAddress</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Building Address
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "BAddress": "Company Name, Colombo rd."
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">OtherAddresses</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Other Addresses
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">No</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "OtherAddresses": ""
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">DistRoadSigns</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Distinguishing Road Signs
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">No</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "DistRoadSigns": ""
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ShortestRoad</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Shortest road to the company
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ShortestRoad": "road description"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">BTelephone</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Building Telephone
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "BTelephone": "0710457845"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Mobile</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Mobile
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Mobile": "0710457845"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">LandArea</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Land Area
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "LandArea": 5
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Capacity</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Building Capacity
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Capacity": 25
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Stories</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Number of Stories
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Stories": 5
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Construction</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Construction
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">No</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Construction": ""
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">BuildType</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    BuildType
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">No</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "BuildType": ""
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">UnapprovedBuildings</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    If there are Unapproved Buildings
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">No</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "UnapprovedBuildings": ""
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">PlanAvailability</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Plan Availability
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "PlanAvailability": "available"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Exitways</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Exit ways
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Exitways": "two exit ways"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">EmergencyExits</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Emergency Exits
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "EmergencyExits": "Description of exits"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">DayManpower</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Manpower in day time
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "DayManpower": 10
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">NightManpower</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Manpower in night time
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "NightManpower": 10
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">TankCapacity</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Water tank capacity
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "TankCapacity": 10
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">CommonTank</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Common tank
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "CommonTank": "Common tank info."
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">FirehoseLocation</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Fire hose location
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "FirehoseLocation": "Fire hose location info."
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ElecPhase</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Electricity Phase
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ElecPhase": "Electricity phase info."
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Generator</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Generator info
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Generator": "Generator info."
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">CurrentCircuit</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Current circuit info
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "CurrentCircuit": "Current circuit info."
                                    }
                                </div>

                            </div>
                            <br />
                        </div>
                    </div>
                    <div style="overflow-y: hidden; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReturnMessage": "Application successfully updated.",
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 07. Approve Application =================================================================--%>
                <div id="apiAppApprove">
                    <h3 class="heading">Approve Municipal Application</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to approve a municipal application</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/FireAppApprove</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">CertificateId</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Application id.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "CertificateId": "FC001"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>
                            </div>
                            <br />


                        </div>
                    </div>
                    <div style="overflow-y: hidden; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReturnMessage": "Application Successfully approved.",
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 08. Reject Application ==================================================================--%>
                <div id="apiAppReject">
                    <h3 class="heading">Reject Municipal Application</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to reject a municipal application</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/FireAppReject</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">CertificateId</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Application id.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "CertificateId": "FC001"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>
                            </div>
                            <br />


                        </div>
                    </div>
                    <div style="overflow-y: hidden; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReturnMessage": "Application Successfully rejected.",
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 09. Assign Supervisor ===================================================================--%>
                <div id="apiAssignSupervisor">
                    <h3 class="heading">Assign Supervisor</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to assign a supervisor to an application </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/AssignSupervisor</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">CertificateId</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Application id.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "CertificateId": "FC001"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Supervisor</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Supervisor Name
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Supervisor":"Supervisor 1"
                                    }
                                </div>
                            </div>
                            <br />

                             <div class="row">
                                <div class="col-sm-2 ">DateReviewed</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Date Reviewed
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">DateTime</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "DateReviewed":"2023/06/12 13:00"
                                    }
                                </div>
                            </div>
                            <br />
                        </div>
                    </div>
                    <div style="overflow-y: hidden; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReturnMessage": "Supervisor Successfully Assigned",
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>                
                <%--=================================== 10. Charges =============================================================================--%>
                <div id="apiChargebyId">
                    <h3 class="heading">Charges</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get all Charges</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/Charges</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>

                            </div>

                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Id</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Charge Id.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Id":1
                                    }
                                </div>

                            </div>

                            <br />
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    &nbsp;&nbsp;"ListFireApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ChargeName": "Inspection",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Amount": 1500.00,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />
                                    "ReturnMessageInfo": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnMessage": "Data found"
                                    <br />
                                     }
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 11. Submit Payment ======================================================================--%>
                <div id="apiPaymentSubmit">
                    <h3 class="heading">Submit Payment</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to submit payment details</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/Payment</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">CertificateId</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Application id.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "CertificateId": "FC001"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Note</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Note 
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">string</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Note": "Note"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">TotAmt</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Total Amount
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "TotAmt": 1500.0
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">Date</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Transaction Date
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">string</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "Date": "2023/06/02 13:00"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">PaymentType</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Payment Type
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">string</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "PaymentType": "Bank"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">PaidDescription</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Paid Description
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "PaidDescription": "Paid Description"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">PaymentID</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Payment ID
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "PaymentID": "123"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">BillNo</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Bill Number
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">Int</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "BillNo": "465"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>

                            </div>
                            <br />                           
                        </div>
                    </div>
                    <div style="overflow-y: hidden; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ReturnMessage": "Payment Successfully submitted.",
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 12. Pending Municipal applications by date ==============================================--%>
                <div id="apiPendingbyDate">
                    <h3 class="heading">Get Pending Municipal Applications Between given dates</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get a list of pending municipal council applications between given dates</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/FireAppPendingByDate</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">StartDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Start date of the search
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "StartDate":"2023-06-01"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">EndDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    End date of the search
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "EndDate":"2023-06-03"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>

                            </div>

                            <br />
                        </div>
                    </div>
                    <div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    &nbsp;&nbsp;"ListFireApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CompanyName": "Company1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": "Company1, Colombo 07.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": "0710859897",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DistanceFromCouncil": 7,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NatureOfBusiness": "Sales",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingPlan": "plan.pdf",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingDescription": "Building Description in text",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotalLand": 10,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"RoadFromCouncil": "Highlevel rd.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"OwnerName": "Owner Name",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CurrentFirePlan": "Fire Extinguishers",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Pending",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": "useremail@mail.com",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateApplied": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateReviewed": "15/2/2023 1:00:00 PM"
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Supervisor": null
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />
                                    &nbsp;&nbsp;"ListPayment": null,
                                    <br />   
                                    "ReturnMessageInfo": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnMessage": "Data found"
                                    <br />
                                     }
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 13. Approved Municipal applications by date =============================================--%>
                <div id="apiApprovedbyDate">
                    <h3 class="heading">Get Approved Municipal Applications Between given dates</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get a list of approved municipal council applications between given dates</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/FireAppApprovedByDate</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">StartDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Start date of the search
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "StartDate":"2023-06-01"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">EndDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    End date of the search
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "EndDate":"2023-06-03"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>

                            </div>

                            <br />
                        </div>
                    </div>
                    <div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    &nbsp;&nbsp;"ListFireApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CompanyName": "Company1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": "Company1, Colombo 07.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": "0710859897",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DistanceFromCouncil": 7,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NatureOfBusiness": "Sales",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingPlan": "plan.pdf",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingDescription": "Building Description in text",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotalLand": 10,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"RoadFromCouncil": "Highlevel rd.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"OwnerName": "Owner Name",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CurrentFirePlan": "Fire Extinguishers",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Approved",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": "useremail@mail.com",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateApplied": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateReviewed": "15/2/2023 1:00:00 PM"
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Supervisor": null
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />
                                    &nbsp;&nbsp;"ListPayment": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Note": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotAmt": 1500.00,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "TstUser",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentType": "Bank",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaidDescription": "Description",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentID": "123",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BillNo": "B112",
                                    <br />   
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />   
                                    "ReturnMessageInfo": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnMessage": "Data found"
                                    <br />
                                     }
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 14. Rejected Municipal applications by date =============================================--%>
                <div id="apiRejectedbyDate">
                    <h3 class="heading">Get Rejected Municipal Applications Between given dates</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get a list of rejected municipal council applications between given dates</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/FireAppRejectedByDate</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">StartDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Start date of the search
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "StartDate":"2023-06-01"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">EndDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    End date of the search
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "EndDate":"2023-06-03"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>

                            </div>

                            <br />
                        </div>
                    </div>
                    <div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    &nbsp;&nbsp;"ListFireApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CompanyName": "Company1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": "Company1, Colombo 07.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": "0710859897",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DistanceFromCouncil": 7,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NatureOfBusiness": "Sales",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingPlan": "plan.pdf",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingDescription": "Building Description in text",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotalLand": 10,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"RoadFromCouncil": "Highlevel rd.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"OwnerName": "Owner Name",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CurrentFirePlan": "Fire Extinguishers",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Rejected",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": "useremail@mail.com",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateApplied": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateReviewed": "15/2/2023 1:00:00 PM"
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Supervisor": null
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />
                                    &nbsp;&nbsp;"ListPayment": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Note": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotAmt": 1500.00,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "TstUser",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentType": "Bank",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaidDescription": "Description",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentID": "123",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BillNo": "B112",
                                    <br />   
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />   
                                    "ReturnMessageInfo": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnMessage": "Data found"
                                    <br />
                                     }
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 15. Hold Municipal applications by date =================================================--%>
                <div id="apiHoldbyDate">
                    <h3 class="heading">Get Hold Municipal Applications Between given dates</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get a list of holted municipal council applications between given dates</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/FireAppHoldByDate</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">StartDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Start date of the search
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "StartDate":"2023-06-01"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">EndDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    End date of the search
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "EndDate":"2023-06-03"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>

                            </div>

                            <br />
                        </div>
                    </div>
                    <div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    &nbsp;&nbsp;"ListFireApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CompanyName": "Company1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": "Company1, Colombo 07.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": "0710859897",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DistanceFromCouncil": 7,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NatureOfBusiness": "Sales",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingPlan": "plan.pdf",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingDescription": "Building Description in text",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotalLand": 10,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"RoadFromCouncil": "Highlevel rd.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"OwnerName": "Owner Name",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CurrentFirePlan": "Fire Extinguishers",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Hold",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": "useremail@mail.com",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateApplied": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateReviewed": "15/2/2023 1:00:00 PM"
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Supervisor": null
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />
                                    &nbsp;&nbsp;"ListPayment": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Note": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotAmt": 1500.00,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "TstUser",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentType": "Bank",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaidDescription": "Description",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentID": "123",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BillNo": "B112",
                                    <br />   
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />   
                                    "ReturnMessageInfo": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnMessage": "Data found"
                                    <br />
                                     }
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 16. Assigned Municipal applications by date =============================================--%>
                <div id="apiAssignedbyDate">
                    <h3 class="heading">Get Assigned Municipal Applications Between given dates</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get a list of municipal council applications that got a supervisor assigned between given dates</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/FireAppAssignedByDate</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">StartDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Start date of the search
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "StartDate":"2023-06-01"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">EndDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    End date of the search
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "EndDate":"2023-06-03"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>

                            </div>

                            <br />
                        </div>
                    </div>
                    <div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    &nbsp;&nbsp;"ListFireApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CompanyName": "Company1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": "Company1, Colombo 07.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": "0710859897",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DistanceFromCouncil": 7,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NatureOfBusiness": "Sales",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingPlan": "plan.pdf",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingDescription": "Building Description in text",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotalLand": 10,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"RoadFromCouncil": "Highlevel rd.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"OwnerName": "Owner Name",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CurrentFirePlan": "Fire Extinguishers",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Assigned",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": "useremail@mail.com",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateApplied": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateReviewed": "15/2/2023 1:00:00 PM"
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Supervisor": null
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />
                                    &nbsp;&nbsp;"ListPayment": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Note": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotAmt": 1500.00,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "TstUser",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentType": "Bank",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaidDescription": "Description",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentID": "123",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BillNo": "B112",
                                    <br />   
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />   
                                    "ReturnMessageInfo": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnMessage": "Data found"
                                    <br />
                                     }
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--=================================== 17. Paid Municipal applications by date =================================================--%>
                <div id="apiPaidbyDate">
                    <h3 class="heading">Get Paid Municipal Applications Between given dates</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get a list of municipal council applications with inspection charges paid between given dates</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/FireAppPaidByDate</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Request type</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Method</div>
                                <div class="col-sm-9">POST</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Content type</div>
                                <div class="col-sm-9">application/json</div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <div>List of parameters</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-2 ">StartDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Start date of the search
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "StartDate":"2023-06-01"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">EndDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    End date of the search
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "EndDate":"2023-06-03"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ClientID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    To identify user.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Required</div>
                                <div class="col-sm-8 ">Yes</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Data type</div>
                                <div class="col-sm-8 ">String</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 "></div>
                                <div class="col-sm-2 ">Example</div>
                                <div class="col-sm-8 ">
                                    {
                                      "ClientID":"TestId"
                                    }
                                </div>

                            </div>

                            <br />
                        </div>
                    </div>
                    <div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
                        <div>
                            <div>Response</div>
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-3 ">Response type</div>
                                <div class="col-sm-9">JSON</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response Status</div>
                                <div class="col-sm-9">200 - OK</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 ">Response values</div>
                                <div class="col-sm-9">
                                    { 
                                    &nbsp;&nbsp;"ListFireApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CompanyName": "Company1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": "Company1, Colombo 07.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": "0710859897",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DistanceFromCouncil": 7,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NatureOfBusiness": "Sales",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingPlan": "plan.pdf",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BuildingDescription": "Building Description in text",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotalLand": 10,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"RoadFromCouncil": "Highlevel rd.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"OwnerName": "Owner Name",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CurrentFirePlan": "Fire Extinguishers",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Paid",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": "useremail@mail.com",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateApplied": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"DateReviewed": "15/2/2023 1:00:00 PM"
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Supervisor": null
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />
                                    &nbsp;&nbsp;"ListPayment": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Note": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotAmt": 1500.00,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "TstUser",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "6/2/2023 1:00:00 PM",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentType": "Bank",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaidDescription": "Description",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentID": "123",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BillNo": "B112",
                                    <br />   
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }
                                    <br />
                                     ],
                                    <br />   
                                    "ReturnMessageInfo": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnValue": "OK",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReturnMessage": "Data found"
                                    <br />
                                     }
                                    <br />
                                    }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>ReturnMessageInfo List</div>
                            <br />
                        </div>
                        <div class="pre">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    "ReturnMessageInfo" is 2nd arry of the response and it has two objects "ReturnValue" and "ReturnMessage".
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">Description</div>
                                <div class="col-sm-2 ">ReturnValue</div>
                                <div class="col-sm-5">ReturnMessage</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If process successfully complete</div>
                                <div class="col-sm-2 ">"OK"</div>
                                <div class="col-sm-5">"Data found etc..."</div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-5 ">If any error occured</div>
                                <div class="col-sm-2 ">"Error"</div>
                                <div class="col-sm-5">"Invalid Client ID, Connection not found etc..."</div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
