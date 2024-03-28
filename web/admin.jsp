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
        <title>JSP Page</title>
        <style>
            body{
                font-family: cursive;
            }
            th,td{
                marging:10px;
                padding:10px;
            }
            #btn{
                width:20%;
                padding: 7px;
            }
            #table{
                margin-top: 10%;
                width: 30%;
            }
            #heading{
                font-size: 40px;
                padding: 30px;
            }
            .center{
                margin: 100%;
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
        
        <table id="table" border="1" align="center" cellspacing="0">
            <tr>
                <td id="heading" colspan="4" align="center">Welcome Admin</td>
            </tr>
            <tr>
                <td><a href="registerStudent.jsp"><button>Register Student</button></a></td>
                <td><a href="registeredStudents.jsp"><button>Registered Students</button></a></td>
                <td><a href="addQuestions.jsp"><button>Add Questions</button></a></td>
                <td><a href="displayQuestions.jsp"><button>Display Questions</button></a></td>
            </tr>
        </table>
        
    </body>
</html>
