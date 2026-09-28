/*
public class GuessingGame {
    public static void main(String[] args) {
        int randomNum; // No necesita ser inicializada aquí
        int guess;     // Tampoco aquí

        if (args.length == 0 || args[0].equals("help")) {
            // Este es el "Camino A"
            System.out.println("usage: java guessinggame [argument]");

        } else {
            // --- ESTE ES EL "CAMINO B" ---
            // Todo el juego debe ocurrir dentro de esta caja {}.

            randomNum = ((int) (Math.random() * 5) + 1);
            guess = Integer.parseInt(args[0]);

            // ✅ La validación AHORA está DENTRO del 'else',
            // donde 'guess' siempre tiene un valor.
            if (guess < 1 || guess > 5) {
                System.out.println("error mensage");
            } else {
                // La comparación también va dentro.
                if (guess == randomNum) {
                    System.out.println("congratulations ");
                } else {
                    System.out.println("Sorry");
                }
            }
        } // <-- La llave del 'else' principal cierra aquí, englobando todo el juego.
    }
}
*/