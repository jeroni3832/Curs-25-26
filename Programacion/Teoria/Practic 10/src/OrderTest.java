public class OrderTest {

    public static void main(String [] args) {

        Shirt myShirt = new Shirt();
        Order myOrder = new Order();
        Shirt myShirt1 = new Shirt();
        Shirt myShirt2 = new Shirt();

        double totalCost = 0.0;
        myShirt.price = 14.99;
        myShirt1.price = 25.25;
        myShirt2.price = 18.65;

        myOrder.addShirt(myShirt);
        myOrder.addShirt(myShirt1);
        totalCost = myOrder.addShirt(myShirt2);
        System.out.printf("total order %.2f\n", totalCost);

    }
}
