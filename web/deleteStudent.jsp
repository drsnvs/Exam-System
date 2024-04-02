<%-- 
    Document   : deleteStudent
    Created on : 29 Mar, 2024, 9:27:09 PM
    Author     : DARSHAN
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete Student</title>
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
    <% 
        try {
            // Step 1: Receive the student ID to be deleted
            String studentId = request.getParameter("studentId");

            // Step 2: Delete student from the database
            Connection con = null;
            PreparedStatement ps = null;
            PreparedStatement pss = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14", "root", "");
                int rowsAffected=0;
//                pss = con.prepareStatement("select username from result where username=?");
//                pss.setString(1, studentId);
//                ResultSet rs = pss.executeQuery();
//                rs.next();
//                if(rs.getString("username").equals(studentId)){
//                    ps = con.prepareStatement("delete data,result from data inner join result on data.username = result.username where data.username=? or result.username is null");
//                    ps.setString(1, studentId);
//
//                    rowsAffected = ps.executeUpdate();
//                }else{
                    ps = con.prepareStatement("delete from data where username=?;");
                    ps.setString(1, studentId);

                    rowsAffected = ps.executeUpdate();
//                }
                
                // Query to delete student by ID
                
                if (rowsAffected > 0) {
                    out.println("<script>alert('Student deleted successfully');</script>");
                    // Redirect back to registeredStudents.jsp after deletion
                    response.sendRedirect("registeredStudents.jsp");
                } else {
                    out.println("<script>alert('Failed 1 to delete student');</script>");
                }
            } catch (Exception e) {
                out.println("<script>alert('Failed 2 to delete student');</script>");
                e.printStackTrace();
            } finally {
                // Close connections and statements
                try {
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
