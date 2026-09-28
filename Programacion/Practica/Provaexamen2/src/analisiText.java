public class analisiText {
    
    private static char[] delimitador = convertirLetra(" -,.!?'" );



    public static void main(String [] args){

        String provaExecucio = "Una noia anomenada Anna va anar a cercar al bosc un home, alla hi va trobar un cec que intentava trobar un figura de metall d'un cuc ben rar. Astorada li va dir que si no ho intentava amb un radar no crec que el trobis. Amb un aparell d'aquests que fan pipiripip segur que el trobraras encara que estigui ben tapat !";




        char[] arrayFiltrado = convertirLetra(provaExecucio);
        imprimirChar(arrayFiltrado);
        System.out.println();

        imprimirChar(delimitador);
        System.out.println();
        System.out.println(esDelimitador( arrayFiltrado,  5));


        System.out.println(posicioInici(arrayFiltrado, 8));

        System.out.println(longitudParaula(arrayFiltrado, 1));



    }
    public static char [] convertirLetra(String provaExecucio){

        String fraseMinusculas = provaExecucio.toLowerCase();

        char [] matriuChars = new char[fraseMinusculas.length()];

        for (int i = 0; i < matriuChars.length; i++){
            matriuChars[i] = fraseMinusculas.charAt(i);
        }

        return matriuChars;

    }

    //3

    public static void imprimirChar(char[] matriuChars) {


        for (int i = 0; i < matriuChars.length; i++) {
            System.out.print(matriuChars[i]);

        }

    }
    //4

    public static boolean esDelimitador(char[] matriuChars, int k ) {

        for (int i = 0; i < delimitador.length; i++) {

            if (matriuChars[k] == delimitador[i]) {
                return true;
            }

        }
        return false;
    }
    //5
    public static boolean posicioInici(char[] matriuChars, int k){

            if(k<0 || k>=matriuChars.length){
                return false;
            }
            if(esDelimitador(matriuChars,k)){
                return false;
            }
            if(k ==0){
                return true;
            }
           return esDelimitador( matriuChars, k - 1);

    }
//6
    public static int longitudParaula(char [] matriuChars, int k){

        int pos=0;

        for(int i = 0; i < matriuChars.length; i++){

           if()


        }


    }

}
