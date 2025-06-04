package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UsuarioDAO extends DataBaseDAO {

    public UsuarioDAO() throws Exception {
    }

    public void inserir(Usuario usuario) throws Exception {
    PreparedStatement pst;
    String sql = "INSERT INTO usuario(id_perfil, nome, login, senha, email) "
                + "VALUES(?, ?, ?, ?, ?)";
    pst = conn.prepareStatement(sql);
    pst.setInt(1, usuario.getId_perfil());
    pst.setString(2, usuario.getNome());
    pst.setString(3, usuario.getLogin());
    pst.setString(4, usuario.getSenha());
    pst.setString(5, usuario.getEmail());
    pst.execute();
}


    public ArrayList<Usuario> listar() throws Exception {
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM usuario";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Usuario u = new Usuario();
            PerfilDAO pDB = new PerfilDAO();
            Perfil p = new Perfil();
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setLogin(rs.getString("login"));
            u.setSenha(rs.getString("senha"));
            u.setEmail(rs.getString("email"));
            u.setId_perfil(rs.getInt("id_perfil"));
            pDB.conectar();
            p = pDB.carregaPorId(u.getId_perfil());
            pDB.desconectar();
            u.setPerfil(p);
            lista.add(u);
        }

        return lista;
    }

    public void excluir(Usuario usuario) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM usuario WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, usuario.getId());
        pst.execute();
    }

    public Usuario carregaPorId(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM usuario WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Usuario u = new Usuario();
        if (rs.next()) {
            u.setId(rs.getInt("id"));
            u.setId_perfil(rs.getInt("id_perfil"));
            u.setLogin(rs.getString("login"));
            u.setNome(rs.getString("nome"));
            u.setSenha(rs.getString("senha"));
            u.setEmail(rs.getString("email"));
            PerfilDAO pDB = new PerfilDAO();
            Perfil p = new Perfil();
            pDB.conectar();
            p = pDB.carregaPorId(u.getId_perfil());
            pDB.desconectar();
            u.setPerfil(p);
        }
        return u;
    }

    public void alterar(Usuario usuario) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE usuario SET id_perfil=?,nome=?,login=?,senha=?,"
                + "email=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, usuario.getId_perfil());
        pst.setString(2, usuario.getNome());
        pst.setString(3, usuario.getLogin());
        pst.setString(4, usuario.getSenha());
        pst.setString(5,usuario.getEmail());
        pst.setInt(6, usuario.getId());
        pst.execute();
    }

    public Usuario logar(String login, String senha) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM usuario WHERE login=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, login);

        rs = pst.executeQuery();
        Usuario u = new Usuario();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                
                u.setId(rs.getInt("id"));
                u.setId_perfil(rs.getInt("id_perfil"));
                u.setLogin(rs.getString("login"));
                u.setNome(rs.getString("nome"));
                u.setSenha(rs.getString("senha"));
                u.setEmail(rs.getString("email"));
               
                
                PerfilDAO pDB = new PerfilDAO();
                pDB.conectar();
                Perfil p = pDB.carregaPorId(u.getId_perfil());
                pDB.desconectar();
                
                u.setPerfil(p);
            }
        }
        return u;
    }
    // Novo método para obter os dados do usuário logado
    public Usuario getDadosUsuarioLogado(String login) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM usuario WHERE login=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, login);

        rs = pst.executeQuery();
        Usuario u = null;
        if (rs.next()) {
            u = new Usuario();
            u.setId(rs.getInt("id"));
            u.setId_perfil(rs.getInt("id_perfil"));
            u.setLogin(rs.getString("login"));
            u.setNome(rs.getString("nome"));
            u.setSenha(rs.getString("senha"));
            u.setEmail(rs.getString("email"));
            PerfilDAO pDB = new PerfilDAO();
            pDB.conectar();
            Perfil p = pDB.carregaPorId(u.getId_perfil());
            pDB.desconectar();
            u.setPerfil(p);
        }
        return u;
    }
}
    

