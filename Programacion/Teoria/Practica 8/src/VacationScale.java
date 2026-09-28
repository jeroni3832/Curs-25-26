public class VacationScale {
        //declarar las variables
    int[] vacationDays;
    int yearsOfService;
//declarar el metodo set para la configuracion inicial
    public void setVacationScale() {
        vacationDays = new int[7]; // indicamos el tamaño de array
        vacationDays[0] = 10;
        vacationDays[1] = 15;
        vacationDays[2] = 15;
        vacationDays[3] = 15;
        vacationDays[4] = 20;
        vacationDays[5] = 20;
        vacationDays[6] = 25;
    }
    // declarar el metodo display
    public void displayVacationDays() {
            //
        if (yearsOfService >= 0 && yearsOfService < 6) {
            System.out.println("Days of Vacation: " + vacationDays[yearsOfService]);

        } else if (yearsOfService >= 6) {
            System.out.println("Days of Vacation: " + vacationDays[6]);
        } else {
            System.out.println("Invalid years of service");
        }

    }
}
