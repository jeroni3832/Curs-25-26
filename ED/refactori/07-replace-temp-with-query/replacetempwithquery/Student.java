package xxx.refactorings.replacetempwithquery;


public class Student {
	private String name;
	private boolean hasGoodAttitude;

	public Student(String name, boolean hasGoodAttitude) {
		this.name = name;
		this.hasGoodAttitude = hasGoodAttitude;
	}

	public float calculateAverage(float homework, float exam) {
		float mark = (homework + exam) / 2;

		if (hasGoodAttitude) {
			return mark + 1;
		} else {
			return mark;
		}
	}
}
