package introduce_local_extension27;

public class Main{
    private CoolConversor conversor = new CoolConversor();

    public double convert (double amount) {

        return conversor.euro2Libra(amount);
    }
}
