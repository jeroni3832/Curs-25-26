package javaTesting.ExploranJUnit;

import org.junit.*;
import org.junit.rules.ExpectedException;

import java.util.Arrays;
import java.util.Objects;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;



public class ExplorantJUnitTest {

    @Rule
    public ExpectedException exception = ExpectedException.none();

    @Test(expected = IllegalArgumentException.class)
    public void testetjantIllegalArgumnetsException() {

        throw new IllegalArgumentException();
    }
    @Ignore
    @Test
    public void illegalParameterersTest(){
        exception.expect(IllegalArgumentException.class);

        throw new IllegalArgumentException();

    }

    @Test

    public void missatgeExeptionTest(){
        exception.expect(IllegalStateException.class);
        exception.expectMessage("the");

        throw new IllegalStateException("the exception");


    }

    @BeforeClass
    public static void executaUnCopPerClasseAbansDeQualsevolTest(){
        System.out.println("Abans d'executar qualsevol test, un cop per classe");
    }

    @AfterClass
    public static void executaUnCopDespuesDeQualsevolTest(){
        System.out.println("Despres d'executar qualsevol test, un cop per classe");
    }

    @Before
    public void executaAbansDeCadaTest(){
        System.out.println("Abans d'executar qualsevol test, per cada test!!!");
    }
    @After
    public void executaDespuesDeCadaTest(){
        System.out.println("Despres d'executar qualsevol test, per cada test!!!");
    }

    @Test
    public void assercionsDeJUnit(){

        assertEquals( 5, 2+3);

        assertFalse("fals es fals", false);
        assertFalse(3>5);

        assertTrue(5>3);

        int[] filsA10= {1,2,3,4,5,6,7,8,9,10};
        int[] primers10= {1,2,3,4,5,6,7,8,9,10};

        Arrays.sort(primers10);
        assertArrayEquals(filsA10, primers10);

        assertNotNull("un String buit no es null", "");
        assertNotNull("");

        assertNotSame("un String buit no es null", "", null);
        assertNotSame( "", null);

        assertNull("Nomes null es considetrat null", null);

        Objects obj = null;
        assertSame(obj,null);
    }
    @Test

    public void assertThatAmbHamcrest(){

        assertThat(" testejant que 4+5 son 9", 4+5, is(9));

        assertThat("fals es false", false, equalTo(false));

        assertThat( false, is(false));

        assertThat("true es true", true, equalTo(true));

        assertThat( true, is(true));

        assertThat("Un String buit no es null", is(not(nullValue())));

        assertThat("Aixo es un text", containsString("un"));

        assertThat("Aixo es un text", endsWith("xt"));

        assertThat("Aixo es un text", startsWith("Ai"));
    }

}
