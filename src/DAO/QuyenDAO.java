package DAO;

import DTO.Quyen;
import UTIL.DataProvider;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class QuyenDAO {

    private static final String FILE_PHANQUYEN = "PhanQuyen.txt";
    private static final String FILE_QUYEN = "Quyen.txt";

    // Tên các cột quyền (BIT) trong file PhanQuyen.txt, bắt đầu từ index 2
    private static final String[] MA_QUYEN = {
        "NS_XemDanhSach", "NS_Them", "NS_Sua", "NS_Xoa", "NS_DuyetNghi",
        "NS_ThayDoiChucVu", "NS_TinhLuong", "NS_XemLuongCaNhan", "NS_InBangLuong", "NS_ChamCong",
        "KHO_XemSanPham", "KHO_ThemSanPham", "KHO_SuaSanPham", "KHO_XoaSanPham",
        "KHO_NhapHang", "KHO_QuanLyNCC", "KHO_BaoCaoTonKho",
        "BH_LapPhieuXuat", "BH_ThongKeDoanhThu", "BH_ThongKeLoiNhuan",
        "PQ_QuanLyPhanQuyen", "ADMIN_BaoCaoTongHop",
        "QLBanHang", "QLNhapHang", "QLNhanVien", "QLSanPham",
        "QLKhachHang", "QLKhuyenMai", "QLThongKe"
    };

    /**
     * Đọc file Quyen.txt để lấy bảng ánh xạ MaQuyen -> TenQuyen
     */
    private Map<String, String> docBangTenQuyen() {
        Map<String, String> map = new HashMap<>();
        List<String[]> rows = DataProvider.readAll(FILE_QUYEN);
        for (String[] row : rows) {
            // row: [0]MaQuyen, [1]TenQuyen
            map.put(row[0], row[1]);
        }
        return map;
    }

    /**
     * Lấy tất cả quyền (cả bật lẫn tắt) từ file Quyen.txt
     */
    public List<Quyen> getAll() {
        List<Quyen> list = new ArrayList<>();
        List<String[]> rows = DataProvider.readAll(FILE_QUYEN);
        for (String[] row : rows) {
            list.add(new Quyen(row[0], row[1]));
        }
        return list;
    }

    /**
     * Lấy danh sách quyền được bật (=1) cho một vai trò
     */
    public List<Quyen> getByVaiTro(String maVaiTro) {
        Map<String, String> bangTen = docBangTenQuyen();
        List<Quyen> list = new ArrayList<>();
        List<String[]> rows = DataProvider.readAll(FILE_PHANQUYEN);
        for (String[] row : rows) {
            if (row[0].equals(maVaiTro)) {
                // Từ cột index 2 trở đi là các cột quyền BIT
                for (int i = 0; i < MA_QUYEN.length; i++) {
                    int colIndex = i + 2; // bỏ qua cột 0 (MaQuyen) và 1 (TenQuyen)
                    if (colIndex < row.length && "1".equals(row[colIndex])) {
                        String ma = MA_QUYEN[i];
                        String ten = bangTen.getOrDefault(ma, ma);
                        list.add(new Quyen(ma, ten));
                    }
                }
                break;
            }
        }
        return list;
    }

    /**
     * Cập nhật quyền cho vai trò cụ thể
     */
    public boolean capNhat(String maVaiTro, String tenQuyen, boolean coQuyen) {
        // Tìm index của quyền trong mảng MA_QUYEN
        int quyenIndex = -1;
        for (int i = 0; i < MA_QUYEN.length; i++) {
            if (MA_QUYEN[i].equals(tenQuyen)) {
                quyenIndex = i;
                break;
            }
        }
        if (quyenIndex == -1) {
            return false; // Không tìm thấy tên quyền hợp lệ
        }

        List<String[]> rows = DataProvider.readAll(FILE_PHANQUYEN);
        boolean found = false;
        for (String[] row : rows) {
            if (row[0].equals(maVaiTro)) {
                int colIndex = quyenIndex + 2;
                if (colIndex < row.length) {
                    row[colIndex] = coQuyen ? "1" : "0";
                    found = true;
                }
                break;
            }
        }
        if (found) {
            DataProvider.writeAll(FILE_PHANQUYEN, rows);
        }
        return found;
    }
}
