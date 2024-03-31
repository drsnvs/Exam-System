<%-- 
    Document   : addQuestions
    Created on : 29 Mar, 2024, 2:10:59 PM
    Author     : DARSHAN
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registered Student</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
            }

            #container {
                width: 50%;
                margin: 50px auto;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
                padding: 20px;
            }

            h2 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }

            input[type="text"] {
                width: calc(100% - 20px);
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-top: 5px;
            }

            #btn {
                width: 100%;
                padding: 10px;
                border: none;
                background-color: #4CAF50;
                color: white;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 20px;
            }

            #btn:hover {
                background-color: #45a049;
            }

            #backBtn {
                text-decoration: none;
                color: #666;
                font-size: 14px;
                padding: 10px;
            }

            #backBtn:hover {
                color: #333;
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
        <div id="container">
            <h2>Add Question</h2>
            <form action="#" onsubmit="return validation()" method="POST">
                <table>
                    <tr>
                        <th>Question</th>
                        <td><input type="text" name="question" id="question"/></td>
                    </tr>
                    <tr>
                        <th>Option 1</th>
                        <td><input type="text" name="o1" id="o1"/></td>
                    </tr>
                    <tr>
                        <th>Option 2</th>
                        <td><input type="text" name="o2" id="o2"/></td>
                    </tr>
                    <tr>
                        <th>Option 3</th>
                        <td><input type="text" name="o3" id="o3"/></td>
                    </tr>
                    <tr>
                        <th>Option 4</th>
                        <td><input type="text" name="o4" id="o4"/></td>
                    </tr>
                    <tr>
                        <th>Answer</th>
                        <td><input type="text" name="answer" id="answer"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input id="btn" type="submit" value="Add" name="add" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><a href="admin.jsp" id="backBtn">Back to Admin</a></td>
                    </tr>
                </table>
            </form>
        </div>
        <script>
            function validation(){
//                var qid = document.getElementById("qid").value;
                var question = document.getElementById("question").value;
                var o1 = document.getElementById("o1").value;
                var o2 = document.getElementById("o2").value;
                var o3 = document.getElementById("o3").value;
                var o4 = document.getElementById("o4").value;
                var answer = document.getElementById("answer").value;
//                if(qid == ""){
//                    alert("Enter Question id");
//                    return false;
//                }
                if(question == ""){
                    alert("Enter Enter Question");
                    return false;
                }
                if(o1 == ""){
                    alert("Enter Option 1");
                    return false;
                }
                if(o2 == ""){
                    alert("Enter Option 2");
                    return false;
                }
                if(o3 == ""){
                    alert("Enter Option 3");
                    return false;
                }
                if(o4 == ""){
                    alert("Enter Option 4");
                    return false;
                }
                if(answer == ""){
                    alert("Enter Answer");
                    return false;
                }
                if(!((answer === o1) || (answer === o2) || (answer === o3) || (answer === o4) )){
                    alert("answer should be in one of the option");
                    return false;
                }
                if(o1===o2 || o1===o3 || o1===o4 || o2===o3 || o2===o4 || o3===o4){
                    alert("Option should be a different");
                    return false;
                }
                
            }
        </script>
    </body>
</html>

<%
    try{
        Connection con = null;
//                Statement st = null;
        PreparedStatement ps = null;

        HttpSession ssn = request.getSession();
        if(!ssn.getId().equals(ssn.getAttribute("key"))){
            response.sendRedirect("index.jsp");
        }

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");
        String question = request.getParameter("question");
        String o1 = request.getParameter("o1");
        String o2 = request.getParameter("o2");
        String o3 = request.getParameter("o3");
        String o4 = request.getParameter("o4");
        String answer = request.getParameter("answer");

//        pss = con.prepareStatement("select username from data where username=?");
//        pss.setString(1,question);
//        pss.setString(1,o1);
//        pss.setString(1,o2);
//        pss.setString(1,o3);
//        pss.setString(1,o4);
//        pss.setString(1,answer);
//        ResultSet rss = pss.executeQuery();
//        rss.last();
//        int count = rss.getRow();
//        int rs=0;
            
        ps = con.prepareStatement("insert into question (question,option1,option2,option3,option4,answer) values(?,?,?,?,?,?)");
        ps.setString(1,question);
        ps.setString(2,o1);
        ps.setString(3,o2);
        ps.setString(4,o3);
        ps.setString(5,o4);
        ps.setString(6,answer);
        int rs = ps.executeUpdate();
//                    response.sendRedirect("insertMessage.jsp");
        if (rs == 1) {
            if(!(question.equals(""))){
                out.print("inserted successfully"); // Send success response
                response.sendRedirect("displayQuestions.jsp");
            }
        } else {
            out.print("inserted unsuccessfully"); // Send failure response
        }
//        ssn.setAttribute("count", count);
//        if(!(count==1)){
//            ps = con.prepareStatement("insert into data (username,password,type,fname,lname,mname,age,stream) values(?,?,'student',?,?,?,?,?)");
//            ps.setString(1,uname);
//            ps.setString(2,password);
//            ps.setString(3,fname);
//            ps.setString(4,lname);
//            ps.setString(5,mname);
//            ps.setString(6,age);
//            ps.setString(7,stream);
//            rs = ps.executeUpdate();
////                    response.sendRedirect("insertMessage.jsp");
//            if (rs == 1) {
//                out.print("success"); // Send success response
//            } else {
//                out.print("failure"); // Send failure response
//            }
//            ssn.setAttribute("count", count);
//        }else{
//        out.println("<!DOCTYPE html>");
//        out.println("<html>");
//        out.println("<head>");
//        out.println("<title>Servlet login</title>");            
//        out.println("</head>");
//        out.println("<body>");
//        out.println("<h1>Username already taken " + count + "</h1>");
//        out.println("</body>");
//        out.println("</html>");
//        ssn.setAttribute("count", count);
////                response.sendRedirect("insertMessage.jsp");
//        }
    }catch(Exception e){
        e.printStackTrace();
    }
%>

<!--CREATE TABLE `darshan_14`.`question` (
  `qid` INT NOT NULL AUTO_INCREMENT,
  `question` VARCHAR(45) NOT NULL,
  `option1` VARCHAR(255) NOT NULL,
  `option2` VARCHAR(45) NOT NULL,
  `option3` VARCHAR(45) NOT NULL,
  `option4` VARCHAR(45) NOT NULL,
  `answer` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`qid`));-->
