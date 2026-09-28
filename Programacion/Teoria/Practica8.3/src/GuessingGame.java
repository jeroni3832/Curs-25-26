public class GuessingGame {

    public static void main(String [] args){

        int randomNum;
        int guess;

        if (args.length ==0 || args[0].equals("help")) {
            System.out.println("usage: java guessinggame []");

            }else{
            randomNum = ((int) (Math.random()*5) +1);
            guess = Integer.parseInt(args[0]);

                if (guess < 1 || guess > 5){
                 System.out.println("error mensage");
                    }else {
                        if (guess == randomNum) {
                        System.out.println("congratulations ");

                        } else {
                        System.out.println("Sorry");
                        }




            }

        }
    }
}
