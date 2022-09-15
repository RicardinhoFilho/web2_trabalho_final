<%-- 
    Document   : menu
    Created on : 23 de ago de 2022, 10:18:15
    Author     : User
--%>
<%@ page import="com.beibe.model.Funcionario" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="sidenav-menu">

    <div class="nav accordion" id="accordionSidenav">
        <!-- Sidenav Menu Heading (Account)-->
        <!-- * * Note: * * Visible only on and above the sm breakpoint-->
        <div class="sidenav-menu-heading d-sm-none">Account</div>
        <!-- Sidenav Link (Alerts)-->
        <!-- * * Note: * * Visible only on and above the sm breakpoint-->
        <a class="nav-link d-sm-none" href="#!">
            <div class="nav-link-icon"><i data-feather="bell"></i></div>
            Alerts
            <span class="badge bg-warning-soft text-warning ms-auto">4 novos!</span>
        </a>

        <!-- Sidenav Menu Heading (Core)-->
        <div class="sidenav-menu-heading">Menu</div>
        <!-- Sidenav Accordion (Dashboard)-->

        <c:choose>
            <c:when test="${sessionScope.funcionario != null}">
                <c:if test="${sessionScope.funcionario.isAdmin()}">
                    <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseDashboards" aria-expanded="false" aria-controls="collapseDashboards">
                        <div class="nav-link-icon"><i data-feather="activity"></i></div>
                        Administrador
                        <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseDashboards" data-bs-parent="#accordionSidenav">
                        <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPages">
                            <a class="nav-link" href="index.jsp">Métricas</a>
                            <a class="nav-link" href="ListarFuncionarios">Listar usuários</a>
                            <a class="nav-link" href="usuarios.html">Cadastrar usuários</a>
                            <a class="nav-link" href="ListarChamados">Chamados</a>
                            <a class="nav-link" href="ListaProdutos">Listar produtos</a>
                            <a class="nav-link" href="ListaCategorias">Listar categorias</a>
                            <a class="nav-link" href="relatorios.jsp">Relatórios</a>
                        </nav>
                    </div>
                </c:if>


                <c:if test="${funcionario.isAdmin() == false}">
                    <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapsess" aria-expanded="false" aria-controls="collapseDashboards">
                        <div class="nav-link-icon"><i data-feather="activity"></i></div>
                        Funcionários
                        <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsess" data-bs-parent="#accordionSidenavs">
                        <nav class="sidenav-menu-nested nav accordion" id="accordions">
                            <a class="nav-link" href="ListarChamados">Chamados</a>
                            <a class="nav-link" href="ListaProdutos">Listar produtos</a>
                            <a class="nav-link" href="ListaCategorias">Listar categorias</a>
                        </nav>
                    </div>
                </c:if>



            </c:when> 
            <c:otherwise>
                <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapse" aria-expanded="false" aria-controls="collapseDashboards">
                    <div class="nav-link-icon"><i data-feather="activity"></i></div>
                    Cliente
                    <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapse" data-bs-parent="#accordionSidenav">
                    <nav class="sidenav-menu-nested nav accordion" id="accordion">
                        <a class="nav-link" href="MeusChamados">Meus chamados</a>
                        <a class="nav-link" href="alterar-cadastro-cliente.jsp">Alterar cadastro</a>
                    </nav>
                </div>


            </c:otherwise>

        </c:choose>




        <!-- Sidenav Heading (Custom)-->
    </div>
</div>
