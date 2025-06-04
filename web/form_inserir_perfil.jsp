<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <link rel="icon" type="image/x-icon" href="imagens/favicon.png">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script language="javascript">
        function validaForm() {
            formulario = document.form_perfil;
            if (formulario.perfil.value == "") {
                alert("O Campo perfil deve ser preenchido!!");
                formulario.perfil.focus();
                return false;
            }
            return true;
        }
    </script>
    <title>Inserir Perfil</title>
    <style>
        body {
            margin-bottom: 60px;
        }
    </style>
</head>
<body>
    <div class="container mt-3 col-12">
        <%@include file="menu.jsp" %>
    </div>
    <div class="container mt-3">
        <h2 class="text-center">Inserir Perfil</h2>
        <form name="form_perfil" action="inserir_perfil.do" method="post" onsubmit="return validaForm();" class="needs-validation" novalidate>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="perfil">Perfil</label>
                        <input type="text" class="form-control" id="perfil" name="perfil" required>
                        <div class="invalid-feedback">Por favor, insira o nome do perfil.</div>
                    </div>
                    <button type="submit" class="btn btn-primary">Salvar</button>
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
        
        (function() {
            'use strict';
            window.addEventListener('load', function() {
               
                var forms = document.getElementsByClassName('needs-validation');
                
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
