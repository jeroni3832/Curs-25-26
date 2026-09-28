package replace_conditional_with_polymorphism17;

public class Bike extends Vehicle {
    public Bike (int speed, int acceleration) {
        super(speed, acceleration);
    }
    @Override
    public int move(){
        return speed * 10;
    }
}
