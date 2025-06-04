package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReceitaDAO extends DataBaseDAO {

    public ReceitaDAO() throws Exception {
    }

    public void inserir(Receita receita) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO receita (id_servico, valor_servico, custo_pecas, lucro) VALUES (?, ?, ?, ?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, receita.getId_servico());
        pst.setDouble(2, receita.getValorServico());
        pst.setDouble(3, receita.getCustoPecas());
        pst.setDouble(4, receita.getLucro());
        pst.execute();
    }

    public ArrayList<Receita> listar() throws Exception {
        ArrayList<Receita> lista = new ArrayList<Receita>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM receita ORDER BY id ASC";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Receita r = new Receita();
            ServicoDAO  sDB = new ServicoDAO();
            Servico s = new Servico();
            r.setId(rs.getInt("id"));
            r.setId_servico(rs.getInt("id_servico"));
            r.setValorServico(rs.getDouble("valor_servico"));
            r.setCustoPecas(rs.getDouble("custo_pecas"));
            r.setLucro(rs.getDouble("lucro"));
            sDB.conectar();
            s = sDB.carregaPorId(r.getId_servico());
            sDB.desconectar();
            r.setServico(s);
            lista.add(r);
        }
        return lista;
    }

    public void excluir(Receita receita) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM receita WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, receita.getId());
        pst.execute();
    }

    public Receita carregaPorId(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM receita WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Receita receita = new Receita();
        if (rs.next()) {
            receita.setId(rs.getInt("id"));
            receita.setId_servico(rs.getInt("id_servico"));
            receita.setValorServico(rs.getDouble("valor_servico"));
            receita.setCustoPecas(rs.getDouble("custo_pecas"));
            receita.setLucro(rs.getDouble("lucro"));
        }
        return receita;
    }

    public void alterar(Receita receita) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE receita SET id_servico=?, valor_servico=?, "
                + "custo_pecas=?, lucro=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, receita.getId_servico());
        pst.setDouble(2, receita.getValorServico());
        pst.setDouble(3, receita.getCustoPecas());
        pst.setDouble(4, receita.getLucro());
        pst.setInt(5, receita.getId());
        pst.execute();
    }
}
