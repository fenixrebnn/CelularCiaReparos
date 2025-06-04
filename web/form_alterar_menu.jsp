<%@page import="modelo.Menu"%>
<%@page import="modelo.MenuDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <link rel="icon" type="image/x-icon" href="imagens/favicon.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script language="javascript">
        function validaForm() {
            formulario = document.form_menu;
            if (formulario.menu.value == "") {
                alert("O Campo menu deve ser preenchido!!");
                formulario.menu.focus();
                return false;
            }
            if (formulario.link.value == "") {
                alert("O Campo link deve ser preenchido!!");
                formulario.link.focus();
                return false;
            }
            return true;
        }
    </script>
    <title>Alterar Menu</title>
    <style>
        body {
            margin-bottom: 60px; /* Altura do footer */
            position: relative;
            min-height: 100vh;
        }
        
        .footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 40px; /* Altura do footer */
            background-color: #000000;
            color: white;
            text-align: center;
            padding: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container mt-3 col-12">
        <%@include file="menu.jsp" %>
    </div>
    <div class="container mt-3">
        <h2 class="text-center">Alterando Menu</h2>
        <form name="form_menu" action="alterar_menu.do" method="post" onsubmit="return validaForm();" class="needs-validation" novalidate>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="menu">Menu</label>
                        <%
                            int id = Integer.parseInt(request.getParameter("id"));
                            try {
                                MenuDAO mDB = new MenuDAO();
                                mDB.conectar();
                                Menu m = mDB.carregaPorId(id);
                                mDB.desconectar();
                                if (m.getId() > 0) {
                        %>
                        <input type="hidden" name="id" value="<%=m.getId() %>">
                        <input type="text" class="form-control" id="menu" name="menu" value="<%=m.getMenu() %>" required>
                        <div class="invalid-feedback">Por favor, insira o nome do menu.</div>
                    </div>
                    <div class="form-group">
                        <label for="link">Link</label>
                        <input type="text" class="form-control" id="link" name="link" value="<%=m.getLink() %>" required>
                        <div class="invalid-feedback">Por favor, insira o link.</div>
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
    <div class="footer">
        &copy; 2024 Celular & Cia  Reparos. Todos os direitos reservados.
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function(form) {
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
