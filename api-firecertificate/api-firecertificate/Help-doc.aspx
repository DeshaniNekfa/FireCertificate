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
            height: 90%;
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
            <div class="col-md-2 left-div">


                <%--<div><a href="#intro">Introduction</a></div>--%>
                <%--<div><a href="#apiParameter">List of Boutique</a></div>--%>
                <%--<div><a href="#apiExecute">Boutique Info</a></div>--%>

                <div><asp:Label ID="lblGetData" runat="server" Text="To Get Data" Font-Bold="true" Font-Size="Larger"></asp:Label></div>

                <div><a href="#apiFireApp">01. Get Municipal Applications List</a></div>
                <div><a href="#apiFireAppById">02. Get Municipal Applications By Id</a></div>
                <div><a href="#apiFireAppByStatus">03. Get Municipal Applications By Status</a></div>
                <div><a href="#apiFireAppUId">04. Get Municipal Applications By User Id</a></div>
                <div><a href="#apiSuperApp">05. Get All Fire Department Applications</a></div>
                <div><a href="#apiSuperAppByCertId">06. Get Fire Department Applications by Certifitate Id</a></div>
                <br />
                <div><a href="#apiFireAppSubmit">07. Submit Municipal Application</a></div>                
                <div><a href="#apiSuperAppSubmit">08. Submit Fire Department Application</a></div>
                <%--<div><a href="#copyright">Copyrights</a></div>--%>

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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "CertificateId": "FC004",
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "User",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"UserId": 0,
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
                <%--=================================== 02. Get Municipal Applications By Id ====================================================--%>
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "CertificateId": "FC004",
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "User",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"UserId": 0,
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
                <%--=================================== 03. Get Municipal Applications By Status ================================================--%>
                <div id="apiFireAppByStatus">
                    <h3 class="heading">Get Municipal Applications By Status</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get a list of municipal council applications by Status of the applications</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/FireAppByStatus</div>
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
                                <div class="col-sm-2 ">Status</div>
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
                                      "Status":"Pending"
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "CertificateId": "FC004",
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "User",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"UserId": 0,
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
                <%--=================================== 04. Get Municipal Applications By User Id ===============================================--%>
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
                                <div class="col-sm-2 ">Status</div>
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
                                      "User":5
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "CertificateId": "FC004",
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "User",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"UserId": 5,
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
                <%--=================================== 05. Get All Fire Department Applications ================================================--%>
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ApplicantName": "App Name",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "OwnerName": "Owner",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "LesseeName": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "EmergencyContact": "0710899898",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Address": "Highlevel rd., Colombo.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "OtherAddresses": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "DistRoadSigns": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ShortestRoad": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Telephone": "0710899898",
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
                <%--=================================== 06. Get Fire Department Applications by Certifitate Id ==================================--%>
                <div id="apiSuperAppByCertId">
                    <h3 class="heading">Get Fire Department Applications by Certifitate Id</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get a Fire Department application by Certificate Id</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/SuperAppByFireId</div>
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
                                    &nbsp;&nbsp;"FireSuperApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "CertificateId": "FC004",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ApplicantName": "App Name",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "OwnerName": "Owner",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "LesseeName": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "EmergencyContact": "0710899898",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Address": "Highlevel rd., Colombo.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "OtherAddresses": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "DistRoadSigns": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ShortestRoad": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Telephone": "0710899898",
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
                <%--=================================== 07. Submit Fire Department Application ==================================================--%>
                <div id="apiFireAppSubmit">
                    <h3 class="heading">Submit Municipal Application</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get a Fire Department application by Certificate Id</div>
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
                                      "RoadFromCouncil": ""
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
                            <div class="col-sm-2 ">Status</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Status of application
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
                                      "Status": "Pending"
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
                            <div class="col-sm-2 ">User</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Applicant's username 
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
                                      "User": "user"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">DateApplied</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Date applied 
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
                                      "DateApplied": "2023/06/02 13:00"
                                    }
                                </div>
                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">DateReviewed</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Date reviewed 
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
                                      "DateReviewed": "2023/06/12 13:00"
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ReturnMessage": "Application details successfully submitted.",
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
                <%--=================================== 08. Submit Municipal Application ========================================================--%>
                <div id="apiSuperAppSubmit">
                    <h3 class="heading">Submit Fire Department Application</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get a Fire Department application by Certificate Id</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://firecertificate-api.nekfa.com/api/SuperAppSubmit</div>
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
                            <div class="col-sm-2 ">OwnerName</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Owner Name
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
                                      "OwnerName": "Owner Name"
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
                                Emergency Contact number
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
                                      "EmergencyContact": "0710457845"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                            <div class="col-sm-2 ">Address</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Address
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
                                      "Address": "Company Name, Colombo rd."
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
                            <div class="col-sm-2 ">Telephone</div>
                            <div class="col-sm-2 ">Description</div>
                            <div class="col-sm-8 ">
                                Telephone
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
                                      "Telephone": "0710457845"
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ReturnMessage": "Application details successfully submitted.",
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
