package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;

public class ServicoDAO extends DataBaseDAO {

    public ServicoDAO() throws Exception {
    }

    public void inserir(Servico servico) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO servico"
 + "(id_agenda, data_entrega, preco, diagnostico) VALUES(?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, servico.getId_agenda());
        pst.setDate(2, new Date(servico.getDataEntrega().getTime())); 
        pst.setDouble(3, servico.getPreco());
        pst.setString(4, servico.getDiagnostico());
        pst.execute();
    }

    public ArrayList<Servico> listar() throws Exception {
        ArrayList<Servico> lista = new ArrayList<Servico>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM servico ORDER BY id ASC";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Servico s = new Servico();
            AgendaDAO aDB = new AgendaDAO();
            Agenda a = new Agenda();
            s.setId(rs.getInt("id"));
            s.setId_agenda(rs.getInt("id_agenda"));
            s.setDataEntrega(rs.getDate("data_entrega"));
            s.setPreco(rs.getDouble("preco"));
            s.setDiagnostico(rs.getString("diagnostico"));
            aDB.conectar();
            a = aDB.carregaPorId(s.getId_agenda());
            aDB.desconectar();
            s.setAgenda(a);
            lista.add(s);
        }

        return lista;
    }

    public void excluir(Servico servico) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM servico WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, servico.getId());
        pst.execute();
    }

    public Servico carregaPorId(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM servico WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Servico s = new Servico();
        if (rs.next()) {
            s.setId(rs.getInt("id"));
            s.setId_agenda(rs.getInt("id_agenda"));
            s.setDataEntrega(rs.getDate("data_entrega"));
            s.setPreco(rs.getDouble("preco"));
            s.setDiagnostico(rs.getString("diagnostico"));
        }
        return s;
    }

   public void alterar(Servico servico) throws Exception {
    PreparedStatement pst;
    String sql = "UPDATE servico SET id_agenda=?, preco=?, "
                + "diagnostico=?, data_entrega=? WHERE id=?";
    pst = conn.prepareStatement(sql);
    pst.setInt(1, servico.getId_agenda());
    pst.setDouble(2, servico.getPreco());
    pst.setString(3, servico.getDiagnostico());
    pst.setDate(4, new Date(servico.getDataEntrega().getTime()));
    // Certifique-se de que getDataEntrega() retorna um java.util.Date
    pst.setInt(5, servico.getId());
    pst.executeUpdate();
    pst.close();
}


 

    

}
    

