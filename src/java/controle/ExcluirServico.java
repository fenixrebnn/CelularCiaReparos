package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Servico;
import modelo.ServicoDAO;

public class ExcluirServico extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ExcluirServico</title>");
            out.println("</head>");
            out.println("<body>");
            
            String id = request.getParameter("id");
            if (id == null || id.isEmpty()) {
                out.print("Um Serviço deve ser selecionado!");
            } else {
                try {
                    int servicoId = Integer.parseInt(id);
                    Servico s = new Servico();
                    s.setId(servicoId);
                    ServicoDAO sDB = new ServicoDAO();
                    sDB.conectar();
                    sDB.excluir(s);
                    sDB.desconectar();
                    
                    out.print("<script language='javascript'>");
                    out.print("alert('Nota de Serviço excluída com sucesso!!');");
                    out.print("location.href='listar_servico.jsp';");
                    out.print("</script>");
                } catch (NumberFormatException e) {
                    out.print("ID de Serviço inválido!");
                } catch (Exception erro) {
                    out.print("Erro ao excluir serviço: " + erro.getMessage());
                }
            }

            out.println("</body>");
            out.println("</html>");
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
        return "Servlet para excluir um serviço";
    }
}
