package DAO;

import DTO.TaiKhoan;
import UTIL.DataProvider;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

public class TaiKhoanDAO {

    private static final String FILE_NAME = "TaiKhoan.txt";

    // Format file: MaNV|TaiKhoan|MatKhau(SHA256)|VaiTro|TrangThai

    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for (byte b : hash) {
                sb.append(String.format("%02X", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("SHA-256 khong kha dung", e);
        }
    }

    /**
     * Dang nhap: tra ve TaiKhoan neu dung, null neu sai
     */
    public TaiKhoan dangNhap(String tenDangNhap, String matKhau) {
        String hashedPassword = hashPassword(matKhau);
        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        for (String[] row : rows) {
            // row: [0]MaNV, [1]TaiKhoan, [2]MatKhau, [3]VaiTro, [4]TrangThai
            if (row[1].equals(tenDangNhap)
                    && row[2].equalsIgnoreCase(hashedPassword)
                    && "1".equals(row[4])) {
                TaiKhoan tk = new TaiKhoan();
                tk.setMaNV(Integer.parseInt(row[0]));
                tk.setTenDangNhap(row[1]);
                tk.setVaiTro(row[3]);       // "ADMIN", "QUANLY", "NHANVIEN"
                tk.setTrangThai(true);
                return tk;
            }
        }
        return null;
    }

    /**
     * Doi mat khau
     */
    public boolean doiMatKhau(int maNV, String matKhauCu, String matKhauMoi) {
        String hashedOld = hashPassword(matKhauCu);
        String hashedNew = hashPassword(matKhauMoi);

        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        boolean found = false;
        for (String[] row : rows) {
            if (Integer.parseInt(row[0]) == maNV
                    && row[2].equalsIgnoreCase(hashedOld)) {
                row[2] = hashedNew;
                found = true;
                break;
            }
        }
        if (found) {
            DataProvider.writeAll(FILE_NAME, rows);
        }
        return found;
    }

    /**
     * Kiem tra tai khoan da ton tai chua
     */
    public boolean tonTai(String tenDangNhap) {
        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        for (String[] row : rows) {
            if (row[1].equals(tenDangNhap)) {
                return true;
            }
        }
        return false;
    }
}
