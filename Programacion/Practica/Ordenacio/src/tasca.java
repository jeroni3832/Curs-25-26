import java.util.Arrays;
public class tasca {
    public static void main(String[] args) {

        int[] selection = {5, 1, 12, -5, 16, 2, 12, 14};

        int min=0;
        int po = 0;
        for (int i = selection.length ; i>0; i--) {

            if(i < selection[i]){
                po=selection[i];
            }if (selection[po]< selection[i])

            System.out.println(selection[po]);

        }



    }
}