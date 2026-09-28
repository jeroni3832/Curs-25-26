package introduce_null_object18;

public class NullWeapon extends Weapon {

    public NullWeapon (int damage) {
        super(damage);
    }


    public int getDamage() {
        return 0;
    }
}
