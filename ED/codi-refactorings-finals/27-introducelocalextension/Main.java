package refactoritzacions;


public class Main {
	private Conversor conversor = new Conversor();
	
	public double convert (double amount) {
		return conversor.euro2Dollar(amount);
	}
}
