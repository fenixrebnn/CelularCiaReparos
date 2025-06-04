package modelo;

import java.util.Date;

public class Agenda {
  private int id_usuario;
  private int id;
  private String marcaModeloCelular;
  private String problema;
  private Date dataConserto;
  private Usuario usuario;

    public Agenda() {
    }

    
    public Agenda(int id_usuario, int id, String marcaModeloCelular,
            String problema, Date dataConserto, Usuario usuario) {
        this.id_usuario = id_usuario;
        this.id = id;
        this.marcaModeloCelular = marcaModeloCelular;
        this.problema = problema;
        this.dataConserto = dataConserto;
        this.usuario = usuario;
    }

    
    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMarcaModeloCelular() {
        return marcaModeloCelular;
    }

    public void setMarcaModeloCelular(String marcaModeloCelular) {
        this.marcaModeloCelular = marcaModeloCelular;
    }

    public String getProblema() {
        return problema;
    }

    public void setProblema(String problema) {
        this.problema = problema;
    }

    public Date getDataConserto() {
        return dataConserto;
    }

    public void setDataConserto(Date dataConserto) {
        this.dataConserto = dataConserto;
    }
   
}
