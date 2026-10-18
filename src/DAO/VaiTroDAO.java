package DAO;

import DTO.VaiTro;
import UTIL.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VaiTroDAO {

    private final QuyenDAO quyenDAO = new QuyenDAO();

    // Lấy danh sách tất cả vai trò (kèm quyền)
    public List<VaiTro> getAll() {
        List<VaiTro> list = new ArrayList<>();
        String sql = "SELECT MaQuyen, TenQuyen FROM dbo.PhanQuyen";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(taoVaiTro(rs.getString("MaQuyen"), rs.getString("TenQuyen")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy vai trò theo mã vai trò (kèm quyền)
    public VaiTro getById(String maVaiTro) {
        String sql = "SELECT MaQuyen, TenQuyen FROM dbo.PhanQuyen WHERE MaQuyen = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, maVaiTro);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return taoVaiTro(rs.getString("MaQuyen"), rs.getString("TenQuyen"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private VaiTro taoVaiTro(String ma, String ten) {
        return new VaiTro(ma, ten, quyenDAO.getByVaiTro(ma));
    }
}
