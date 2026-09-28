package extract_method4;

public class UrlNormalizer {
    public String normalize(String title) {
        String url = "";
        // First we trim whitespaces
        url = title.trim();
        url = removeSpecialChars(url);

        url = spacesReplacedChars(url);

        // lowercase everything
        url = url.toLowerCase();

        return url;
    }

    private String removeSpecialChars(String url){
        String specialRemoved = "";
        for (int i = 0; i < url.length(); i++) {
            if (url.charAt(i) != ',' && url.charAt(i) != ':'
                    && url.charAt(i) != '.' && url.charAt(i) != '?') {
                specialRemoved += url.charAt(i);
            }
        }

        return specialRemoved;

    }



    private String spacesReplacedChars(String url){

        String spacesReplaced = "";
        for (int i = 0; i < url.length(); i++) {
            if (url.charAt(i) == ' ') {
                spacesReplaced += "-";
            } else {
                spacesReplaced += url.charAt(i);
            }
        }
        return spacesReplaced;

    }
    }
