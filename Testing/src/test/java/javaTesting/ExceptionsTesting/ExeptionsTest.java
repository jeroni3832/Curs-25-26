package javaTesting.ExceptionsTesting;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class ExeptionsTest {

    @Test(expected = NullPointerException.class)
    public void NullPointerTes(){

        Integer edat = null;

        String edatEnLLetres = edat.toString();

        assertEquals(""+18, edatEnLLetres);


    }

    @Test
    public void catchNullPointerTest(){

        Integer edat = null;
        String edatEnLLetres;

        try{
            edatEnLLetres = edat.toString();
        }catch(NullPointerException npe){
            edat = 18;
            edatEnLLetres = edat.toString();
        }


        assertEquals(""+18,edatEnLLetres);


    }

    @Test
    public void tryCatchNullPointerTest(){

        Integer edat = null;
        String edatEnLLetres ="";
        String text;
        try{
            edatEnLLetres = edat.toString();
        }catch(NullPointerException npe){
            edat = 18;
            edatEnLLetres = edat.toString();
        }finally{
            text= "Edat == " + edatEnLLetres;
        }


        assertEquals("Edat == 18",text);


    }


    @Test (expected = IllegalArgumentException.class)
    public void throwingIllegalArgumentExceptiontryCatchNullPointerTest(){

        Integer edat = null;
        String edatEnLLetres ="";
        String text;

        try{
            System.out.println("pasa1 - generearm nullpointerexception");
            edatEnLLetres = edat.toString();
        }catch(NullPointerException npe){
            System.out.println("pasa2 - capturam la nullpointerexception");
            System.out.println("pasa3 - anam a llansar una exepcio");
            throw new IllegalArgumentException("excepcio creada i llanzada per mi");
        }finally{
            System.out.println("pas final- codi de tancament");
        }





    }

    @Test (expected = NullPointerException.class)
    public void excepcioErronia(){
        Integer edat = null;
        String edatEnLLetres ="";
        String text;

        try{
            System.out.println("pasa1 - generearm nullpointerexception");
            edatEnLLetres = edat.toString();
            throw new IllegalArgumentException("excepcio creada i llanzada per mi");
        }catch(IllegalArgumentException e){
            System.out.println("pasa2 - capturam la IllegalArgumentException");

        }finally{
            System.out.println("pas final- codi de tancament");
        }
    }


    @Test
    public void jugantAmbObjectesExcepcioTest(){

        Integer edat = null;
        String edatEnLLetres;

        try{
            edatEnLLetres = edat.toString();
        }catch(NullPointerException npe){
            edat = 18;
            edatEnLLetres = edat.toString();
            System.out.println("amen a jugar amb lobecta excepcio");

            System.out.println(npe.getMessage());
            System.out.println(npe.getStackTrace());
            npe.printStackTrace();
        }


        assertEquals(""+18,edatEnLLetres);


    }

}
