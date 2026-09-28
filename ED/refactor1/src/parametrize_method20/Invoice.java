package parametrize_method20;

public class Invoice {
    private float subtotal;
    private Customer customer;

    public Invoice(float subtotal, Customer customer) {
        this.subtotal = subtotal;
        this.customer = customer;
    }

    public float charge() {
        if (customer.getAge() < 18) {
            return realCharge(0.5f);
        } else if (customer.payInCash()) {
            return realCharge(0.7f);
        } else {
            return realCharge(1f);
        }
    }

    private float realCharge(float discount) {

        return subtotal * discount;
    }

}
