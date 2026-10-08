package UTIL;

public class Auth {
    public static int Ma;
    public static String quyen;

    public static boolean isAdmin() {
        return "Admin".equalsIgnoreCase(quyen);
    }

    public static boolean isBanHang() {
        return "BanHang".equalsIgnoreCase(quyen);
    }
}
