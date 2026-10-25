package DAO;

import DTO.TaiKhoan;
import UTIL.DataProvider;
import java.util.List;

public class TaiKhoanDAO {

    private static final String FILE_NAME = "TaiKhoan.txt";

    /**
     * Dang nhap: tra ve TaiKhoan neu dung, null neu sai
     */
    public TaiKhoan dangNhap(String tenDangNhap, String matKhau) {
        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        for (String[] row : rows) {
            // row: [0]MaNV, [1]TaiKhoan, [2]MatKhau, [3]VaiTro, [4]TrangThai
            if (row[1].equals(tenDangNhap)
                    && row[2].equals(matKhau)
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
        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        boolean found = false;
        for (String[] row : rows) {
            if (Integer.parseInt(row[0]) == maNV
                    && row[2].equals(matKhauCu)) {
                row[2] = matKhauMoi;
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
