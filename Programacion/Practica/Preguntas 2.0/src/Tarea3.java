import java.util.Scanner;//es scanner va siempre encima de la clase
public class Tarea3 {

    public static void main(String [] args){
/*tasca3
        //crear el scanner
        Scanner teclado = new Scanner(System.in);

        double numeroReal;
        int numeroEntero;

        //peticion de info
        System.out.print("Introduzca un numero real: ");
        numeroReal = teclado.nextDouble();

        System.out.print("Introduzca un numero entero: ");
        numeroEntero = teclado.nextInt();


        //introducir los calculos
        double division = numeroReal/numeroEntero;
        int parteEntera = (int) division;
        int modulo = parteEntera % numeroEntero;

        System.out.println("\n------------------------------------");
        System.out.println("La division es: " + division);
        System.out.println("El modulo es: " + modulo);

tasca 4 */
        Scanner teclado = new Scanner(System.in);// activar el scanner del teclado
        double gradosCentigrados;//variable grados centigrados

        System.out.printf("Introduce los grados: ");
        gradosCentigrados =teclado.nextDouble();// escaneo de teclado


        double gradosFahrenheit = 9.0 / 5.0 * gradosCentigrados + 32; //variable grados Fahrenheit y la formunla de la conversion
        System.out.printf("La conversionde de %.1fºC es %.4fºF.", gradosCentigrados,gradosFahrenheit);// %:1f es la primera variable con 1 decimal, %.4f es la segunda variable con 4 decimales.

 /*tasca5
        Scanner teclado = new Scanner(System.in);// activacion de escaner

        //declarar variable
        String  nombre;
        byte edad;
        double estatura;

        // escaneo de teclado
        System.out.printf("Introduce tu nombre: ");
        nombre = teclado.nextLine();

        System.out.printf("Introduce tu edad: ");
        edad = teclado.nextByte();
        byte suma=(byte) (edad+2);//asignacion del valor de la formula

        System.out.printf("Introduce tu altura: ");
        estatura = teclado.nextDouble();
        double division= estatura/2;//asignacion del valor de la formula


        System.out.println("La edad es: " + suma);
        System.out.println("La estatura es; " + division);
tasca 6
        Scanner teclado = new Scanner(System.in);

        String nombre;

        System.out.printf("Cual es tu nombre? ");
        nombre = teclado.nextLine();

        System.out.println("Hola, " + nombre);

 tasca 7
        Scanner teclado = new Scanner(System.in);


        int quarter=0;
        int dime=0;
        int nickel=0;
        int penny=0;
        int suma=0;
        double totalDolares;

        System.out.printf("Cuantos quarters: ");
        quarter = teclado.nextInt();
        int quarterTotal=quarter * 25;
        System.out.printf("Cuantos dimes: ");
        dime = teclado.nextInt();
        int dimeTotal=dime*10;
        System.out.printf("Cuantos nicke: ");
        nickel = teclado.nextInt();
        int nickelTotal=nickel *5;
        System.out.printf("Cuantos penny: ");
        penny = teclado.nextInt();
        int pennyTotal=penny*1;

        suma = quarterTotal + dimeTotal + nickelTotal + pennyTotal;
        totalDolares = suma / 100.0;

        System.out.printf("La suma total en dolares es: $%.2f", totalDolares);

tasca 8

        Scanner teclado = new Scanner(System.in); //iniciar el scaner

        //declaracion de variables
        int decenas=0;
        int unidades=0;
        int restoUnidades=0;
        int decenasTotales=0;


        System.out.printf("Cuantas unidades: "); //valor introducido
        unidades = teclado.nextInt();
        decenasTotales = unidades /12;//calculo de la divison
        restoUnidades = unidades % 12;// la (%) da el resultado del sobrante de la division

        System.out.println("Las decenas son: " + decenasTotales);
        System.out.println("Las unidades restantes: " + restoUnidades);

tarea 9
        Scanner teclado = new Scanner(System.in);

        double a=0;
        double b=0;
        double c=0;
        double x=0;
        double y=0;
        double xy=0;


        System.out.printf("Valor de a: ");
        a = teclado.nextDouble();
        System.out.printf("Valor de b: ");
        b = teclado.nextDouble();
        System.out.printf("Valor de c: ");
        c = teclado.nextDouble();
        System.out.printf("Valor de x: ");
        x = teclado.nextDouble();

        y = (a * x * x)+ (b *x) + c;


        System.out.println("El valor de y es: " + y);

 */


    }
}