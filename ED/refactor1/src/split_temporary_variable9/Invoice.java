package split_temporary_variable9;

public class Invoice {
    public float totalPrice (float price, float vat, float discount) {

        float aplicVat = (vat * price) / 100;
        System.out.println("Applied vat: " + aplicVat);

        float aplicWithVat = price + aplicVat;
        System.out.println("Total with vat: " + aplicWithVat);

        return aplicWithVat - discount;
    }
}
