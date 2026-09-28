package hide_delegate25;

public class Player {
    private Die die;

    public Player () {
        this.die = new Die();
    }

    public Die getDie() {
        return die;
    }

    public int roll(){
        return die.roll();
    }
}