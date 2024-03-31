<%-- 
    Document   : startTest
    Created on : 28 Mar, 2024, 7:49:01 PM
    Author     : DARSHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Start Test</title>
    <style>
        body {
            font-family: cursive,Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 800px;
            margin: 100px auto;
            text-align: center;
        }
        .start-btn {
            padding: 15px 30px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Ready to start Exam?</h2>
        <form action="studentHome.jsp" method="GET">
            <p><%
                try{
                    HttpSession ssn = request.getSession();
                    %>
                    <%
                        String uname = (String) ssn.getAttribute("uname");
//                        out.println(uname);
                }catch(Exception e){
                    e.printStackTrace();
                }
                    %>
            </p>
            <button type="submit" class="start-btn">Start Exam</button>
        </form>
    </div>
</body>
</html>
