

import java.util.Random;

public class Main {

    public static void main(String[] args) {

        final int NUM_NOTES = 3;

        int notaA;
        int notaB;
        int notaC;

        Random rand = new Random(); // per calcular números aleatoris

        // Calcular les notes aleartòriament:
        notaA = rand.nextInt(10);
        notaB = rand.nextInt(10);
        notaC = rand.nextInt(10);

        double mitjana = (notaA + notaB + ((double) notaC / NUM_NOTES));

        System.out.println(
                "\nnota A: " + notaA +
                "\nNota B: " + notaB +
                "\nNota C " + notaC +
                "\nMitjana de les notes: " + mitjana);


    }
}