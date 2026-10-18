package DAO;

import DTO.TaiKhoan;
import UTIL.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TaiKhoanDAO {

    private final VaiTroDAO vaiTroDAO = new VaiTroDAO();

    private static final String HASH = "CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', CAST(? AS VARCHAR(255))), 2)";

    // Trả về TaiKhoan (kèm vai trò và quyền) nếu đúng thông tin và đang hoạt động, ngược lại null
    public TaiKhoan dangNhap(String tenDangNhap, String matKhau) {
        String sql = "SELECT MaNV, TaiKhoan, MaQuyen, TrangThai FROM dbo.TaiKhoan "
                + "WHERE TaiKhoan = ? AND MatKhau = " + HASH + " AND TrangThai = 1";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, tenDangNhap);
            ps.setString(2, matKhau);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    TaiKhoan tk = new TaiKhoan();
                    tk.setMaNV(rs.getInt("MaNV"));
                    tk.setTenDangNhap(rs.getString("TaiKhoan"));
                    tk.setTrangThai(rs.getBoolean("TrangThai"));
                    tk.setVaiTro(vaiTroDAO.getById(rs.getString("MaQuyen")));
                    return tk;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean doiMatKhau(int maNV, String matKhauCu, String matKhauMoi) {
        String sql = "UPDATE dbo.TaiKhoan SET MatKhau = " + HASH
                + " WHERE MaNV = ? AND MatKhau = " + HASH;
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, matKhauMoi);
            ps.setInt(2, maNV);
            ps.setString(3, matKhauCu);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean tonTai(String tenDangNhap) {
        String sql = "SELECT 1 FROM dbo.TaiKhoan WHERE TaiKhoan = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, tenDangNhap);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
