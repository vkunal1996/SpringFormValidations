<%-- 
    Document   : UpdateSuccess
    Created on : Jan 13, 2018, 3:29:35 PM
    Author     : vkunal1996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <style>
         #registrationform{
                background-color: #EEEEEE;
                height:30%;
            }
            #blank{
                height: 30%;
            }
            td{
                padding:0 2px 0 2px;
            }
            #firstName{
                float: left;
            }
            #lastName{
                float:left;
            }
            #month,#date,#year{
                float:left;
            }
            body{
                background-image: url("back.jpg");
                background-repeat: no-repeat;
                background-color: #8E24AA;
            }
            
            .formError{
                color:red;
                transition: all 0.5s;
            }
            a{
                color:white;
                font-size: 20px;
                text-decoration: none;
            }
            a:hover{
                font-size: 25px;
                color: lightcoral;
                text-decoration: none;
                transition: all 0.5s;
            }
    </style>
    </head>
    <body>
         <table>
            <tr>
                <td><a href="signin.htm">Sign Out</a></td>
            </tr>
        </table>
    <center>
        <h1>Updation Successful ! Please Sign in Again by Signing Out</h1>
          <P style="color:white; font-size:20px;">  You will Redirect in </P><div id="counter" style="color:white;"><h2>5</h2></div> <P style="color:white; font-size:20px;">Seconds </P>
    <script>
        setInterval(function() {
            var div = document.querySelector("#counter");
            var count = div.textContent * 1 - 1;
            div.textContent = count;
            if (count == 0) {
                window.location.href="http://localhost:8080/SpringHibernateGmailClone/signin.htm";
            }
        }, 1000);
        </script>
    </center>
    </body>
</html>
