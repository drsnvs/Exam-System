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
public class login extends HttpServlet {

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
                
                HttpSession ssn = request.getSession();
                if(!ssn.getId().equals(ssn.getAttribute("key"))){
                    response.sendRedirect("index.jsp");
                }
                
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");
                String uname = request.getParameter("uname");
                String password = request.getParameter("password");
                
                ps = con.prepareStatement("select * from data where username=? and password=?");
                ps.setString(1,uname);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
//                rs.last();
//                int count = rs.getRow();
//                if(rs.next()){
//                    if(rs.getString("type").equals("admin")){
//                        response.sendRedirect("admin.jsp");
//                    }else if(rs.getString("type").equals("student")){
//                        response.sendRedirect("login");
//                    }else{
//                        response.sendRedirect("login");
//                    }
//                }else{
//                    out.println("<script type=\"text/javascript\">");  
//                    out.println("alert('Wrong password');");
//                    out.println("window.location='index.jsp';");
//                    out.println("</script>");
//                }
                if (rs.next()) {
                    String userType = rs.getString("type");
                    if ("admin".equals(userType)) {
                        response.sendRedirect("admin.jsp");
                    } else if ("student".equals(userType)) {
                        response.sendRedirect("student.jsp"); 
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Unknown user type');");
                        out.println("window.location='index.jsp';");
                        out.println("</script>");
                    }
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Wrong username or password');");
                    out.println("window.location='index.jsp';");
                    out.println("</script>");
                }
                
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet login</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet login at " + rs + "</h1>");
                out.println("</body>");
                out.println("</html>");
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

//CREATE TABLE `darshan_14`.`data` (
//  `username` VARCHAR(45) NOT NULL,
//  `password` VARCHAR(45) NOT NULL,
//  `type` VARCHAR(7) NOT NULL,
//  PRIMARY KEY (`username`));
//ALTER TABLE `darshan_14`.`data` 
//ADD COLUMN `fname` VARCHAR(45) NOT NULL AFTER `type`,
//ADD COLUMN `lname` VARCHAR(45) NOT NULL AFTER `fname`,
//ADD COLUMN `mname` VARCHAR(45) NOT NULL AFTER `lname`,
//ADD COLUMN `age` VARCHAR(45) NOT NULL AFTER `mname`,
//ADD COLUMN `stream` VARCHAR(45) NOT NULL AFTER `age`;
