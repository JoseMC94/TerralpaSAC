package com.freesoftDevPeru.Controllers;

import com.freesoftDevPeru.Clases.Cliente;
import com.freesoftDevPeru.Clases.Documento;
import com.freesoftDevPeru.Clases.Usuario;
import com.freesoftDevPeru.Dao.DaoDocumento;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author José Maldonado <josephcand at gmail.com>
 */
public class contrlBuscarDocumento extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");// recibir tildes y ñs
            PrintWriter out = response.getWriter();
            String nombreProyecto = request.getParameter("inputBuscar");
            DaoDocumento doc = new DaoDocumento();
            LinkedList listaAtributosDocumentoBuscar = doc.DocumentoBuscar(nombreProyecto);
//        para el documento
            Documento documento = (Documento) listaAtributosDocumentoBuscar.get(0);
            Cliente cliente = (Cliente) listaAtributosDocumentoBuscar.get(1);
            Usuario usuario = (Usuario) listaAtributosDocumentoBuscar.get(2);

            request.getSession().setAttribute("miDocumentoEncontrado", documento);
            request.getSession().setAttribute("miCliente", cliente);
            request.getSession().setAttribute("miUsuarioDoc", usuario);

            response.sendRedirect("webs/DocumentoEncontrado.jsp");
//            RequestDispatcher d = request.getRequestDispatcher("webs/DocumentoEncontrado.jsp");
//            d.include(request, response);
        } catch (ClassNotFoundException ex) {
            response.sendRedirect("webs/Error.jsp");
        } catch (SQLException ex) {
           response.sendRedirect("webs/Error.jsp");
        } catch(IndexOutOfBoundsException b){
            response.sendRedirect("webs/Error.jsp");
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
