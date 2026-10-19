package DAO;

import DTO.ChiTietPhieuNhap;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import UTIL.DBConnect;

public class ChiTietPhieuNhapDAO {
    public ArrayList<ChiTietPhieuNhap> layChiTietPhieuNhap() {
        ArrayList<ChiTietPhieuNhap> ds = new ArrayList<>();
        String sql = "SELECT * FROM dbo.CTPhieuNhap";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ChiTietPhieuNhap ctpn = new ChiTietPhieuNhap(
                        rs.getInt("maPhieuNhap"),
                        rs.getInt("ID"),
                        rs.getInt("soLuong"),
                        rs.getDouble("GiaNhap")
                    );                   
                    ds.add(ctpn);
                }
            }
        catch (SQLException e) {
            e.printStackTrace();     
        }
        return ds;
    }

    //Thêm sản phẩm vào phiếu nhập
    public boolean themSanPhamVaoPhieu(ChiTietPhieuNhap ctpn) {
        String sql = "INSERT INTO dbo.CTPhieuNhap (MaPN, ID, SoLuong, GiaNhap) VAULES (?, ?, ?, ?)";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql))
             {
                ps.setInt(1, ctpn.getMaPhieuNhap());
                ps.setInt(2, ctpn.getMaSanPham());
                ps.setInt(3, ctpn.getSoLuong());
                ps.setDouble(4, ctpn.getDonGia());
                return ps.executeUpdate() > 0;
             } 
        catch (SQLException e) {
                e.printStackTrace();
        }
        return false;
    }

    //Xóa sản phẩm khỏi phiếu nhập
    public boolean xoaSanPhamKhoiPhieu(int maPhieuNhap, int maSanPham){
        String sql = "DELETE FROM dbo.CTPhieuNhap WHERE MaPN = ? AND ID = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql))
             {
                ps.setInt(1, maPhieuNhap);
                ps.setInt(2, maSanPham);
                return ps.executeUpdate() > 0;
             }
        catch (SQLException e) {
                e.printStackTrace();
        }
        return false;
    }

    //Sửa thông tin sản phẩm trong phiếu nhập
    public boolean suaSanPhamTrongPhieu(ChiTietPhieuNhap ctpn) {
        String sql = "UPDATE dbo.CTPhieuNhap SET SoLuong = ?, GiaNhap = ? WHERE MaPN = ? AND ID = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql))
             {
                ps.setInt(1, ctpn.getSoLuong());
                ps.setDouble(2, ctpn.getDonGia());
                ps.setInt(3, ctpn.getMaPhieuNhap());
                ps.setInt(4, ctpn.getMaSanPham());
                return ps.executeUpdate() > 0;
             }
        catch (SQLException e) {
                e.printStackTrace();
        }
        return false;
    }

    //Lấy các sản phẩm trong 1 phiếu nhập 
    public ArrayList<ChiTietPhieuNhap> cacsanphamtrongphieu(int maPhieuNhap){
        ArrayList<ChiTietPhieuNhap> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.CTPhieuNhap WHERE MaPN = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql))
             {
                ps.setInt(1, maPhieuNhap);
                ResultSet rs = ps.executeQuery();
                while (rs.next()){
                    ChiTietPhieuNhap ctpn = new ChiTietPhieuNhap();
                    ctpn.setMaPhieuNhap(rs.getInt("MaPN"));
                    ctpn.setMaSanPham(rs.getInt("ID"));
                    ctpn.setSoLuong(rs.getInt("SoLuong"));
                    ctpn.setDonGia(rs.getDouble("GiaNhap"));
                    list.add(ctpn);
                }
             }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //Xóa tất cả chi tiết của phiếu
    public boolean xoaTatCaChiTietCuaPhieu(int maPhieuNhap){
        String sql = "DELETE FROM dbo.CTPhieuNhap WHERE MaPN = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql))
             {
                ps.setInt(1, maPhieuNhap);
                return ps.executeUpdate() > 0;
             }
        catch (SQLException e) {
                e.printStackTrace();
        }
        return false;
    }
}