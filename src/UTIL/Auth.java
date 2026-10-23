package UTIL;

import DTO.Quyen;
import DTO.TaiKhoan;
import DTO.VaiTro;
import java.util.List;

public class Auth {

    // Tài khoản đang đăng nhập hiện tại
    private static TaiKhoan taiKhoanHienTai;

    /**
     * Gọi sau khi đăng nhập thành công để lưu thông tin tài khoản
     */
    public static void dangNhap(TaiKhoan tk) {
        taiKhoanHienTai = tk;
    }

    /**
     * Đăng xuất
     */
    public static void dangXuat() {
        taiKhoanHienTai = null;
    }

    /**
     * Lấy mã nhân viên đang đăng nhập
     */
    public static int getMaNV() {
        return taiKhoanHienTai != null ? taiKhoanHienTai.getMaNV() : -1;
    }

    /**
     * Lấy mã quyền (ADMIN, QL_KHO, QL_NHANSU, QL_KINHDOANH)
     */
    public static String getMaQuyen() {
        if (taiKhoanHienTai != null && taiKhoanHienTai.getVaiTro() != null) {
            return taiKhoanHienTai.getVaiTro().getMaVaiTro();
        }
        return null;
    }

    /**
     * Kiểm tra có phải Admin không
     */
    public static boolean isAdmin() {
        return "ADMIN".equals(getMaQuyen());
    }

    /**
     * Kiểm tra người dùng hiện tại có quyền cụ thể hay không.
     *
     * Ví dụ sử dụng:
     *   Auth.coQuyen("KHO_ThemSanPham")   → true/false
     *   Auth.coQuyen("NS_TinhLuong")      → true/false
     *   Auth.coQuyen("QLBanHang")         → true/false
     *
     * Danh sách tên quyền:
     *   - NS_XemDanhSach, NS_Them, NS_Sua, NS_Xoa, NS_DuyetNghi,
     *     NS_ThayDoiChucVu, NS_TinhLuong, NS_XemLuongCaNhan, NS_InBangLuong, NS_ChamCong
     *   - KHO_XemSanPham, KHO_ThemSanPham, KHO_SuaSanPham, KHO_XoaSanPham,
     *     KHO_NhapHang, KHO_QuanLyNCC, KHO_BaoCaoTonKho
     *   - BH_LapPhieuXuat, BH_ThongKeDoanhThu, BH_ThongKeLoiNhuan
     *   - PQ_QuanLyPhanQuyen, ADMIN_BaoCaoTongHop
     *   - QLBanHang, QLNhapHang, QLNhanVien, QLSanPham, QLKhachHang, QLKhuyenMai, QLThongKe
     */
    public static boolean coQuyen(String tenQuyen) {
        if (taiKhoanHienTai == null) {
            return false;
        }
        VaiTro vaiTro = taiKhoanHienTai.getVaiTro();
        if (vaiTro == null) {
            return false;
        }
        List<Quyen> danhSachQuyen = vaiTro.getDanhSachQuyen();
        if (danhSachQuyen == null) {
            return false;
        }
        for (Quyen q : danhSachQuyen) {
            if (q.getMaQuyen().equals(tenQuyen)) {
                return true;
            }
        }
        return false;
    }
}
