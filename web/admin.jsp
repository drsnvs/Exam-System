<%-- 
    Document   : admin
    Created on : 28 Mar, 2024, 7:12:20 PM
    Author     : DARSHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Page</title>
    <style>
        body {
            font-family: cursive,Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        #container {
            width: 700px;
            margin: 100px auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        #heading {
            font-size: 40px;
            font-weight: bold;
            text-align: center;
            padding: 20px 0;
            color: #004B49; /* Changed heading color to specified color */
            border-bottom: 2px solid #004B49; /* Added bottom border */
            margin-bottom: 20px; /* Increased margin-bottom */
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: #004B49; /* Changed button text color to specified color */
        }

        button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #004B49; /* Changed button background color to specified color */
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049; /* Darken button color on hover */
        }
    </style>
</head>
<body>
<%
try {
    HttpSession ssn = request.getSession();
    if (!ssn.getId().equals(ssn.getAttribute("key"))) {
        response.sendRedirect("index.jsp");
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>

<div id="container">
    <div id="heading">Exam System</div> <!-- Changed heading text to "Exam System" -->
    <table border="1">
        <tr>
            <td><a href="registerStudent.jsp"><button>Register Student</button></a></td>
            <td><a href="registeredStudents.jsp"><button>Registered Students</button></a></td>
            <td><a href="addQuestions.jsp"><button>Add Questions</button></a></td>
            <td><a href="displayQuestions.jsp"><button>Display Questions</button></a></td>
            <td><a href="Studentresults.jsp"><button>Student Results</button></a></td>
        </tr>
        <tr>
            <td colspan="5"><a href="logout.jsp"><button>Log out</button></a></td>
        </tr>
    </table>
</div>

</body>
</html>
