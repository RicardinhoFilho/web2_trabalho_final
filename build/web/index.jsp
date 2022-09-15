<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Beibe Beauty</title>
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
                    <jsp:include page="menu.jsp"/>
                    <c:import url="ListarPorCategoria"></c:import>

                    </nav>

                </div>
            <c:choose>
                <c:when test="${sessionScope.funcionario != null}">
                    <c:choose>
                        <c:when test="${sessionScope.funcionario.isAdmin()==false}">
                            <c:redirect url="ListarChamados"/>
                        </c:when>
                       
                       </c:choose> 



                                <div id="layoutSidenav_content">
                                    <div class="container-fluid">

                                        <div class="page-header-title"> <br></div>
                                        <div class="row page-header-title">

                                            <!-- Earnings (Monthly) Card Example -->
                                            <div class="col-xl-3 col-md-6 mb-4">
                                                <div class="card border-start-lg border-warning shadow h-100 py-2">
                                                    <div class="card-body">
                                                        <div class="row no-gutters align-items-center">
                                                            <div class="col mr-2">
                                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                                    Chamados em aberto</div>
                                                                <div class="h5 mb-0 font-weight-bold text-gray-800">

                                                                    <c:import url="Total"></c:import>   
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Earnings (Monthly) Card Example -->
                                                <div class="col-xl-3 col-md-6 mb-4">
                                                    <div class="card border-start-lg border-primary shadow h-100 py-2">
                                                        <div class="card-body">
                                                            <div class="row no-gutters align-items-center">
                                                                <div class="col mr-2">
                                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                                        Tempo médio de resolução</div>
                                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">

                                                                    <c:import url="Tempo"></c:import>H

                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <i class="fas  fa-clock fa-2x text-gray-300"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                                <!-- Earnings (Monthly) Card Example -->
                                                <div class="col-xl-3 col-md-6 mb-4">
                                                    <div class="card border-start-lg border-danger shadow h-100 py-2">
                                                        <div class="card-body">
                                                            <div class="row no-gutters align-items-center">
                                                                <div class="col mr-2">
                                                                    <div class="text-xs font-weight-bold text-danger text-uppercase mb-1"> Chamados atrasados
                                                                    </div>
                                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">

                                                                    <c:import url="Atrasado"></c:import>

                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <i class="fas fa-exclamation-triangle fa-2x text-gray-300"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Pending Requests Card Example -->
                                                <div class="col-xl-3 col-md-6 mb-4">
                                                    <div class="card border-start-lg border-success shadow h-100 py-2">
                                                        <div class="card-body">
                                                            <div class="row no-gutters align-items-center">
                                                                <div class="col mr-2">
                                                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                                        Chamados fechados hoje</div>
                                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">

                                                                    <c:import url="FechadosHoje"></c:import>

                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <i class="fas fa-comments fa-2x text-gray-300"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Styled timeline component-->
                                        <div class="container-fluid px-4">
                                            <h1>Chamados Por Categoria</h1>
                                            <div class="card">
                                                <div class="card-body">
                                                    <table id="datatablesSimple">
                                                        <thead>
                                                            <tr>
                                                                <th>Categoria</th>
                                                                <th>Total</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                        <c:forEach var="item" items="${chamados}">
                                                            <tr>
                                                                <td><c:out value="${item.titulo}" /></td>

                                                                <td><c:out value="${item.id}" /></td>

                                                            </tr>



                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    </c:when>
                                    <c:otherwise>
                                        <c:redirect url="MeusChamados" />
                                    </c:otherwise>

                                    </c:choose>     

                                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
                                    <script src="js/scripts.js"></script>
                                    </body>
                                    </html>
