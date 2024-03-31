<%-- 
    Document   : studentHome
    Created on : 28 Mar, 2024, 7:49:01 PM
    Author     : DARSHAN
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Test</title>
    <style>
        body {
            font-family: cursive,Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .question {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
            margin-bottom: 10px;
        }
        .question h3 {
            margin-top: 0;
        }
        .options {
            padding-left: 20px;
        }
        .options label {
            display: block;
            margin-bottom: 5px;
        }
        .options input[type="radio"] {
            margin-right: 5px;
        }
        .submit-btn {
            text-align: center;
            margin-top: 20px;
        }
        .submit-btn input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Online Test</h2>
        </div>
        <form action="result.jsp" method="POST">
            <% 
                try {
                    Connection con = null;
                    Statement st = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");
                    st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from question");
                    int questionCount = 1;
                    while(rs.next()) {
            %>
            <div class="question">
                <h3>Question <%= questionCount++ %>:</h3>
                <p><%= rs.getString("question") %></p>
                <div class="options">
                    <label><input type="radio" name="<%= rs.getString("qid") %>" value="<%= rs.getString("option1") %>" > <%= rs.getString("option1") %></label>
                    <label><input type="radio" name="<%= rs.getString("qid") %>" value="<%= rs.getString("option2") %>" > <%= rs.getString("option2") %></label>
                    <label><input type="radio" name="<%= rs.getString("qid") %>" value="<%= rs.getString("option3") %>" > <%= rs.getString("option3") %></label>
                    <label><input type="radio" name="<%= rs.getString("qid") %>" value="<%= rs.getString("option4") %>" > <%= rs.getString("option4") %></label>
                </div>
            </div>
            <% 
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                }
            %>
            <div class="submit-btn">
                <input type="submit" value="Submit Test">
            </div>
        </form>
    </div>
</body>
</html>
