package unline_method5;

public class UrlCleaner {

    public String clean(String title) {



        return title.trim().
            replaceAll("[\\.\\:\\,\\?\\!\\_\\;]", "").
            replaceAll("[\\s]+", " ").replaceAll("[\\s]", "-").
            toLowerCase();


    }


}

