package javaTesting;

public class AppParameters {

    //afegir objectes conexio base de dades
    public static final String DOMAIN="127.0.0.1";

    public static final String PORT = "80";

    //public static final Object BD_COM = new ClasseConnexioBBDD();

    //public static Object MESSAGES_TRANSLATIONS;

    //IMPLEMENTA SINGLETON PATTERN

    private static  AppParameters instance;

    private AppParameters(){
        //codi necessari per la inicialitzacion de la app
    }

    private void initApp(){
            //codi per reconfigura app
    }
    private void resetAp(){

    }


    public static AppParameters getInstance(){
        if(instance==null)
            instance = new AppParameters();
        return instance;
    }

    public static String deployedURL() {
        return "https://" + DOMAIN + ":" + PORT;
    }



}
