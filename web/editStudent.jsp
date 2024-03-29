<%-- 
    Document   : editStudent
    Created on : 29 Mar, 2024, 8:27:58 PM
    Author     : DARSHAN
--%>

<%-- 
    Document   : editStudent
    Created on : 29 Mar, 2024, 8:27:58 PM
    Author     : DARSHAN
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Student</title>
    <style>
        body {
            font-family: cursive;
        }
        th, td {
            margin: 10px;
            padding: 10px;
        }
        #btn {
            width: 20%;
            padding: 7px;
        }
        
        #table {
            margin-top: 2%;
            width: 30%;
        }
        #heading {
            font-size: 40px;
            padding: 30px;
        }
        .center {
            margin: 100%;
        }
        #cancel{
            width: 20%;
            padding: 7px;
        }
    </style>
</head>
<body>
    <% 
        try {
            HttpSession ssn = request.getSession();
            if (!ssn.getId().equals(ssn.getAttribute("key"))) {
                response.sendRedirect("index.jsp");
            }

            // Step 1: Receive the student ID from the form
            String studentId = request.getParameter("studentId");

            // Step 2: Fetch student details from the database
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14", "root", "");
                
                // Query to fetch student details by ID
                ps = con.prepareStatement("SELECT * FROM data WHERE username = ?");
                ps.setString(1, studentId);
                rs = ps.executeQuery();
                
                if (rs.next()) {
    %>
                    <form action="#" onsubmit="return validation()" method="POST">
                        <input type="hidden" name="studentId" value="<%= studentId %>">
                        <table id="table" border="1" align="center" cellspacing="0">
                            <tr>
                                <td id="heading" colspan="2" align="center">Edit <%= rs.getString("username") %></td>
                            </tr>
                            <tr>
                                <th>First Name</th>
                                <td class="center" align="center"><input type="text" name="fname" id="fname" value="<%= rs.getString("fname") %>"></td>
                            </tr>
                            <tr>
                                <th>Middle Name</th>
                                <td class="center" align="center"><input type="text" name="mname" id="mname" value="<%= rs.getString("mname") %>"></td>
                            </tr>
                            <tr>
                                <th>Last Name</th>
                                <td class="center" align="center"><input type="text" name="lname" id="lname" value="<%= rs.getString("lname") %>"></td>
                            </tr>
                            <tr>
                                <th>Age</th>
                                <td class="center" align="center"><input type="text" name="age" id="age" value="<%= rs.getString("age") %>"></td>
                            </tr>
                            <tr>
                                <th>Stream</th>
                                <td class="center" align="center"><input type="text" name="stream" id="stream" value="<%= rs.getString("stream") %>"></td>
                            </tr>
                            <tr>
                                <th>Username</th>
                                <td class="center" align="center"><input type="text" name="uname" id="uname" value="<%= rs.getString("username") %>"></td>
                            </tr>
                            <tr>
                                <th>Password</th>
                                <td class="center" align="center"><input type="text" name="password" id="password" value="<%= rs.getString("password") %>"></td>
                            </tr>
                            <tr>
                                <th>Confirm Password</th>
                                <td class="center" align="center"><input type="password" name="cpassword" id="cpassword" value="<%= rs.getString("password") %>"></td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <input id="btn" type="submit" value="Update" name="update">
                                    
                                    <a href="registeredStudents.jsp"><input type="button" id="cancel" value="Cancel"></a>
                                </td>
                            </tr>
                        </table>
                    </form>
    <%
                } else {
                    out.println("Student not found!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Step 4: Close connections and statements
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Handle update logic after form submission
        if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("update") != null) {
            // Retrieve form parameters
            String fname = request.getParameter("fname");
            String mname = request.getParameter("mname");
            String lname = request.getParameter("lname");
            String age = request.getParameter("age");
            String stream = request.getParameter("stream");
            String uname = request.getParameter("uname");
            String password = request.getParameter("password");

            // Perform update operation here
            Connection con = null;
            PreparedStatement ps = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14", "root", "");
                String studentId = request.getParameter("studentId");
                // Update query
                String updateQuery = "UPDATE data SET fname=?, mname=?, lname=?, age=?, stream=?, username=?, password=? WHERE username=?";
                ps = con.prepareStatement(updateQuery);
                ps.setString(1, fname);
                ps.setString(2, mname);
                ps.setString(3, lname);
                ps.setString(4, age);
                ps.setString(5, stream);
                ps.setString(6, uname);
                ps.setString(7, password);
                ps.setString(8, studentId);
                
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<script>alert('Student information updated successfully');</script>");
                    response.sendRedirect("registeredStudents.jsp");
                } else {
                    out.println("<script>alert('Failed to update student information');</script>");
                }
            } catch (Exception ex) {
                out.println("<script>alert('Failed to update student information');</script>");
                ex.printStackTrace();
            } finally {
                // Close connections and statements
                try {
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (SQLException ex) {
                    
                    ex.printStackTrace();
                }
            }
        }
    %>
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
