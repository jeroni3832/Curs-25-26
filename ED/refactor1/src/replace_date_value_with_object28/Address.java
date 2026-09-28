package replace_date_value_with_object28;

public class Address {

    private String street;
    private String city;
    private String state;

    public Address( String street, String city, String state){

    this.street = street;
    this.city = city;
    this.state = state;
    }
    @Override
    public String toString(){
        return this.street + " " + this.city + " " + this.state;
 }

}