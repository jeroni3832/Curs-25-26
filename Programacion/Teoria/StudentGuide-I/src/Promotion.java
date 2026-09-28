public class Promotion {
    public static void main(String[] args) {
       int num1 = 53; // INT 32 bits
       int num2 = 47; // INT 32 bits
       byte num3; // el resultado no puede ser de tipo menor a int
       num3 = (byte) ( num1 + num2); // con este (byte) se que entra en un byte
       System.out.println(" valor de num2: " + num3);

       short a = 1 ;
       short b = 2 ;
       short c =(short)(a + b); // se pone un short porque el (a + b) java lo interpreta como int
        System.out.println("valer c: " + c);
    }
}
