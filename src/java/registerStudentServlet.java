/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DARSHAN
 */
public class registerStudentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try{
                Connection con = null;
    //                Statement st = null;
                PreparedStatement ps = null;
                PreparedStatement pss = null;

                HttpSession ssn = request.getSession();
                if(!ssn.getId().equals(ssn.getAttribute("key"))){
                    response.sendRedirect("index.jsp");
                }

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");
                String uname = request.getParameter("uname");
                String password = request.getParameter("password");
                String fname = request.getParameter("fname");
                String mname = request.getParameter("mname");
                String lname = request.getParameter("lname");
                String stream = request.getParameter("stream");
                String age = request.getParameter("age");

                pss = con.prepareStatement("select username from data where username=?");
                pss.setString(1,uname);
                ResultSet rss = pss.executeQuery();
                rss.last();
                int count = rss.getRow();
                int rs=0;

                if(!(count==1)){
                    ps = con.prepareStatement("insert into data (username,password,type,fname,lname,mname,age,stream) values(?,?,'student',?,?,?,?,?)");
                    ps.setString(1,uname);
                    ps.setString(2,password);
                    ps.setString(3,fname);
                    ps.setString(4,lname);
                    ps.setString(5,mname);
                    ps.setString(6,age);
                    ps.setString(7,stream);
                    rs = ps.executeUpdate();
//                    response.sendRedirect("insertMessage.jsp");
                    if (rs == 1) {
                        out.print("success"); // Send success response
                    } else {
                        out.print("failure"); // Send failure response
                    }
                    ssn.setAttribute("count", count);
                }else{
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet login</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Username already taken " + count + "</h1>");
                out.println("</body>");
                out.println("</html>");
                ssn.setAttribute("count", count);
//                response.sendRedirect("insertMessage.jsp");
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
//<%
//                    try{
//                        Connection con = null;
//        //                Statement st = null;
//                        PreparedStatement ps = null;
//                        PreparedStatement pss = null;
//
//                        HttpSession ssn = request.getSession();
//                        if(!ssn.getId().equals(ssn.getAttribute("key"))){
//                            response.sendRedirect("index.jsp");
//                        }
//
//                        Class.forName("com.mysql.jdbc.Driver");
//                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");
//                        String uname = request.getParameter("uname");
//                        String password = request.getParameter("password");
//                        String fname = request.getParameter("fname");
//                        String mname = request.getParameter("mname");
//                        String lname = request.getParameter("lname");
//                        String stream = request.getParameter("stream");
//                        String age = request.getParameter("age");
//                        
//                        pss = con.prepareStatement("select * from data where username=?");
//                        pss.setString(1,uname);
//                        ResultSet rss = ps.executeQuery();
//                        rss.last();
//                        int count = rss.getRow();
//                        int rs=0;
//                        if(count==1){
//                            ps = con.prepareStatement("insert into data (username,password,type,fname,lname,mname,age,stream) values(?,?,'student',?,?,?,?,?)");
//                            ps.setString(1,uname);
//                            ps.setString(2,password);
//                            ps.setString(3,fname);
//                            ps.setString(4,lname);
//                            ps.setString(5,mname);
//                            ps.setString(6,age);
//                            ps.setString(7,stream);
//                            rs = ps.executeUpdate();
//                        }else{%>
//                            alert("Username already Exists");
//                            return false;
//                        <%}
//                        if(rs == 1){%>
//                            alert("Data Insert Successfully");
//                            return true;
//                        <%}else{%>
//                            alert("Username already Exists");
//                            return false;
//                        <%}
//                        out.println("<!DOCTYPE html>");
//                        out.println("<html>");
//                        out.println("<head>");
//                        out.println("<title>Servlet login</title>");            
//                        out.println("</head>");
//                        out.println("<body>");
//                        out.println("<h1>Servlet login at " + rs + "</h1>");
//                        out.println("</body>");
//                        out.println("</html>");
//                        }catch(Exception e){
//                            e.printStackTrace();
//                        }%>