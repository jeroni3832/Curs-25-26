package Replace_method_with_method_object11;

public class DiscountCalculate {

    private double finalPrice;
    private double appliedVat;
    private double price;
    private double discount;
    private Customer customer;

    public DiscountCalculate(double price, Customer customer, double discount ){
        finalPrice = 0;
        appliedVat = 0;
        this.price=price;
        this.customer=customer;
        this.discount=discount;

    }
    public double applyDiscount(double price, double discount) {


        return calculPrice() * caculappliedVat() - discount;
    }
    private double caculappliedVat(){

        double appliedVat = 0;

        switch (customer.getType()) {
            case Customer.NORMAL:
                appliedVat = 1.21f;
                break;
            case Customer.SPECIAL:
                appliedVat = 1.15f;
                break;
            case Customer.VIP:
                appliedVat = 1.04f;
                break;
            default:
                appliedVat = 1.21f;
                break;
        }
        return appliedVat;
    }

    private double calculPrice(){

        double finalPrice = 0;

        if (price > 50 && customer.isVip()) {
            finalPrice = price * 0.5;
        } else if (price > 10 && customer.isSpecial()) {
            finalPrice = price * 0.1;
        } else {
            finalPrice = price;
        }
        return finalPrice;
    }
}
