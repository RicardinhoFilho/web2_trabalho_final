<%-- 
    Document   : login-funcionario
    Created on : 23 de ago de 2022, 09:15:41
    Author     : User
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
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-gradient-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container-xl px-4">
                        <div class="row justify-content-center">
                            <div class="col-xl-10 col-lg-12 col-md-9">

                                <div class="card o-hidden border-0 shadow-lg my-5">
                                    <div class="card-body p-0">
                                        <!-- Nested Row within Card Body -->
                                        <div class="row">
                                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                                            <div class="col-lg-6">
                                                <div class="p-5">
                                                    <!-- Basic login form-->
                                                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                                                        <div class="card-header justify-content-center"><h3 class="fw-light my-4">Bem vindo novamente!</h3></div>
                                                        <div class="card-body">
                                                            <!-- Login form-->
                                                            <form method = "post"  action = "LoginFuncionario">
                                                                <!-- Form Group (email address)-->
                                                                <div class="mb-3">
                                                                    <label class="small mb-1" for="inputEmailAddress"  >Email</label>
                                                                    <input class="form-control" id="inputEmailAddress" name="email" type="email" placeholder="Digite seu e-mail" />
                                                                </div>
                                                                <!-- Form Group (password)-->
                                                                <div class="mb-3">
                                                                    <label class="small mb-1" for="inputPassword">Senha</label>
                                                                    <input class="form-control" id="inputPassword" name="senha" type="password" placeholder="Digite sua senha" />
                                                                </div>
                                                                <!-- Form Group (remember password checkbox)-->
                                                                <div class="mb-3">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" id="rememberPasswordCheck" type="checkbox" value="" />
                                                                        <label class="form-check-label" for="rememberPasswordCheck">Lembre-me</label>
                                                                    </div>
                                                                </div>
                                                                <!-- Form Group (login box)-->
                                                                <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                                    <a class="small" href="redefinirSenha.html">Esqueceu sua senha?</a>
                                                                    <button class="btn btn-primary" type="submit" >Entrar</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <div class="card-footer text-center">
                                                            <div class="small"><a href="cadastroSimples.html">Criar uma conta</a></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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

