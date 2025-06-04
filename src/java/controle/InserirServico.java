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

public class InserirServico extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Inserir Servico</title>");
            out.println("</head>");
            out.println("<body>");

            // Captura os parâmetros do formulário
            int idAgenda = Integer.parseInt(request.getParameter("id_agenda"));
            String diagnostico = request.getParameter("diagnostico");
            Date dataEntrega = Date.valueOf(request.getParameter("data_entrega"));  // Convertendo a data para o tipo Date
            double preco = limparValorMonetario(request.getParameter("preco"));

            // Valida os parâmetros
            if (idAgenda <= 0) {
                out.print("O campo ID da Agenda deve ser preenchido com um valor positivo!");
                return;
            }
            if (diagnostico == null || diagnostico.isEmpty()) {
                out.print("O campo Diagnóstico deve ser preenchido!");
                return;
            }
            if (dataEntrega == null) {
                out.print("O campo Data de Entrega deve ser preenchido corretamente!");
                return;
            }
            if (preco <= 0) {
                out.print("O campo Preço deve ser preenchido com um valor positivo!");
                return;
            }

            try {
                // Cria um objeto Servico com os dados recebidos
                Servico servico = new Servico();
                servico.setId_agenda(idAgenda);
                servico.setDiagnostico(diagnostico);
                servico.setDataEntrega(dataEntrega);
                servico.setPreco(preco);

                // Insere o serviço no banco de dados
                ServicoDAO servicoDAO = new ServicoDAO();
                servicoDAO.conectar();
                servicoDAO.inserir(servico);
                servicoDAO.desconectar();

                // Exibe uma mensagem de sucesso
                out.print("<script language='javascript'>");
                out.print("alert('Nota de Serviço inserida com sucesso!');");
                out.print("location.href='listar_servico.jsp';");
                out.print("</script>");
            } catch (NumberFormatException e) {
                out.print("Erro na conversão dos dados numéricos. Verifique o campo Preço.");
            } catch (Exception e) {
                out.print("Erro ao inserir o serviço: " + e.getMessage());
            }

            out.println("</body>");
            out.println("</html>");
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
        return "Servlet para inserir um novo serviço";
    }
}
