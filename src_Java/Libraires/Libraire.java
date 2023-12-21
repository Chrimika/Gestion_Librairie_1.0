package Libraires;

import Personne.Personne;

public class Libraire extends Personne {
    private int salaire;
    public int getSalaire(){
        return salaire;
    }
    public void setSalaire(int salaire){
        this.salaire = salaire;
    }
    public Libraire(String nom, String Tel, String email, int salaire){
        super(nom, Tel, email);
        this.salaire = salaire;
    }
}
