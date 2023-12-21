package Clients;

import Personne.Personne;

public class Client extends Personne {
    private String addresse;
    private int nbrLivresAchete;

    public String getAddresse(){
        return addresse;
    }
    public int getNbrLivresAchete(){
        return nbrLivresAchete;
    }

    public Client(int id, String nom, String Tel, String email, String addresse, int nbrLivresAchete){
        super(nom, Tel, email);
        this.addresse = addresse;
        this.nbrLivresAchete = nbrLivresAchete;
    }

}
