package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Receita;
import modelo.ReceitaDAO;

public class AlterarReceita extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Alterar Receita</title>");
            out.println("</head>");
            out.println("<body>");

            try {
                int id = Integer.parseInt(request.getParameter("id"));
                int id_servico = Integer.parseInt(request.getParameter("id_servico"));
                double custoPecas = limparValorMonetario(request.getParameter("custo_pecas"));
                double valorServico = limparValorMonetario(request.getParameter("valor_servico"));
                double lucro = limparValorMonetario(request.getParameter("lucro"));

                if (id <= 0) {
                    out.print("O ID da Receita não foi encontrado!");
                } else if (id_servico <= 0) {
                    out.print("O ID do Serviço não foi encontrado!");
                } else if (custoPecas < 0) {
                    out.print("O campo custo de peças não pode ser negativo!");
                } else if (valorServico < 0) {
                    out.print("O campo valor do serviço não pode ser negativo!");
                } else if (lucro < 0) {
                    out.print("O campo lucro não pode ser negativo!");
                } else {
                    Receita receita = new Receita();
                    receita.setId(id);
                    receita.setId_servico(id_servico);
                    receita.setCustoPecas(custoPecas);
                    receita.setValorServico(valorServico);
                    receita.setLucro(lucro);

                    ReceitaDAO receitaDAO = new ReceitaDAO();
                    receitaDAO.conectar();
                    receitaDAO.alterar(receita);
                    receitaDAO.desconectar();

                    out.print("<script language='javascript'>");
                    out.print("alert('Receita alterada com sucesso!!');");
                    out.print("location.href='listar_receita.jsp';");
                    out.print("</script>");
                }
            } catch (NumberFormatException e) {
                out.print("Erro de formatação: " + e.getMessage());
            } catch (Exception e) {
                out.print("Erro: " + e.getMessage());
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    private double limparValorMonetario(String valor) throws NumberFormatException {
        if (valor == null || valor.isEmpty()) {
            throw new NumberFormatException("Valor nulo ou vazio");
        }
        // Remove qualquer caractere que não seja dígito ou ponto/vírgula
        valor = valor.replaceAll("[^\\d,.-]", "").replace(",", ".");
        return Double.parseDouble(valor);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para alterar receita";
    }
}
