package introduce_foreign_method26;

public class PasswordChecker {
    public static String improvePassword (String password) {
        if (password.length() < 5) {
            return checkPassword (password);
        } else {
            return password;
        }
    }
    public static String checkPassword (String password) {
        if (password.length() < 5) {
            return "****" + password + "****";
        }  else {
            return password;
        }
    }
}