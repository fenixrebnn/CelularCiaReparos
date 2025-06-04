package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MenuDAO extends DataBaseDAO {

    public MenuDAO() throws Exception {
       
    }
    

    public void excluir(Menu m) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM menu WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, m.getId());
        pst.execute();
    }

    public ArrayList<Menu> listar() throws Exception {
        ArrayList<Menu> lista = new ArrayList<Menu>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM menu";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setMenu(rs.getString("menu"));
            m.setLink(rs.getString("link"));
            
            lista.add(m);
        }

        return lista;
    }

    public void inserir(Menu m) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO menu (menu,link) VALUES(?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, m.getMenu());
        pst.setString(2, m.getLink());
    
        pst.execute();
    }

    public Menu carregaPorId(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM menu WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Menu m = new Menu();
        if (rs.next()) {
            m.setId(rs.getInt("id"));
            m.setMenu(rs.getString("menu"));
            m.setLink(rs.getString("link"));
        }
        return m;
    }

    public void alterar(Menu m) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE menu SET menu=?, link=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, m.getMenu());
        pst.setString(2, m.getLink());
        pst.setInt(3, m.getId());
        pst.execute();
    }
    
}
