/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Administrator
 */

public class DateThreeTest {
    public static void main(String args[]){
        DateThree date = new DateThree();

        date.setDay(14);
        date.setMonth(2);
        date.setYear(2025);
        System.out.println(date.getDay()+ "/"+ date.getMonth() +"/"+ date.getYear());
    } // end main
    public void displayDate(){

    }
} // end class
