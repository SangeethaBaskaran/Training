/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package customer;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sangeetha
 */
@WebServlet(name = "validate", urlPatterns = {"/validate"})
public class validate extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            
            dbConnection con = new dbConnection();
            if(request.getSession().getAttribute("name")!=null){
                String user = (String) request.getSession().getAttribute("name");
                String result[] = con.select(user);
                if (result[0] == null) {
                    request.setAttribute("details", "Oops!! You have not "
                            + "surveyed with us before !! Please give your survey!");
                } else {
                    request.setAttribute("details", "Hey " + user + "!! Happy " + result[0] + " !!! "
                            + "Found that you love " + result[1] + " ! Wannu change");

                }
                RequestDispatcher rd = request.getRequestDispatcher("main1.jsp");
                rd.forward(request, response);
            }else{
            String name = request.getParameter("name");
            String pass = request.getParameter("password");
            if (!con.validate(name, pass)) {
                request.setAttribute("error", "Username and password incorrect");
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else {
                request.getSession().setAttribute("name", request.getParameter("name"));
                String user = (String) request.getSession().getAttribute("name");
                String result[] = con.select(user);
                if (result[0] == null) {
                    request.setAttribute("details", "Oops!! You have not "
                            + "surveyed with us before !! Please give your survey!");
                } else {
                    request.setAttribute("details", "Hey " + user + "!! Happy " + result[0] + " !!! "
                            + "Found that you love " + result[1] + " ! Wannu change");

                }  
                out.write("<p>hey</p>");
                out.println("<p>hey</p>");
                out.println("<img src=\"https://www.refersion.com/tracker/chargebee?k=pub_9ef6qqqwxzx4dkjhkhkj136&ci=sesdcw2ss2dfs\">");
                RequestDispatcher rd = request.getRequestDispatcher("main1.jsp");
                rd.forward(request, response);
            }}
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            out.close();
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
