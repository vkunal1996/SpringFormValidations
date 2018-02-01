<%-- 
    Document   : UpdateForm
    Created on : Jan 13, 2018, 1:35:17 PM
    Author     : vkunal1996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    <center>
        <table>
                <tr>
                    <td><a href="signup.htm">Sign Up</a></td>
                    <td><P>                      </P></td>
                    <td><a href="signin.htm">Sign In</a></td>
                </tr>
            </table><br/>
       <form:form method="post" commandName="signinUser">

        <div id="MainDivision" style="margin: auto; height: auto;">
                    <div class="row">
                        <div class="col-sm-4" id="blank">
                        </div>
                        <div class="col-sm-4" id="registrationform" style="height:auto;">
                            <P>
                                <center>
                                <h1 style="color:#F44336; font-family: fantasy;">Sign In </h1>
                                </center>
                            </P>
                            
                            <div id="usernameDivision">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4><b>Enter your Username</b></h4>
                                    </div>
                                    <div class="col-sm-12">
                                        <form:input path="userName" placeholder="UserName" style="width:95%;"/>
                                        <form:errors path="userName" class="formError"/>
                                    </div>
                                </div>
                                
                            </div><br/>
                            <div id="passwordDivision">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4><b>Create a Password</b></h4>
                                    </div>
                                    <div class="col-sm-12">
                                        <form:password path="password" placeholder="Password" style="width:95%;"/>
                                        <form:errors path="password" class="formError"/>
                                    </div>
                                </div>
                                
                            </div><br/>
                            
                            <div id="submitButton">
                                <div class="row">
                                    <div class="col-sm-12" style="margin-left:0%;">
                                        <input type="submit" value="Sign In" style="height:10%; width:30%; background:#1E88E5; color: white;" />
                                    </div>
                                </div>
                            </div>
                            </div>
                        
                        </div>
                        <div class="col-sm-4" id="blank">
                        </div>
                    </div>
       </form:form>
    </center>
    </body>
</html>
