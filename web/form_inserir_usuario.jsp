<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <link rel="icon" type="image/x-icon" href="imagens/favicon.png">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .footer {
            text-align: center;
            padding: 10px 0;
            background-color: #000000;
            color: white;
            font-size: 0.9rem;
            width: 100%;
            box-shadow: 0px -3px 5px #cbced1;
            position: fixed;
            bottom: 0;
            left: 0;
        }
        .container-padding {
            padding-bottom: 100px; /* Ajuste conforme necessário */
        }
    </style>
    <script language="javascript">
        function validaForm() {
            var formulario = document.form_usuario;
            if (formulario.nome.value == "") {
                alert("O Campo nome deve ser preenchido!!");
                formulario.nome.focus();
                return false;
            }
            if (formulario.login.value == "") {
                alert("O Campo login deve ser preenchido!!");
                formulario.login.focus();
                return false;
            }
            if (formulario.senha.value == "") {
                alert("O Campo senha deve ser preenchido!!");
                formulario.senha.focus();
                return false;
            }
            if (formulario.id_perfil.value == "") {
                alert("O Campo Perfil deve ser selecionado!!");
                formulario.id_perfil.focus();
                return false;
            }
            if (formulario.email.value == "") {
                alert("O Campo E-mail deve ser preenchido!!");
                formulario.email.focus();
                return false;
            }

            return true;
        }
    </script>
    <title>Inserir Usuário</title>
</head>
<body class="d-flex flex-column min-vh-100">
    <div class="container mt-3">
        <%@include file="menu.jsp" %>
    </div>
    <div class="container mt-3 container-padding">
        <h2 class="text-center">Inserir Usuário</h2>
        <form name="form_usuario" action="inserir_usuario.do" method="post" onsubmit="return validaForm();" class="needs-validation" novalidate>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="nome">Nome</label>
                        <input type="text" class="form-control" id="nome" name="nome" required>
                        <div class="invalid-feedback">Por favor, insira o nome.</div>
                    </div>
                    <div class="form-group">
                        <label for="login">Login</label>
                        <input type="text" class="form-control" id="login" name="login" required>
                        <div class="invalid-feedback">Por favor, insira o login.</div>
                    </div>
                    <div class="form-group">
                        <label for="senha">Senha</label>
                        <input type="password" class="form-control" id="senha" name="senha" required>
                        <div class="invalid-feedback">Por favor, insira a senha.</div>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" class="form-control" id="email" name="email" required>
                        <div class="invalid-feedback">Por favor, insira o email.</div>
                    </div>
                    <div class="form-group">
                        <label for="id_perfil">Perfil</label>
                        <select class="form-control" id="id_perfil" name="id_perfil" required>
                            <option value="">Escolha um Perfil</option>
                            <% 
                            try {
                                PerfilDAO pDB = new PerfilDAO();
                                pDB.conectar();
                                ArrayList<Perfil> lista = pDB.listar();
                                for (Perfil p : lista) {
                            %>
                            <option value="<%=p.getId()%>"><%=p.getPerfil()%></option>
                            <%
                                }
                                pDB.desconectar();
                            } catch (Exception e) {
                                out.print(e);
                            }
                            %>
                        </select>
                        <div class="invalid-feedback">Por favor, selecione um perfil.</div>
                    </div>
                    <button type="submit" class="btn btn-primary">Salvar</button>
                </div>
            </div>
        </form>
    </div>
    <div class="footer">
        &copy; 2024 Celular & Cia Reparos. Todos os direitos reservados.
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</body>
</html>
