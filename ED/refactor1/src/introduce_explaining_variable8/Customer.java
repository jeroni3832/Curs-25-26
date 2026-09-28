package introduce_explaining_variable8;

class Customer {
    private String name;
    private int age;
    private float salary;

    public Customer(String name, int age, float salary) {
        this.name = name;
        this.age = age;
        this.salary = salary;
    }


    public float applyDiscount(float totalAmount) {
        boolean potFerFeina = (age > 17 && age < 66);
        boolean salariMinin = salary - (salary * 0.2f)< 1000f;
        boolean totalDesconte = totalAmount * 0.5 < 100;

        if (potFerFeina && salariMinin && totalDesconte) {
            return totalAmount * 0.9f;
        } else {
            return totalAmount;
        }
    }
}