<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Agenda"%>
<%@page import="modelo.AgendaDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Servico"%>
<%@page import="modelo.ServicoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Alterar Serviço</title>
    <link rel="icon" type="image/x-icon" href="imagens/favicon.png">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="scripts.js"></script> <!-- Arquivo com scripts comuns -->
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
            return parseFloat(valor).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
        }

        function formatarCampoMoeda(campo) {
            var valor = campo.value.replace(/\D/g, '');
            valor = (valor / 100).toFixed(2); // ajusta para duas casas decimais
            campo.value = formatarMoeda(valor);
        }

        function limparFormatacaoMoeda(campo) {
            var valor = campo.value.replace(/\D/g, '');
            campo.value = valor / 100;
        }

        function validaForm() {
            var formulario = document.form_alterar_servico;
            if (formulario.id_agenda.value == "") {
                alert("Por favor, selecione uma agenda.");
                formulario.id_agenda.focus();
                return false;
            }
            if (formulario.diagnostico.value == "") {
                alert("Por favor, insira o diagnóstico.");
                formulario.diagnostico.focus();
                return false;
            }
            if (formulario.data_entrega.value == "") {
                alert("Por favor, insira a data de entrega.");
                formulario.data_entrega.focus();
                return false;
            }
            if (formulario.preco.value == "") {
                alert("Por favor, insira o preço.");
                formulario.preco.focus();
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
        <div align="center">
            <h2>Alterar Serviço</h2>
            <form name="form_alterar_servico" action="alterar_servico.do" method="post" onsubmit="return validaForm();" class="needs-validation" novalidate>
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <%
                            int id = Integer.parseInt(request.getParameter("id"));
                            try {
                                ServicoDAO sDB = new ServicoDAO();
                                sDB.conectar();
                                Servico s = sDB.carregaPorId(id);
                                sDB.desconectar();
                                if (s.getId() > 0) {
                        %>
                        <input type="hidden" name="id" value="<%= s.getId() %>">
                        <div class="form-group">
                            <label for="id_agenda">Agenda</label>
                            <select class="form-control" id="id_agenda" name="id_agenda" required>
                                <option value="">Escolha uma Agenda</option>
                                <% 
                                    AgendaDAO aDB = new AgendaDAO();
                                    aDB.conectar();
                                    ArrayList<Agenda> lista = aDB.listar();
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                    for (Agenda a : lista) {
                                        String dataFormatada = sdf.format(a.getDataConserto());
                                %>
                                <option value="<%= a.getId() %>" <%= (a.getId() == s.getId_agenda()) ? "selected" : "" %>><%= a.getUsuario().getNome() %> - <%= dataFormatada %></option>
                                <%
                                    }
                                    aDB.desconectar();
                                %>
                            </select>
                            <div class="invalid-feedback">Por favor, selecione uma agenda.</div>
                        </div>
                        <div class="form-group">
                            <label for="diagnostico">Diagnóstico</label>
                            <input type="text" class="form-control" id="diagnostico" name="diagnostico" value="<%= s.getDiagnostico() %>" required>
                            <div class="invalid-feedback">Por favor, insira o diagnóstico.</div>
                        </div>
                        <div class="form-group">
                            <label for="data_entrega">Data de Entrega</label>
                            <input type="date" class="form-control" id="data_entrega" name="data_entrega" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(s.getDataEntrega()) %>" required>
                            <div class="invalid-feedback">Por favor, insira a data de entrega.</div>
                        </div>
                        <div class="form-group">
                            <label for="preco">Preço</label>
                            <input type="text" class="form-control" id="preco" name="preco" value="<%= s.getPreco() %>" onkeyup="formatarCampoMoeda(this)" onfocus="limparFormatacaoMoeda(this)" required>
                            <div class="invalid-feedback">Por favor, insira o preço.</div>
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
    </div>
    <div class="footer">
        &copy; 2024 Celular & Cia Reparos. Todos os direitos reservados.
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
