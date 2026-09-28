public class Sequence {

    int firstNumber=0;
    int secondNumber=1;
    int nextNumber;

    public final int SEQUENCE_LIMIT=100;

    public void displaySequence(){

        System.out.println(firstNumber + " " );
        System.out.println(secondNumber + " " );

        nextNumber= firstNumber + secondNumber;

        while (nextNumber <= SEQUENCE_LIMIT) {

            System.out.println(nextNumber + " ");

            firstNumber = secondNumber;
            secondNumber = nextNumber;

            nextNumber = firstNumber + secondNumber;
        }
        System.out.println();
    }
}
