<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestClient.aspx.cs" Inherits="TestAPI.TestClient" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
     <script>
  
         $(document).ready(function () {
  
             var error;
             $("#Save").click(function () {
  
                 var person = new Object();
                 person.name = "Tarun";
                 person.surname = "Chatterjee";
  
                 $.support.cors = true;
  
                 $.ajax({
                     url: 'http://localhost:10042/api/Test/Postdata',
                     data: JSON.stringify(person),
                     contentType: 'application/json; charset=utf-8',
                     dataType: "json",
                     type: "POST",
                     headers: {
                         'Accept': 'application/json',
                         'Content-Type': 'application/json',
                         'Access-Control-Allow-Origin': '*'
                     },
                     crossDomain: true,
                     success: function (dataReceived) {
                         if (dataReceived) {
                             alert("Welcome " + dataReceived);
                         } else {
                             alert("Authentication failed")
                         }
                     },
                     error: function (e) {
                         alert(e);
                     }
  
                 });
  
             });
  
  
             $("#Get1").click(function () {
                 var person = new Object();
                 var name = "Tarun";
  
  
                 var jsonString = { person: name };
  
                 $.ajax({
                     type: 'GET',
                     url: 'http://localhost:10042/api/test/',
                     contentType: "application/json",
                     dataType: 'jsonp',
                     crossDomain: true,
                     data: jsonString,
                     success: function (dataReceived) {
                         if (dataReceived) {
                             alert("Welcome " + dataReceived);
                         } else {
                             alert("Authentication failed")
                         }
                     },
                     error: function (e) {
                         alert(e);
                     }
                 });
             });
             $("#Get2").click(function () {
                 var person = new Object();
                 var name1 = "Tarun";
                 var name2 = "Chatterjee";
  
  
                 var jsonString = { person1: name1, person2: name2 };
  
                 $.ajax({
                     type: 'GET',
                     url: 'http://localhost:10042/api/test/',
                     contentType: "application/json",
                     dataType: 'jsonp',
                     crossDomain: true,
                     data: jsonString,
                     success: function (dataReceived) {
                         if (dataReceived) {
                             alert("Welcome " + dataReceived);
                         } else {
                             alert("Authentication failed")
                         }
                     },
                     error: function (e) {
                         alert(e);
                     }
                 });
             });
         });
     </script>
</head>
<body>
     <form id="form1" runat="server">
         <input type="button" id="Save" value="Save Data" />
         <input type="button" id="Get1" value="Get Data with 1 Parameters" />
         <input type="button" id="Get2" value="Get Data with 2 Parameters" />
     </form>
 </body></html>
