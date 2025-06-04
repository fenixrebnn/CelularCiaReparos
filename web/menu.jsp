<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Menu"%>
<%@page import="modelo.Usuario"%>
<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) {
    response.sendRedirect("login.jsp");
    return; // Ensure no further processing happens
}
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar {
            background-color: #D91807; 
        }
        .navbar .nav-link {
            color: white; 
            padding: 10px 15px; 
            transition: background-color 0.3s ease; 
            font-size: 1.5rem; 
        }
        .navbar .nav-link:hover {
            background-color: #BF382C; 
        }
        
        .navbar-nav {
            width: 100%;
            display: flex;
            justify-content: space-between;
            padding-left: 0;
        }
        .nav-item {
            margin-right: 15px; 
        }
    </style>
</head>
<body>
    <div class="container mt-3 col-12">
        <div class="row mt-2">
            <div class="col-12">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <% try {
                                PerfilDAO pDB = new PerfilDAO();
                                pDB.conectar();
                                ArrayList<Menu> listaMenu = pDB.menusVinculados(usuario.getId_perfil());

                                for (Menu m : listaMenu) {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="<%= m.getLink() %>"><%= m.getMenu() %></a>
                            </li>
                            <% } pDB.desconectar(); } catch (Exception e) {
                                out.print("Error: " + e.getMessage());
                                response.sendRedirect("login.jsp");
                            } %>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <div style="text-align: right;">
            <a href='sair.jsp' class="btn btn-danger">Sair</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
