/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beibe.servlets.GeradorRelatorio;

import com.beibe.database.ConnectionDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author Felipe
 */
@WebServlet(name = "GeradorRelatorio", urlPatterns = {"/GeradorRelatorio"})
public class GeradorRelatorio extends HttpServlet {

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
            throws ServletException, IOException, Exception {

                try {
                    ConnectionDAO factory = (ConnectionDAO) new ConnectionDAO();
                    // Host onde o servlet esta executando
                    String host = "http://" + request.getServerName() + ":" + request.getServerPort();
                    // Caminho contextualizado do relatório compilado
                    Integer id = Integer.parseInt(request.getParameter("id"));
                    String jasper = request.getContextPath() + "";
                    switch (id) {
                        case 1:
                            jasper = request.getContextPath() + "/funcionarios.jasper";
                            break;
                        case 2:
                            jasper = request.getContextPath() + "/produtos.jasper";
                            break;
                        case 3:
                            jasper = request.getContextPath() + "/atendimentos_desc.jasper";
                            break;
                        case 4:
                            jasper = request.getContextPath() + "/atendimentos_cresc.jasper";
                            break;
                        case 5:
                            jasper = request.getContextPath() + "/reclamacoes_totais.jasper";
                            break;
                        case 6:
                            jasper = request.getContextPath() + "/reclamacoes_em_aberto.jasper";
                            break;
                        case 7:
                            jasper = request.getContextPath() + "/reclamacoes_fechadas.jasper";
                            break;
                        default:
                            break;
                    }
                    // URL para acesso ao relatório
                    URL jasperURL = new URL(host + jasper);        
                    // Parâmetros do relatório
                    HashMap params = new HashMap();
                    // Geração do relatório
                    byte[] bytes = JasperRunManager.runReportToPdf(jasperURL.openStream(), params, factory.conectaDB());
                    if(bytes != null) {
                        System.out.println("oi");
                        // A página será mostrada em PDF
                        response.setContentType("application/pdf");
                        // Envia o PDF para o Cliente
                        OutputStream ops= response.getOutputStream();
                        ops.write(bytes);
                   }
               }
               catch (Exception e) {
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(GeradorRelatorio.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(GeradorRelatorio.class.getName()).log(Level.SEVERE, null, ex);
        }
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