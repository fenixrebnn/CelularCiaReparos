package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Servico;
import modelo.ServicoDAO;

public class AlterarServico extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Alterar Serviço</title>");
            out.println("</head>");
            out.println("<body>");

            int id = Integer.parseInt(request.getParameter("id"));
            int id_agenda = Integer.parseInt(request.getParameter("id_agenda"));
            String diagnostico = request.getParameter("diagnostico");
            Date data_entrega = Date.valueOf(request.getParameter("data_entrega"));  // Convertendo a data para o tipo Date
            double preco = limparValorMonetario(request.getParameter("preco"));

            if (diagnostico == null || diagnostico.isEmpty()) {
                out.print("O campo Diagnóstico deve ser preenchido!");
            } else if (data_entrega == null) {
                out.print("O campo Data de Entrega deve ser preenchido!");
            } else if (preco <= 0) {
                out.print("O campo Preço deve ser preenchido com um valor positivo!");
            } else if (id_agenda < 1) {
                out.print("O campo Agenda deve ser preenchido!");
            } else if (id < 1) {
                out.print("O ID da nota de serviço não encontrado!");
            } else {
                try {
                    Servico s = new Servico();
                    s.setId(id);
                    s.setId_agenda(id_agenda);
                    s.setDataEntrega(data_entrega);
                    s.setPreco(preco);
                    s.setDiagnostico(diagnostico);
                    ServicoDAO sDB = new ServicoDAO();
                    sDB.conectar();
                    sDB.alterar(s);
                    sDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Nota de Serviço atualizada com sucesso!!');");
                    out.print("location.href='listar_servico.jsp';");
                    out.print("</script>");
                } catch (Exception erro) {
                    out.print("<p>Ocorreu um erro ao alterar a nota de serviço: " + erro.getMessage() + "</p>");
                }
            }
            out.println("</body>");
            out.println("</html>");

        } catch (NumberFormatException e) {
            out.print("<p>Ocorreu um erro ao processar o valor monetário: " + e.getMessage() + "</p>");
        } finally {
            out.close();
        }
    }

    // Método para limpar e converter o valor monetário
    private double limparValorMonetario(String valor) throws NumberFormatException {
        if (valor == null || valor.isEmpty()) {
            throw new NumberFormatException("Valor nulo ou vazio");
        }
        // Remove qualquer caractere que não seja dígito, ponto ou vírgula
        valor = valor.replaceAll("[^\\d,.]", "").replace(",", ".");
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
        return "Servlet para alterar um serviço existente";
    }
}
