import java.util.Scanner;

public class Prova1 {
    public static void main (String[] args){
        Scanner teclado = new Scanner(System.in);
        int añoNacimiento;


        System.out.println("Cuantos años tienes");
        int añosActu=teclado.nextInt();
        System.out.println("cual es ti dia de cumple: ");
        int dia=teclado.nextInt();
        if(dia <= 31 && dia >= 1){

        }
        System.out.println("cual es tu mes de cumple: ");
        int mes=teclado.nextInt();
        System.out.println("que dia es hoy ");
        int diaActu=teclado.nextInt();
        System.out.println("que mes estamos hoy ");
        int mesActu=teclado.nextInt();
        System.out.println("Que años estamos: ");
        int año= teclado.nextInt();
        añoNacimiento = año - añosActu;

        if(mesActu == mes && diaActu < dia || mesActu<mes) {

            añoNacimiento--;


        }
        System.out.println( añoNacimiento);


        }
}
