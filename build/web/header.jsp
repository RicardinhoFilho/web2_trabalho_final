<%-- 
    Document   : header
    Created on : 23 de ago de 2022, 11:26:54
    Author     : User
--%>
<%@ page import="com.beibe.model.Funcionario" %>
<%@ page import="com.beibe.model.Cliente" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<<<<<<< HEAD
=======

>>>>>>> 4105adb11b1ffff30b1035d7a880e5c25129dc4c
<nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-primary" id="sidenavAccordion">
    <!-- Sidenav Toggle Button-->
    <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle"><i data-feather="menu"></i></button>
    <!-- Navbar Brand-->
    <!-- * * Tip * * You can use text or an image for your navbar brand.-->
    <!-- * * * * * * When using an image, we recommend the SVG format.-->
    <!-- * * * * * * Dimensions: Maximum height: 32px, maximum width: 240px-->
    <a class="navbar-brand pe-3 ps-4 ps-lg-2" href="index.html">Beibe Beauty</a>
    <!-- Navbar Search Input-->
    <!-- * * Note: * * Visible only on and above the lg breakpoint-->
    <form class="form-inline me-auto d-none d-lg-block me-3">
        <div class="input-group input-group-joined input-group-solid">
            <input class="form-control pe-0" type="search" placeholder="Procurar" aria-label="Procurar" />
            <div class="input-group-text"><i data-feather="Procurar"></i></div>
        </div>
    </form>
    <!-- Navbar Items-->
   
        <!-- Messages Dropdown-->

        <!-- User Dropdown-->
        <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
            <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <c:choose>

                        <c:when test = "${sessionScope.funcionario != null}">

                            <% Funcionario funcionario= (Funcionario) session.getAttribute("funcionario"); %>
                                             <img class="img-fluid" src="https://ui-avatars.com/api/?name=<c:out value="${funcionario.nome}"/>" /></a>

                            </c:when>
                            <c:when test = "${sessionScope.cliente != null}">
                                <% Cliente cliente= (Cliente) session.getAttribute("cliente"); %>
                                                                             <img class="img-fluid" src="https://ui-avatars.com/api/?name=<c:out value="${cliente.nome}"/>" /></a>

                                </c:when>


                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>
            <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
                <h6 class="dropdown-header d-flex align-items-center">

                    <c:choose>

                        <c:when test = "${sessionScope.funcionario != null}">

                            <% Funcionario funcionario= (Funcionario) session.getAttribute("funcionario"); %>
                                <img class="dropdown-user-img" src="https://ui-avatars.com/api/?name=<c:out value="${funcionario.nome}"/>" />
                            <div class="dropdown-user-details">

                                <div class="dropdown-user-details-name"><c:out value="${funcionario.nome}"/></div>
                                <div class="dropdown-user-details-email"><c:out value="${funcionario.email}"/></div>
                            </c:when>
                            <c:when test = "${sessionScope.cliente != null}">
                                <% Cliente cliente= (Cliente) session.getAttribute("cliente"); %>
                                <img class="dropdown-user-img" src="https://ui-avatars.com/api/?name=<c:out value="${cliente.nome}"/>" />
                                <div class="dropdown-user-details">

                                    <div class="dropdown-user-details-name"><c:out value="${cliente.nome}"/></div>
                                    <div class="dropdown-user-details-email"><c:out value="${cliente.email}"/></div>
                                </c:when>


                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>

                        </div>
                </h6>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="Logout">
                    <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
                    Sair
                </a>
            </div>
        </li>
    </ul>
</nav>