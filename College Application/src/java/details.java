/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sujan Darai
 */
public class details extends HttpServlet {

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
            String first = request.getParameter("firstname");              
            String last = request.getParameter("lastname");  
            String contact = request.getParameter("contact");
            String country = request.getParameter("country");
            String address = request.getParameter("address");
            String university = request.getParameter("university");
            String two = request.getParameter("plus2marks");
            String ten = request.getParameter("10_marks");
            Class.forName("org.apache.derby.jdbc.ClientDriver");  
            Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/data","root","qwerty");  
            Statement stmt = con.createStatement();      
            String query = "insert into data values ('"+first+"','"+last+"','"+contact+"','"+country+"','"+address+"','"+university+"','"+two+"','"+ten+"')";             
            String query2 = "select * from data"; 
            ResultSet rs = stmt.executeQuery(query2);
            HttpSession session = request.getSession();
//            out.println(first);
//            out.println(last);
//            out.println(contact);
//            out.println(country);
//            out.println(address);
//            out.println(university);
//            out.println(two);
//            out.println(ten);
           int count =0;
            int flag =0;      
                while(rs.next()){
                if(first.equals(rs.getString(1))){
                    count++;                    
                    out.println("you have already filled the form");
                    break;
                }
            }  
            if(count==0){
                stmt.executeUpdate(query);
                out.println("Sucessfully inserted");
                flag =1;  
            }                        
            if(flag!=1 && count!=1){  
                out.println("success");
                out.println("failed to insert the data!!");
            }  
        }
        catch(Exception e){ System.out.println(e);}  
    }
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
