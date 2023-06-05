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

                <div><a href="#apiReasons">01. Reasons List</a></div>
                <div><a href="#apiPlaces">02. Places List</a></div>
                <div><a href="#apiGetApplicationByStatus" style="color:orange!important;">03. App. Details by status</a></div>
                <div><a href="#apiGetApplicationById" style="color:orange!important;">04. App. Details by id</a></div>
                <div><a href="#apiGetApplicationAmts">05. App. Amount Details</a></div>
                <div><a href="#apiGetApplicationByStatusDtRng" style="color:red!important;">06. App. Details by status (Date Range)</a></div>
                <div><a href="#apiGetAppPayDetails" style="color:red!important;">07. App. Payment Details</a></div>
                <div><a href="#apiGetAppByUsrId" style="color:red!important;">08. App. Details by user id</a></div>
                <div><a href="#apiGetAppSumryById" style="color:red!important;">09. App. Summary by id</a></div>
                <div><a href="#apiGetBankPaySummary" style="color:red!important;">10. App. Bank Payment Summary by id</a></div>
                <div><a href="#apiGetManualPaySummary" style="color:red!important;">11. App. Manual Payment Summary by id</a></div>

                <div style="height:30px!important;"></div>
                <div><asp:Label ID="lblDBTransaction" runat="server" Text="To Update Database" Font-Bold="true" Font-Size="Larger"></asp:Label></div>

                <div><a href="#apiApplication">01. App. Submit</a></div>
                <div><a href="#apiAppReject">02. App. Reject</a></div>
                <div><a href="#apiAppApprove" style="color:red!important;">03. App. Approve</a></div>
                <div><a href="#apiAppManulPay" style="color:red!important;">04. App. Manual Payment</a></div>
                <div><a href="#apiAppBankPay" style="color:red!important;">05. App. Bank Payment</a></div>
                <div><a href="#apiSaveBankPayRslt" style="color:red!important;">06. App. Bank Payment Result</a></div>
                <%--<div><a href="#copyright">Copyrights</a></div>--%>

            </div>
            <div class="col-md-8 right-div">
                <h3>API Help Document</h3>
                <hr />



                <%--<div id="intro">
                    <h3 class="heading">Introduction</h3>
                    <p>
                       
                    </p>
                </div>--%>




                <%--=================================== 01. Reasons List =====================================================--%>



                <div id="apiReasons">
                    <h3 class="heading">Reasons List</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get Reason List when pass ClientID parameter.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppReason</div>
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
                                    &nbsp;&nbsp;"ListReason": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Reason": "Birthday",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;},
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "2",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Reason": "Wedding",
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



                <%--=================================== 02. Places List =====================================================--%>



                <div id="apiPlaces">
                    <h3 class="heading">Places List</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get Place List when pass ClientID parameter.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppPlace</div>
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
                                    &nbsp;&nbsp;"ListPlace": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "Place": "Rajapaksha Garden",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;},
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": "2",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Place": "Avenra Garden",
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



                <%--=================================== 03. App. Details by status =====================================================--%>



                <div id="apiGetApplicationByStatus">
                    <h3 class="heading">Application Details by status</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get application details by status (Pending, Approved, Rejected, Paid) when pass Status, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppByStatus</div>
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
                                    Application status. (Pending, Approved, Rejected, Paid)
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
                    <div style="height: 780px; overflow-y: scroll; overflow-x: hidden;">
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
                                    &nbsp;&nbsp;"ListApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": 1,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BookingId": "GP0001",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReasonID": 2,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Reason": "Birthday",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PlaceID": 2,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Place": "Avenra Garden",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Name": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NIC": "901234567V",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": "4th Floor, No. 131, W A D Ramanayake Mawatha, Colombo 02",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Mobile": "0710123456",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": "0117820820",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": "info@nekfa.com",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Council": 0,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"InCouncil": "No",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NICCopy": "E:/Attachments/",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReserveDate": "2023/12/25 00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"StartTime": "2023/12/25 08:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"EndTime": "2023/12/25 17:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Pending",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"UserId": 0,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "2023/01/01 00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryDescription": "Application details successfully submitted.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryStatus": "Pending",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryUsr": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryDate": "2023/01/01 00:00"
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;}
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; 
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



                <%--=================================== 04. App. Details by id =====================================================--%>



                <div id="apiGetApplicationById">
                    <h3 class="heading">Application Details by id</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get application details by id when pass Id, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppById</div>
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
                    <div style="height: 1040px; overflow-y: scroll; overflow-x: hidden;">
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
                                    &nbsp;&nbsp;"AppDetails": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": 1,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BookingId": "GP0001",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReasonID": 2,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Reason": "Birthday",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PlaceID": 2,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Place": "Avenra Garden",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Name": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NIC": "901234567V",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": "4th Floor, No. 131, W A D Ramanayake Mawatha, Colombo 02",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Mobile": "0710123456",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": "0117820820",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": "info@nekfa.com",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Council": 0,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"InCouncil": "No",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NICCopy": "E:/Attachments/",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReserveDate": "2023/12/25 00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"StartTime": "2023/12/25 08:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"EndTime": "2023/12/25 17:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Pending",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"UserId": 0,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "2023/01/01 00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryDescription": "Application details successfully submitted.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryStatus": "Pending",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryUsr": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryDate": "2023/01/01 00:00"
                                    <br />
                                    &nbsp;&nbsp;},
                                    <br />
                                    &nbsp;&nbsp;"AppHistoryDetails": [
                                    <br />
                                    &nbsp;&nbsp;{
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": 1,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ApplicationId": 1,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Description": "Application details successfully submitted.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Pending",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "2023/01/01 00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;} 
                                    <br />
                                    ],
                                    <br />
                                    "AppPaymentDetails": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "Place": "Rajapaksha Garden",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "ReserveDate": ""2023/05/17 00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "TotAmt": "300.00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; "PaymentDueDate": "2023/12/25 00:00"
                                    <br />
                                    },
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



                <%--=================================== 05. App. Amount Details =====================================================--%>



                <div id="apiGetApplicationAmts">
                    <h3 class="heading">Application Amount Details</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get application amount details when pass Id, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppAmts</div>
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
                    <div style="height: 800px; overflow-y: scroll; overflow-x: hidden;">
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
                                    &nbsp;&nbsp;"ObjApplication": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": 0,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BookingId": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReasonID": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Reason": "Wedding Photoshoot",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PlaceID": "1",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Place": "Rajapaksha Garden",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Name": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NIC": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Mobile": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Council": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"InCouncil": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NICCopy": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReserveDate": "2023/05/26 00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"StartTime": "2023/05/26 03:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"EndTime": "2023/05/26 09:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"UserId": 0,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "0001-01-01T00:00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryDescription": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryStatus": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryUsr": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryDate": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Comment": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"FixedAmt": 3000.00,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ExtraAmt": 3000.00,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotalAmt": 6000.00
                                    <br />
                                    &nbsp;&nbsp;},
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



                <%--=================================== 06. App. Details by status (Date Range) =====================================================--%>



                <div id="apiGetApplicationByStatusDtRng">
                    <h3 class="heading">Application Details by status (Date Range)</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get application details by status for a date range (Pending, Approved, Rejected, Paid) when pass Status, FromDate, ToDate, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppByStatusDtRng</div>
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
                                    Application status. (Pending, Approved, Rejected, Paid)
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
                                <div class="col-sm-2 ">FromDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Date range start date.
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
                                      "FromDate":"2023/01/01 00:00"
                                    }
                                </div>

                            </div>
                            <br />



                            <div class="row">
                                <div class="col-sm-2 ">ToDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Date range end date.
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
                                      "ToDate":"2023/01/02 00:00"
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
                    <div style="height: 780px; overflow-y: scroll; overflow-x: hidden;">
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
                                    &nbsp;&nbsp;"ListApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": 1,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BookingId": "GP0001",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReasonID": 2,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Reason": "Birthday",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PlaceID": 2,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Place": "Avenra Garden",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Name": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NIC": "901234567V",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": "4th Floor, No. 131, W A D Ramanayake Mawatha, Colombo 02",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Mobile": "0710123456",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": "0117820820",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": "info@nekfa.com",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Council": 0,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"InCouncil": "No",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NICCopy": "E:/Attachments/",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReserveDate": "2023/12/25 00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"StartTime": "2023/12/25 08:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"EndTime": "2023/12/25 17:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Pending",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"UserId": 0,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "2023/01/01 00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryDescription": "Application details successfully submitted.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryStatus": "Pending",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryUsr": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryDate": "2023/01/01 00:00"
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;}
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; 
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



                <%--=================================== 07. App. Payment Details =====================================================--%>



                <div id="apiGetAppPayDetails">
                    <h3 class="heading">Application Payment Details</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get application payment details when pass Id, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppGetPayDetails</div>
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
                    <div style="height: 550px; overflow-y: scroll; overflow-x: hidden;">
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
                                    &nbsp;&nbsp;"objAppPayCnfirmDetails": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": 0,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ApplicationId": 157,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Note": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentDueDate": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"FixedAmt": "1000.00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ExtraAmt": "0.0",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotAmt": "1000.00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "0001-01-01T00:00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentType": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaidDate": "0001-01-01T00:00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaidDescription": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"InCouncil": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BankFee": "10.00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotServiceFee": "1010.00"
                                    <br />
                                    },
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



                <%--=================================== 08. App. Details by user id =====================================================--%>



                <div id="apiGetAppByUsrId">
                    <h3 class="heading">Application Details by user id</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get application details by user id when pass UserId, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppByLogUsr</div>
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
                                <div class="col-sm-2 ">UserId</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Relevant user id.
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
                                      "UserId":"49"
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
                    <div style="height: 690px; overflow-y: scroll; overflow-x: hidden;">
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
                                    &nbsp;&nbsp;"ListApplication": [
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": 1,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BookingId": "GP0001",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReasonID": 2,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Reason": "Birthday",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PlaceID": 2,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Place": "Avenra Garden",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Name": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NIC": "901234567V",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": "4th Floor, No. 131, W A D Ramanayake Mawatha, Colombo 02",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Mobile": "0710123456",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": "0117820820",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": "info@nekfa.com",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Council": 0,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"InCouncil": "No",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NICCopy": "E:/Attachments/",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReserveDate": "2023/12/25 00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"StartTime": "2023/12/25 08:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"EndTime": "2023/12/25 17:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Pending",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"UserId": 0,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "2023/01/01 00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null                                  
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;}
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



                <%--=================================== 09. App. Summary by id =====================================================--%>



                <div id="apiGetAppSumryById">
                    <h3 class="heading">Application Summary by id</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get application summary by application id when pass Id, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppSumryById</div>
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
                                      "Id":150
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
                    <div style="height: 868px; overflow-y: scroll; overflow-x: hidden;">
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
                                    &nbsp;&nbsp;"AppDetails": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Id": 1,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BookingId": "GP0001",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReasonID": 2,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Reason": "Birthday",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PlaceID": 2,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Place": "Avenra Garden",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Name": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NIC": "901234567V",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Address": "4th Floor, No. 131, W A D Ramanayake Mawatha, Colombo 02",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Mobile": "0710123456",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Telephone": "0117820820",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Email": "info@nekfa.com",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Council": 0,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"InCouncil": "No",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NICCopy": "E:/Attachments/",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReserveDate": "2023/12/25 00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"StartTime": "2023/12/25 08:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"EndTime": "2023/12/25 17:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Status": "Pending",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"User": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"UserId": 0,
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Date": "2023/01/01 00:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null,                                 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryDescription": null,                                 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryStatus": null,                                 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryUsr": null,                                 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"HstryDate": null,                                 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Comment": null,                                 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"FixedAmt": 0.0,                                 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ExtraAmt": 0.0,                                 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotalAmt": 0.0,                                 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"FromDate": null,                                 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ToDate": null,                                 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ServiceFee": "6000.00",                                 
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaidDate": "2023/12/25 00:00"                                
                                    <br />
                                    },
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



                <%--=================================== 10. App. Bank Payment Summary by id =====================================================--%>



                <div id="apiGetBankPaySummary">
                    <h3 class="heading">Application Bank Payment Summary by id</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get application bank payment summary details by id when pass Id, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppBankPaySumry</div>
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
                    <div style="height: 500px; overflow-y: scroll; overflow-x: hidden;">
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
                                    &nbsp;&nbsp;"PayDetails": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ApplicationId": "154",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Name": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NIC": "998899883V",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BookingId": "GP0001",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaidDate": "2023/05/30 08:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"OrderID": "14GP0003",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ReferenceNo": "12345",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"CardNo": "xxxxxxxxxxxxxx09",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PayByFirstName": "A",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PayByMiddleName": "",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PayByLastName": "WIJERATNE",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PayAmount": "7000.00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ConvenienceFee": "50.00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotalAmount": "7050.00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null                               
                                    <br />
                                    &nbsp;&nbsp;},
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



                <%--=================================== 11. App. Manual Payment Summary by id =====================================================--%>



                <div id="apiGetManualPaySummary">
                    <h3 class="heading">Application Manual Payment Summary by id</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to get application manual payment summary details by id when pass Id, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppManualPaySumry</div>
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
                    <div style="height: 450px; overflow-y: scroll; overflow-x: hidden;">
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
                                    &nbsp;&nbsp;"PayDetails": {
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ApplicationId": "154",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"Name": "A. Wijeratne",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"NIC": "998899883V",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BookingId": "GP0001",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"FixedAmt": "3000.00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ExtraAmt": "3000.00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"TotAmt": "6000.00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaymentType": "CHEQUE",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaidDate": "2023/05/30 08:00",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"PaidDescription": "Manual CHEQUE Payment.",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"BillNo": "00001",
                                    <br />
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;"ClientID": null                               
                                    <br />
                                    &nbsp;&nbsp;},
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



                <%--=================================== 01. App. Submit =====================================================--%>



                <div id="apiApplication">
                    <h3 class="heading">Application Submit</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to save application details when pass ReasonID, PlaceID, Name, NIC, Address, Mobile, Telephone, Email, Council, NICCopy, ReserveDate, StartTime, EndTime, UserId, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/App</div>
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
                                <div class="col-sm-2 ">ReasonID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Application reason id.
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
                                      "ReasonID":"1"
                                    }
                                </div>

                            </div>
                            <br />



                            <div class="row">
                                <div class="col-sm-2 ">PlaceID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Application place id.
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
                                      "PlaceID":"1"
                                    }
                                </div>

                            </div>
                            <br />


                            <div class="row">
                                <div class="col-sm-2 ">Name</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Applicant's Name.
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
                                      "Name":"A. Wijeratne"
                                    }
                                </div>

                            </div>
                            <br />


                            <div class="row">
                                <div class="col-sm-2 ">NIC</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Applicant's national identity card number.
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
                                      "NIC":"901234567V"
                                    }
                                </div>

                            </div>
                            <br />


                            <div class="row">
                                <div class="col-sm-2 ">Address</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Applicant's Address.
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
                                      "Address":"4th Floor, No. 131, W A D Ramanayake Mawatha, Colombo 02"
                                    }
                                </div>

                            </div>
                            <br />


                            <div class="row">
                                <div class="col-sm-2 ">Mobile</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Applicant's Mobile Number.
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
                                      "Mobile":"0710123456"
                                    }
                                </div>

                            </div>
                            <br />


                            <div class="row">
                                <div class="col-sm-2 ">Telephone</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                   Applicant's Telephone Number.
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
                                      "Telephone":"0117820820"
                                    }
                                </div>

                            </div>
                            <br />


                            <div class="row">
                                <div class="col-sm-2 ">Email</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                     Applicant's Email Address.
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
                                      "Email":"info@nekfa.com"
                                    }
                                </div>

                            </div>
                            <br />


                            <div class="row">
                                <div class="col-sm-2 ">Council</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    In the Council or not.
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
                                      "Council":"1"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">NICCopy</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    File path which save national identity card copy.
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
                                      "NICCopy":"E:/Attachments/"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ReserveDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Reservation Date.
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
                                      "ReserveDate":"2023/12/25 00:00"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">StartTime</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Reservation date function start time.
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
                                      "StartTime":"2023/12/25 08:00"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">EndTime</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Reservation date function end time.
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
                                      "EndTime":"2023/12/25 17:00"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">UserId</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Relevant user id.
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
                                      "UserId":"49"
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
                    <div style="height: 170px; overflow-y: scroll; overflow-x: hidden;">
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
                                <div class="col-sm-5">"Application details successfully submitted etc..."</div>
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



                <%--=================================== 02. App. Reject =====================================================--%>



                <div id="apiAppReject">
                    <h3 class="heading">Application Reject</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to reject application details when pass Id, Comment, User, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppRej</div>
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
                                <div class="col-sm-2 ">Comment</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Reason to reject application or any comment.
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
                                      "Comment":"Date already reserved for another customer."
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">User</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Relevant user name.
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
                                      "User":"A. Wijeratne"
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
                    <div style="height: 170px; overflow-y: scroll; overflow-x: hidden;">
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ReturnMessage": "Application Rejected.",
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
                                <div class="col-sm-5">"Application Rejected etc..."</div>
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



                <%--=================================== 03. App. Approve =====================================================--%>



                <div id="apiAppApprove">
                    <h3 class="heading">Application Approve</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to approve application details when pass ApplicationId, Note, PaymentDueDate, FixedAmt, ExtraAmt, TotAmt, User, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppAprve</div>
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
                                <div class="col-sm-2 ">ApplicationId</div>
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
                                      "ApplicationId":1
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Note</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Approval note.
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
                                      "Note":"Application approved."
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">PaymentDueDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Payment due date.
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
                                      "PaymentDueDate":"2023/01/01 00:00"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">FixedAmt</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Initial charge.
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
                                      "FixedAmt":"100.00"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ExtraAmt</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Additional charge.
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
                                      "ExtraAmt":"200.00"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">TotAmt</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Total charge.
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
                                      "TotAmt":"300.00"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">User</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Relevant user name.
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
                                      "User":"A. Wijeratne"
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
                    <div style="height: 170px; overflow-y: scroll; overflow-x: hidden;">
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ReturnMessage": "Application Approved.",
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
                                <div class="col-sm-5">"Application Approved etc..."</div>
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



                <%--=================================== 04. App. Manual Payment =====================================================--%>



                <div id="apiAppManulPay">
                    <h3 class="heading">Application Manual Payment</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to do a manual payment when pass ApplicationId, PaidDate, BillNo, PaidDescription, PaymentType, User, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppManualPay</div>
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
                                <div class="col-sm-2 ">ApplicationId</div>
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
                                      "ApplicationId":1
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">PaidDate</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Payment Date.
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
                                      "PaidDate":"2023/12/25 00:00"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">BillNo</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Bill no.
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
                                      "BillNo":"001"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">PaidDescription</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Comment about payment.
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
                                      "PaidDescription":"Manual payment done."
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">PaymentType</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Type of payment. (CHEQUE or CASH)
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
                                      "PaymentType":"CHEQUE"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">User</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Relevant user name.
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
                                      "User":"A. Wijeratne"
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
                    <div style="height: 170px; overflow-y: scroll; overflow-x: hidden;">
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ReturnMessage": "Application Payment Successful.",
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
                                <div class="col-sm-5">"Application Payment Successful etc..."</div>
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



                <%--=================================== 05. App. Bank Payment =====================================================--%>



                <div id="apiAppBankPay">
                    <h3 class="heading">Application Bank Payment</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to do a bank payment when pass ApplicationId, PayAmount, ConvenienceFee, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppBankPay</div>
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
                                <div class="col-sm-2 ">ApplicationId</div>
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
                                      "ApplicationId":1
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">PayAmount</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Payment amount.
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
                                      "PayAmount":"6000.00"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ConvenienceFee</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Convenience fee.
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
                                      "ConvenienceFee":"60.00"
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
                    <div style="height: 170px; overflow-y: scroll; overflow-x: hidden;">
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ReturnMessage": "Application Payment Confirmation Successful.",
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
                                <div class="col-sm-5">"Application Payment Confirmation Successful etc..."</div>
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



                <%--=================================== 06. App. Bank Payment Result =====================================================--%>



                <div id="apiSaveBankPayRslt">
                    <h3 class="heading">Application Bank Payment Result</h3>
                    <div>
                        <div>
                            <div>Introduction</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">This API helps to save bank payment result when pass OrderID, ResponseCode, ReasonCode, ReasonCodeDesc, ReferenceNo, PaddedCardNo, AuthCode, BillToToFirstName, BillToMiddleName, BillToLastName, Signature, SignatureMethod, ResultTime, User, ClientID parameters.</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>Base URL</div>
                        </div>
                        <div class="pre row">
                            <div class="col-sm-12 ">https://photoshoot-api.nekfa.com/api/AppBankPayResult</div>
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
                                <div class="col-sm-2 ">OrderID</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Order id.
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
                                      "OrderID":"14GP0003"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ResponseCode</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Response code.
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
                                      "ResponseCode":"1"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ReasonCode</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Reason code.
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
                                      "ReasonCode":"1"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ReasonCodeDesc</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Reason code description.
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
                                      "ReasonCodeDesc":"SUCCESS"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ReferenceNo</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Reference no.
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
                                      "ReferenceNo":"12345"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">PaddedCardNo</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Card no.
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
                                      "PaddedCardNo":"xxxxxxxxxxxxxx09"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">AuthCode</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Authorization code.
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
                                      "AuthCode":"GP01"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">BillToToFirstName</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Payment done person first name.
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
                                      "BillToToFirstName":"A"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">BillToMiddleName</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Payment done person middle name.
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
                                      "BillToMiddleName":""
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">BillToLastName</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Payment done person last name.
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
                                      "BillToLastName":"WIJERATNE"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">Signature</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Signature.
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
                                      "Signature":"jBmVIRViWmIGCBE1MjQ0BzkAAAA="
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">SignatureMethod</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Signature method.
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
                                      "SignatureMethod":"Digital"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">ResultTime</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Result time.
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
                                      "ResultTime":"2023/05/30 00:00"
                                    }
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-sm-2 ">User</div>
                                <div class="col-sm-2 ">Description</div>
                                <div class="col-sm-8 ">
                                    Relevant user name.
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
                                      "User":"A. Wijeratne"
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
                    <div style="height: 170px; overflow-y: scroll; overflow-x: hidden;">
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
                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; "ReturnMessage": "Application Payment Successfully Done.",
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
                                <div class="col-sm-5">"Application Payment Successfully Done etc..."</div>
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
