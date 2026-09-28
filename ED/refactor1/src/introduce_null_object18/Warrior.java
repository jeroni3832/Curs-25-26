package introduce_null_object18;

public class Warrior {
    private Weapon weapon;

    public Warrior(Weapon weapon) {
        this.weapon = weapon;
    }

    public int attack() {

        return weapon.getDamage();
    }
}