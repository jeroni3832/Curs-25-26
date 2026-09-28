package xxx.refactorings.inlinemethod;


public class UrlCleaner {

	public String clean(String title) {
		String url = trimSpaces(title);

		url = removeSpecialChars(url);
		url = replaceSpaces(url);
		url = url.toLowerCase();

		return url;
	}

	private String replaceSpaces(String url) {
		return url.replaceAll("[\\s]+", " ").replaceAll("[\\s]", "-");
	}

	private String removeSpecialChars(String url) {

		return url.replaceAll("[\\.\\:\\,\\?\\!\\_\\;]", "");
	}

	private String trimSpaces(String url) {
		return url.trim();
	}
}

