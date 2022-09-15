/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beibe.servlets.chamados;

import com.beibe.database.ConnectionDAO;
import com.beibe.database.DAO.DAOChamado;
import com.beibe.database.DAO.DAOResposta;
import com.beibe.facade.ChamadoFacade;
import com.beibe.model.Cliente;
import com.beibe.model.Funcionario;
import com.beibe.model.Resposta;
import com.beibe.utils.exceptions.chamadosExceptions.AtualizarChamadoException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "FinalizarChamado", urlPatterns = {"/FinalizarChamado"})
public class FinalizarChamado extends HttpServlet {

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
        try {

            Integer id = Integer.parseInt(request.getParameter("id"));

            

            HttpSession session = request.getSession(false);
            Funcionario funcionario = (Funcionario) session.getAttribute("funcionario");
              Cliente cliente = (Cliente) session.getAttribute("cliente");

            if (funcionario != null || cliente != null) {
                
                ChamadoFacade.finalizarChamado(id);
                if(cliente!=null){
                    response.sendRedirect("MeusChamados");
                    return;
                }
                
            }

            response.sendRedirect("ListarChamados");
            return;

        } catch (AtualizarChamadoException e) {
             request.setAttribute("msg", e.getMessage());
           request.getRequestDispatcher("erro.jsp").forward(request, response);
            return;
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
