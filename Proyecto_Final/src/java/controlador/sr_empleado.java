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
import modelo.Empleado;

/**
 *
 * @author Bomiki
 */
public class sr_empleado extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     Empleado empleado;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_empleado</title>");
            out.println("</head>");
            out.println("<body>");
            
            empleado = new Empleado(Integer.parseInt(request.getParameter("txt_id")),Integer.parseInt(request.getParameter("drop_puesto")),request.getParameter("txt_nombres"),request.getParameter("txt_apellidos"),request.getParameter("txt_direccion"),request.getParameter("txt_telefono"),Integer.parseInt(request.getParameter("txt_genero")),request.getParameter("txt_dpi"),request.getParameter("txt_fn"),request.getParameter("txt_fe_inicio"),request.getParameter("txt_fe_ingreso"));
            
            if ("agregar".equals(request.getParameter("btn_agregar"))) {
                 if (empleado.agregar() > 0) {
                 request.getRequestDispatcher("index.jsp").forward(request, response);
             } else {
                 response.getWriter().write("error");
                 request.getRequestDispatcher("index.jsp").forward(request, response);
             }
         }
            if ("modificar".equals(request.getParameter("btn_modificar"))) {
                 if (empleado.modificar()> 0) {
                  request.setAttribute("mensaje", "Empleado agregado exitosamente");
                 request.getRequestDispatcher("index.jsp").forward(request, response);
             } else {
                 response.getWriter().write("error");
                 request.getRequestDispatcher("index.jsp").forward(request, response);
             }
         }
                    if ("eliminar".equals(request.getParameter("btn_eliminar"))) {
             try {
                 System.out.println("ID del empleado a eliminar: " + request.getParameter("txt_id"));
                 if (empleado.eliminar() > 0) {
                     System.out.println("El empleado fue eliminado correctamente.");
                     request.setAttribute("mensaje", "Empleado eliminado exitosamente.");
                     request.getRequestDispatcher("index.jsp").forward(request, response);
                 } else {
                     System.out.println("Error al intentar eliminar el empleado.");
                     request.setAttribute("mensaje", "Error al eliminar el empleado.");
                     request.getRequestDispatcher("index.jsp").forward(request, response);
                 }
             } catch (ServletException | IOException e) {
                 System.out.println("Error al procesar la solicitud de eliminación: " + e.getMessage());
                 response.getWriter().write("Error: " + e.getMessage());
             }
         }


            
            
                /*if ("agregar".equals(request.getParameter("btn_agregar"))) {
                 if (empleado.agregar()> 0) {
                  request.setAttribute("mensaje", "Empleado agregado exitosamente");
                 request.getRequestDispatcher("index.jsp").forward(request, response);
             } else {
                 response.getWriter().write("error"); // Devolver 'error' si hubo un problema
             }
         }*/
                
                            /*if ("agregar".equals(request.getParameter("btn_agregar"))) {
                if (empleado.agregar() > 0) {
                    request.setAttribute("mensaje", "Empleado agregado exitosamente");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensaje", "Error al agregar el empleado. Por favor revisa la consola para más detalles.");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
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
    }// <//*editor-fold>*/
}

