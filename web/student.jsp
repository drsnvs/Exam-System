<%-- 
    Document   : student
    Created on : 28 Mar, 2024, 7:49:01 PM
    Author     : DARSHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <h1>Student</h1>
    </body>
</html>
