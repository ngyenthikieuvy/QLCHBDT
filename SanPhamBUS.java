package BUS;
import DAO.SanPhamDAO;
import DTO.SanPham;


import java.util.ArrayList;

public class SanPhamBUS {
    private SanPhamDAO spDAO = new SanPhamDAO();

    public ArrayList<SanPham> laydanhsachsanpham() {
        return spDAO.laydanhsachsanpham();
    }

    public String themSP(SanPham sp) {
        if (sp == null) {
            return "Thông tin sản phẩm không hợp lệ";
        }

        if (sp.getMaSP() == null || sp.getMaSP().trim().isEmpty()) {
            return "Không để trống mã sản phẩm";
        }
        if (sp.getTenSP() == null
                || sp.getTenSP().trim().isEmpty()) {
            return "Tên sản phẩm không được để trống!";
        }

        if (sp.getThuongHieu() == null
                || sp.getThuongHieu().trim().isEmpty()) {
            return "Thương hiệu không được để trống!";
        }

        if (sp.getGiaBan() <= 0) {
            return "Giá bán phải lớn hơn 0!";
        }

        if (sp.getSoLuong() < 0) {
            return "Số lượng không được âm!";
        }

        if (sp.getMaLoai() <= 0) {
            return "Mã loại sản phẩm không hợp lệ!";
        }

        if (spDAO.themSP(sp)) {
            return "Thêm sản phẩm thành công";
        }

        return "thêm sản phẩm thất bại";
    }

    public String suaSP(SanPham sp) {
        if (sp == null) {
            return "Thông tin sản phẩm không hợp lệ!";
        }

        if (sp.getMaSP() == null
                || sp.getMaSP().trim().isEmpty()) {
            return "Mã sản phẩm không hợp lệ!";
        }

        if (sp.getTenSP() == null
                || sp.getTenSP().trim().isEmpty()) {
            return "Tên sản phẩm không được để trống!";
        }

        if (sp.getGiaBan() <= 0) {
            return "Giá bán phải lớn hơn 0!";
        }

        if (sp.getSoLuong() < 0) {
            return "Số lượng không được âm!";
        }

        if (spDAO.suaSP(sp)) {
            return "Cập nhật sản phẩm thành công!";
        }

        return "Cập nhật sản phẩm thất bại!";
    }

    public String xoaSP(int ID) {

        if (ID <= 0) {
            return "ID sản phẩm không hợp lệ!";
        }

        if (spDAO.xoa(ID)) {
            return "Xóa sản phẩm thành công!";
        }

        return "Xóa sản phẩm thất bại!";
    }

    // 5. Tìm kiếm sản phẩm
    public ArrayList<SanPham> timkiem(String tukhoa) {

        if (tukhoa == null || tukhoa.trim().isEmpty()) {
            return laydanhsachsanpham();
        }

        return spDAO.timkiem(tukhoa.trim());
    }
}

