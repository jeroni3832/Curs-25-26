package refactoritzacions;

public class PasswordChecker {
	public static String improvePassword (String password) {
		if (password.length() < 5) {
			return "****" + password + "****";
		} else {
			return password;
		}
	}
}
