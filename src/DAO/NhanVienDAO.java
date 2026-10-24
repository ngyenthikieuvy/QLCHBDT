package DAO;

import DTO.NhanVien;
import UTIL.DataProvider;
import java.util.ArrayList;
import java.util.List;

public class NhanVienDAO {

    private static final String FILE_NAME = "NhanVien.txt";

    /**
     * 1. Lấy danh sách tất cả nhân viên từ file NhanVien.txt
     */
    public ArrayList<NhanVien> layDanhSachNhanVien() {
        ArrayList<NhanVien> dsNV = new ArrayList<>();
        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        
        for (String[] row : rows) {
            // Giả định cấu trúc dòng: 
            // [0]MaNV, [1]Ho, [2]Ten, [3]GioiTinh, [4]SoDienThoai, [5]MaCV, [6]MaQuyen, [7]TrangThai, [8]TenTaiKhoan
            if (row.length >= 9) {
                try {
                    int maNV = Integer.parseInt(row[0].trim());
                    String ho = row[1].trim();
                    String ten = row[2].trim();
                    String gioiTinh = row[3].trim();
                    String soDienThoai = row[4].trim();
                    String maCV = row[5].trim();
                    boolean trangThai = Boolean.parseBoolean(row[7].trim());

                    NhanVien nv = new NhanVien(maNV, ho, ten, gioiTinh, soDienThoai, maCV, trangThai);
                    dsNV.add(nv);
                } catch (NumberFormatException e) {
                    // Bỏ qua dòng lỗi định dạng số nếu có
                }
            }
        }
        return dsNV;
    }

    /**
     * 2. Thêm nhân viên mới vào file
     */
    public boolean themNhanVien(NhanVien nv) {
        try {
            String[] row = new String[]{
                String.valueOf(nv.getMa()),
                nv.getHo(),
                nv.getTen(),
                nv.getGioiTinh(),
                nv.getSoDienThoai(),
                nv.getMaCV(),
                String.valueOf(nv.isTrangThai()),
            };
            DataProvider.append(FILE_NAME, row);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 3. Cập nhật thông tin nhân viên
     */
    public boolean capNhatNhanVien(NhanVien nv) {
        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        boolean found = false;

        for (int i = 0; i < rows.size(); i++) {
            String[] row = rows.get(i);
            if (row.length > 0 && Integer.parseInt(row[0].trim()) == nv.getMa()) {
                // Cập nhật lại các trường thông tin
                rows.set(i, new String[]{
                    String.valueOf(nv.getMa()),
                    nv.getHo(),
                    nv.getTen(),
                    nv.getGioiTinh(),
                    nv.getSoDienThoai(),
                    nv.getMaCV(),
                    String.valueOf(nv.isTrangThai()),
                });
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
     * 4. Xóa nhân viên (Xóa theo mã NV)
     */
    public boolean xoaNhanVien(int maNV) {
        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        boolean found = false;

        for (int i = 0; i < rows.size(); i++) {
            String[] row = rows.get(i);
            if (row.length > 0 && Integer.parseInt(row[0].trim()) == maNV) {
                rows.remove(i);
                found = true;
                break;
            }
        }

        if (found) {
            DataProvider.writeAll(FILE_NAME, rows);
        }
        return found;
    }
}