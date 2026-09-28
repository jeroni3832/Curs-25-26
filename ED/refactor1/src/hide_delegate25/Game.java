package hide_delegate25;

public class Game {
    private Player player;
    private Die die;

    public Game () {
        init();
    }

    private void init () {
        player = new Player();
        die = player.getDie();
    }

    public int roll () {
        return player.roll();
    }
}
