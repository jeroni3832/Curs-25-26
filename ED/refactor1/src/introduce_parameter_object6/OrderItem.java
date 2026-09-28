package introduce_parameter_object6;

public class OrderItem {


    public Object totalItem;
    private Integer productID;
    private String description;
    private Integer quantity;
    private Float price;
    private Float discount;

    public OrderItem(Integer productID, String description, Integer quantity, Float price, Float discount){
        this.productID = productID;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.discount = discount;
    }

    public Integer getProductID(){
        return productID;
    }

    public void setProductID(Integer productID){ this.productID = productID;}

    public String getDescription(){
        return description;
    }

    public void setDescription(String description){
        this.description = description;
    }

    public Integer getQuantity(){
        return quantity;
    }

    public void setQuantity(Integer quantity){
        this.quantity = quantity;
    }

    public float getPrice(){
        return price;
    }

    public void setPrice(float price){
        this.price = price;
    }

    public float getDiscount(){
        return discount;
    }

    public void setDiscount(float disconunt){
        this.discount = discount;
    }


    public float totalItem(){
        return (quantity * price) - (quantity * price * discount);
    }
}
