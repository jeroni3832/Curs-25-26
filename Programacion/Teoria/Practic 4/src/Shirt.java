public class Shirt {

    public int shirtID = 0;// Default ID for the shirt

    public String description = "-description required_"; // defauld
    // The color codes are R=Red, B=blue, G=Gren, U=Unset

    public char colorCode ='U';
    public double price = 12.99; // Default price for all shirts
    public int qualityInStock = 41;
    public void setPrice(double priceArg) {
        price =priceArg;
    }

    // This method displays the values for an item

    public void displayInformation() {
        System.out.println("Shirt ID: " + shirtID);
        System.out.println("Shirt description: " + description);
        System.out.println("Color Code: " + colorCode);
        System.out.println("Shirt price: " + price);
        System.out.println("Quantity in stock: " + qualityInStock);

    }//end of display method

}//end of class
