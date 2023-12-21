package Livres;

import java.sql.Date;
import java.util.HashMap;

public class Livre {
    private int id;
    private String nom;
    private int Prix;
    private String hauteur;
    private Date dateSortie;
    private String categorie;

    public int getId(){
        return id;
    }
    public String getNom(){
        return nom;
    }
    public int getPrix(){
        return Prix;
    }
    public String getHauteur(){
        return hauteur;
    }
    public Date getDateSortie(){
        return dateSortie;
    }
    public String getCategorie(){
        return categorie;
    }

    public Livre(int id, String nom, int Prix, String hauteur, Date dateSortie, String categorie){
        this.id = id;
        this.nom = nom;
        this.Prix = Prix;
        this.dateSortie = dateSortie;
        this.hauteur = hauteur;
        this.categorie = categorie;
    }

}
