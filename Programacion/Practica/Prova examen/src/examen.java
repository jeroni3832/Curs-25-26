import java.util.Arrays;


public class examen {
    public static void main(String[] args) {
//1. Método que pida un array para sacar la media aritmétrica.
//2. Otro metedo que precise de un array ( Dentro de estos métodos haces el proceso para obtener el resultado cuando se quiera ejecutar).
//3. Del método anterior sacar la nota mínima del Array
//4. Comprovar si el Array està ordenado con un bucle comprovando si una falla la condición boolean
//5. Hacer lo mismo que antes pero comparando los impares de forma descendente
//6. Hacer una nueva matrz con los numeros invertidos buscando el ultimo y ponerlo al principio con un bucle
//7. Método que pida un número y con un blucle averiguar si esta dentro del Array
//8. De una posicion dada, crea un metodo que intercanvien los números (el que se ha dado y el mas grande desde este hasta el principio      del array).


        int[] numArray= {1,2,3,4,5};

        System.out.println(mitjaAritmetica(numArray));

    }

    public static float mitjaAritmetica(int[] matriu) {
        float k = 0;

        for (int i = 0; i < matriu.length; i++) {
            k= matriu [i] + k;


        }


        return k / matriu.length;
    }
}