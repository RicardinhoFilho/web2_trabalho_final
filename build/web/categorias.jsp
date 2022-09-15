<%-- 
    Document   : categorias
    Created on : 30 de ago de 2022, 10:27:04
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.beibe.model.Categoria" %>
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
        <title>Groups List - SB Admin Pro</title>
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
                            <!-- Sidenav Menu Heading (Account)-->
                            <!-- * * Note: * * Visible only on and above the sm breakpoint-->
                            <div id="layoutSidenav_nav">
                                <nav class="sidenav shadow-right sidenav-light">
                                    <jsp:include page="menu.jsp"/>

                                </nav>

                            </div>

                            <!-- Sidenav Heading (Custom)-->
                        </div>
                    </div>
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
                                            <div class="page-header-icon"><i data-feather="box"></i></div>
                                            Categorias
                                        </h1>
                                    </div>
                                    <div class="col-12 col-xl-auto mb-3">
                                        <button class="btn btn-sm btn-light text-primary" type="button" data-bs-toggle="modal" data-bs-target="#createGroupModal">
                                            <i class="me-1" data-feather="plus"></i>
                                            Cadastrar nova categoria
                                        </button>
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
                                            <th>Nome da categoria</th>
                                            <th>Data de criação</th>
                                            <th>Ações</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Nome da categoria</th>
                                            <th>Data de criação</th>
                                            <th>Ações</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%  List<Categoria> categorias= (List<Categoria>) request.getAttribute("categorias"); 

                                         
                                        %>

                                        <c:forEach var="item" items="${categorias}">
                                            <tr>
                                                <td><c:out value="${item.nome}" /></td>

                                                 <td><c:out value="${item.created_at}" /></td>
                                                <td>
                                                    <button class="btn btn-datatable btn-icon btn-transparent-dark me-2" type="button" data-bs-toggle="modal" data-bs-target="#editGroupModal<c:out value="${item.id}"/>">EDITAR</button>
                                                    <a class="btn btn-datatable btn-icon btn-transparent-dark" href="ExcluirCategoria?id=<c:out value="${item.id}"/>">EXCLUIR</a>
                                                </td>
                                            </tr>

                                            <!-- Edit group modal-->
                                        <div class="modal fade" id="editGroupModal<c:out value="${item.id}" />" tabindex="-1" role="dialog" aria-labelledby="editGroupModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="editGroupModalLabel">Editar categoria</h5>
                                                        <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="EditarCategoria?id=<c:out value="${item.id}" />" method="post" >
                                                            <div class="mb-0">
                                                                <label class="mb-1 small text-muted" for="formGroupName">Nome da categoria: </label>
                                                                <input name="nome" class="form-control" id="formGroupName" type="text" value="<c:out value="${item.nome}" />" placeholder="Digite o nome da categoria" />
                                                            </div>
                                                             <div class="modal-footer">
                                                        <button class="btn btn-danger-soft text-danger" type="button" data-bs-dismiss="modal">Cancelar</button>
                                                        <button class="btn btn-primary-soft text-light" type="submit">Salvar</button>
                                                    </div>
                                                        </form>
                                                    </div>
                                                   
                                                </div>
                                            </div>
                                        </div>

                                    </c:forEach>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- Create group modal-->
                    <div class="modal fade" id="createGroupModal" tabindex="-1" role="dialog" aria-labelledby="createGroupModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="createGroupModalLabel">Cadastrar categoria</h5>
                                    <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="CriarCategoria" method="post">
                                        <div class="mb-0">
                                            <label class="mb-1 small text-muted" for="formGroupName">Nome da categoria: </label>
                                            <input class="form-control" id="formNomeProduto" name="nome" type="text" placeholder="Digite o nome da categoria" />
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-danger-soft text-danger" type="button" data-bs-dismiss="modal">Cancel</button>
                                            <button class="btn btn-primary-soft text-primary" type="submit">Cadastrar categoria</button>
                                        </div>
                                    </form>
                                </div>

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
