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
                ssn.setAttribute("key", ssn.getId());
            }catch(Exception e){
                e.printStackTrace();
            }
        %>
        <form action="login" method="POST">
            <table id="table" border="1" align="center" cellspacing="0">
                <tr>
                    <td id="heading" colspan="2" align="center">Exam System</td>
                </tr>
                <tr>
                    <th>Enter Username</th>
                    <td class="center" align="center"><input type="text" name="uname" id="uname"/></td>
                </tr>
                <tr>
                    <th>Enter Password</th>
                    <td class="center" align="center"><input type="password" name="password" id="password"/></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input id="btn" type="submit" value="Login" name="submit" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
