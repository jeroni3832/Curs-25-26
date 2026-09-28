package javaTesting;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class IntegerStudyTest {
    @Test
    public void integerStudy(){
        Integer vuit = new Integer(8);
        Integer eight = new Integer(8);
        Integer tretze = 13;
        int esperat =13;
        assertEquals("el numero vuit val realment 8", 8,  vuit.intValue());
        assertEquals("el numero eight val realmente 8" , 8, eight.intValue());

        //assertTrue(vuit == eight);


    }


        @Test
        public void binaryStudy(){
            Integer dos = new Integer(2);
            Integer eight = new Integer(8);

            String tipusPersona = "hi ha" + Integer.toBinaryString(2) + "de persones, les que entene biari";

            assertEquals(tipusPersona, 2, dos.intValue());

            //assertEquals("el numero vuit val realment 8", 8,  vuit.intValue());
            //assertEquals("el numero eight val realmente 8" , 8, eight.intValue());



        }



}
