package number_magic3;

import java.util.Random;
    public class PasswordGenerator {
        private static final int MAX_PASSWORD_LENTGH = 15;
        private static final int MIN_PASSWORD_LENTGH = 6;
        private Random random = new Random();
        private String characters = "abcdefghijkmnopqrstuvwxyz23456789";

        public String generatePassword(int length) throws Exception {
            if (length < MIN_PASSWORD_LENTGH || length > MAX_PASSWORD_LENTGH) {
                throw new Exception("Wrong password length: " + length);
            } else {
                String password = "";

                for (int i = 0; i < length; i++)
                    password += characters.charAt(random.nextInt(characters.length()));

                return password;
            }
        }
    }


