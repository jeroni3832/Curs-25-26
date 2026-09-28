import java.util.ArrayList;

public class VacationScaleTwo {

    public ArrayList vacationDays;

    public void setVacationScale() {

        vacationDays = new ArrayList(7);
        vacationDays.add(10);
        vacationDays.add(15);
        vacationDays.add(15);
        vacationDays.add(15);
        vacationDays.add(20);
        vacationDays.add(20);
        vacationDays.add(25);
    }
        public void displayVacationDays(){

            for (int years = 0; years < vacationDays.size(); years++)

            System.out.println("The vacation for" + years + "years of servie is: " + vacationDays.get(years));
        }

}
