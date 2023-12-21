package Administrateur;

import Libraires.Libraire;
import Personne.Personne;

import java.sql.*;
import java.util.Scanner;

public class Administrateur extends Personne {
    final String DB_URL = "jdbc:mysql://localhost/gestionlibrairie";
    final String USERNAME = "root";
    final String PASSWORD = "";
    Scanner sc = new Scanner(System.in);
    private String password;
    public String getPassword(){
        return password;
    }
    public void setPassword(String password){
        this.password = password;
    }


    public Administrateur(String nom, String Tel, String email, String password){
        super(nom, Tel, email);
        this.password = password;
        try{
            Connection conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
            //connexion reussie

            Statement stat  = conn.createStatement();
            String sql = "INSERT INTO administrateur (nom, Tel, email, password) VALUES (?,?,?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, nom);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, Tel);
            preparedStatement.setString(4, password);
            int addedRows = preparedStatement.executeUpdate();
            if(addedRows > 0){
                System.out.println("Success");
                stat.close();
                conn.close();
            }else{
                System.out.println("Echec ou deja enregistre");
                stat.close();
                conn.close();
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //Connexion

    public static Administrateur connexion(){
        final String DB_URL = "jdbc:mysql://localhost/gestionlibrairie";
        final String USERNAME = "root";
        final String PASSWORD = "";
        Administrateur administrateur=null;
        Scanner sc = new Scanner(System.in);

        System.out.println("*Connexion*");
        System.out.println("Entrez votre nom svp : ");
        String nom = sc.next();
        System.out.println("Entrez votre password : ");
        String pass = sc.next();

        try{
            Connection conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);

            Statement stat = conn.createStatement();
            String sql = "SELECT * FROM administrateur WHERE nom = ? AND password = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, nom);
            preparedStatement.setString(2, pass);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int idAd = resultSet.getInt("id_admin");
                String nombd = resultSet.getString("nom");
                String tel = resultSet.getString("Tel");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");

                administrateur.setId(idAd);
                 administrateur.setNom(nombd);
                 administrateur.setPassword(password);
                 administrateur.setEmail(email);
                 administrateur.setTel(tel);
                stat.close();
                conn.close();

                 return administrateur;
            }else {
               // System.out.println("Pas trouve");
            }

        }catch (Exception e){
            System.out.println("Error");
        }
        return administrateur;
    }

    //Libraires

    //Creer Admin

    public static Administrateur CreerAdmin(){
        Scanner sc = new Scanner(System.in);

        System.out.println("*Creation Admin*");
        System.out.println("Entrez le nom de l'admin : ");
        String nom = sc.next();
        System.out.println("Entrez le Tel de l'admin : ");
        String Tel = sc.next();
        System.out.println("Entrez l'email de l'admin : ");
        String email = sc.next();
        System.out.println("Entrez le password de l'admin : ");
        String password = sc.next();

        Administrateur admin = new Administrateur(nom, Tel, email, password);
        return admin;
    }

    //Ajout Libraire
    public void AjoutLibraire(Administrateur admin){
        Scanner sc = new Scanner(System.in);
        System.out.println("*Ajout Libraire*");
        System.out.println("Entrez le nom du libraire : ");
        String nom = sc.next();
        System.out.println("Entrez le Tel du libraire : ");
        String Tel = sc.next();
        System.out.println("Entrez l'email du libraire : ");
        String email = sc.next();
        System.out.println("Entrez le salaire du libraire : ");
        int salaire = sc.nextInt();

        try{
            Connection conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
            //connexion reussie


            Statement stat2  = conn.createStatement();
            String sql2 = "SELECT id_admin FROM administrateur WHERE nom = ? AND password = ?";
            PreparedStatement preparedStatement2 = conn.prepareStatement(sql2);
            preparedStatement2.setString(1, admin.getNom());
            preparedStatement2.setString(2, admin.getPassword());
            ResultSet resultSet = preparedStatement2.executeQuery();
            if (resultSet.next()) {
                int id_admin = resultSet.getInt("id_admin");

                Statement stat  = conn.createStatement();
                String sql = "INSERT INTO libraire (nom, Tel, email, salaire, id_admin) VALUES (?,?,?,?,?)";
                PreparedStatement preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, nom);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, Tel);
                preparedStatement.setInt(4, salaire);
                preparedStatement.setInt(4, id_admin);
                int addedRows = preparedStatement.executeUpdate();
                stat.close();
                stat2.close();
                conn.close();
            }
            else{
                System.out.println("Error");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Administrateur administrateur=null;
        Scanner sc = new Scanner(System.in);
        System.out.println("Voulez vous : ");
        System.out.println("1-Creer un compte Admin");
        System.out.println("2-se conecter a un compte Admin");
        int choix = sc.nextInt();
        switch (choix){
            case 1:
                administrateur = Administrateur.CreerAdmin();
                break;
            case 2:
                administrateur = connexion();
                if(administrateur!=null)
                    System.out.println("Bienvenue Mr "+ administrateur.getNom());
                else
                    System.out.println("Non enregistre");
        }
    }
}
