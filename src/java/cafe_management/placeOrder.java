/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cafe_management;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.mysql.cj.xdevapi.JsonParser;
import common.OpenPdf;
import dao.BillDao;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.swing.JOptionPane;
import model.Bill;


/**
 *
 * @author mayur
 */
@WebServlet(name = "placeOrder", urlPatterns = {"/placeOrder"})
public class placeOrder extends HttpServlet {

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
            int billId=Integer.parseInt(BillDao.getId());
            
            
            
            String email = request.getParameter("email");
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String cemail = request.getParameter("cemail");
        String grandTotal=request.getParameter("gtl");

        SimpleDateFormat dFormat=new SimpleDateFormat("dd-MM-yyyy");
        Date date = new Date();
        String today=dFormat.format(date);
        String createdBy=email;
        Bill bill=new Bill();
        bill.setId(billId);
        bill.setName(name);
        bill.setMobileNumber(mobile);
        bill.setEmail(cemail);
        bill.setDate(today);
        bill.setTotal(grandTotal);
        bill.setCreatedBy(createdBy);
        BillDao.save(bill);
        
        
        
        // Read JSON data from the request body
        BufferedReader reader = request.getReader();
        StringBuilder jsonData = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonData.append(line);
        }
         // Parse JSON data using Gson
        JsonArray jsonArray = new Gson().fromJson(jsonData.toString(), JsonArray.class);

        // Initialize a list to store extracted data
//        List<OrderItem> orderList = new ArrayList<>();

        // Iterate over the JSON array and extract data
        
        
        
        //create pdf format
        
        String path="D:\\CafeBills\\";
        com.itextpdf.text.Document doc= new com.itextpdf.text.Document();
        try{
            PdfWriter.getInstance(doc, new FileOutputStream(path+""+billId+".pdf"));
            doc.open();
            Paragraph cafeName = new Paragraph("                                                           Cafe Manegement System\n");
            doc.add(cafeName);
            Paragraph startLine = new Paragraph("****************************************************************************************************************");
            doc.add(startLine);
            Paragraph paragraf3 =new Paragraph("\tBill ID: "+billId+"\nCustomer Name: "+name+"\nTotal Paid: "+grandTotal);
            doc.add(paragraf3);
            doc.add(startLine);
            PdfPTable tb1= new PdfPTable(4);
            tb1.addCell("Name");
            tb1.addCell("Price");
            tb1.addCell("Quantity");
            tb1.addCell("Total");
            for (JsonElement element : jsonArray) {
            JsonObject jsonObject = element.getAsJsonObject();
            
            // Extract individual fields from the JSON object
            String Name = jsonObject.get("Name").getAsString();
            String price = jsonObject.get("Price").getAsString();
            String quantity = jsonObject.get("Quantity").getAsString();
            String total = jsonObject.get("Total").getAsString();
            
                tb1.addCell(Name);
                tb1.addCell(price);
                tb1.addCell(quantity);
                tb1.addCell(total);
            // Create an instance of OrderItem and add it to the list
            
        }
            doc.add(tb1);
            doc.add(startLine);
            Paragraph thanksMsg=new Paragraph("Thank You, Please Visit Again.");
            doc.add(thanksMsg);
            //open pdf
            OpenPdf.openById(String.valueOf(billId));
            
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
        }
        doc.close();
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//            JOptionPane.showMessageDialog(null, "total: "+grandTotal);
        
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
