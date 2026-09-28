package refactoritzacions;


public class Main {
	private Player player;
	private Die die;
	
	public Main () {
		init();
	}
	
	private void init () {
		player = new Player();
		die = player.getDie();
	}
	
	public int roll () {
		return die.roll();
	}
}
