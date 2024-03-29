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
    <title>JSP Page</title>
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
            margin-top: 10%;
            width: 90%;
        }
        #heading {
            font-size: 40px;
            padding: 30px;
        }
        .center {
            margin: 100%;
        }
        #qid {
            width: 10%;
        }
        #updateBtn, #deleteBtn {
            width: 80px;
            padding: 5px;
            margin-right: 5px;
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

<!--<form action="#" method="POST">-->
    <table id="table" border="1" align="center" cellspacing="0">
        <tr>
            <td id="heading" colspan="8" align="center">Questions</td>
        </tr>
        <tr>
            <th>Question ID</th>
            <th>Question</th>
            <th>Option 1</th>
            <th>Option 2</th>
            <th>Option 3</th>
            <th>Option 4</th>
            <th>Answer</th>
            <th>Actions</th>
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
                    <button id="updateBtn" type="submit">Update</button>
                </form>
                <form action="deleteQuestion.jsp" method="POST">
                    <input type="hidden" name="questionId" value="<%= rs.getString("qid") %>">
                    <button id="deleteBtn" type="submit">Delete</button>
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
<!--</form>-->
</body>
</html>
