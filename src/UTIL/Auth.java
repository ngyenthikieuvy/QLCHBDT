package UTIL;

import DTO.TaiKhoan;

public class Auth {

    private static TaiKhoan taiKhoanHienTai;

    public static void dangNhap(TaiKhoan tk) {
        taiKhoanHienTai = tk;
    }

    public static void dangXuat() {
        taiKhoanHienTai = null;
    }

    public static TaiKhoan getTaiKhoan() {
        return taiKhoanHienTai;
    }

    public static int getMaNV() {
        return taiKhoanHienTai != null ? taiKhoanHienTai.getMaNV() : -1;
    }

    public static String getVaiTro() {
        return taiKhoanHienTai != null ? taiKhoanHienTai.getVaiTro() : null;
    }

    public static boolean isAdmin() {
        return "ADMIN".equals(getVaiTro());
    }

    public static boolean isQuanLy() {
        return "QUANLY".equals(getVaiTro());
    }

    public static boolean isNhanVien() {
        return "NHANVIEN".equals(getVaiTro());
    }
}
