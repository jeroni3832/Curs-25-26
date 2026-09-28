import java.util.Scanner;
public class Prova {

    public static void main (String[] args) {

        Scanner teclado = new Scanner(System.in);
        String respuesta = "";
        String[] listaNombres= new String[3];
        boolean encontrado = false;


        for(int i = 0; i < listaNombres.length; i++) {
            System.out.println("Introduce un nombre:");
            listaNombres[i] = teclado.nextLine();


        }
        System.out.println("Datos guadados");

        System.out.println("Que nombre buscas:");
        String buscar= teclado.nextLine();

       for(int i = 0; i < listaNombres.length; i++){

           if(listaNombres[i].trim().equalsIgnoreCase(buscar)){
               System.out.println("tu nombre es "+ buscar);

               encontrado=true;
               break;
            }
        }
       if(!encontrado){
           System.out.println("No tenemos su busqueda "+ buscar);
       }

     /*   do{
            System.out.println("Por fa vor di tu nombre ");
        String nombre = teclado.nextLine();
        System.out.println("tu nombre es " + nombre);

        System.out.println("Eres estudiente? ");
        String esEstudiante = teclado.nextLine();

        if (esEstudiante.equals("si")) {
            System.out.println("Bienvenido al curso ");

        } else if (esEstudiante.equals("no")) {
            System.out.println("Lo siento no eres estudienta");
        }
        System.out.println("Cual es tu edad? ");
        int edad = teclado.nextInt();
        System.out.println("Tu edad es: " + edad);
        teclado.nextLine();

        System.out.println("¿Quieres introducir otra persona? (si/no)");
        respuesta = teclado.nextLine();
        }
        while(respuesta.equals("si"));
        teclado.nextLine();
        System.out.println("¡Adiós! Programa finalizado.");
*/
    }
}