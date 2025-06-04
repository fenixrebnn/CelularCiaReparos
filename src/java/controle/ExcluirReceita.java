package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Receita;
import modelo.ReceitaDAO;


public class ExcluirReceita extends HttpServlet {

     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ExcluirReceita</title>");
            out.println("</head>");
            out.println("<body>");
            String id = request.getParameter("id");
            if (id == null || id.equals("")) {
                out.print("Uma receita deve ser selecionado!");
            } else {
                try {
                    Receita r = new Receita();
                    r.setId(Integer.parseInt(id));
                    ReceitaDAO rDB = new ReceitaDAO();
                    rDB.conectar();
                    rDB.excluir(r);
                    rDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Receita excluído com sucesso!!');");
                    out.print("location.href='listar_receita.jsp';");
                    out.print("</script>");

                }  catch (Exception erro) {
                    out.print("Erro ao excluir receita: " + erro.getMessage());
                }

            }
            out.println("</body>");
            out.println("</html>");

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
        return "Servlet para excluir uma receita";
    }
}
