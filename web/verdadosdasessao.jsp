<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>

<html>

<head>

<title>Exemplo do Objeto Session</title>

</head>

<body>

<h1>O Objeto Session</h1>

Exemplo de uso de alguns métodos da interface javax.servlet.http.HttpSession

<br><br>A sessão foi criada em: <%= session.getCreationTime() %>

<br>A sessão ficará inativa em um intervalo de: <%= session.getMaxInactiveInterval() %>

<br>O ID Session é: <%= session.getId() %>

<br>A sessão atual está sendo usada? <%= session.isNew() %>

<br>A sessão foi acessada pela última vez em: <%= session.getLastAccessedTime() %>

<br>A sessão foi criada em: <%= session.getCreationTime() %>

</body>

</html>
