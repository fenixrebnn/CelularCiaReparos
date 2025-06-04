package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Agenda;
import modelo.AgendaDAO;

public class InserirAgenda extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            // Captura os parâmetros do formulário
            String marcaModeloCelular = request.getParameter("marca_modelo_celular");
            String problema = request.getParameter("problema");
            String dataConsertoStr = request.getParameter("data_conserto");
            int idUsuario = Integer.parseInt(request.getParameter("id_usuario")); // Id do usuário logado

            // Validação dos parâmetros
            if (marcaModeloCelular == null || marcaModeloCelular.isEmpty() ||
                problema == null || problema.isEmpty() ||
                dataConsertoStr == null || dataConsertoStr.isEmpty()) {
                out.print("Todos os campos devem ser preenchidos!");
                return;
            }

            try {
                // Conversão da data de conserto para o formato adequado
                Date dataConserto = Date.valueOf(dataConsertoStr);

                // Cria um objeto Agenda com os dados recebidos
                Agenda agenda = new Agenda();
                agenda.setMarcaModeloCelular(marcaModeloCelular);
                agenda.setProblema(problema);
                agenda.setDataConserto(dataConserto);
                agenda.setId_usuario(idUsuario); // Define o id do usuário logado

                // Insere a agenda no banco de dados
                AgendaDAO agendaDAO = new AgendaDAO();
                agendaDAO.conectar();
                agendaDAO.inserir(agenda);
                agendaDAO.desconectar();

                // Exibe mensagem de sucesso
                out.print("<script language='javascript'>");
                out.print("alert('Agenda inserida com sucesso!');");
                out.print("location.href='agendar_conserto.jsp';");
                out.print("</script>");
            } catch (Exception e) {
                out.print("Erro ao inserir agenda: " + e.getMessage());
            }
        } finally {
            out.close();
        }
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
        return "Servlet para inserir uma nova agenda de conserto";
    }
}
