<%-- 
    Document   : registeredStudents
    Created on : 28 Mar, 2024, 10:03:53 PM
    Author     : DARSHAN
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                margin-top: 5%;
                width: 40%;
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
        
        
<!--        <form action="#" method="POST">-->
            <table id="table" border="1" align="center" cellspacing="0">
                <tr>
                    <td id="heading" colspan="9" align="center">Register</td>
                </tr>
                <tr>
                    <th>First name</th>
                    <th>Middle name</th>
                    <th>Last name</th>
                    <th>Username</th>
                    <th>Age</th>
                    <th>Stream</th>
                    <th>Type</th>
                    <th>Edit</th>
                    <th>Delete</th>                    
                </tr>
                <tr>
                    <%
                        try{
                            Connection con = null;
            //                Statement st = null;
                            Statement st = null;

                            HttpSession ssn = request.getSession();
                            if(!ssn.getId().equals(ssn.getAttribute("key"))){
                                response.sendRedirect("index.jsp");
                            }

                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");
                            

                            st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from data");
                            while(rs.next()){
                            
                    %>
                    <td><% out.println(rs.getString("fname")); %></td>
                    <td><% out.println(rs.getString("mname")); %></td>
                    <td><% out.println(rs.getString("lname")); %></td>
                    <td><% out.println(rs.getString("username")); %></td>
                    <td><% out.println(rs.getString("age")); %></td>
                    <td><% out.println(rs.getString("stream")); %></td>
                    <td><% out.println(rs.getString("type")); %></td>
                    <td>
                    <form action="editStudent.jsp" method="POST">
                        <input type="hidden" name="studentId" value="<%= rs.getString("username") %>">
                        <button type="submit">Edit</button>
                    </form>
                </td>
                <td>
                    <form action="deleteStudent.jsp" method="POST" onsubmit="return confirm('Are you sure you want to delete this student?');">
                        <input type="hidden" name="studentId" value="<%= rs.getString("username") %>">
                        <button type="submit">Delete</button>
                    </form>
                </td>
                </tr>
                
                    <%
                        }%>
                        <tr>
                            <td colspan="9" align="center"><a href="admin.jsp" id="backBtn">Back to Admin</a></td>
                        </tr><%
                            
                        }catch(Exception e){
                            e.printStackTrace();
                        }
                    %>
                
            </table>
        <!--</form>-->
                    
    </body>
</html>
