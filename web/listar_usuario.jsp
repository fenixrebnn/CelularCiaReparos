<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
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
        <title>Gerenciar Usuários</title>
    </head>
    <body>
        <div class="container mt-3 col-12">
            <%@include file="menu.jsp" %>         
        </div>
        <div class="container" align="center">
            <h3>Lista de Usuários 
                <button class="btn btn-success ml-2" onclick="location.href='form_inserir_usuario.jsp'">Novo Usuário</button>
            </h3>
            <div class="table-responsive custom-width">
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th>ID</th>
                            <th>PERFIL</th>
                            <th>NOME</th>
                            <th>LOGIN</th>
                            <th>E-MAIL</th>
                            <th>ALTERAR</th>
                            <th>EXCLUIR</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                                            
                            try {
                                UsuarioDAO uDB = new UsuarioDAO();
                                ArrayList<Usuario> lista;
                                uDB.conectar();
                                lista = uDB.listar();
                                for(Usuario u:lista){
                                    %>
                                    <tr class="text-center">
                                        <td><%=u.getId() %></td>
                                        <td><%=u.getPerfil() %></td>
                                        <td><%=u.getNome() %></td>
                                        <td><%=u.getLogin() %></td>
                                        <td><%=u.getEmail() %></td>
                                        <td>
                                            <a href="form_alterar_usuario.jsp?id=<%=u.getId() %>">
                                                <button class="btn btn-warning">Alterar</button>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="excluir_usuario.do?id=<%=u.getId() %>">
                                                <button class="btn btn-danger">Excluir</button>
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                }
                                uDB.desconectar();
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
