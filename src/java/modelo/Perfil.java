package modelo;

import java.util.ArrayList;

public class Perfil {
    private int id;
    private String perfil;
    ArrayList<Menu> listaVinculados;

    public ArrayList<Menu> getListaVinculados() {
        return listaVinculados;
    }

    public void setListaVinculados(ArrayList<Menu> listaVinculados) {
        this.listaVinculados = listaVinculados;
    }

    public Perfil() {
    }

    public Perfil(int id, String perfil) {
        this.id = id;
        this.perfil = perfil;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    @Override
    public String toString() {
        return getPerfil();
    }
    
}
