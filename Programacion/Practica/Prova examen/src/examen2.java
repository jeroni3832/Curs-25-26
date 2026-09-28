public class examen2 {
    public static void main(String [] args){
        int[] numArray= {8,2,3,4,5};

        System.out.println(mitjaAritmetica(numArray));
    }

    public static float mitjaAritmetica(int[] matriu) {
        
        int min= matriu [0];
        for (int i = 0; i < matriu.length; i++) {
            if(matriu [i]< min ){
                min = matriu[i];
              
            }


        }


        return  min;
    }
}
