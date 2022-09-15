/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beibe.servlets.chamados;

import com.beibe.facade.ChamadoFacade;
import com.beibe.model.Funcionario;
import com.beibe.model.Resposta;
import com.beibe.utils.exceptions.chamadosExceptions.CriarRespostaException;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebServlet(name = "CriarResposta", urlPatterns = {"/CriarResposta"})
public class CriarResposta extends HttpServlet {

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
            String texto = request.getParameter("texto");
            Integer id = Integer.parseInt(request.getParameter("id"));

            HttpSession session = request.getSession(false);
            Funcionario funcionario = (Funcionario) session.getAttribute("funcionario");
            Resposta resposta = new Resposta();
            resposta.setId(id);
            resposta.setTexto(texto);
            if (funcionario != null) {
                resposta.setFuncionario(funcionario);
            }
            System.out.println("ESSA É A RESPOSTA: " + resposta.getTexto());
            ChamadoFacade.criarResposta(resposta);

            if (funcionario != null) {
                response.sendRedirect("ListarChamados");
                return;
            }
            response.sendRedirect("MeusChamados");

        } catch (CriarRespostaException e) {
            System.out.println(e);
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
