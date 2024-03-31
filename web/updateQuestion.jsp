<%-- 
    Document   : updateQuestion
    Created on : 29 Mar, 2024, 4:30:17 PM
    Author     : DARSHAN
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Question</title>
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
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-top: 10px;
            color: #666;
        }
        input[type="text"], textarea {
            width: calc(100% - 20px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 5px;
        }
        input[type="submit"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-top: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        #backBtn {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #666;
        }
    </style>
</head>
<body>
    <div id="container">
        <h2>Update Question</h2>
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
                
                // Fetch question details from the database based on the question ID
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14", "root", "");

                // Query to fetch question details by ID
                ps = con.prepareStatement("SELECT * FROM question WHERE qid = ?");
                ps.setString(1, questionId);
                rs = ps.executeQuery();

                if (rs.next()) {
        %>
        <form action="updateQuestionProcess.jsp" onsubmit="return validation()" method="POST">
            <input type="hidden" name="questionId" value="<%= rs.getString("qid") %>">
            <label for="question">Question:</label>
            <textarea name="question" id="question" rows="4"><%= rs.getString("question") %></textarea>
            <label for="option1">Option 1:</label>
            <input type="text" name="option1" id="o1" value="<%= rs.getString("option1") %>">
            <label for="option2">Option 2:</label>
            <input type="text" name="option2" id="o2" value="<%= rs.getString("option2") %>">
            <label for="option3">Option 3:</label>
            <input type="text" name="option3" id="o3" value="<%= rs.getString("option3") %>">
            <label for="option4">Option 4:</label>
            <input type="text" name="option4" id="o4" value="<%= rs.getString("option4") %>">
            <label for="answer">Answer:</label>
            <input type="text" name="answer" id="answer" value="<%= rs.getString("answer") %>">
            <input type="submit" value="Update">
        </form>
        <script>
        function validation(){
            var question = document.getElementById("question").value;
            var o1 = document.getElementById("o1").value;
            var o2 = document.getElementById("o2").value;
            var o3 = document.getElementById("o3").value;
            var o4 = document.getElementById("o4").value;
            var answer = document.getElementById("answer").value;

            if(question == ""){
                alert("Enter Enter Question");
                return false;
            }
            if(o1 == ""){
                alert("Enter Option 1");
                return false;
            }
            if(o2 == ""){
                alert("Enter Option 2");
                return false;
            }
            if(o3 == ""){
                alert("Enter Option 3");
                return false;
            }
            if(o4 == ""){
                alert("Enter Option 4");
                return false;
            }
            if(answer == ""){
                alert("Enter Answer");
                return false;
            }
            if(!((answer === o1) || (answer === o2) || (answer === o3) || (answer === o4) )){
                alert("answer should be in one of the option");
                return false;
            }
            if(o1===o2 || o1===o3 || o1===o4 || o2===o3 || o2===o4 || o3===o4){
                alert("Option should be a different");
                return false;
            }
        }
        </script>
        <%
                } else {
                    out.println("Question not found!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <a href="displayQuestions.jsp" id="backBtn">Back to Question Display</a>
    </div>
</body>
</html>
