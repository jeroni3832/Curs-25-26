public class ClassMap {

    public String[][] deskArray;
    public String name;

    public void setClassMap() {

        deskArray = new String[3][4];

        boolean flag = false;
        for (int row = 0; row < 3; row++) {

            for (int col = 0; col < 4; col++) {

                if (deskArray[row][col] == null) {
                    deskArray[row][col] = name;
                    System.out.println(name + "desk is at position: Row" + row + "Colum:" + col);

                    flag = true;
                    break;
                }
            }
            if (flag == true) {
                break;
            }
        }
        if (flag == true) {
            break;
        }
    }

    public void displayDeskMap() {
        for (int row = 0; row < 3; row++) {
            for (int col = 0; col < 4; col++) {
                System.out.println(deskArray[row][col] + "     ");

            }
            System.out.println();
        }


    }


}
