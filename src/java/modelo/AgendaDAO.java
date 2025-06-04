package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.SQLException;


  public class AgendaDAO extends DataBaseDAO {

    public AgendaDAO() throws Exception {
    }
      
      
    public void inserir(Agenda agenda) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO agenda (id_usuario,marca_modelo_celular"
                + ",problema,data_conserto) "
                + "VALUES(?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, agenda.getId_usuario());
        pst.setString(2, agenda.getMarcaModeloCelular());
        pst.setString(3, agenda.getProblema());
        pst.setDate(4, new Date(agenda.getDataConserto().getTime()));  
        pst.execute();
    }
 
      
    public ArrayList<Agenda> listar() throws Exception {
        ArrayList<Agenda> lista = new ArrayList<Agenda>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM agenda ORDER BY id ASC ";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Agenda a = new Agenda();
            UsuarioDAO uDB = new UsuarioDAO();
            Usuario u = new Usuario();
            a.setId(rs.getInt("id"));
            a.setId_usuario(rs.getInt("id_usuario"));
            a.setProblema(rs.getString("problema"));
            a.setMarcaModeloCelular(rs.getString("marca_modelo_celular"));
            a.setDataConserto(rs.getDate("data_conserto"));
            uDB.conectar();
            u = uDB.carregaPorId(a.getId_usuario());
            uDB.desconectar();
            a.setUsuario(u);
            lista.add(a);
        }

        return lista;
    }


    public void excluir(Agenda agenda) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM agenda WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, agenda.getId());
        pst.execute();
    }

    public Agenda carregaPorId(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM agenda WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
       Agenda a = new Agenda();
        if (rs.next()) {
            a.setId(rs.getInt("id"));
            a.setId_usuario(rs.getInt("id_usuario"));
            a.setProblema(rs.getString("problema"));
            a.setMarcaModeloCelular(rs.getString("marca_modelo_celular"));
            a.setDataConserto(rs.getDate("data_conserto"));
            UsuarioDAO uDB = new UsuarioDAO();
            Usuario u = new Usuario();
            uDB.conectar();
            u = uDB.carregaPorId(a.getId_usuario());
            uDB.desconectar();
            a.setUsuario(u);
            
        }
        return a;
    }

    public void alterar(Agenda agenda) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE agenda SET id_usuario=?,  "
                + "marca_modelo_celular=?,problema=?, data_conserto=? "
                + "WHERE id=?";

        pst = conn.prepareStatement(sql);
        pst.setInt(1, agenda.getId_usuario());
        pst.setString(2, agenda.getMarcaModeloCelular());
        pst.setString(3, agenda.getProblema());
        pst.setDate(4, new Date(agenda.getDataConserto().getTime())); 
        pst.setInt(5, agenda.getId());
        pst.execute();
    }
}

