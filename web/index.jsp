<%-- 
    Document   : index
    Created on : 28 Mar, 2024, 6:27:45 PM
    Author     : DARSHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Exam System Login</title>
    <style>
        body {
            font-family: cursive,Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        #container {
            width: 400px;
            margin: 100px auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #heading {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            padding: 20px 0;
            background-color: #004B49;
            color: #fff;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }

        form {
            padding: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 12px);
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 3px;
            background-color: #004B49;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #004B49;
        }
    </style>
</head>
<body>
    <%
        try{
            HttpSession ssn = request.getSession();
            ssn.setAttribute("key", ssn.getId());
        }catch(Exception e){
            e.printStackTrace();
        }
    %>
<div id="container">
    <div id="heading">Exam System Login</div>
    <form action="login" method="POST">
        <label for="uname">Enter Username</label>
        <input type="text" name="uname" id="uname" required>
        <label for="password">Enter Password</label>
        <input type="password" name="password" id="password" required>
        <input type="submit" value="Login" name="submit">
    </form>
</div>
</body>
</html>
