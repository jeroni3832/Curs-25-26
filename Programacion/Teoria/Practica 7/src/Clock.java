public class Clock {
    public int currentTime = 1000;

    public void displayPartOfDay(){

        if(currentTime >= 801 && currentTime <= 1200) {
            System.out.println("Morning");
        }else if(currentTime >= 1201 && currentTime<= 1700) {
            System.out.println("Altemoon");
        }else if(currentTime >= 1701 && currentTime<= 2400) {
            System.out.println("Evering");
        }else if(currentTime >= 001 && currentTime<= 800) {
            System.out.println("Early Morming");
        }


    }
}
