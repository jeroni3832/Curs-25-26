package replace_conditional_with_polymorphism17;

public abstract class Vehicle {

    protected int speed;
    protected int acceleration;

    public Vehicle(int speed, int acceleration) {

        this.speed = speed;
        this.acceleration = acceleration;
    }

    public abstract int move();




}
