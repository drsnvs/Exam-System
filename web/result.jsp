<%-- 
    Document   : result
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
    <title>Test Result</title>
    <style>
        body {
            font-family: cursive,Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .result {
            margin-top: 30px;
        }
        .result p {
            margin: 10px 0;
            font-size: 18px;
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
    <div class="container">
        <h2>Exam Result</h2>
        
        <% 
            try {
                Connection con = null;
                Statement st = null;
                PreparedStatement ps = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");
                st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from question");

                int totalQuestions = 0;
                int correctAnswers = 0;

                // Loop through each question from the database
                while(rs.next()) {
                    totalQuestions++;

                    String qid = rs.getString("qid");
                    String correctAnswer = rs.getString("answer");

                    // Retrieve the selected answer submitted from studentHome.jsp
                    String selectedAnswer = request.getParameter(qid);

                    // Check if selected answer matches the correct answer
                    if(selectedAnswer != null && selectedAnswer.equals(correctAnswer)) {
                        correctAnswers++;
                    }
                }
                String uname = (String) session.getAttribute("uname");
                // Calculate score
                double score = ((double) correctAnswers / totalQuestions) * 100;
                
                int res;
                ps = con.prepareStatement("insert into result (total,correct,result,username) values(?,?,?,?);");
//                out.println(totalQuestions);
//                out.println(correctAnswers);
//                out.println(score);
//                out.println(uname);
                ps.setInt(1,totalQuestions);
                ps.setInt(2,correctAnswers);
                ps.setDouble(3,score);
                ps.setString(4,uname);
                res = ps.executeUpdate();
//                out.println(res);
                if(res==1){
        %>
<!--        <div class="result">
            <p>Username: <%= uname %></p>
            <p>Total Questions: <%= totalQuestions %></p>
            <p>Correct Answers: <%= correctAnswers %></p>
            <p>Result: <%= String.format("%.2f", score) %>%</p>
        </div>-->
        <% 
            }else{%>
        <div class="result">
            <p>Exam already submitted</p>
        </div>
        <%
            }
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
        <%
            try{
                Connection con = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");
                Statement st = null;
                st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from result");
                while(rs.next()){
                    if(rs.getString("username").equals(session.getAttribute("uname"))){
            
        %>
        <div class="result">
            <div class="result">
                <p>Username: <%= rs.getString("username") %></p>
                <p>Total Questions: <%= rs.getInt("total") %></p>
                <p>Correct Answers: <%= rs.getInt("correct") %></p>
                <p>Result: <%= String.format("%.2f", rs.getDouble("result")) %>%</p>

        </div>
        <%
            }}
            }catch(Exception e){
                e.printStackTrace();
            }
        %>
        </div>
    </div>
</body>
</html>
