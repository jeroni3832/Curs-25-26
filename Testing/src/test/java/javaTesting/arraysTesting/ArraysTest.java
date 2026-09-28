package javaTesting.arraysTesting;

import org.junit.Test;

import java.util.Arrays;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class ArraysTest {

    @Test
    public void exempleArraysSenzill(){

        String[] numerals = { "zero", "un", "dos", "tres"};

        assertEquals("zero",numerals[0]);

        String nombres = "";

        for(String n:numerals){
            nombres += n +"|";
        }

        assertEquals(nombres, "zero|un|dos|tres|");

    }
    @Test
    public void provesOrdenaciArray(){
        String[] numerals = { "zero", "un", "dos", "tres"};

        Arrays.sort(numerals);

        for (int i =0; i < numerals.length -1 ; i++){
            assertTrue( numerals[i].compareTo(numerals[i+1])<0);
        }
    }

    @Test
    public void farcirArrayParcialment() {
        int[] nums = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
        Arrays.fill(nums, 5, 10, -1);

        for (int i = 5; i < nums.length - 1; i++) {
            assertTrue(nums[i] == -1);
        }

    }

    @Test
    public void copiaRangMatriu(){
        String[] dies = {"dilluns", "dimarts", "dimecres", "dijous", "divendres"};
        String[] feiners = Arrays.copyOfRange(dies, 0 , 5);
        assertTrue( feiners.length == 5);
        assertTrue( feiners[1].equals("dimarts") );

        String[] feinersEsclaus = Arrays.copyOfRange(feiners, 0 , 7);
        assertTrue( feinersEsclaus[0].equals("dilluns") );
        assertEquals(feinersEsclaus[5], null);
        assertEquals(feinersEsclaus[6], null);

        feinersEsclaus[5] = "dissabteDeFeina";
        feinersEsclaus[6] = "diaDeDescans";
        assertTrue( feinersEsclaus[6].equals("diaDeDescans"));
    }

    @Test
    public void arraysIrregularsTest(){
        int[][] arrayIrregulars = {{0,1,2,3,4,5},
                {0,1,2,3,4},
                {0,1,2,3},
                {0,1,2},
                {0,1},
                {0}
        };

        assertEquals( arrayIrregulars.length, 6);

        assertEquals( arrayIrregulars[0].length, 6);

        assertEquals( arrayIrregulars[5].length, 1);
    }
}
