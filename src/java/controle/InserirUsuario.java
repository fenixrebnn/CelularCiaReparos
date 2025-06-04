package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;
import modelo.UsuarioDAO;

public class InserirUsuario extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Inserir Usuario</title>");
            out.println("</head>");
            out.println("<body>");

            int id_perfil = Integer.parseInt(request.getParameter("id_perfil"));
            String nome = request.getParameter("nome");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            String email = request.getParameter("email");

            if (nome == null || nome.equals("")) {
                out.print("O campo Nome deve ser preenchido!");
            } else if (login == null || login.equals("")) {
                out.print("O campo Login deve ser preenchido!");
            } else if (senha == null || senha.equals("")) {
                out.print("O campo Senha deve ser preenchido!");
            } else if (email == null || email.equals("")) {
                out.print("O campo Senha deve ser preenchido!");
            } else if (id_perfil<1) {
                out.print("O campo Perfil deve ser preenchido!");
            } else {
                try {
                    Usuario u = new Usuario();
                    u.setId_perfil(id_perfil);
                    u.setNome(nome);
                    u.setLogin(login);
                    u.setSenha(senha);
                    u.setEmail(email);
                    UsuarioDAO uDB = new UsuarioDAO();
                    uDB.conectar();
                    uDB.inserir(u);
                    uDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Usuario inserido com sucesso!!');");
                    out.print("location.href='listar_usuario.jsp';");
                    out.print("</script>");
                } catch (Exception erro) {
                    out.print(erro);
                }

            }

            out.println("</body>");
            out.println("</html>");


        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
