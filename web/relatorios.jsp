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
        <ul class="navbar-nav align-items-center ms-auto">
            <!-- Documentation Dropdown-->
            <!-- Navbar Search Dropdown-->
            <!-- * * Note: * * Visible only below the lg breakpoint-->
            <li class="nav-item dropdown no-caret me-3 d-lg-none">
                <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="searchDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="search"></i></a>
                <!-- Dropdown - Search-->
                <div class="dropdown-menu dropdown-menu-end p-3 shadow animated--fade-in-up" aria-labelledby="searchDropdown">
                    <form class="form-inline me-auto w-100">
                        <div class="input-group input-group-joined input-group-solid">
                            <input class="form-control pe-0" type="text" placeholder="Procurar por..." aria-label="Search" aria-describedby="basic-addon2" />
                            <div class="input-group-text"><i data-feather="Procurar"></i></div>
                        </div>
                    </form>
                </div>
            </li>
            <!-- User Dropdown-->
            <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
                <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class="img-fluid" src="assets/img/illustrations/profiles/profile-1.png" /></a>
                <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
                    <h6 class="dropdown-header d-flex align-items-center">
                        <img class="dropdown-user-img" src="assets/img/illustrations/profiles/profile-1.png" />
                        <div class="dropdown-user-details">
                            <div class="dropdown-user-details-name">Valerie Luna</div>
                            <div class="dropdown-user-details-email">vluna@aol.com</div>
                        </div>
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
                <div class="sidenav-menu">
                    <div class="nav accordion" id="accordionSidenav">
                        <!-- Sidenav Menu Heading (Account)-->
                        <!-- * * Note: * * Visible only on and above the sm breakpoint-->
                        <div class="sidenav-menu-heading d-sm-none">Account</div>
                        <!-- Sidenav Link (Alerts)-->
                        <!-- Sidenav Menu Heading (Core)-->
                        <div class="sidenav-menu-heading">Menu</div>
                        <!-- Sidenav Accordion (Dashboard)-->
                        <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseDashboards" aria-expanded="false" aria-controls="collapseDashboards">
                            <div class="nav-link-icon"><i data-feather="activity"></i></div>
                            Administrador
                            <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseDashboards" data-bs-parent="#accordionSidenav">
                            <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPages">
                                <a class="nav-link" href="index.html">Métricas</a>
                                <a class="nav-link" href="listarUsu.html">Listar usuários</a>
                                <a class="nav-link" href="usuarios.html">Cadastrar usuários</a>
                                <a class="nav-link" href="produtos.html">Listar produtos</a>
                                <a class="nav-link" href="categorias.html">Listar categorias</a>
                                <a class="nav-link" href="relatorios.html">Relatórios</a>
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