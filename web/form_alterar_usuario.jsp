<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <link rel="icon" type="image/x-icon" href="imagens/favicon.png">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Alterar Usuário</title>
  
    <script>
        function validaForm(){
            var formulario = document.form_usuario;
            if(formulario.id_perfil.value==""){
                alert("O Campo Perfil deve ser selecionado!!");
                formulario.id_perfil.focus();
                return false;
            }
            if(formulario.nome.value==""){
                alert("O Campo Nome deve ser preenchido!!");
                formulario.nome.focus();
                return false;
            }
            if(formulario.login.value==""){
                alert("O Campo Login deve ser preenchido!!");
                formulario.login.focus();
                return false;
            }
            if(formulario.senha.value==""){
                alert("O Campo Senha deve ser preenchido!!");
                formulario.senha.focus();
                return false;
            } 
            if(formulario.email.value==""){
                alert("O Campo E-mail deve ser preenchido!!");
                formulario.email.focus();
                return false;
            }
            return true;
        }
    </script>
    <style>
        .footer {
            text-align: center;
            padding: 10px 0;
            background-color: #000000;
            color: white;
            font-size: 0.9rem;
            width: 100%;
            box-shadow: 0px -3px 5px #cbced1;
        }
        .container-padding {
            padding-bottom: 100px; /* Add enough padding to make space for the footer */
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">
    <div class="container mt-3">
        <%@include file="menu.jsp" %>
    </div>
    <div class="container mt-3 container-padding">
        <h2 class="text-center">Alterar Usuário</h2>
        <form name="form_usuario" action="alterar_usuario.do" method="post" onsubmit="return validaForm();" class="needs-validation" novalidate>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        try {
                            UsuarioDAO uDB = new UsuarioDAO();
                            uDB.conectar();
                            Usuario u = uDB.carregaPorId(id);
                            uDB.desconectar();
                            if (u.getId() > 0) {
                    %>
                    <div class="form-group">
                        <label for="id">ID</label>
                        <input type="text" class="form-control" id="id" value="<%=u.getId() %>" disabled>
                        <input type="hidden" name="id" value="<%=u.getId() %>">
                    </div>
                    <div class="form-group">
                        <label for="id_perfil">Perfil</label>
                        <select class="form-control" id="id_perfil" name="id_perfil" required>
                            <option value="">Selecione um Perfil</option>
                            <%
                                try {
                                    PerfilDAO pDB = new PerfilDAO();
                                    pDB.conectar();
                                    ArrayList<Perfil> lista = pDB.listar();
                                    for (Perfil p : lista) {
                                        if (p.getId() == u.getId_perfil()) {
                            %>
                            <option value="<%=p.getId() %>" selected><%=p.getPerfil() %></option>
                            <%
                                        } else {
                            %>
                            <option value="<%=p.getId() %>"><%=p.getPerfil() %></option>
                            <%
                                        }
                                    }
                                    pDB.desconectar();
                                } catch (Exception erro) {
                                    out.print(erro);
                                }
                            %>
                        </select>
                        <div class="invalid-feedback">Por favor, selecione um perfil.</div>
                    </div>
                    <div class="form-group">
                        <label for="nome">Nome</label>
                        <input type="text" class="form-control" id="nome" name="nome" value="<%=u.getNome() %>" required>
                        <div class="invalid-feedback">Por favor, insira o nome.</div>
                    </div>
                    <div class="form-group">
                        <label for="login">Login</label>
                        <input type="text" class="form-control" id="login" name="login" value="<%=u.getLogin() %>" required>
                        <div class="invalid-feedback">Por favor, insira o login.</div>
                    </div>
                    <div class="form-group">
                        <label for="senha">Senha</label>
                        <input type="password" class="form-control" id="senha" name="senha" value="<%=u.getSenha() %>" required>
                        <div class="invalid-feedback">Por favor, insira a senha.</div>
                    </div>
                    <div class="form-group">
                        <label for="email">E-mail</label>
                        <input type="email" class="form-control" id="email" name="email" value="<%=u.getEmail() %>" required>
                        <div class="invalid-feedback">Por favor, insira um e-mail válido.</div>
                    </div>
                    <button type="submit" class="btn btn-primary">Salvar</button>
                    <%
                            }
                        } catch (Exception erro) {
                            out.print(erro);
                        }
                    %>
                </div>
            </div>
        </form>
    </div>
    <div class="footer mt-auto">
        &copy; 2024 Celular & Cia  Reparos. Todos os direitos reservados.
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
