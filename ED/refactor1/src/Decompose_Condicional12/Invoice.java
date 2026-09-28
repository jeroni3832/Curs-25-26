package Decompose_Condicional12;

public class Invoice {

    private Customer customer;

    public Invoice (Customer customer) {
        this.customer = customer;
    }

    public float calculatePayment (float price, float discount, float vat) {
        float payment = 0;

        if ( calAge() ) {
            payment = price * discount * vat;
        } else {
            payment = price * vat;
        }
        return payment;
    }
    private boolean calAge(){

       return (customer.getAge() < 18 || customer.getAge() > 65);
    }
}
