<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        <center>
            <table>
                <tr>
                    <td><a href="signup.htm">Sign Up</a></td>
                    <td><P>                      </P></td>
                    <td><a href="signin.htm">Sign In</a></td>
                </tr>
            </table>
            
        </center>
    </body>
</html>
