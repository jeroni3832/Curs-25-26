public class CustomerTest {
    public static void main(String []args){

    Customer myCustomer = new Customer();

    Customer myCustomer1 = new Customer();

    myCustomer.setCustomerInfo(1, "Sally", "567 Oak St", "505-123-2323");
    myCustomer1.setCustomer1Info(2, "Sally", "567 Oak St", "505-123-2323", "sally@mail.com");

   myCustomer.displayCustomer();
   myCustomer1.displayCustomer1();
   
    }

}
