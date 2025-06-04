<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="modelo.Servico"%>
<%@page import="modelo.ServicoDAO"%>
<%@page import="modelo.Agenda"%>
<%@page import="modelo.AgendaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <style>
        .footer {
            text-align: center;
            padding: 10px 0;
            background-color: #000000;
            color: white;
            font-size: 0.9rem;
            bottom: 0;
            width: 100%;
            position: fixed;
            box-shadow: 0px -3px 5px #cbced1;
        }
        body {
            margin-bottom: 60px; 
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Minha Nota de Serviços</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="imagens/favicon.png">
</head>
<body>
    <div class="principal">
        <div class="container mt-3 col-12">
            <%@include file="menu.jsp" %>
        </div>

        <div class="container" align="center">
            <h3>Minha Nota de Serviço</h3>
            <div class="table-responsive custom-width">
                <% 
                try {
                    int idAgendaParam = Integer.parseInt(request.getParameter("id"));
                    ServicoDAO sDB = new ServicoDAO();
                    AgendaDAO aDB = new AgendaDAO();
                    sDB.conectar();
                    aDB.conectar();

                    ArrayList<Servico> listaServicos = sDB.listar();
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));

                    boolean possuiServicos = false;

                    // Verificar se existem serviços para a agenda específica
                    for (Servico s : listaServicos) {
                        if (idAgendaParam == s.getId_agenda()) {
                            possuiServicos = true;
                            break;
                        }
                    }

                    if (possuiServicos) {
                %>
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th>ID</th>
                            <th>ID da Agenda</th>
                            <th>Nome</th>
                            <th>Diagnóstico</th>
                            <th>Preço</th>
                            <th>Data de Entrega</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        for (Servico s : listaServicos) {
                            if (idAgendaParam == s.getId_agenda()) {
                        %>
                        <tr class="text-center">
                            <td><%= s.getId() %></td>
                            <td><%= s.getId_agenda() %></td>
                            <td><%= s.getAgenda().getUsuario().getNome() %></td>
                            <td><%= s.getDiagnostico() %></td>
                            <td><%= currencyFormatter.format(s.getPreco()) %></td>
                            <td><%= sdf.format(s.getDataEntrega()) %></td>
                        </tr>
                        <% 
                            }
                        }
                        %>
                    </tbody>
                </table>
                <% 
                    } else {
                %>
                <div class="alert alert-warning" role="alert">
                     Nota de serviço não está disponível.
                </div>
                <% 
                    }

                    sDB.desconectar();
                    aDB.desconectar();

                } catch (Exception e) {
                    out.print("<div class='alert alert-danger' role='alert'>Erro ao listar os serviços: " + e.getMessage() + "</div>");
                }
                %>
            </div>
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
