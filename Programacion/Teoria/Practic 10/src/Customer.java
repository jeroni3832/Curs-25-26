public class Customer {

    int customerID = 0;
    String name = "";
    String address = "";
    String phoneNum = "";
    String email = "";

    public void setCustomerInfo(int id, String nm, String addr, String phNum){
        this.customerID = id;
        this.name = nm;
        this.address = addr;
        this.phoneNum = phNum;

    }

    public  void setCustomer1Info(int id, String nm, String addr, String phNum, String email){
        this.customerID = id;
        this.name = nm;
        this.address = addr;
        this.phoneNum = phNum;
        this.email = email;
    }


    public void displayCustomer() {
        System.out.println("--- Ficha de Cliente ---");
        System.out.println("ID: " + customerID);
        System.out.println("Nombre: " + name);
        System.out.println("Dirección: " + address);
        System.out.println("Teléfono: " + phoneNum);
       // System.out.println("Email: " + email);
    }
    public void displayCustomer1() {
        System.out.println("--- Ficha de Cliente ---");
        System.out.println("ID: " + customerID);
        System.out.println("Nombre: " + name);
        System.out.println("Dirección: " + address);
        System.out.println("Teléfono: " + phoneNum);
        System.out.println("Email: " + email);
    }

}
