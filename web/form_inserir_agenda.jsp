<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <link rel="icon" type="image/x-icon" href="imagens/favicon.png">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            var formulario = document.form_agenda;
            if (formulario.marca_modelo_celular.value == "") {
                alert("O Campo Marca/Modelo Celular deve ser preenchido!!");
                formulario.marca_modelo_celular.focus();
                return false;
            }
            if (formulario.problema.value == "") {
                alert("O Campo Problema deve ser preenchido!!");
                formulario.problema.focus();
                return false;
            }
            if (formulario.data_conserto.value == "") {
                alert("O Campo Data de Conserto deve ser preenchido!!");
                formulario.data_conserto.focus();
                return false;
            }
            return true;
        }
    </script>
    <title>Agendar Conserto</title>
</head>
<body class="d-flex flex-column min-vh-100">
    <div class="container mt-3">
        <%@include file="menu.jsp" %>
    </div>
    <div class="container mt-3 container-padding">
        <h2 class="text-center">Agendar Conserto</h2>
        <form name="form_agenda" action="inserir_agenda.do" method="post" onsubmit="return validaForm();" class="needs-validation" novalidate>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="marca_modelo_celular">Marca/Modelo Celular</label>
                        <input type="text" class="form-control" id="marca_modelo_celular" name="marca_modelo_celular" required>
                        <div class="invalid-feedback">Por favor, insira a marca/modelo do celular.</div>
                    </div>
                    <div class="form-group">
                        <label for="problema">Problema</label>
                        <textarea class="form-control" id="problema" name="problema" rows="4" required></textarea>
                        <div class="invalid-feedback">Por favor, descreva o problema.</div>
                    </div>
                    <div class="form-group">
                        <label for="data_conserto">Data de Conserto</label>
                        <input type="date" class="form-control" id="data_conserto" name="data_conserto" required>
                        <div class="invalid-feedback">Por favor, selecione a data de conserto.</div>
                    </div>
                    <input type="hidden" name="id_usuario" value="<%= usuario.getId() %>">
                    <button type="submit" class="btn btn-primary">Salvar</button>
                </div>
            </div>
        </form>
    </div>
    <div class="footer">
        &copy; 2024 Celular  & Cia  Reparos. Todos os direitos reservados.
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
