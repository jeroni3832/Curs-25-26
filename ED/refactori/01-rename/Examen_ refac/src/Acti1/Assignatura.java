package Acti1;

public class Assignatura {
    private String nom;
    private arrayLit<HashMap<String, Object>>estudiants;

    public Assignatura(String nom){
        this.nom = nom;
        this.estudiants = new ArrayList<>();
    }
    public void afegirEstudiant(String nom, double qualificacio){
        HashMap<String, Object>estudiant = new HashMap<>();
        estudiant.put("nom", nom);
        estudiant.put("qualificacio", qualificacio);
        estudiants.add(estudiant);
    }

    public double obtenirMitjana(){
        double total = 0;
        for(HashMap<String, Object>estudiant:estudiant){
            total +=(double) estudiant.get("qualificacio");
        }
        return estudiants.isEmpty() ? 0 : total / estudiants.size();
    }
    public static void main(String[] args){
        Assignatura assignatura = new Assignatura("Programacio");
        assignatura.afegirEstudiant("Joan Perez",8.5);
        assignatura.afegirEstudiant("Anna Lopez", 7.2);
        assignatura.mostrarEstudiants();
        System.out.println("Mitjana: "+ assignatura.obtenirMitjana());
    }
}
