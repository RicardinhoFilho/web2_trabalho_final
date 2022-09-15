<%-- 
    Document   : chamados
    Created on : 24 de ago de 2022, 16:38:49
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.beibe.model.Chamado" %>
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
                            <div class="sidenav-menu-heading d-sm-none">Account</div>
                            <!-- Sidenav Link (Alerts)-->
                            <!-- * * Note: * * Visible only on and above the sm breakpoint-->
                            <a class="nav-link d-sm-none" href="#!">
                                <div class="nav-link-icon"><i data-feather="bell"></i></div>
                                Alerts
                                <span class="badge bg-warning-soft text-warning ms-auto">4 novos!</span>
                            </a>

                            <!-- Sidenav Menu Heading (Core)-->

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
                <div class="container-fluid">

                    <div class="page-header-title"> <br></div>
                    <div class="row page-header-title">

                    </div>
                </div>
                <!-- Styled timeline component-->
                <div id="timelineStyled">
                    <div class="card mb-4">
                        <c:choose>
                            <c:when test="${sessionScope.cliente != null}">
                                <a class="text-warning" href="HelperNovoChamado">

                                    <div class="card-header"> Criar Chamado</div></a>                            </c:when>
                                <c:otherwise>
                                <div class="card-header">Novos chamados</div>
                            </c:otherwise>
                        </c:choose>

                        <div class="card-body">
                            <!-- Component Preview-->
                            <div class="sbp-preview">
                                <div class="sbp-preview-content">
                                    <div class="timeline">
                                        <%  List<Chamado> chamados= (List<Chamado>) request.getAttribute("chamados");%>

                                        <c:forEach var="item" items="${chamados}">


                                            <div class="timeline-item">
                                                <div class="timeline-item-marker">
                                                    <div class="timeline-item-marker-text"> <c:out value="${item.criacao}" /> </div>
                                                    <div class="timeline-item-marker-indicator bg-warning-soft text-warning"><i data-feather="plus"></i></div>
                                                </div>
                                                <div class="timeline-item-content pt-0">
                                                    <div class="card shadow-sm">
                                                        <div class="card-body">
                                                            <c:choose>
                                                                <c:when test="${item.finalizado == null}">
                                                                    <h5 ><a class="text-warning" href="alerts.html" data-bs-toggle="modal" data-bs-target="#teste<c:out value="${item.id}" />"><c:out value="${item.cliente.nome}" /> - <c:out value="${item.titulo}" /> - Chamado #<c:out value="${item.id}" /></a></h5>

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <h5 ><a class="text-success" href="alerts.html" data-bs-toggle="modal" data-bs-target="#teste<c:out value="${item.id}" />"><c:out value="${item.cliente.nome}" /> - <c:out value="${item.titulo}" /> - Chamado #<c:out value="${item.id}" /></a></h5>

                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:out value="${item.texto}" />                                                   </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- MODAL -->

                                            <div class="modal fade" id="teste<c:out value="${item.id}" />" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" style="display: none;" aria-hidden="true">
                                                <div class="modal-dialog modal-xl" role="document">
                                                    <div class="modal-content">
                                                        <div class="mb-4">
                                                            <!-- Dashboard activity timeline example-->
                                                            <div class="card card-header-actions">
                                                                <div class="card-header">
                                                                    <c:out value="${item.cliente.nome}" />  -  <c:out value="${item.titulo}" />  - Chamado #<c:out value="${item.id}" />"
                                                                    <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <c:choose>
                                                                    <c:when test="${item.repostas.size()>= 0}">
                                                                        <div class="card-body">
                                                                            <div class="timeline timeline-xs">
                                                                                <div class="timeline-item">
                                                                                    <div class="timeline-item-marker">
                                                                                        <div class="timeline-item-marker-text"><c:out value="${item2.criacao}"/></div>

                                                                                        <div class="timeline-item-marker-indicator bg-purple"></div>

                                                                                    </div>
                                                                                    <div class="timeline-item-content">
                                                                                        <c:out value="${item.cliente.nome}"/> -    <c:out value="${item.texto}"/>
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <c:forEach var="item2" items="${item.repostas}">




                                                                            <div class="card-body">
                                                                                <div class="timeline timeline-xs">
                                                                                    <!-- Timeline Item 1-->

                                                                                    <div class="timeline timeline-xs">
                                                                                        <!-- Timeline Item 1-->
                                                                                        <div class="timeline-item">
                                                                                            <div class="timeline-item-marker">
                                                                                                <div class="timeline-item-marker-text">                                                                                                <div class="timeline-item-marker-text"><c:out value="${item2.criacao}"/></div>
                                                                                                </div>
                                                                                                <c:choose>
                                                                                                    <c:when test="${item2.funcionario != null}">
                                                                                                        <div class="timeline-item-marker-indicator bg-green"></div>
                                                                                                    </c:when>
                                                                                                    <c:otherwise>
                                                                                                        <div class="timeline-item-marker-indicator bg-purple"></div>
                                                                                                    </c:otherwise>
                                                                                                </c:choose>
                                                                                            </div>
                                                                                            <div class="timeline-item-content">
                                                                                                <c:out value="${item2.funcionario!=null?item2.funcionario.nome: item.cliente.nome}"/>: <c:out value="${item2.texto}"/>
                                                                                            </div>
                                                                                        </div>










                                                                                    </div>
                                                                                </div>

                                                                            </div>




                                                                        </c:forEach>
                                                                        <c:choose>
                                                                            <c:when test="${item.finalizado != null}">

                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <div class="card-header">
                                                                                    Interagir no chamado
                                                                                </div>
                                                                                <form action="CriarResposta?id=<c:out value="${item.id}"/>" method = "post" >
                                                                                    <div class="card-body"><textarea  name="texto" class="lh-base form-control" type="text" placeholder="Escreva..." rows="2"></textarea></div>
                                                                                    <div class="d-grid"></div>
                                                                                    <div class="modal-footer">
                                                                                        <a class="btn btn-danger"  href="FinalizarChamado?id=<c:out value="${item.id}"/>">Finalizar chamado</a>                                                                                <button class="fw-100 btn btn-primary" type="submit">Enviar interação</button>
                                                                                    </div>
                                                                                </form>
                                                                            </c:otherwise>
                                                                        </c:choose>     

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>    </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div></div>
                                            </c:otherwise>
                                        </c:choose>




                                    </c:forEach>











                                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
                                    <script src="js/scripts.js"></script>
                                    </body>
                                    </html>
