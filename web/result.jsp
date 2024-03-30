<%@page import="java.sql.*"%>
<%@page import="java.util.Enumeration"%>

<%
    try {
        int totalQuestions = 0;
        int correctAnswers = 0;
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("question")) {
                totalQuestions++;
                String userAnswer = request.getParameter(paramName);
                String questionId = paramName.substring("question".length());
                String correctAnswer = ""; // Retrieve correct answer from the database based on questionId
                // Perform database query to get correct answer by questionId
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");
                ps = con.prepareStatement("SELECT answer FROM question WHERE qid = ?");
                ps.setString(1, questionId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    correctAnswer = rs.getString("answer");
                }
                if (userAnswer != null && userAnswer.equals(correctAnswer)) {
                    correctAnswers++;
                }
            }
        }
        double percentage = ((double) correctAnswers / totalQuestions) * 100;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
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
        .result {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="result">Test Result</h2>
        <p>Total Questions: <%= totalQuestions %></p>
        <p>Correct Answers: <%= correctAnswers %></p>
        <p>Percentage Score: <%= percentage %> %</p>
    </div>
</body>
</html>
<%
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
