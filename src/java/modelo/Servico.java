
package modelo;

import java.util.Date;


public class Servico {
    private int id;
    private int id_agenda;
    private Agenda agenda;
    private String diagnostico;
    private double preco;
    private Date dataEntrega;

    public Servico() {
    }

    public Servico(int id, int id_agenda, String diagnostico, 
            double preco, Date dataEntrega) {
        this.id = id;
        this.id_agenda = id_agenda;
        this.diagnostico = diagnostico;
        this.preco = preco;
        this.dataEntrega = dataEntrega;
    }

    public Agenda getAgenda() {
        return agenda;
    }

    public void setAgenda(Agenda agenda) {
        this.agenda = agenda;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }
    
    
  
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_agenda() {
        return id_agenda;
    }

    public void setId_agenda(int id_agenda) {
        this.id_agenda = id_agenda;
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public Date getDataEntrega() {
        return dataEntrega;
    }

    public void setDataEntrega(Date dataEntrega) {
        this.dataEntrega = dataEntrega;
    }
    
}
