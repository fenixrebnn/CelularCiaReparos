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
    <title>Lista de Agendamentos</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="imagens/favicon.png">
</head>
<body>
    <div class="main-container">
        <div class="container mt-3 col-12">
            <%@include file="menu.jsp" %>
        </div>

        <div class="container content" align="center">
            <h3>Lista de Agendamentos
               
            </h3>
            <div class="table-responsive custom-width">
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th>ID</th>
                            <th>Nome Cliente</th>
                            <th>E-mail Cliente</th>
                            <th>Perfil</th>
                            <th>Marca/Modelo Celular</th>
                            <th>Problema</th>
                            <th>Data Conserto</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                AgendaDAO aDB = new AgendaDAO();
                                ArrayList<Agenda> lista;
                                aDB.conectar();
                                lista = aDB.listar();
                                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                for (Agenda a : lista) {
                        %>
                        <tr class="text-center">
                            <td><%= a.getId() %></td>
                            <td><%= a.getUsuario().getNome() %></td>
                            <td><%= a.getUsuario().getEmail() %></td>
                            <td><%= a.getUsuario().getPerfil() %></td>
                            <td><%= a.getMarcaModeloCelular() %></td>
                            <td><%= a.getProblema() %></td>
                            <td><%= sdf.format(a.getDataConserto()) %></td>
                        </tr>
                        <%
                                }
                                aDB.desconectar();
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="footer">
            &copy; 2024 Celular & Cia  Reparos. Todos os direitos reservados.
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
