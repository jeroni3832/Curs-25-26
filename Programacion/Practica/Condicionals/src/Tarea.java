import java.util.Scanner;
public class Tarea {
    public static void main(String []args) {
/*tasca1
        int x = 5, y = 7;

        if (x > y){
            System.out.println("x es mayor");
        }
        if (y > x){
            System.out.println("y es mayor");
        }
        if (x == y){
            System.out.printf("x es igual a y");
        }

 Tasca 2
        float x =5.77f, y = 7.83f;

        if (x == y){
            System.out.println("son iguales");

        }else if {
        System.out.println("No son iguals");
        }

tarea 3
        int x = 5, y = 7;

        if (x > y){
            System.out.println("X es mayor que Y");
        }else if (x < y) {
            System.out.println("Y es mayor que X");
        }else if (x == y){
            System.out.println("X es igual que Y");
        }

tasca 5

        //solusio meva
        float temp=0f
        if (0 <= 60) {
            System.out.println("Cold enough to wear a coat");
        } else if ((temp >= 60) && (temp <= 68)) {
            System.out.println("Cold enough to wear a jacket");
        } else System.out.println("No outerwear required!");

        //solucio tasca
        float temp=0f;

        if (temp < 60) {
            System.out.println("Cold enough to wear a coat");
        } else if (temp < 68) {
            System.out.println("Cold enough to wear a jacket");
        } else System.out.println("No outerwear required!");

tarea 13

       String mes="febrero";

       switch(mes) {
           case "enero", "marzo", "mayo", "julio", "agosto", "octubre", "diciembre":
               System.out.println("Tiene 31 dias");
               break;
           case "febrero":
               System.out.println("tiene 28 dias");
               break;
           case "abril", "junio", "setiembre", "noviembre":
               System.out.println("tiene 30 dias");
               break;
           default:
               System.out.println("mes erroneo");
               break;

       }


            String tarjeta="plata";

            switch (tarjeta) {
                case "bronce":
                    System.out.println("Habitacion mas los Beneficion de targeta bronce son free parking + newspaper");
                case "plata":
                    System.out.println("Habitacion mas los Beneficion de targeta plata son bronze level features + breakfast");
                case "oro":
                    System.out.println("Habitacion mas los Beneficios de tarjeta oro son silver level features + dinner for one");
                default:
                    System.out.println("Habitacion");

            }

 */

        String customerLevel = "gold"; //hardcoded test value
        customerLevel = customerLevel.toLowerCase(); //for uniformity in processing
        System.out.println("Your benefits are:");
        switch (customerLevel) {
            case "gold":
                System.out.println("\t included dinner for 1");
            case "silver":
                System.out.println("\t included breakfast");
            case "bronze":
                System.out.println("\t free parking");
                System.out.println("\t included newspaper");
            default:
                System.out.println("\t room");

        }
    }
}
