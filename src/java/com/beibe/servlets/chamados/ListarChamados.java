/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beibe.servlets.chamados;

import com.beibe.database.ConnectionDAO;
import com.beibe.database.DAO.DAOChamado;
import com.beibe.database.DAO.DAOFuncionario;
import com.beibe.database.DAO.DAOResposta;
import com.beibe.facade.ChamadoFacade;
import com.beibe.model.Chamado;
import com.beibe.model.Funcionario;
import com.beibe.utils.exceptions.chamadosExceptions.ListarChamadosException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import java.util.List;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "ListarChamados", urlPatterns = {"/ListarChamados"})
public class ListarChamados extends HttpServlet {

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

            HttpSession session = request.getSession(false);

            if (session != null) {
                Funcionario funcionario = (Funcionario) session.getAttribute("funcionario");
                if (funcionario != null) {
                    

                    request.setAttribute("chamados", ChamadoFacade.listarChamados());

                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/chamados.jsp");
                    rd.forward(request, response);

                }
            }

        } catch (ListarChamadosException e) {
            System.out.println(e);
            response.sendRedirect("login-funcionario.jsp");
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
