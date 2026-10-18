package DAO;

import DTO.Quyen;
import UTIL.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class QuyenDAO {

    // Mỗi cột BIT của PhanQuyen là một quyền, vai trò có quyền khi giá trị cột = 1
    public List<Quyen> getByVaiTro(String maVaiTro) {
        List<Quyen> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.PhanQuyen WHERE MaQuyen = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, maVaiTro);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    ResultSetMetaData md = rs.getMetaData();
                    for (int i = 1; i <= md.getColumnCount(); i++) {
                        if (md.getColumnType(i) == Types.BIT && rs.getBoolean(i)) {
                            String ten = md.getColumnName(i);
                            list.add(new Quyen(ten, ten));
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    // Cập nhật quyền cho vai trò cụ thể
    public boolean capNhat(String maVaiTro, String tenQuyen, boolean coQuyen) {
        // Tên cột không thể bind bằng ?, nên chỉ nhận tên có trong PhanQuyen
        if (!tenQuyen.matches("[A-Za-z_]+") || !tonTaiCot(tenQuyen)) {
            return false;
        }
        String sql = "UPDATE dbo.PhanQuyen SET " + tenQuyen + " = ? WHERE MaQuyen = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setBoolean(1, coQuyen);
            ps.setString(2, maVaiTro);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean tonTaiCot(String ten) {
        String sql = "SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('dbo.PhanQuyen') "
                + "AND name = ? AND system_type_id = 104";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, ten);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
