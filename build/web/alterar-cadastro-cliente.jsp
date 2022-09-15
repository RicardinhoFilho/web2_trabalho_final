<%-- 
    Document   : alterar-cadastro-cliente
    Created on : 15 de set de 2022, 09:47:18
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.beibe.model.Cliente" %>

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
    <body class="bg-gradient-primary">
        <div id="layoutAuthentication">
            <% Cliente cliente= (Cliente) session.getAttribute("cliente"); %>
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container-xl px-4">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <!-- Basic registration form-->
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header justify-content-center"><h3 class="fw-light my-4">Cadastrar-se</h3></div>
                                    <div class="card-body">
                                        <!-- Registration form-->
                                        <form  method = "post"  action = "EditarCliente">
                                            <!-- Form Row-->
                                            <div class="row gx-3">
                                                <div class="col-md-6">
                                                    <!-- Form Group (first name)-->
                                                    <div class="mb-3">
                                                        <label class="small mb-1" for="inputFirstName">Nome</label>
                                                        <input class="form-control" id="inputFirstName" type="text" placeholder="Digite seu nome" name="nome" value="<c:out value="${cliente.nome}"/>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <!-- Form Group (last name)-->
                                                    <div class="mb-3">
                                                        <label class="small mb-1" for="inputLastName">Sobrenome</label>
                                                        <input class="form-control" id="inputLastName" type="text" placeholder="Digite seu sobrenome" name="sobrenome"  value="<c:out value="${cliente.sobrenome}"/>" />
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Form Group (email address)            -->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">Email</label>
                                                <input class="form-control" name="email" id="inputEmailAddress" type="email" aria-describedby="emailHelp" placeholder="Digite seu email"  value="~<c:out value="${cliente.email}"/>" />
                                            </div>
                                            <!-- Form Row    -->
                                            <div class="row gx-3">
                                                <div class="col-md-6">
                                                    <!-- Form Group (password)-->
                                                    <div class="mb-3">
                                                        <label class="small mb-1" for="inputPassword">Senha</label>
                                                        <input class="form-control" name="senha" id="inputPassword" type="password" placeholder="Digite sua senha"  value="<c:out value="${cliente.senha}"/>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <!-- Form Group (confirm password)-->
                                                    <div class="mb-3">
                                                        <label class="small mb-1" for="inputConfirmPassword">Confirmar senha</label>
                                                        <input class="form-control" id="inputConfirmPassword" type="password" placeholder="Repita sua senha" value="<c:out value="${cliente.senha}"/>"  />
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Form Group (create account submit)-->
                                            <button type="submit" class="btn btn-primary btn-block" >Editar</button>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="login.html">Já tem uma conta? Entre!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>