
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PerfilDAO extends DataBaseDAO {

    public PerfilDAO() throws Exception {
    }

    public void excluir(Perfil perfil) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM perfil WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, perfil.getId());
        pst.execute();
    }

    public ArrayList<Perfil> listar() throws Exception {
        ArrayList<Perfil> lista = new ArrayList<Perfil>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM perfil";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Perfil p = new Perfil();
            p.setId(rs.getInt("id"));
            p.setPerfil(rs.getString("perfil"));
            lista.add(p);
        }

        return lista;
    }

    public void inserir(Perfil perfil) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO perfil (perfil) VALUES(?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, perfil.getPerfil());
        pst.execute();
    }

    public Perfil carregaPorId(int id) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM perfil WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Perfil p = new Perfil();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setPerfil(rs.getString("perfil"));
        }
        return p;
    }

    public void alterar(Perfil perfil) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE perfil SET perfil=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, perfil.getPerfil());
        pst.setInt(2, perfil.getId());
        pst.execute();
    }

    public ArrayList<Menu> menusVinculados(int id_perfil) throws Exception {
        ArrayList<Menu> lista = new ArrayList<Menu>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM menu WHERE id IN(SELECT id_menu FROM menu_perfil WHERE id_perfil=?)";
        pst = conn.prepareStatement(sql);

        pst.setInt(1, id_perfil);

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

    public ArrayList<Menu> menusDesvinculados(int id_perfil) throws Exception {
        ArrayList<Menu> lista = new ArrayList<Menu>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM menu WHERE id NOT IN(SELECT id_menu FROM menu_perfil WHERE id_perfil=?)";
        pst = conn.prepareStatement(sql);

        pst.setInt(1, id_perfil);

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

    public void vincularMenu(int id_menu, int id_perfil) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO menu_perfil (id_menu,id_perfil) VALUES(?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id_menu);
        pst.setInt(2, id_perfil);
        pst.execute();
    }

    public void desvincularMenu(int id_menu, int id_perfil) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM menu_perfil WHERE id_menu=? AND id_perfil=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id_menu);
        pst.setInt(2, id_perfil);
        pst.execute();
    }
}
