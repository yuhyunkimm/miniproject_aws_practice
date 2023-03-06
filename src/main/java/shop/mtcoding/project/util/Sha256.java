package shop.mtcoding.project.util;

import java.security.MessageDigest;

public class Sha256 {
    public static String encode(String password1) {
        String password = "salt" + password1;
        String SHA = "";
        try {
            MessageDigest sh = MessageDigest.getInstance("SHA-256");
            sh.update(password.getBytes());
            byte byteData[] = sh.digest();
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            SHA = sb.toString();

        } catch (Exception e) {
            e.printStackTrace();
            SHA = null;
        }
        return SHA;
    }
}
