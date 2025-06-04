<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.sql.*"%>
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
            margin-bottom: 60px; /* Altura do footer */
        }
    </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <title> Gerenciar Perfil</title>
    </head>
    <body>
        
        <div class="container mt-3 col-12">
            <%@include file="menu.jsp" %>         
        </div>
        <div class="container" align="center">
            <h3>Lista de Perfis 
                <button class="btn btn-success ml-2" onclick="location.href='form_inserir_perfil.jsp'">Novo Perfil</button>
            </h3>
            <div class="table-responsive custom-width">
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th>ID</th>
                            <th>PERFIL</th>
                            <th>ALTERAR</th>
                            <th>EXCLUIR</th>
                            <th>GERENCIAR MENUS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                                            
                            try {
                                PerfilDAO pDB = new PerfilDAO();
                                ArrayList<Perfil> lista;
                                pDB.conectar();
                                lista = pDB.listar();
                                for(Perfil p:lista){
                                    %>
                                    <tr class="text-center">
                                        <td><%=p.getId() %></td>
                                        <td><%=p.getPerfil() %></td>
                                        <td>
                                            <a href="form_alterar_perfil.jsp?id=<%=p.getId() %>">
                                                <button class="btn btn-warning">Alterar</button>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="excluir_perfil.do?id=<%=p.getId() %>">
                                                <button class="btn btn-danger">Excluir</button>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="form_gerenciar_menu_perfil.jsp?id=<%=p.getId() %>">
                                                <button class="btn btn-primary">Gerenciar Menus</button>
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                }
                                pDB.desconectar();
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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
