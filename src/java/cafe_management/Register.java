/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cafe_management;

import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import model.User;

/**
 *
 * @author mayur
 */
public class Register extends HttpServlet {

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
            String txtName=request.getParameter("name");
            String txtEmail=request.getParameter("email");
            String txtMobileNumber=request.getParameter("mobile");
            String txtAddress=request.getParameter("address");
            String txtAnswer=request.getParameter("answer");
            String txtSecurityQuestion=request.getParameter("security-question");
            String txtPassword=request.getParameter("password");
            User user=new User();
        user.setName(txtName);
        user.setEmail(txtEmail);
        user.setMobileNumber(txtMobileNumber);
        user.setAddress(txtAddress);
        user.setAnswer(txtAnswer);
        user.setSecurityQuestion(txtSecurityQuestion);
        user.setPassword(txtPassword);
        UserDao.save(user);
//        out.println("<!DOCTYPE html>");
//        out.println("<html>");
//        out.println("<head>");
//        out.println("<title>Your Page Title</title>");
//        out.println("</head>");
//        out.println("<body>");
//        out.println("<h1>Welcome to Your Page</h1>");
//        out.println("<p>This is your HTML content.</p>");
//        out.println("<script>");
//        out.println("alert('Register Successfully!!');");
//        out.println("window.location.href = 'index.html';"); // Replace 'yourpage.html' with the URL of the page you want to redirect to
//        out.println("</script>");
//        out.println("</body>");
//        out.println("</html>");
        response.sendRedirect("index.html");
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
