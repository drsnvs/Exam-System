<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registered Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        #container {
            width: 60%;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        button {
            padding: 7px 15px;
            border: none;
            background-color: #004B49;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        button:hover {
            background-color: #45a049;
        }

        #backBtn {
            text-decoration: none;
            color: #666;
            font-size: 14px;
            padding: 10px;
        }

        #backBtn:hover {
            color: #333;
        }
    </style>
</head>
<body>
<div id="container">
    <h2>Registered Students</h2>
    <table>
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
        <%
            try {
                Connection con = null;
                Statement st = null;
                HttpSession ssn = request.getSession();
                if (!ssn.getId().equals(ssn.getAttribute("key"))) {
                    response.sendRedirect("index.jsp");
                }

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14", "root", "");

                st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from data");
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("fname") %></td>
            <td><%= rs.getString("mname") %></td>
            <td><%= rs.getString("lname") %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("age") %></td>
            <td><%= rs.getString("stream") %></td>
            <td><%= rs.getString("type") %></td>
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
                }
                %>
        <tr>
            <td colspan="9" align="center"><a href="admin.jsp" id="backBtn">Back to Admin</a></td>
        </tr>
        <%
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</div>
</body>
</html>
