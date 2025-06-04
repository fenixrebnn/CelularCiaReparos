<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Receita"%>
<%@page import="modelo.ReceitaDAO"%>
<%@page import="modelo.ServicoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
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
            width: 100%;
            box-shadow: 0px -3px 5px #cbced1;
        }
        body {
            margin-bottom: 100px; /* Aumenta a margem inferior para evitar sobreposição com o footer */
        }
    </style>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gerenciar Receita</title>
    <link rel="icon" type="image/x-icon" href="imagens/favicon.png">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="container mt-3 col-12">
        <%@include file="menu.jsp" %>
    </div>
    <div class="container" align="center">
        <h3>Lista de Receitas 
            <button class="btn btn-success ml-2" onclick="location.href='form_inserir_receita.jsp'">Inserir Receita</button>
        </h3>
        <div class="table-responsive custom-width">
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr class="text-center">
                        <th>ID</th>
                        <th>ID Serviço</th>
                        <th> Data Pagamento</th>
                        <th>Valor Serviço</th>
                        <th>Custo Peças</th>
                        <th>Lucro</th>
                        <th>Alterar</th>
                        <th>Excluir</th>
                    </tr>
                </thead>
                <tbody>
                    <%                                            
                        ArrayList<Receita> lista = new ArrayList<Receita>();
                        double valorServicoTotal = 0;
                        double custoTotal = 0;
                        double lucroTotal = 0;
                        Map<String, Double> lucroMensal = new HashMap<String, Double>();
                        Map<String, Double> custoPecasMensal = new HashMap<String, Double>();
                        Map<String, Double> valorServicoMensal = new HashMap<String, Double>();

                        try {
                            ReceitaDAO rDB = new ReceitaDAO();
                            rDB.conectar();
                            lista = rDB.listar();
                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                            SimpleDateFormat monthYearFormat = new SimpleDateFormat("MM/yyyy");
                            NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
                            for (Receita r : lista) {
                                valorServicoTotal += r.getValorServico();
                                custoTotal += r.getCustoPecas();
                                lucroTotal += r.getLucro();

                                String monthYear = monthYearFormat.format(r.getServico().getDataEntrega());
                                
                                // Agrupar lucros mensais
                                lucroMensal.put(monthYear, lucroMensal.getOrDefault(monthYear, 0.0) + r.getLucro());
                                // Agrupar custo de peças mensais
                                custoPecasMensal.put(monthYear, custoPecasMensal.getOrDefault(monthYear, 0.0) + r.getCustoPecas());
                                // Agrupar valor de serviços mensais
                                valorServicoMensal.put(monthYear, valorServicoMensal.getOrDefault(monthYear, 0.0) + r.getValorServico());
                    %>
                    <tr class="text-center">
                        <td><%= r.getId() %></td>
                        <td><%= r.getId_servico() %></td>
                        <td><%= sdf.format(r.getServico().getDataEntrega()) %></td>
                        <td><%= currencyFormatter.format(r.getValorServico()) %></td>
                        <td><%= currencyFormatter.format(r.getCustoPecas()) %></td>
                        <td><%= currencyFormatter.format(r.getLucro()) %></td>
                        <td>
                            <a href="form_alterar_receita.jsp?id=<%= r.getId() %>">
                                <button class="btn btn-warning">Alterar</button>
                            </a>
                        </td>
                        <td>
                            <a href="excluir_receita.do?id=<%= r.getId() %>">
                                <button class="btn btn-danger">Excluir</button>
                            </a>
                        </td>
                    </tr>
                    <%
                            }
                            rDB.desconectar();
                        } catch (Exception erro) {
                            out.print(erro);
                        }
                    %>
                </tbody>
            </table>
        </div>
        <p class="info">Observação: Lucro = Valor do Serviço - Custo das Peças.</p>
        <div class="container mt-3 col-md-10">
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr class="text-center">
                        <th colspan="2">Relatório da Receita</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><strong>Valor do Serviço Total:</strong></td>
                        <td><%= NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(valorServicoTotal) %></td>
                    </tr>
                    <tr>
                        <td><strong>Custo das Peças Total:</strong></td>
                        <td><%= NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(custoTotal) %></td>
                    </tr>
                    <tr>
                        <td><strong>Lucro Total:</strong></td>
                        <td><%= NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(lucroTotal) %></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Gráfico -->
        <div class="container chart-container">
            <canvas id="lucroCustoValorMensalChart" width="400" height="150"></canvas>
        </div>
    </div>
    <div class="footer">
        &copy; 2024 Celular & Cia Reparos. Todos os direitos reservados.
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        const ctx = document.getElementById('lucroCustoValorMensalChart').getContext('2d');

        const labels = [<% for (String monthYear : lucroMensal.keySet()) { %>'<%= monthYear %>', <% } %>];

        const lucroData = {
            label: 'Lucro Mensal em R$',
            data: [<% for (Double lucro : lucroMensal.values()) { %><%= lucro %>, <% } %>],
            backgroundColor: 'rgba(0, 123, 123, 0.7)',  // Darker green
            borderColor: 'rgba(0, 123, 123, 1)',
            borderWidth: 1
        };

        const custoPecasData = {
            label: 'Custo das Peças Mensal em R$',
            data: [<% for (Double custo : custoPecasMensal.values()) { %><%= custo %>, <% } %>],
            backgroundColor: 'rgba(153, 0, 0, 0.7)',  // Darker red
            borderColor: 'rgba(153, 0, 0, 1)',
            borderWidth: 1
        };

        const valorServicoData = {
            label: 'Valor do Serviço Mensal em R$',
            data: [<% for (Double valor : valorServicoMensal.values()) { %><%= valor %>, <% } %>],
            backgroundColor: 'rgba(204, 153, 0, 0.7)',  // Darker yellow
            borderColor: 'rgba(204, 153, 0, 1)',
            borderWidth: 1
        };

        const data = {
            labels: labels,
            datasets: [lucroData, custoPecasData, valorServicoData]
        };

        new Chart(ctx, {
            type: 'bar',
            data: data,
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>
