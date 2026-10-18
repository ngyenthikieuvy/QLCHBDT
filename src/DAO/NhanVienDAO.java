package DAO;

import DTO.NhanVien;
import UTIL.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NhanVienDAO {

    //  Lấy danh sách tất cả nhân viên
    public ArrayList<NhanVien> layDanhSachNhanVien() {
        ArrayList<NhanVien> ds = new ArrayList<>();
        String sql = "SELECT * FROM nhanvien";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                NhanVien nv = new NhanVien(
                    rs.getInt("maNV"),
                    rs.getString("ho"),
                    rs.getString("ten"),
                    rs.getString("gioiTinh"),
                    rs.getString("soDienThoai"),
                    rs.getString("maCV"),
                    rs.getString("maQuyen"),
                    rs.getBoolean("trangThai"),
                    rs.getString("tenTaiKhoan")
                );
                ds.add(nv);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ds;
    }

    //  Thêm nhân viên mới
    public boolean themNhanVien(NhanVien nv) {
        String sql = "INSERT INTO nhanvien (ho, ten, gioiTinh, soDienThoai, maCV, maQuyen, trangThai, tenTaiKhoan, matKhau) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nv.getHo());
            ps.setString(2, nv.getTen());
            ps.setString(3, nv.getGioiTinh());
            ps.setString(4, nv.getSoDienThoai());
            ps.setString(5, nv.getMaCV());
            ps.setString(6, nv.getMaQuyen());
            ps.setBoolean(7, nv.isTrangThai());
            ps.setString(8, nv.getTenTaiKhoan());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Sửa thông tin khách hàng 
    public boolean suaKhachHang(NhanVien nv) {
        return updateNhanVien(nv); // Gọi lại hàm updateNhanVien để tránh trùng lặp code
    }

    // Cập nhật thông tin nhân viên 
    public boolean updateNhanVien(NhanVien nv) {
        String sql = "UPDATE nhanvien SET ho = ?, ten = ?, gioiTinh = ?, soDienThoai = ?, maCV = ?, maQuyen = ?, trangThai = ?, tenTaiKhoan = ?, matKhau = ? WHERE maNV = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nv.getHo());
            ps.setString(2, nv.getTen());
            ps.setString(3, nv.getGioiTinh());
            ps.setString(4, nv.getSoDienThoai());
            ps.setString(5, nv.getMaCV());
            ps.setString(6, nv.getMaQuyen());
            ps.setBoolean(7, nv.isTrangThai());
            ps.setString(8, nv.getTenTaiKhoan());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //  Xóa nhân viên 
    public boolean xoaNhanVien(int maNV) {
        String sql = "UPDATE nhanvien SET trangThai = 0 WHERE maNV = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, maNV);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Set tên khách hàng 
    public boolean setTenKhachHang(int maKH, String tenMoi) {
        String sql = "UPDATE khachhang SET ten = ? WHERE maKH = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, tenMoi);
            ps.setInt(2, maKH);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}