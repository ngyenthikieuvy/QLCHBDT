package DAO;

import DTO.TaiKhoan;
import UTIL.DataProvider;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

public class TaiKhoanDAO {

    private static final String FILE_NAME = "TaiKhoan.txt";
    private final VaiTroDAO vaiTroDAO = new VaiTroDAO();

    // Format file: MaNV|TaiKhoan|MatKhau(SHA256 hex)|MaQuyen|TrangThai

    /**
     * Hash mật khẩu bằng SHA-256, trả về chuỗi hex viết hoa
     */
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
            throw new RuntimeException("SHA-256 không khả dụng", e);
        }
    }

    /**
     * Trả về TaiKhoan (kèm vai trò và quyền) nếu đúng thông tin và đang hoạt động, ngược lại null
     */
    public TaiKhoan dangNhap(String tenDangNhap, String matKhau) {
        String hashedPassword = hashPassword(matKhau);
        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        for (String[] row : rows) {
            // row: [0]MaNV, [1]TaiKhoan, [2]MatKhau, [3]MaQuyen, [4]TrangThai
            if (row[1].equals(tenDangNhap)
                    && row[2].equalsIgnoreCase(hashedPassword)
                    && "1".equals(row[4])) {
                TaiKhoan tk = new TaiKhoan();
                tk.setMaNV(Integer.parseInt(row[0]));
                tk.setTenDangNhap(row[1]);
                tk.setTrangThai(true);
                tk.setVaiTro(vaiTroDAO.getById(row[3]));
                return tk;
            }
        }
        return null;
    }

    /**
     * Đổi mật khẩu cho nhân viên
     */
    public boolean doiMatKhau(int ma NV, String matKhauCu, String matKhauMoi) {
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
     * Kiểm tra tên đăng nhập đã tồn tại chưa
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
