<%@page import="modelo.Menu"%>
<%@page import="modelo.MenuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" type="image/x-icon" href="imagens/favicon.png">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <title> Gerenciar Menu</title>
    </head>
    <body>
        <div class="container mt-3 col-12">
            <%@include file="menu.jsp" %>         
        </div>
        <div class="container" align="center">
            <h3>Lista de Menus 
                <button class="btn btn-success ml-2" onclick="location.href='form_inserir_menu.jsp'">Adicionar Menu</button>
            </h3>
            <div class="table-responsive custom-width">
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th>ID</th>
                            <th>MENU</th>
                            <th>LINK</th>
                            <th>ALTERAR</th>
                            <th>EXCLUIR</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                                            
                            try {
                                MenuDAO mDB = new MenuDAO();
                                ArrayList<Menu> lista;
                                mDB.conectar();
                                lista = mDB.listar();
                                for(Menu m:lista){
                                    %>
                                    <tr class="text-center">
                                        <td><%=m.getId() %></td>
                                        <td><%=m.getMenu() %></td>
                                        <td><%=m.getLink() %></td>
                                        <td>
                                            <a href="form_alterar_menu.jsp?id=<%=m.getId() %>">
                                                <button class="btn btn-warning">Alterar</button>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="excluir_menu.do?id=<%=m.getId() %>">
                                                <button class="btn btn-danger">Excluir</button>
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                }
                                mDB.desconectar();
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
