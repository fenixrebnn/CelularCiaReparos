
package modelo;


public class Usuario {
   private int id;
   private int id_perfil;
   private Perfil perfil;
   private String senha;
   private String login;
   private String nome;
   private String email;

   
    
    public Usuario() {
    }
    

    public Usuario(int id, int id_perfil, Perfil perfil, 
    String senha, String login, String nome, String email) {
        this.id = id;
        this.id_perfil = id_perfil;
        this.perfil = perfil;
        this.senha = senha;
        this.login = login;
        this.nome = nome;
      
        this.email =email;
    }

   

    
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_perfil() {
        return id_perfil;
    }

    public void setId_perfil(int id_perfil) {
        this.id_perfil = id_perfil;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
