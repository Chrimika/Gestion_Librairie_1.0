package Rayons;

public class Rayon {
    private int id;
    private int capacite;
    private String libelle;

    public int getId(){
        return id;
    }
    public int getCapacite(){
        return capacite;
    }
    public String getLibelle(){
        return libelle;
    }

    public Rayon(int id, int capacite, String libelle){
        this.id = id;
        this.capacite = capacite;
        this.libelle = libelle;
    }
}
