package replace_conditional_with_polymorphism17;

public class  Car extends Vehicle {
    public Car (int speed, int acceleration) {
        super(speed, acceleration);
    }
    @Override
    public int move(){
        return speed * acceleration * 5;
    }
}
