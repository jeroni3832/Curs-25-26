public class Person {

        public int ageYears = 32;

        public void calcuateAge() {
        int ageDays = ageYears * 365;
        long ageSeconds = (long) ageDays * 365 * 24L * 60 * 60;

        System.out.println("You are " + ageDays + " days old.");
        System.out.println("You are " + ageSeconds + " seconds old.");
    }
}
