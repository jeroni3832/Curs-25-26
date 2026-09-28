package xxx.refactorings.removeparameterassignment;


public class Student {
	public float evaluateTerm(float homeworkMark, float examMark, float attitude) {
		if (examMark < 5) {
			examMark = 1;
		}

		if (homeworkMark < 4) {
			homeworkMark = 1;
		}
		return (homeworkMark + examMark) / 2 + attitude;
	}
}
