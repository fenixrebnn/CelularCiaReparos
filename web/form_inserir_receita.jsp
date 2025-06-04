<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Servico"%>
<%@page import="modelo.ServicoDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Inserir Receita</title>
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
    <script>
        function formatarMoeda(valor) {
            // Converte o valor para float e formata como moeda brasileira (R$)
            return parseFloat(valor).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
        }

        function formatarCampoMoeda(campo) {
            var valor = campo.value.replace(/\D/g, '');
            valor = (valor / 100).toFixed(2); // ajusta para duas casas decimais
            campo.value = formatarMoeda(valor);
        }

        function limparFormatacaoMoeda(campo) {
            // Remove formatação ao foco no campo
            var valor = campo.value.replace(/\D/g, '');
            campo.value = valor / 100;
        }

        function validaForm() {
            var formulario = document.form_inserir_receita;
            if (formulario.id_servico.value == "") {
                alert("Por favor, selecione um serviço.");
                formulario.id_servico.focus();
                return false;
            }
            if (formulario.valor_servico.value == "") {
                alert("Por favor, insira o valor do serviço.");
                formulario.valor_servico.focus();
                return false;
            }
            if (formulario.custo_pecas.value == "") {
                alert("Por favor, insira o custo das peças.");
                formulario.custo_pecas.focus();
                return false;
            }
            if (formulario.lucro.value == "") {
                alert("Por favor, insira o lucro.");
                formulario.lucro.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="d-flex flex-column min-vh-100">
    <div class="container mt-3">
        <%@include file="menu.jsp" %>
    </div>
    <div class="container mt-3 container-padding">
        <h1 class="text-center">Inserir Receita</h1>
        <form name="form_inserir_receita" action="inserir_receita.do" method="post" onsubmit="return validaForm();" class="needs-validation" novalidate>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="id_servico"> Nota de Serviço</label>
                        <select class="form-control" id="id_servico" name="id_servico" required>
                            <option value="">Escolha uma Nota de Serviço</option>
                            <% 
                            try {
                                ServicoDAO sDB = new ServicoDAO();
                                sDB.conectar();
                                ArrayList<Servico> lista = sDB.listar();
                                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                for (Servico s : lista) {
                            %>
                            <option value="<%=s.getId()%>"><%=s.getAgenda().getUsuario().getNome()%> - <%=sdf.format(s.getDataEntrega())%></option>
                            <%
                                }
                                sDB.desconectar();
                            } catch (Exception e) {
                                out.print(e);
                            }
                            %>
                        </select>
                        <div class="invalid-feedback">Por favor, selecione uma nota de serviço.</div>
                    </div>
                    <div class="form-group">
                        <label for="valor_servico">Valor do Serviço:</label>
                        <input type="text" class="form-control" id="valor_servico" name="valor_servico" onkeyup="formatarCampoMoeda(this)" onfocus="limparFormatacaoMoeda(this)" required>
                        <div class="invalid-feedback">Por favor, insira o valor do serviço.</div>
                    </div>
                    <div class="form-group">
                        <label for="custo_pecas">Custo das Peças:</label>
                        <input type="text" class="form-control" id="custo_pecas" name="custo_pecas" onkeyup="formatarCampoMoeda(this)" onfocus="limparFormatacaoMoeda(this)" required>
                        <div class="invalid-feedback">Por favor, insira o custo das peças.</div>
                    </div>
                    <div class="form-group">
                        <label for="lucro">Lucro:</label>
                        <input type="text" class="form-control" id="lucro" name="lucro" onkeyup="formatarCampoMoeda(this)" onfocus="limparFormatacaoMoeda(this)" required>
                        <div class="invalid-feedback">Por favor, insira o lucro.</div>
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
