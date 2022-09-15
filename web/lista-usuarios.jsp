<%-- 
    Document   : lista-usuarios
    Created on : 31 de ago de 2022, 16:39:08
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.beibe.model.Funcionario" %>
<%@ page import ="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Beibe Beauty</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="nav-fixed">
        <jsp:include page="header.jsp"/>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sidenav shadow-right sidenav-light">
                    <div class="sidenav-menu">
                        <div class="nav accordion" id="accordionSidenav">
                            <!-- Sidenav Menu Heading (Core)-->
                            <jsp:include page="menu.jsp"/>
                        </div>

                    </div>
                </nav>

                    </h6>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="login.html">
                        <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
                        Sair
                    </a>
                </div>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sidenav shadow-right sidenav-light">
                <jsp:include page="menu.jsp"/>
            </nav>


            </div>
            <div id="layoutSidenav_content">
                <main>
                    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-fluid px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="user"></i></div>
                                            Usuários
                                        </h1>
                                    </div>
                                    <div class="col-12 col-xl-auto mb-3">
                                        <a class="btn btn-sm btn-light text-primary" href="cadastrar-funcionario.jsp">
                                            <i class="me-1" data-feather="user-plus"></i>
                                            Cadastrar usuário
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-fluid px-4">
                        <div class="card">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Nome</th>
                                            <th>Email</th>
                                            <th>Groups</th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            
                                            
                                            

                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>User</th>
                                            <th>Email</th>
                                            <th>Cargos</th>
                                        </tr>
                                    </tfoot>
                                    <%  List<Funcionario> funcionarios= (List<Funcionario>) request.getAttribute("funcionarios"); 
                                         
                                    %>

                                    <tbody>
                                        <c:forEach var="item" items="${funcionarios}">
                                            <tr>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <div class="avatar me-2"><img class="avatar-img img-fluid" src="https://ui-avatars.com/api/?name=<c:out value="${item.nome}"/>" /></div>
                                                            <c:out value="${item.nome}" />   <c:out value="${item.sobrenome}" />
                                                    </div>
                                                </td>
                                                <td> <c:out value="${item.email}" /></td>
                                                <td>
                                                    <span class="badge bg-green-soft text-green"> 
                                                        <c:choose>

                                                            <c:when test = "${item.isAdmin() == true}">
                                                                Administrador
                                                            </c:when>



                                                            <c:otherwise>
                                                                Atendente
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </span>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables/datatables-simple-demo.js"></script>
    </body>
</html>
