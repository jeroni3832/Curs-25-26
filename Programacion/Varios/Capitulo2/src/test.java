public class test {

    public static void main(String[] args)
    {
        int x = 1;
        boolean r1, r2, r3, r4;

        //    false      true
        //    1 > 1 AND  1 < 10
        r1 = (x > 1) && (x++ < 10); // true

        //    false       true
        //    10 < 1  AND 15 > 1
        r2 = (10 < x) && (15 > x++); // false

        //    false        true
        //    10 == 1  OR  20 > 1
        r3 = (10 == x) || (20 > x++); // false

        //    false        true
        //    10 == 1  OR  20 > 1
        r4 = (10 == x) || (20 > x++); // false

        System.out.println(r1 + " " + r2 + " " + r3 + " " + r4);
    }

}
