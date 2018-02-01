<%-- 
    Document   : UpdateForm
    Created on : Jan 13, 2018, 3:29:25 PM
    Author     : vkunal1996
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
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
                <td><a href="signin.htm">Sign Out</a></td>
            </tr>
        </table>
        <br/>
    </center>
      
        <%
            session.setAttribute("user", request.getParameter("user") );
            String firstName=" ",lastName =" ",password=" ",retypePassword=" ",dob=" ",gender=" ",contact=" ",currentEmail=" ",location=" ";
            String userName=(String)session.getAttribute("user");
            try{
                Connection cn;
                PreparedStatement st;
                ResultSet rs;
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url="jdbc:sqlserver://localhost;instanceName=vkunal1996;databaseName=Struts;user=vkunal1996;password=12345";
                cn=DriverManager.getConnection(url);
                String sql="Select * from GmailUserDetails where UserName=?";
                st=cn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                st.setString(1,userName);
                rs=st.executeQuery();
                while(rs.next()){
                firstName=rs.getString("FirstName");
                lastName=rs.getString("LastName");
                password=rs.getString("Password");
                retypePassword=rs.getString("RetypePassword");
                dob=rs.getString("DOB");
                gender=rs.getString("Gender");
                contact=rs.getString("Contact");
                currentEmail=rs.getString("CurrentEmail");
                location=rs.getString("Location");
                }
               /* out.print(firstName);
                out.print(lastName);
                out.print(password);
                out.print(retypePassword);
                out.print(userName);
                out.print(gender);
                out.print(dob);
                out.print(contact);
                out.print(location);*/


            }
            catch(Exception e){
            
                e.printStackTrace();
            }
        %>
        
    <form:form method="post" commandName="updateUser">
        <div id="MainDivision" style="margin: auto; height: auto;">
                    <div class="row">
                        <div class="col-sm-4" id="blank">
                        </div>
                        <div class="col-sm-4" id="registrationform" style="height:auto;">
                            <P>
                                <center>
                                <h1 style="color:#F44336; font-family: fantasy;">Update Form</h1>
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
                                        <form:input path="firstName" value="<%=firstName%>"/>
                                        <form:errors path="firstName" class="formError"/>
                                    </div>
                                    <div class="col-sm-6" id="lastName">
                                         <form:input path="lastName" value="<%=lastName%>"/>
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
                                        <form:hidden path="userName" value="<%=session.getAttribute("user")%>"/>
                                        <form:input path="userName" value="<%=session.getAttribute("user")%>" style="width:95%;" disabled="true"/>
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
                                        <form:password path="password" value="<%=password%>" showPassword="true" style="width:95%;"/>
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
                                        <input type=date style="width:95%;" id="dob" name="dob" value="<%=dob%>"/>
                                        <form:errors path="dob" class="formError"/>

                                    </div>
                                </div>
                            </div><br/>
                            <div id="genderDivision">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4><b>Gender</b></h4>
                                    </div>
                                    <script>
                                            window.onload = function() {
                                                $("#gender").val("<%=gender%>");
                                                $("#location").val("<%=location%>");
                                            }
                                    </script>
                                    <div class="col-sm-12">
                                        <form:select path="gender" style="width:95%" id="gender">
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
                                        <form:input path="contact" value="<%=contact%>" style="width:95%;"/>
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
                                        <form:input path="currentEmail" value="<%=currentEmail%>" style="width:95%;"/>
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
                                        <form:select path="location" style="width:95%" id="location">
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
                                        <input type="submit" value="Update Details" style="height:10%; width:30%; background:#1E88E5; color: white;" />
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
