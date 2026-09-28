package refactoritzacions;


public class Vehicle {

	private int acceleration;
	private int speed;
	
	public Vehicle(int acceleration, int speed) {
		this.acceleration = acceleration;
		this.speed = speed;
	}

	public void initVehicle (int type, int value) {
		  if (type == 1) {
		    acceleration = value;
		    return;
		  }

		  if (type == 2 || type == 3)  {
		    speed = value;
		    return;
		  }
		}

	public int getAcceleration() {
		return acceleration;
	}

	public int getSpeed() {
		return speed;
	}
}
