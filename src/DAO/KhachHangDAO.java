package DAO;

import DTO.KhachHang;
import UTIL.DataProvider;
import java.util.ArrayList;
import java.util.List;

public class KhachHangDAO {

    private static final String FILE_NAME = "KhachHang.txt";

    /**
     * 1. Lấy danh sách tất cả khách hàng từ file KhachHang.txt
     */
    public ArrayList<KhachHang> layDanhSachKhachHang() {
        ArrayList<KhachHang> dsKH = new ArrayList<>();
        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        
        for (String[] row : rows) {
            if (row.length >= 7) {
                try {
                    int maKH = Integer.parseInt(row[0].trim());
                    String ho = row[1].trim();
                    String ten = row[2].trim();
                    String gioiTinh = row[3].trim();
                    String soDienThoai = row[4].trim();
                    int tongChiTieu = Integer.parseInt(row[5].trim());
                    boolean tinhTrang = Boolean.parseBoolean(row[6].trim());

                    KhachHang kh = new KhachHang(maKH, ho, ten, gioiTinh, soDienThoai, tongChiTieu, tinhTrang);
                    dsKH.add(kh);
                } catch (NumberFormatException e) {
                    // Bỏ qua dòng lỗi định dạng số nếu có
                }
            }
        }
        return dsKH;
    }

    /**
     * 2. Thêm khách hàng mới vào file
     */
    public boolean themKhachHang(KhachHang kh) {
        try {
            String[] row = new String[]{
                String.valueOf(kh.getMa()),
                kh.getHo(),
                kh.getTen(),
                kh.getGioiTinh(),
                kh.getSoDienThoai(),
                String.valueOf(kh.getTongChiTieu()),
                String.valueOf(kh.isTinhTrang())
            };
            DataProvider.append(FILE_NAME, row);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 3. Sửa thông tin khách hàng 
     */
    public boolean capNhatKhachHang(KhachHang kh) {
        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        boolean found = false;

        for (int i = 0; i < rows.size(); i++) {
            String[] row = rows.get(i);
            if (row.length > 0 && Integer.parseInt(row[0].trim()) == kh.getMa()) {
                rows.set(i, new String[]{
                    String.valueOf(kh.getMa()),
                    kh.getHo(),
                    kh.getTen(),
                    kh.getGioiTinh(),
                    kh.getSoDienThoai(),
                    String.valueOf(kh.getTongChiTieu()),
                    String.valueOf(kh.isTinhTrang())
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
     * 4. Xóa khách hàng (theo maKH)
     */
    public boolean xoaKhachHang(int maKH) {
        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        boolean found = false;

        for (int i = 0; i < rows.size(); i++) {
            String[] row = rows.get(i);
            if (row.length > 0 && Integer.parseInt(row[0].trim()) == maKH) {
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

    /**
     * 5. Tìm kiếm khách hàng (theo maKH)
     */
    public KhachHang timKiemTheoMa(int maKH) {
        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        for (String[] row : rows) {
            if (row.length >= 7) {
                try {
                    int id = Integer.parseInt(row[0].trim());
                    if (id == maKH) {
                        String ho = row[1].trim();
                        String ten = row[2].trim();
                        String gioiTinh = row[3].trim();
                        String soDienThoai = row[4].trim();
                        int tongChiTieu = Integer.parseInt(row[5].trim());
                        boolean tinhTrang = Boolean.parseBoolean(row[6].trim());

                        return new KhachHang(id, ho, ten, gioiTinh, soDienThoai, tongChiTieu, tinhTrang);
                    }
                } catch (NumberFormatException e) {
                    // Bỏ qua dòng lỗi định dạng
                }
            }
        }
        return null; 
    }
}