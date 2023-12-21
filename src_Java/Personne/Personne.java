package Personne;
/*
* getters
* int
 public int get(){
   return ;
 }
*
* String
 public String get(){
   return ;
 }
*
*
* setters
* int
 public void set(int ){
   this. = ;
 }
*
* String
 public void set(String ){
   this. = ;
 }
* */
public class Personne {
    private int id;
    private String nom;
    private String Tel;
    private String email;

    public int getId(){
        return id;
    }
    public String getNom(){
      return nom;
    }
    public String getTel(){
        return Tel;
    }
    public String getEmail(){
        return email;
    }
    public void setId(int id){
        this.id = id;
    }
    public void setNom(String nom){
        this.nom = nom;
    }
    public void setTel(String tel){
        this.Tel = tel;
    }
    public void setEmail(String email){
        this.email = email;
    }

    public Personne(String nom, String Tel, String email){
        this.nom = nom;
        this.Tel = Tel;
        this.email = email;
    }
}
