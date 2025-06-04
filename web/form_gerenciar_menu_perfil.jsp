<%@page import="modelo.Menu"%>
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
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <link rel="icon" type="image/x-icon" href="imagens/favicon.png">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <title>Gerenciar Menus de Perfil</title>
    </head>
    <body class="d-flex flex-column min-vh-100">
        <div class="container mt-3">
            <%@include file="menu.jsp" %>
        </div>
        <div class="container mt-3">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <h2 class="text-center">Gerenciar Menus de Perfil</h2>
                    <form name="form_gerenciar" method="post" action="gerenciar_menu_perfil.do" onsubmit="return validaForm();" class="needs-validation" novalidate>
                        <%
                            int id = Integer.parseInt(request.getParameter("id"));
                            Perfil perfil = new Perfil();
                            ArrayList<Menu> listaVinculados = new ArrayList<Menu>();
                            ArrayList<Menu> listaDesvinculados = new ArrayList<Menu>();
                            try {
                                PerfilDAO pDB = new PerfilDAO();
                                pDB.conectar();
                                perfil = pDB.carregaPorId(id);
                                listaVinculados = pDB.menusVinculados(id);
                                listaDesvinculados = pDB.menusDesvinculados(id);
                                pDB.desconectar();
                            } catch (Exception e) {
                                out.print(e);
                            }
                        %>
                        <input type="hidden" name="id_perfil" value="<%=perfil.getId()%>" />
                        <input type="hidden" name="op" value="vincular" />
                        <table class="table table-bordered">
                            <tr>
                                <td>ID:</td>
                                <td><%=perfil.getId()%></td>
                            </tr>
                            <tr>
                                <td>Perfil:</td>
                                <td><%=perfil.getPerfil()%></td>
                            </tr>
                            <tr>
                                <td>Menu:</td>
                                <td>
                                    <select class="form-control" name="id_menu" required>
                                        <option value="">Escolha um menu</option>
                                        <%
                                            for (Menu m : listaDesvinculados) {
                                                out.println("<option value='"+m.getId()+ "'>"+m.getMenu()+"</option>");
                                            }
                                        %>
                                    </select>
                                    <div class="invalid-feedback">Por favor, escolha um menu.</div>
                                </td>
                                <td>
                                    <button type="submit" class="btn btn-primary">Vincular</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <br/>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>MENU</th>
                                <th>DESVINCULAR</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Menu m : listaVinculados) {
                            %>
                            <tr>
                                <td align="center"><%=m.getId()%></td>
                                <td><%=m.getMenu()%></td>
                                <td align="center">
                                    <a href="gerenciar_menu_perfil.do?id_menu=<%=m.getId()%>&id_perfil=<%=id%>&op=desvincular" class="btn btn-danger">
                                        Desvincular
                                    </a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="footer mt-auto text-center">
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
