<%-- 
    Document   : registerStudent
    Created on : 28 Mar, 2024, 8:13:14 PM
    Author     : DARSHAN
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registered Student</title>
        <style>
            body{
                font-family: cursive;
            }
            th,td{
                marging:10px;
                padding:10px;
            }
            #btn{
                width:20%;
                padding: 7px;
            }
            #table{
                margin-top: 2%;
                width: 30%;
            }
            #heading{
                font-size: 40px;
                padding: 30px;
            }
            .center{
                margin: 100%;
            }
        </style>
    </head>
    <body>
        <%
            try{
                HttpSession ssn = request.getSession();
                if(!ssn.getId().equals(ssn.getAttribute("key"))){
                    response.sendRedirect("index.jsp");
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        %>
        <form action="registerStudentServlet" onsubmit="return validation()" method="POST">
            <table id="table" border="1" align="center" cellspacing="0">
                <tr>
                    <td id="heading" colspan="2" align="center">Register Student</td>
                </tr>
                <tr>
                    <th>First Name</th>
                    <td class="center" align="center"><input type="text" name="fname" id="fname"/></td>
                </tr>
                <tr>
                    <th>Middle Name</th>
                    <td class="center" align="center"><input type="text" name="mname" id="mname"/></td>
                </tr>
                <tr>
                    <th>Last Name</th>
                    <td class="center" align="center"><input type="text" name="lname" id="lname"/></td>
                </tr>
                <tr>
                    <th>Age</th>
                    <td class="center" align="center"><input type="text" name="age" id="age"/></td>
                </tr>
                <tr>
                    <th>Stream</th>
                    <td class="center" align="center"><input type="text" name="stream" id="stream"/></td>
                </tr>
                <tr>
                    <th>Create Username</th>
                    <td class="center" align="center"><input type="text" name="uname" id="uname"/></td>
                </tr>
                <tr>
                    <th>Create Password</th>
                    <td class="center" align="center"><input type="password" name="password" id="password"/></td>
                </tr>
                <tr>
                    <th>Confirm Password</th>
                    <td class="center" align="center"><input type="password" name="cpassword" id="cpassword"/></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input id="btn" type="submit" value="Register" name="register" /></td>
                </tr>
            </table>
        </form>
        <script>
            function validation(){
                var fname = document.getElementById("fname").value;
                var mname = document.getElementById("mname").value;
                var lname = document.getElementById("lname").value;
                var stream = document.getElementById("stream").value;
                var age = document.getElementById("age").value;
                var uname = document.getElementById("uname").value;
                var password = document.getElementById("password").value;
                var cpassword = document.getElementById("cpassword").value;
                if(fname == ""){
                    alert("Enter First name");
                    return false;
                }
                if(mname == ""){
                    alert("Enter Middle name");
                    return false;
                }
                if(lname == ""){
                    alert("Enter Last name");
                    return false;
                }
                if(stream == ""){
                    alert("Enter Stream");
                    return false;
                }
                if(age == ""){
                    alert("Enter Age");
                    return false;
                }
                if(uname == ""){
                    alert("Enter Username");
                    return false;
                }
                if(password == ""){
                    alert("Enter Password");
                    return false;
                }
                if(cpassword == ""){
                    alert("Enter Cofirm Password");
                    return false;
                }
                if(!(password === cpassword)){
                    alert("Password and Cofirm Password is not same");
                    return false;
                }
            }
        </script>
    </body>
</html>
