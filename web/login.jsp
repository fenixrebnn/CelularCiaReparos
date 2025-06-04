<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" type="image/x-icon" href="imagens/favicon.png">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <title>Página Login</title>
    <script language="javascript">
        function validaForm() {
            var formulario = document.form_login;
            if (formulario.login.value == "") {
                alert("O Campo login deve ser preenchido!!");
                formulario.login.focus();
                return false;
            }
            if (formulario.senha.value == "") {
                alert("O Campo senha deve ser preenchido!!");
                formulario.senha.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <br><br><br><br>
    <center>
        <form action="efetuar_login.do" method="post" name="form_login" onsubmit="return validaForm();">
            <div class="wrapper">
                <div class="logo">
                    <img src="imagens/favicon.png" alt="logotipo">
                </div>
                <div class="text-center mt-4 name">
                   Celular & Cia  Reparos
                </div>
                <div class="p-3 mt-3">
                    <div class="form-field d-flex align-items-center">
                        <span class="far fa-user"></span>
                        <input type="text" name="login" id="userName" placeholder="Usuário">
                    </div>
                    <div class="form-field d-flex align-items-center">
                        <span class="fas fa-key"></span>
                        <input type="password" name="senha" id="pwd" placeholder="Senha">
                    </div>
                    <button class="btn mt-3">Entrar</button>
                </div>
                
            </div>
        </form>
    </center>
    <div class="footer">
        &copy; 2024 Celular & Cia  Reparos. Todos os direitos reservados.
    </div>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"> </script>
</body>
</html>
