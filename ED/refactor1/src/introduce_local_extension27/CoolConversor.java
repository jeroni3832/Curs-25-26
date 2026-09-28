package introduce_local_extension27;

public class CoolConversor extends Conversor {
    public double euro2Libra(double qty) {
        return qty * 0.5d;
    }

    public double libra2Euro (double qty) {
        return qty / 0.6d;
    }
}
