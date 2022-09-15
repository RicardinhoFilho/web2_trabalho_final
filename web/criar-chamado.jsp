<%-- 
    Document   : criar-chamado
    Created on : 14 de set de 2022, 15:28:06
    Author     : User
--%>
<%@ page import="com.beibe.model.Produto" %>
<%@ page import ="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Beibe Beauty</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script
            data-search-pseudo-elements
            defer
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
            crossorigin="anonymous"
        ></script>
    </head>
    <body class="bg-gradient-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container-xl px-4">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <!-- Basic registration form-->
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header justify-content-center">
                                        <h3 class="fw-light my-4">Criar Chamado</h3>
                                    </div>
                                    <div class="card-body">
                                        <!-- Registration form-->
                                        <form method = "post"  action = "CriarChamado">
                                            <form>
                                                <!-- Form Row-->
                                                <div class="row gx-3">
                                                    <div class="col-md-6">
                                                        <!-- Form Group (first name)-->
                                                        <div class="mb-3">
                                                            <label class="small mb-1" for="titulo"
                                                                   >Titulo</label
                                                            >
                                                            <input
                                                                class="form-control"
                                                                id="titulo"
                                                                type="text"
                                                                placeholder="Digite o titulo"
                                                                name="titulo"
                                                                />
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Form Group (email address)            -->
                                                <div class="mb-3">
                                                    <label class="small mb-1" for="texto"
                                                           >Reclamação</label
                                                    >
                                                    <input
                                                        class="form-control"
                                                        id="texto"
                                                        type="text"
                                                        name="texto"
                                                        aria-describedby="emailHelp"
                                                        placeholder="Digite sua reclamação"
                                                        />
                                                </div>
                                                <!-- Form Row    -->
                                                <div class="row gx-3">
                                                    <div class="col-md-6">
                                                        <%  List<Produto> produtos= (List<Produto>) request.getAttribute("produtos"); 
                                         
                                                        %>
                                                        <c:out value="${produtos.size()}" />
                                                        <div class="mb-3">
                                                            <c:forEach var="item" items="${produtos}">
                                                                <label class="small mb-1" for="inputPassword">
                                                                    <c:out value="${item.nome}" /> <input type="radio" for="produto_<c:out value="${item.id}" />"
                                                                           id="produto_<c:out value="${item.id}" />"
                                                                           name="produto_id" value="<c:out value="${item.id}" />"
                                                                           /></label>


                                                            </c:forEach>



                                                        </div>
                                                         <button class="btn btn-primary" type="submit" >Criar</button>
                                                    </div>
                                                </div>
                                                <!-- Form Group (create account submit)-->
                                            </form>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer"></div>
        </div>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"
        ></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
