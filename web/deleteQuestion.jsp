<%-- 
    Document   : deleteQuestion
    Created on : 29 Mar, 2024, 5:00:00 PM
    Author     : DARSHAN
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete Question</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        #container {
            width: 50%;
            margin: 5% auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
            padding: 20px;
            text-align: center;
        }
        #message {
            margin-top: 20px;
            padding: 10px;
            background-color: #f2f2f2;
            border: 1px solid #ddd;
        }
        #backBtn {
            padding: 10px 20px;
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #004B49; /* Blue color */
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        #backBtn:hover {
            background-color: #45a049; /* Darker blue color on hover */
        }
    </style>
</head>
<body>
    <div id="container">
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
                // Retrieve question ID from request
                String questionId = request.getParameter("questionId");
                
                // Delete question from the database based on the question ID
                Connection con = null;
                PreparedStatement ps = null;

                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14", "root", "");

                // Query to delete question by ID
                ps = con.prepareStatement("DELETE FROM question WHERE qid = ?");
                ps.setString(1, questionId);
                int rs = ps.executeUpdate();

                if (rs > 0) {
        %>
        <div id="message">
            <p>Question with ID <%= questionId %> deleted successfully.</p>
        </div>
        <%
                } else {
        %>
        <div id="message">
            <p>Error deleting question with ID <%= questionId %>. Please try again.</p>
        </div>
        <%
                }
        %>
        <a href="displayQuestions.jsp" id="backBtn">Back to Questions</a>
        <%
            } catch (Exception e) {
                e.printStackTrace();
        %>
        <div id="message">
            <p>An error occurred. Please try again later.</p>
        </div>
        <a href="displayQuestions.jsp" id="backBtn">Back to Questions</a>
        <%
            }
        %>
    </div>
</body>
</html>
