<%-- 
    Document   : UpdateSuccess
    Created on : Jan 13, 2018, 1:35:33 PM
    Author     : vkunal1996
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
                <td><a href="signin.htm">Sign Out</a></td>
                <td><a href="update.htm?user=${userName}">Update Details</a></td>
            </tr>
        </table>
        <br/>
        <center>
                     <c:forEach items="${userDetails}" var="st">

            <table>
                <tr>
                    <th style="color:white;" align="left">First Name</th>
                    <td style="color:white;"><c:out value="${st.firstName}"></c:out></td>
                </tr>
                <tr>
                    <th style="color:white;" align="left">Last Name</th>
                    <td style="color:white;"><c:out value="${st.lastName}"></c:out></td>
                </tr>
                <tr>
                    <th style="color:white;" align="left">User Name</th>
                    <td style="color:white;"><c:out value="${st.userName}"></c:out></td>
                </tr>
                <tr>
                    <th style="color:white;" align="left">Password</th>
                    <td style="color:white;"><c:out value="${st.password}"></c:out></td>
                </tr>
                <tr>
                    <th style="color:white;" align="left">Confirmed PAssword</th>
                    <td style="color:white;"><c:out value="${st.retypePassword}"></c:out></td>
                </tr>
                <tr>
                    <th style="color:white;" align="left">Gender</th>
                    <td style="color:white;"><c:out value="${st.gender}"></c:out></td>
                </tr>
                <tr>
                    <th style="color:white;" align="left">Contact</th>
                    <td style="color:white;"><c:out value="${st.contact}"></c:out></td>
                </tr>
                <tr>
                    <th style="color:white;" align="left">Current Email</th>
                    <td style="color:white;"><c:out value="${st.currentEmail}"></c:out></td>
                </tr>
                
                <tr>
                    <th style="color:white;" align="left">Location</th>
                    <td style="color:white;"><c:out value="${st.location}"></c:out></td>
                </tr>
            </table>
                        </c:forEach>

        </center>
         
    </center>
    </body>
</html>
