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
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            User user=null;
        user=UserDao.login(email, password);
            if(user==null){
                out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Your Page Title</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Welcome to Your Page</h1>");
        out.println("<p>This is your HTML content.</p>");
        out.println("<script>");
        out.println("alert('Incorrect Username Or Password!!');");
        out.println("window.location.href = 'index.html';"); // Replace 'yourpage.html' with the URL of the page you want to redirect to
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
//                JOptionPane.showMessageDialog(null,"<html><b style=\"color:red\">Incorrect Username Or Password!!</b></html>","Message",JOptionPane.ERROR_MESSAGE);
//                response.sendRedirect("index.html");
            }
            else if(user.getStatus().equals("false")){
                 out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Your Page Title</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Welcome to Your Page</h1>");
        out.println("<p>This is your HTML content.</p>");
        out.println("<script>");
        out.println("alert('Waiting for Admin Approval!!');");
        out.println("window.location.href = 'index.html';"); // Replace 'yourpage.html' with the URL of the page you want to redirect to
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
//                ImageIcon ic=new ImageIcon("src/popupicon/wait.png");
//                JOptionPane.showMessageDialog(null,"<html><b>Wait For Admin Approval!!</b></html>","Message",JOptionPane.INFORMATION_MESSAGE);
//                response.sendRedirect("index.html");
            }
            else{
               response.sendRedirect("MainPage.jsp?email="+email);
            }
            /* TODO output your page here. You may use following sample code. */
            
//            response.sendRedirect("mainPage.html");
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
