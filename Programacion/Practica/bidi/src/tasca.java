public class tasca {

    public static void main(String[] args) {


        String [][] horario = new String[3][5];



        // FILA 0: Dias
        horario[0][0] = "Dilluns";
        horario[0][1] = "Dimarts";
        horario[0][2] = "Dimecres";
        horario[0][3] = "Dijous";
        horario[0][4] = "Divendres";

        // FILA 1: Berena
        horario[1][0] = "Poma";
        horario[1][1] = "Yogur";
        horario[1][2] = "Pam boli";
        horario[1][3] = "Taso de llet";
        horario[1][4] = "Napolitana";

        // FILA 2: Dinar
        horario[2][0] = "Macarrons";
        horario[2][1] = "Arros";
        horario[2][2] = "Llom a la pimienta";
        horario[2][3] = "Truita de patates";
        horario[2][4] = "Espagetis carbonara";




        // Recorre las FILAS (horario.length = 3)
        for (int i = 0; i < horario.length; i++) {


            // Recorre las COLUMNAS (horario[i].length = 5)
            for (int j = 0; j < horario[i].length; j++) {


                System.out.printf("%-20s", horario[i][j]);
            }

            // Salto de línea: Esto se ejecuta al terminar todas las columnas de una fila
            System.out.println();


        }
    }
}