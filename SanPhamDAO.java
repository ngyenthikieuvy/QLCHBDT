package DAO;

import DTO.SanPham;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SanPhamDAO {

    public ArrayList<SanPham> laydanhsachsanpham() {
        ArrayList<SanPham> danhsach = new ArrayList<>();
        String sql = "SELECT * FROM dbo.SanPham";

        // Sử dụng try-with-resources để tự động đóng kết nối, PreparedStatement và ResultSet
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                SanPham sp = new SanPham();

                sp.setMaSP(rs.getString("MaSP"));
                sp.setTenSP(rs.getString("TenSP"));
                sp.setThuongHieu(rs.getString("ThuongHieu"));
                sp.setXuatxu(rs.getString("XuatXu"));
                sp.setMaLoai(rs.getInt("MaLoai"));
                sp.setMauSac(rs.getString("MauSac"));
                sp.setDungLuong(rs.getString("DungLuong"));
                sp.setGiaBan(rs.getDouble("GiaBan"));
                sp.setSoLuong(rs.getInt("SoLuong"));
                sp.setMoTa(rs.getString("MoTa"));

                danhsach.add(sp);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return danhsach;
    }

    //Thêm sản phẩm mới
    public boolean themSP(SanPham sp) {
        String sql = "INSERT INTO dbo.SanPham (MaSP, TenSP, ThuongHieu, XuatXu, MaLoai, MauSac, DungLuong, GiaBan, SoLuong, MoTa) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, sp.getMaSP());
            ps.setString(2, sp.getTenSP());
            ps.setString(3, sp.getThuongHieu());
            ps.setString(4, sp.getXuatxu());
            ps.setInt(5, sp.getMaLoai());
            ps.setString(6, sp.getMauSac());
            ps.setString(7, sp.getDungLuong());
            ps.setDouble(8, sp.getGiaBan());
            ps.setInt(9, sp.getSoLuong());
            ps.setString(10, sp.getMoTa());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean suaSP(SanPham sp) {
        String sql = "UPDATE SanPham SET TenSP=?,ThuongHieu=?," +
                "Xuatxu=?,MaLoai=?,MauSac=?,DungLuong=?," +
                "GiaBan=?,SoLuong=?,HinhAnh=?,MoTa=? WHERE MaSP=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, sp.getMaSP());
            ps.setString(2, sp.getTenSP());
            ps.setString(3, sp.getThuongHieu());
            ps.setString(4, sp.getXuatxu());
            ps.setInt(5, sp.getMaLoai());
            ps.setString(6, sp.getMauSac());
            ps.setString(7, sp.getDungLuong());
            ps.setDouble(8, sp.getGiaBan());
            ps.setInt(9, sp.getSoLuong());
            ps.setString(10, sp.getMoTa());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean xoa(int ID){
        String sql="DELETE FROM dbo.SanPham WHERE MaSP=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setInt (1,ID);

            return ps.executeUpdate()>0;}
        catch (SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    //Tìm kiếm Sản Phẩm
    public ArrayList<SanPham> timkiem(String tukhoa) {
        ArrayList<SanPham> danhsach = new ArrayList<>();

        // Sửa lại điều kiện WHERE: Thường tìm theo MaSP và TenSP thay vì ID (vì ID là số)
        String sql = "SELECT * FROM dbo.SanPham WHERE MaSP LIKE ? OR TenSP LIKE ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Tạo chuỗi tìm kiếm chứa % để dùng với LIKE
            String tk = "%" + tukhoa + "%";

            // Truyền biến tk vào cả 2 dấu hỏi (?)
            ps.setString(1, tk);
            ps.setString(2, tk);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    SanPham sp = new SanPham();
                    sp.setMaSP(rs.getString("MaSP"));
                    sp.setTenSP(rs.getString("TenSP"));
                    sp.setThuongHieu(rs.getString("ThuongHieu"));
                    sp.setXuatxu(rs.getString("XuatXu"));
                    sp.setMaLoai(rs.getInt("MaLoai"));
                    sp.setMauSac(rs.getString("MauSac"));
                    sp.setDungLuong(rs.getString("DungLuong"));
                    sp.setGiaBan(rs.getDouble("GiaBan")); // Khuyên dùng getBigDecimal cho tiền tệ
                    sp.setSoLuong(rs.getInt("SoLuong"));
                    sp.setMoTa(rs.getString("MoTa"));

                    danhsach.add(sp);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Bắt lỗi SQL nếu có
        }

        return danhsach; // Trả về danh sách kết quả tìm kiếm
    }

}

