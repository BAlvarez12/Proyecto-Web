/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Puesto;

/**
 *
 * @author Bomiki
 */
public class sr_puesto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     Puesto puesto;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_puesto</title>");
            out.println("</head>");
            out.println("<body>");
            
             puesto = new Puesto(Integer.parseInt(request.getParameter("txt_id")),request.getParameter("txt_puesto"));
             
             if ("agregarp".equals(request.getParameter("btn_agregarp"))) {
                 if (puesto.agregar() > 0) {
                  request.setAttribute("mensaje", "Empleado agregado exitosamente");
                 request.getRequestDispatcher("index.jsp").forward(request, response);
             } else {
                 response.getWriter().write("error"); // Devolver 'error' si hubo un problema
             }
         }  
             
             if ("eliminarp".equals(request.getParameter("btn_eliminarp"))) {
                 if (puesto.eliminar()> 0) {
                  request.setAttribute("mensaje", "Empleado agregado exitosamente");
                 request.getRequestDispatcher("index.jsp").forward(request, response);
             } else {
                 response.getWriter().write("error"); // Devolver 'error' si hubo un problema
             }
         }  
             
              if ("modificarp".equals(request.getParameter("btn_modificarp"))) {
                 if (puesto.modificar()> 0) {
                  request.setAttribute("mensaje", "Empleado agregado exitosamente");
                 request.getRequestDispatcher("index.jsp").forward(request, response);
             } else {
                 response.getWriter().write("error"); // Devolver 'error' si hubo un problema
             }
         }  

         /*if ("modificar".equals(request.getParameter("btn_modificar"))) {
             if (puesto.modificar() > 0) {
                 response.getWriter().write("success");
             } else {
                 response.getWriter().write("error");
             }
         }

         if ("eliminar".equals(request.getParameter("btn_eliminar"))) {
             if (empleado.eliminar() > 0) {
                 response.getWriter().write("success");
             } else {
                 response.getWriter().write("error");
             }
         }*/
                 
    
       
           // empleado.agregar();
          
               
               /*out.println("<h1>Ingreso Exitoso</h1>");
               out.println("<a href ='index.jsp'>Regresar</a>");*/
  
            
            //out.println("<h1>Ingreso Exitoso</h1>");
            /* out.println("<p>" + request.getParameter("txt_nombres")+"</p>");
            out.println("<p>" + request.getParameter("txt_apellidos")+"</p>");
            out.println("<p>" + request.getParameter("txt_direccion")+"</p>");
            out.println("<p>" + request.getParameter("txt_telefono")+"</p>");
            out.println("<p>" + request.getParameter("txt_fn")+"</p>");
            out.println("<p>" + request.getParameter("drop_puesto")+"</p>");*/
            out.println("</body>");
            out.println("</html>");
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
