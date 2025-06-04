package modelo;

public class Receita {
    private int id;
    private int id_servico;
    private Servico servico;
    private double valorServico;
    private double custoPecas;
    private double lucro;

    public Receita() {
    }

    public Receita(int id, int id_servico, Servico servico, double valorServico,
            double custoPecas, double lucro) {
        this.id = id;
        this.id_servico = id_servico;
        this.servico = servico;
        this.valorServico = valorServico;
        this.custoPecas = custoPecas;
        this.lucro = lucro;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_servico() {
        return id_servico;
    }

    public void setId_servico(int id_servico) {
        this.id_servico = id_servico;
    }

    public Servico getServico() {
        return servico;
    }

    public void setServico(Servico servico) {
        this.servico = servico;
    }

    public double getValorServico() {
        return valorServico;
    }

    public void setValorServico(double valorServico) {
        this.valorServico = valorServico;
    }

    public double getCustoPecas() {
        return custoPecas;
    }

    public void setCustoPecas(double custoPecas) {
        this.custoPecas = custoPecas;
    }

    public double getLucro() {
        return lucro;
    }

    public void setLucro(double lucro) {
        this.lucro = lucro;
    }

  

   
}
