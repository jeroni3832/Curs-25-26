public class Tarea {

    public static void main(String [] args){
/* tasca1
        String firstName = new String ("Jony"); // declarar un string
tasca 2
        String firstName = ("Jony"); // declaracion
tasca 3
        String s1 = ("John");
        String s2 = ("Leavings");
        String s3 = s1 + " " + s2; // declarar s3 con los valores de s1 y s2 con un espacion" "
        System.out.println(s3);

 tasca 4
        String s1 = ("John");
        String s2 = ("Leavings");
        String s3 = s1;
        s3 = s3.concat(" ");// concatenar el espacio
        s3= s3.concat(s2);// concatenar s2

        System.out.println(s3);

  tasca 5
        String firstName = ("Jony");
        int stringLength = 0;// crea el contenedor donde guarda el numero
        stringLength = firstName.length();// .length cuenta los caractes del firstName y los guarda en el string

        System.out.println(stringLength);


  tasca 6

        System.out.println("Baloncesto".length()); // la misma funcion que la tasca 5

tasca 7 //formas de pasar a minisculas un string
        System.out.println("John".toLowerCase());

        String firstName = "John";
        System.out.println(firstName.toLowerCase());

 tasca 8
        System.out.println("John".toUpperCase()); // pasar texto a mayusculas

 tasca 12
        String s1= "hola", s2= "adio";
        boolean x;

        x = s1.equals(s2);// el equals tiene que ir entre lo que deseas comparar
        System.out.println(x);

tasca 15

        String name= "Mary had a little lamb";
        int result= name.indexOf("i"); // buscar la ubicacion de un caracter
        System.out.println("La posicion es:" + result);

        // Version corta sin el int.
        System.out.println("La posicion es: " + name.indexOf("i"));
       // Todo en una linea
        System.out.println("Mary had a little lamb" .indexOf("i"));


 tasca 16


        String  name= "Mary had a little lamb";
        int posicion1= name.indexOf("a"); // buscar la ubicacion de un caracter

        int posicion2= name.indexOf("a", (posicion1 + 1)); //
        System.out.println("La posicion es: " + posicion2);

tasca 17
        String name= "Mary had a little lamb, little lamb, little lamb, Mary had a little lamb that was as white as snow";
        // sin usar el length sale lo mismo al poner el "+ 1"
        int posicion1= name.indexOf("as");
        int posicion2= name.indexOf("as", (posicion1 + 1));
        System.out.println("La posicion es: " + posicion2);


        int posicion3= name.indexOf("as");
        int finals1= posicion3 + "as".length();
        int posicion4= name.indexOf("as", finals1);
        System.out.println("La posicion es: " + posicion4);

tasca 18 //imprimir la ultima parabra ante de()

        String name= "Mary had a little lamb,\n little lamb,\n little lamb,\n Mary had a little lamb that was as white as snow";
        int lastposition= name.lastIndexOf("little");
        System.out.println("La ultima posicion: " + lastposition);

 tasca 19//imprimir la ultima letra antes de()
        String name= "Mary had a little lamb,\n little lamb,\n little lamb,\n Mary had a little lamb that was as white as snow";
        int lastposition= name.lastIndexOf("w");
        System.out.println("La ultima posicion: " + lastposition);

 tasca 20// sustituir una palabra en un texto string inmutable
        String name= "Mary had a little lamb,\n little lamb,\n little lamb,\n Mary had a little lamb that was as white as snow".replace("little", "big big");// se remplaza un texto
        System.out.println("resultado " + name);

 tasca 21 // eliminar una palabra y dejar el sitio vacio
        String name= "Mary had a little lamb,\n little lamb,\n little lamb,\n Mary had a little lamb that was as white as snow".replace("little","");
        System.out.println(name);

 tasca 22
        String number = "111-222-3333";
        String pre = number.substring(0, 3); //aqui uso numero para indicar donde buscar
        System.out.println("prefijo: "+ pre);

tasca 23
        String number = "111-222-3333";
        String pre = number.substring(4);//aqui uso numero para indicar donde buscar
        System.out.println("prefijo: "+ pre);

 tasca24
        String number = "111-222-3333";
        int inicioLetra= 4;// indicas el inicio
        int numeroSelec= 3;// la cantidad deseada
        String numCentral= number.substring(4, inicioLetra + numeroSelec);// dices donde empezar y despues dices donde empezar y donde finalizar
        System.out.println("numero central: "+ numCentral);

tasca 25 // formas de buscar la ultima posicion
        String number = "111-222-3333";
        int positionLast= number.lastIndexOf("1");
        System.out.println("Posicion anterior : "+ positionLast);


        String phoneNumber = "111-222-3333";
        int lastSearchPosition = 2;
        int foundPosition = phoneNumber.lastIndexOf('1', lastSearchPosition);
        System.out.println("la posicion",+ foundPosition);

tasca 26
        String name=" how are you? ";
        System.out.println(name.trim() + "X");// sirver si solo lo vas a usar una vez si no conviene crear una variable "X"

 tasca27

        String name=">>>>>>How are you<<<<<<";
        String name1=name.replace(">","");//primera remplazo asignado name1
        name1=name1.replace("<", "");// segundo resplazo y se asigna a mismo string
        System.out.println(name1);

tasca 28

        String name="Mary had a little lamb,\nlittle lamb,\nlittle lamb,\nMary had a little lamb that was as white as snow";
        int startPos= name.indexOf("\n") +1;//decir donde el inicio
        String namePos= name.substring(startPos);// decir donde recortar y guardar en string
        int endPos= namePos.indexOf("\n");//decir donde finaliza
        String nameEnd= namePos.substring(0, (endPos + 1));//decir donde cortar y guardar el string
        int finalPos= namePos.indexOf("lamb");// dar la posicion de lamb
        System.out.println(finalPos);

 tasca 29
        String s1="Mary", s2="had", s3="a", s4="little", s5="lamb";
        System.out.printf("%10s\n", s1);//se usa"%" para decir que va la variable, el 10 es el ancho y la s el tipo de variable
        System.out.printf("%10s\n", s2);
        System.out.printf("%10s\n", s3);
        System.out.printf("%10s\n", s4);
        System.out.printf("%10s\n", s5);
 tasca 30
        String s1="Mary", s2="had", s3="a", s4="little", s5="lamb";
        System.out.printf("|%10s|\n", s1);
        System.out.printf("|%10s|\n", s2);
        System.out.printf("|%10s|\n", s3);
        System.out.printf("|%10s|\n", s4);
        System.out.printf("|%10s|\n", s5);

 */
        String s1="Mary", s2="had", s3="a", s4="little", s5="lamb";
        String s = "";// creacion de un contendedor vacio
        s = s + String.format("|%10s|\n", s1);// asignacion de la variame en el contador" con las indicaciones expecificas |(%variabe)(10ancho)(s tipo variable)| y los caracteres expecificos"
        s = s + String.format("|%10s|\n", s2);
        s = s + String.format("|%10s|\n", s3);
        s = s + String.format("|%10s|\n", s4);
        s = s + String.format("|%10s|\n", s5);
        System.out.println(s);

    }
}
