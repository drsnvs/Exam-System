<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Logout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            margin: 20px auto;
        }
        td {
            padding: 10px;
            text-align: center;
        }
        button {
            padding: 10px 20px;
            background-color: #004B49;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        button:hover {
            background-color: #004B49;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Logout</h1>
        <%
            session.invalidate();
        %>
        <table>
            <tr>
                <td colspan="2">Session Closed</td>
            </tr>
            <tr>
                <td colspan="2"><a href="index.jsp"><button>Back to Home page</button></a></td>
            </tr>
        </table>
    </div>
</body>
</html>
