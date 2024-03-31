<%-- 
    Document   : displayQuestions
    Created on : 29 Mar, 2024, 3:12:33 PM
    Author     : DARSHAN
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Questions</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        #container {
            width: 80%;
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
        input[type="text"] {
            width: calc(100% - 20px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 5px;
        }
        .btn {
            background-color: #004B49;
            color: white;
            padding: 8px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
        }
        .btn:hover {
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
<%
    try{
        HttpSession ssn = request.getSession();
        if(!ssn.getId().equals(ssn.getAttribute("key"))){
            response.sendRedirect("index.jsp");
        }
    } catch(Exception e){
        e.printStackTrace();
    }
%>

<div id="container">
    <h2>Questions</h2>
    <table>
        <tr>
            <th>Question ID</th>
            <th>Question</th>
            <th>Option 1</th>
            <th>Option 2</th>
            <th>Option 3</th>
            <th>Option 4</th>
            <th>Answer</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <%
            try{
                Connection con = null;
                Statement st = null;

                HttpSession ssn = request.getSession();
                if(!ssn.getId().equals(ssn.getAttribute("key"))){
                    response.sendRedirect("index.jsp");
                }

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");

                st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from question");
                while(rs.next()){
        %>
        <tr>
            <td><% out.println(rs.getString("qid")); %></td>
            <td><% out.println(rs.getString("question")); %></td>
            <td><% out.println(rs.getString("option1")); %></td>
            <td><% out.println(rs.getString("option2")); %></td>
            <td><% out.println(rs.getString("option3")); %></td>
            <td><% out.println(rs.getString("option4")); %></td>
            <td><% out.println(rs.getString("answer")); %></td>
            <td>
                <form action="updateQuestion.jsp" method="POST">
                    <input type="hidden" name="questionId" value="<%= rs.getString("qid") %>">
                    <button class="btn" type="submit">Update</button>
                </form></td><td>
                <form action="deleteQuestion.jsp" method="POST">
                    <input type="hidden" name="questionId" value="<%= rs.getString("qid") %>">
                    <button class="btn" type="submit">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }%>
            <tr>
                <td colspan="8" align="center"><a href="admin.jsp" id="backBtn">Back to Admin</a></td>
            </tr><%
            } catch(Exception e){
                e.printStackTrace();
            }
        %>
    </table>
</div>

</body>
</html>
