<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test1.aspx.cs" Inherits="TestAPI.Test1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        function TestAPIMethod() {
            //var _data = JSON.stringify({ val: "ABC" });           
            //var UserInfo = new Object();
            //UserInfo["UserName"] = "0712340180";
            //UserInfo["Password"] = "$2y$10$DDGPLCwxzS1IozS582uHxuPHx6cJmLzTC.43Nx2ssVN0ejWhr1pTy";
            //UserInfo["LocationID"] = "R2FtcGFoYVBTLzE=";
            //var stringReqdata = JSON.stringify(UserInfo);

            var reqdata = {
                UserName: "0773901192",
                Password: "$2y$10$DDGPLCwxzS1IozS582uHxuPHx6cJmLzTC.43Nx2ssVN0ejWhr1pTy",
                LocationID: "R2FtcGFoYVBTLzE="              
            }
            var stringReqdata = JSON.stringify(reqdata);
           // var url = "http://api-boutique.nekfa.com//api/BoutiqueList";
           var url = "https://k97mt4tgo5.execute-api.ap-south-1.amazonaws.com/beta/boutique";
            jQuery.ajax({
                crossDomain: true,
                async: false,
                type: "POST",
                url: url,
                dataType: "json",
                context: document.body,
                contentType: 'application/json; charset=utf-8',
                data: stringReqdata,
            //    success: function (data) {
            //        alert("Success");
            //    },
            //    error: function (error) {
            //        alert("Error123");
            //    }

            //});
                success: onSuccess,
                failure: function (AjaxResponse) {
                    alert("Failed: " + AjaxResponse.body);
                }
            });
            function onSuccess(AjaxResponse) {
                alert(AjaxResponse["ListBoutiqueInfo"]);
                $.each(AjaxResponse, function (index, el) {                  
                    alert("element at " + index + ": " + el);
                    
                    
                });

                $("#Result").html(AjaxResponse.d);
             
            }

            //var _data = JSON.stringify({ val: "ABC" });
            //$.ajax({
            //    type: "POST",
            //    url: 'http://localhost:39094//api/Test',
            //    dataType: "json",               
            //    contentType: "application/json",
            //    data: _data,
            //    success: function (data) {
            //        alert("Success");
            //    },
            //    error: function (error) {
            //        alert("Error123");
            //    }

            //});
        }

        function TestAPIMethod1() {
            alert('dsds');
            var UserInfo = new Object();
            UserInfo["UserName"] = "0773901192";
            UserInfo["Password"] = "$2y$10$DDGPLCwxzS1IozS582uHxuPHx6cJmLzTC.43Nx2ssVN0ejWhr1pTy";
            UserInfo["LocationID"] = "R2FtcGFoYVBTLzE=";
            $.ajax({

                //url: "Test1.aspx/Get_API_Response",
                url: "api/BoutiqueList",
                //"headers": {
                //    "accept": "application/json",
                //    "Access-Control-Allow-Origin": "*"
                //},
                 data: JSON.stringify({ userInfo: UserInfo }),
                 //data: JSON.stringify({ 'val': '1234' }),
                contentType: "application/json; charset=utf-8",
                type: "POST",
                //method: 'POST',
                dataType: "json",
                crossDomain: true,
                success: onSuccess,
                failure: function (AjaxResponse) {
                    alert("Failed: " + AjaxResponse.d);
                }
            });
            function onSuccess(AjaxResponse) {
                $("#Result").html("The time is: " + AjaxResponse.d);
                alert(AjaxResponse.d);
            }
        }

 </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input id="btnGetTime" type="button" value="Get Response" onclick="TestAPIMethod()" />
         <input type="button" id="post1" value="Test1" onclick="TestAPIMethod1()" />
    </div>
    </form>
</body>
</html>
