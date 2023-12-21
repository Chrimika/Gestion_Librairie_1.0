package Commandes;

import java.sql.Date;

public class Commande {
    private int id;
    private Date dateCommande;
    private int Prix;
    private int Qte;
    private String etat;
    private int idClient;
    private int idLivre;

    public Commande(int id, Date dateCommande, int Prix, int Qte, String etat, int idClient, int idLivre){
        this.dateCommande = dateCommande;
        this.id = id;
        this.Prix = Prix;
        this.etat = etat;
        this.Qte = Qte;
        this.idClient = idClient;
        this.idLivre = idLivre;
    }
}
