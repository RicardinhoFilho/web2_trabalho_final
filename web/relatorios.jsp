<%-- 
    Document   : relatorios
    Created on : 14 de set de 2022, 20:48:15
    Author     : Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                        
                        <!-- Sidenav Accordion (Dashboard)-->
                           <jsp:include page="menu.jsp"/>
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
                                            <div class="page-header-icon"><i data-feather="list"></i></div>
                                            Relatórios
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-fluid px-4">
                        <div class="card">
                            <div class="card-body">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td><a href="GeradorRelatorio?id=1">Funcionários Cadastrados</a></td>
                                            <td>
                                                <a class="btn btn-datatable btn-icon btn-transparent-dark me-2"><i data-feather="download"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><a href="GeradorRelatorio?id=2">3 Produtos Mais Reclamados</a></td>
                                            <td>
                                                <a class="btn btn-datatable btn-icon btn-transparent-dark me-2"><i data-feather="download"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><a href="GeradorRelatorio?id=3">Atendimentos em Aberto Antigos</a></td>
                                            <td>
                                                <a class="btn btn-datatable btn-icon btn-transparent-dark me-2"><i data-feather="download"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><a href="GeradorRelatorio?id=4">Atendimentos em Aberto Recentes</a></td>
                                            <td>
                                                <a class="btn btn-datatable btn-icon btn-transparent-dark me-2"><i data-feather="download"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><a href="GeradorRelatorio?id=5">Reclamações (Todas)</a></td>
                                            <td>
                                                <a class="btn btn-datatable btn-icon btn-transparent-dark me-2"><i data-feather="download"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><a href="GeradorRelatorio?id=6">Reclamações (Em Aberto)</a></td>
                                            <td>
                                                <a class="btn btn-datatable btn-icon btn-transparent-dark me-2"><i data-feather="download"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><a href="GeradorRelatorio?id=7">Reclamações (Fechadas)</a></td>
                                            <td>
                                                <a class="btn btn-datatable btn-icon btn-transparent-dark me-2"><i data-feather="download"></i></a>
                                            </td>
                                        </tr>
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