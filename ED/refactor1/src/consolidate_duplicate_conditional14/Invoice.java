package consolidate_duplicate_conditional14;

public class Invoice {

    private Customer customer;
    private float price;
    private int qty;

    public Invoice (Customer customer, float price, int qty) {
        this.customer = customer;
        this.price = price;
        this.qty = qty;
    }

    public float calculateTotal (float vat, float discount) {
        float subtotal = 0;
        float discountCalculated = discount;

        discountCalculated = (customer.isVip() ? discount : 0);
        subtotal =(price * qty) - discount;
        subtotal = subtotal * (1 + (vat/100));
        return subtotal;
    }

}

