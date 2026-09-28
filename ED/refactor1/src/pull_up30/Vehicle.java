package pull_up30;

public class Vehicle {
    private String name;
    private String plate;

    public void start() {
        System.out.println("Starting Vehicle");
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPlate() {
        return plate;
    }
    public void setPlate(String plate) {
        this.plate = plate;
    }
}
