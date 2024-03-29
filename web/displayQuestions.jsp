<%-- 
    Document   : displayQuestions
    Created on : 29 Mar, 2024, 3:12:33 PM
    Author     : DARSHAN
--%>

<%@page import="java.sql.*"%>
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
                width: 90%;
            }
            #heading{
                font-size: 40px;
                padding: 30px;
            }
            .center{
                margin: 100%;
            }
            #qid{
                width:10%;
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
        
        
        <form action="#" method="POST">
            <table id="table" border="1" align="center" cellspacing="0">
                <tr>
                    <td id="heading" colspan="7" align="center">Questions</td>
                </tr>
                <tr>
                    <th>Question ID</th>
                    <th>Question</th>
                    <th>Option 1</th>
                    <th>Option 2</th>
                    <th>Option 3</th>
                    <th>Option 4</th>
                    <th>Answer</th>
                </tr>
                <tr>
                    <%
                        try{
                            Connection con = null;
            //                Statement st = null;
                            Statement st = null;

                            HttpSession ssn = request.getSession();
                            if(!ssn.getId().equals(ssn.getAttribute("key"))){
                                response.sendRedirect("index.jsp");
                            }

                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");
                            

                            st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from question");
                            while(rs.next()){
                            
                    %>
                    <td id="qid"><% out.println(rs.getString("qid")); %></td>
                    <td id="question"><% out.println(rs.getString("question")); %></td>
                    <td id="op1"><% out.println(rs.getString("option1")); %></td>
                    <td id="op2"><% out.println(rs.getString("option2")); %></td>
                    <td id="op3"><% out.println(rs.getString("option3")); %></td>
                    <td id="op4"><% out.println(rs.getString("option4")); %></td>
                    <td id="answer"><% out.println(rs.getString("answer")); %></td></tr>
                    <%
                        }
                        }catch(Exception e){
                            e.printStackTrace();
                        }
                    %>
                
            </table>
        </form>
                    
    </body>
</html>
