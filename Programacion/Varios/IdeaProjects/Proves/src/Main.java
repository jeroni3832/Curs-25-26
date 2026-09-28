 public class Main {

     public static void main(String[] args) {

         // Creacion d'objecta
         Dog dog1;
         dog1 = new Dog();

         //Assignacio de valors
         dog1.name = "Chitara";
         dog1.age = 13;
         dog1.race = "Pitbul";
         dog1.dangerous = false;


         //*******************

         // Creacion d'objecta
         Cat cat1;
         cat1 = new Cat();

         //Assignacio de valors
         cat1.name = "Neula";
         cat1.age = 7;
         cat1.race = "Persa";
         cat1.dangerous = true;

         // Creacion d'objecta
         Cat cat2;
         cat2 = new Cat();

         //Assignacio de valors
         cat2.name = "Neula";
         cat2.age = 3;
         cat2.race = "Persa";
         cat2.dangerous = false;

         //Execucio de metode
         dog1.displayDog();
         cat1.displayCat();
         cat2.displayCat();

     }
 }