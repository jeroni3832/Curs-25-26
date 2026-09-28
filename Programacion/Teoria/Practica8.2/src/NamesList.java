import java.util.ArrayList;

public class NamesList {

    public ArrayList<String> listOfNames;

        public void setList(){

            listOfNames = new ArrayList<>();
            listOfNames.add("Jeroni");
            listOfNames.add("Marga");
            listOfNames.add("Toni");
            listOfNames.add("Juan");

            System.out.println("lista de nombre: " + listOfNames);
            System.out.println("numero de Array: " + listOfNames.size());
        }
        public void manipulateList(){

            listOfNames.remove("Juan");

            System.out.println("lista de nombre: " + listOfNames);
            System.out.println("numero de Array: " +listOfNames.size());

            listOfNames.add(1,"Juan");

            System.out.println("lista de nombre: " + listOfNames);
            System.out.println("numero de Array: " +listOfNames.size());


        }



}
