<%-- 
    Document   : SignUpForm
    Created on : Jan 11, 2018, 10:25:11 AM
    Author     : vkunal1996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="model.GmailUserDetails"%>
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
    </center>
        <form:form method="post" commandName="addUser">
            <div id="MainDivision" style="margin: auto; height: auto;">
                    <div class="row">
                        <div class="col-sm-4" id="blank">
                        </div>
                        <div class="col-sm-4" id="registrationform" style="height:auto;">
                            <P>
                                <center>
                                <h1 style="color:#F44336; font-family: fantasy;">Registration Form</h1>
                                </center>
                            </P>
                            <div id="nameDivision">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4><b>Name</b></h4>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6" id="firstName">
                                        <form:input path="firstName" placeholder="FirstName"/>
                                        <form:errors path="firstName" class="formError"/>
                                    </div>
                                    <div class="col-sm-6" id="lastName">
                                         <form:input path="lastName" placeholder="LastName"/>
                                         <form:errors path="lastName" class="formError"/>
                                    </div>
                                </div>
                            </div><br/>
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
                            <div id="retypepasswordDivision">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4><b>Confirm Your Password</b></h4>
                                    </div>
                                    <div class="col-sm-12">
                                        <form:password path="retypePassword" placeholder="Confirm Password" style="width:95%;"/>
                                        <form:errors path="retypePassword" class="formError"/>
                                    </div>
                                </div>
                                
                            </div><br/>
                            <div id="dobDivision">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4><b>Birthday</b></h4>
                                    </div>
                                    <div class="col-sm-12">
                                        <input type=date style="width:95%;" id="dob" name="dob"/>
                                        <form:errors path="dob" class="formError"/>

                                    </div>
                                </div>
                            </div><br/>
                            <div id="genderDivision">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4><b>Gender</b></h4>
                                    </div>
                                    <div class="col-sm-12">
                                        <form:select path="gender" style="width:95%">
                                            <form:option value="Choose" label="Choose"/>
                                            <form:option value="Male" value="Male"/>
                                            <form:option value="Female" value="Female"/>
                                        </form:select>
                                        <form:errors path="gender" class="formError"/>
                                    </div>
                                </div>
                            </div><br/>
                                <div id="contactDivision">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4><b>Contact No.</b></h4>
                                    </div>
                                    <div class="col-sm-12">
                                        <form:input path="contact" placeholder="Mobile Number" style="width:95%;"/>
                                        <form:errors path="contact" class="formError"/>
                                    </div>
                                </div>
                                </div><br/>
                            <div id="currentEmailDivision">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4><b>Current Email.</b></h4>
                                    </div>
                                    <div class="col-sm-12">
                                        <form:input path="currentEmail" placeholder="Email" style="width:95%;"/>
                                        <form:errors path="currentEmail" class="formError"/>
                                    </div>
                                </div>
                            </div><br/>
                            <div id="locationDivision">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4><b>Location</b></h4>
                                    </div>
                                    <div class="col-sm-12">
                                        <form:select path="location" style="width:95%">
                                            <form:option value="Choose" label="Choose"/>
                                            <form:option value="India" value="India"/>
                                            <form:option value="Canada" value="Canada"/>
                                            <form:option value="America" value="America"/>
                                            <form:option value="Australia" value="Australia"/>
                                            <form:option value="Germany" value="Germany"/>
                                        </form:select>
                                       <form:errors path="location" class="formError"/>
                                    </div>
                                </div>
                            </div><br/>
                            <div id="submitButton">
                                <div class="row">
                                    <div class="col-sm-12" style="margin-left: 60%;">
                                        <input type="submit" value="Sign up" style="height:10%; width:30%; background:#1E88E5; color: white;" />
                                    </div>
                                </div>
                            </div>
                            </div>
                        
                        </div>
                        <div class="col-sm-4" id="blank">
                        </div>
                    </div>
            
        </form:form>
    </body>
</html>
