package Consolidate_Conditional13;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Invoice {

    private Customer customer;
    private int year;

    public Invoice(Customer customer, int year) {
        this.customer = customer;
        this.year = year;
    }

    public float calculateTotal(float subtotal, float vat) {
        if (esValidoCobrar(subtotal)) {
            return 0;
        }
        return subtotal * vat;
    }

    private boolean esValidoCobrar( float subtotal){
        return ((customer.getAge() < 18) ||(new GregorianCalendar().get(Calendar.YEAR) > year)
        ||(subtotal < 0.5f));

    }


}
