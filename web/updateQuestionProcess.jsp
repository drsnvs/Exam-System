<%-- 
    Document   : updateQuestionProcess
    Created on : 29 Mar, 2024, 4:55:21 PM
    Author     : DARSHAN
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Question Process</title>
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
            // Retrieve form parameters
            String questionId = request.getParameter("questionId");
            String question = request.getParameter("question");
            String option1 = request.getParameter("option1");
            String option2 = request.getParameter("option2");
            String option3 = request.getParameter("option3");
            String option4 = request.getParameter("option4");
            String answer = request.getParameter("answer");

            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14", "root", "");

            // Prepare update query
            String updateQuery = "UPDATE question SET question=?, option1=?, option2=?, option3=?, option4=?, answer=? WHERE qid=?";
            PreparedStatement ps = con.prepareStatement(updateQuery);
            ps.setString(1, question);
            ps.setString(2, option1);
            ps.setString(3, option2);
            ps.setString(4, option3);
            ps.setString(5, option4);
            ps.setString(6, answer);
            ps.setString(7, questionId);

            // Execute update query
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<script>alert('Question updated successfully');</script>");
                response.sendRedirect("displayQuestions.jsp"); // Redirect to displayQuestions.jsp after successful update
            } else {
                out.println("<script>alert('Failed to update question');</script>");
            }

            // Close resources
            ps.close();
            con.close();
        } catch (Exception e) {
            out.println("<script>alert('Failed to update question');</script>");
            e.printStackTrace();
        }
    %>
</body>
</html>
