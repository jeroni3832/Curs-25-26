public class Activitat {

    public static void main(String args []){
/*
    int x= 5;
    int y=7;
    boolean resul;


    resul= x==y;

    System.out.println("Es 5 igual a 7? " + resul);


    resul= x > y;

    System.out.println("Es 5 es mayor que 7? " + resul);

    resul= x < y;

    System.out.println("Es 5 es menor que 7? " + resul);

    resul= x >= y;

    System.out.println("Es 5 es mayor o igual que 7? " + resul);

    resul= x <= y;

    System.out.println("Es 5 es menor o igual que 7? " + resul);

    resul= x != y;

    System.out.println("Es 5 no es igual que 7? " + resul);

    resul= !(x > y);

    System.out.println("Es 5 no mayor que 7? " + resul);



    boolean x= false, y= true;
    boolean resul= x == y;

    System.out.println(resul);



        int x = 5;
        int y = 7;
        Boolean r1, r2, r3;

        r1= ((x > 1 ) && (y > 1));
        r2= ((x >6 ) && (y > 7));
        r3= ((x > 15) && (y > 15));

        System.out.println("resultado 1: " + r1 );
        System.out.println("resultado 1: " + r2 );
        System.out.println("resultado 1: " + r3 );

        boolean resul;
        int x,y;

        x=1; y=1; resul=((x > 5) && (y > 7)); System.out.println("resultado: " +resul);
        x=6; y=7; resul=((x > 5) && (y > 7)); System.out.println("resultado: " +resul);
        x=15; y=15; resul=((x > 5) && (y > 7)); System.out.println("resultado: " +resul);



        boolean result;
        int x,y;
        x = 6; y = 0; result = ((x >= 5) && (y != 0)); System.out.println(result);
        x = 5; y = 0; result = ((x >= 5) && (y != 0)); System.out.println(result);
        x = 4; y = 1; result = ((x >= 5) && (y != 0)); System.out.println(result);
        x = 7; y = 2; result = ((x >= 5) && (y != 0)); System.out.println(result);


        boolean result;
        int x,y;
        x = 5; y = 5; result = ((x >= 5) ^ (y > 5)); System.out.println(result);
        x = 6; y = 6; result = ((x >= 5) ^ (y > 5)); System.out.println(result);
        x = 3; y = 3; result = ((x >= 5) ^ (y > 5)); System.out.println(result);
        x = 1; y = 10; result = ((x >= 5) ^ (y > 5)); System.out.println(result);
        x = 10; y = 1; result = ((x >= 5) ^ (y > 5)); System.out.println(result);


        boolean resul;
        int x, y, z;

        x = 5; y = 16; z = 25; resul=((x > 5) || (y > 15) || (z <= 25)); System.out.println("resultado: " +resul);
        x = 5; y = 16; z = 24; resul=((x > 5) || (y > 15) || (z <= 25)); System.out.println("resultado: " +resul);
        x = 5; y = 15; z = 24; resul=((x > 5) || (y > 15) || (z <= 25)); System.out.println("resultado: " +resul);
        x = 4; y = 5; z = 30; resul=((x > 5) || (y > 15) || (z <= 25)); System.out.println("resultado: " +resul);


        boolean resul;
        int x, y, z;

        x = 5; y = 14; z =20; resul= ((x >= 5) && (y < 15) ||(z <15));System.out.println("resultado: " +resul);
        x = 5; y = 15; z =13; resul= ((x >= 5) && (y < 15) ||(z <15));System.out.println("resultado: " +resul);
        x = 5; y = 10; z =10; resul= ((x >= 5) && (y < 15) ||(z <15));System.out.println("resultado: " +resul);
        x = 4; y = 5; z =230; resul= ((x >= 5) && (y < 15) ||(z <15));System.out.println("resultado: " +resul);


        int x= 5;
        int y =15;
        int z=15;

        boolean subResult01 = x >= 5;
        boolean subResult02 = ((y < 14) || (z < 20));
        boolean result = (subResult01 && subResult02);

        System.out.println("resultado: " + result);

 */

        boolean resul;

        int x, y, z;

        x = 5; y = 14; z =14; resul=((x >= 5) || ((y < 15) ^ (z <15)));System.out.println("resultado: " +resul);
        x = 5; y = 20; z =13; resul=((x >= 5) || ((y < 15) ^ (z <15)));System.out.println("resultado: " +resul);
        x = 6; y = 5; z =30; resul=((x >= 5) || ((y < 15) ^ (z <15)));System.out.println("resultado: " +resul);
        x = 5; y = 20; z =20; resul=((x >= 5) || ((y < 15) ^ (z <15)));System.out.println("resultado: " +resul);





    }

}
