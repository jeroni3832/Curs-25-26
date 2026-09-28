package replace_conditional_with_polymorphism17;

public class Plane extends Vehicle {
    public Plane (int speed, int acceleration) {
        super(speed, acceleration);
    }
    @Override
    public int move(){
        return acceleration * 2;
    }
}
