<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Agenda"%>
<%@page import="modelo.AgendaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Meus Agendamentos</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="imagens/favicon.png">
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
            margin-bottom: 60px; /* Altura do footer */
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="container mt-3 col-12">
            <%@include file="menu.jsp" %>
        </div>

        <div class="container content" align="center">
            <h3>Meus Agendamentos 
            <button class="btn btn-success ml-3" onclick="location.href='form_inserir_agenda.jsp'">Novo</button></h3>
            <div class="table-responsive custom-width">
                <% 
                try {
                    AgendaDAO aDB = new AgendaDAO();
                    ArrayList<Agenda> lista;
                    aDB.conectar();
                    lista = aDB.listar();
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

                    boolean possuiAgendamentos = false; // Flag para verificar se há agendamentos

                    // Loop para verificar se há agendamentos para o usuário logado
                    for (Agenda a : lista) {
                        if (usuario.getId() == a.getId_usuario()) {
                            possuiAgendamentos = true;
                            break;
                        }
                    }

                    if (possuiAgendamentos) {
                %>
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th>ID</th>
                            <th>Nome </th>
                            <th>E-mail</th>
                            <th>Marca/Modelo Celular</th>
                            <th>Problema</th>
                            <th>Data Conserto</th>
                            <th>Alterar</th>
                            <th>Excluir</th>
                            <th>Nota de Serviço</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        for (Agenda a : lista) {
                            if (usuario.getId() == a.getId_usuario()) {
                        %>
                        <tr class="text-center">
                            <td><%= a.getId() %></td>
                            <td><%= a.getUsuario().getNome() %></td>
                            <td><%= a.getUsuario().getEmail() %></td>
                            <td><%= a.getMarcaModeloCelular() %></td>
                            <td><%= a.getProblema() %></td>
                            <td><%= sdf.format(a.getDataConserto()) %></td>
                            <td>
                                <a href="form_alterar_agenda.jsp?id=<%= a.getId() %>">
                                    <button class="btn btn-warning">Alterar</button>
                                </a>
                            </td>
                            <td>
                                <a href="excluir_agenda.do?id=<%= a.getId() %>">
                                    <button class="btn btn-danger">Excluir</button>
                                </a>
                            </td>
                            <td>
                                <a href="visualizar_agenda.jsp?id=<%= a.getId() %>">
                                    <button class="btn btn-info">Visualizar</button>
                                </a>
                            </td>
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
                    Você não possui nenhum agendamento.
                </div>
                <% 
                    }

                    aDB.desconectar();

                } catch (Exception erro) {
                    out.print("<div class='alert alert-danger' role='alert'>Erro: " + erro.getMessage() + "</div>");
                }
                %>
            </div>
            <p class="info">Horário de Funcionamento: Seg á Sab: 13:00 ás 18:30.</p>
        </div>

        <div class="footer">
            &copy; 2024 Celular & Cia Reparos. Todos os direitos reservados.
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
