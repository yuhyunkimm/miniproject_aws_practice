// package shop.mtcoding.project.utilTest;

// import java.security.MessageDigest;

// import org.junit.jupiter.api.Test;

// public class Sha256Test {

// @Test
// public static void encode(String ps) {
// String password = "salt" + ps;
// String SHA = "";
// try {
// MessageDigest sh = MessageDigest.getInstance("SHA-256");
// sh.update(password.getBytes());
// byte byteData[] = sh.digest();
// StringBuffer sb = new StringBuffer();
// for (int i = 0; i < byteData.length; i++) {
// sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
// }
// SHA = sb.toString();

// } catch (Exception e) {
// e.printStackTrace();
// SHA = null;
// }
// System.out.println("테스트 : " + SHA);
// }

// public static void main(String[] args) {
// encode("1234");
// }
// }
