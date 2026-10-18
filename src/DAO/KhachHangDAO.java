
package DAO;

import DTO.KhachHang;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import UTIL.DBConnect;

public class KhachHangDAO {

    // Lấy danh sách tất cả khách hàng
    public ArrayList<KhachHang> layDanhSachKhachHang() {
        ArrayList<KhachHang> ds = new ArrayList<>();
        String sql = "SELECT * FROM khachhang";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                KhachHang kh = new KhachHang(
                    rs.getInt("maKH"),
                    rs.getString("ho"),
                    rs.getString("ten"),
                    rs.getString("gioiTinh"),
                    rs.getString("soDienThoai"),
                    rs.getInt("tongChiTieu"),
                    rs.getBoolean("tinhTrang")
                );
                ds.add(kh);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ds;
    }

    // Thêm khách hàng mới
    public boolean themKhachHang(KhachHang kh) {
        String sql = "INSERT INTO khachhang (ho, ten, gioiTinh, soDienThoai, tongChiTieu, tinhTrang) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, kh.getHo());
            ps.setString(2, kh.getTen());
            ps.setString(3, kh.getGioiTinh());
            ps.setString(4, kh.getSoDienThoai());
            ps.setInt(5, kh.getTongChiTieu());
            ps.setBoolean(6, kh.isTinhTrang());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Sửa thông tin khách hàng
    public boolean suaKhachHang(KhachHang kh) {
        String sql = "UPDATE khachhang SET ho = ?, ten = ?, gioiTinh = ?, soDienThoai = ?, tongChiTieu = ?, tinhTrang = ? WHERE maKH = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, kh.getHo());
            ps.setString(2, kh.getTen());
            ps.setString(3, kh.getGioiTinh());
            ps.setString(4, kh.getSoDienThoai());
            ps.setInt(5, kh.getTongChiTieu());
            ps.setBoolean(6, kh.isTinhTrang());
            ps.setInt(7, kh.getMa()); // Hoặc kh.getMaKH() nếu dùng method cũ

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa khách hàng (xóa mềm bằng cách cập nhật tinhTrang = false hoặc xóa cứng khỏi CSDL)
    public boolean xoaKhachHang(int maKH) {
        // Xóa mềm (vẫn giữ lịch sử hóa đơn, không xóa hẳn khỏi database)
        String sql = "UPDATE khachhang SET tinhTrang = 0 WHERE maKH = ?";
        
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, maKH);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Tìm kiếm khách hàng theo từ khóa (tên hoặc số điện thoại)
    public ArrayList<KhachHang> timkiemKhachHang(String tuKhoa) {
        ArrayList<KhachHang> ds = new ArrayList<>();
        String sql = "SELECT * FROM khachhang WHERE ten LIKE ? OR ho LIKE ? OR soDienThoai LIKE ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            String key = "%" + tuKhoa + "%";
            ps.setString(1, key);
            ps.setString(2, key);
            ps.setString(3, key);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    KhachHang kh = new KhachHang(
                        rs.getInt("maKH"),
                        rs.getString("ho"),
                        rs.getString("ten"),
                        rs.getString("gioiTinh"),
                        rs.getString("soDienThoai"),
                        rs.getInt("tongChiTieu"),
                        rs.getBoolean("tinhTrang")
                    );
                    ds.add(kh);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ds;
    }

    // Lấy họ tên đầy đủ của khách hàng theo mã KH
    public String getTenKhachHang(int maKH) {
        String sql = "SELECT ho, ten FROM khachhang WHERE maKH = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, maKH);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("ho") + " " + rs.getString("ten");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ""; // Trả về chuỗi rỗng nếu không tìm thấy
    }
}