<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Usuario"%>
<%@page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" type="image/x-icon" href="imagens/favicon.png">
    <title>Meus Dados</title>
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
    <div class="container mt-3 col-12">
        <%@include file="menu.jsp" %>         
    </div>

    <div class="container" align="center">
        <h3>Meus Dados</h3>
        <div class="table-responsive custom-width">
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr class="text-center">
                        <th>Campo</th>
                        <th>Dados</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>ID:</td>
                        <td><%= usuario.getId() %></td>
                    </tr>
                    <tr>
                        <td>Nome:</td>
                        <td><%= usuario.getNome() %></td>
                    </tr>
                    <tr>
                        <td>Login:</td>
                        <td><%= usuario.getLogin() %></td>
                    </tr>
                    <tr>
                        <td>E-mail:</td>
                        <td><%= usuario.getEmail() %></td>
                    </tr>
                    <tr>
                        <td>Perfil:</td>
                        <td><%= usuario.getPerfil().getPerfil() %></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
    <div class="footer">
        &copy; 2024 Celular & Cia  Reparos. Todos os direitos reservados.
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
