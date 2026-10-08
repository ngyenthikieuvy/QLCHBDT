package DAO;

import DTO.KhachHangDTO;

public class KhachHangDAO {
    public boolean themKhachHang(KhachHangDTO kh) {
        String sql = "INSERT INTO KhachHang (HoTen, GioiTinh, SDT, DiaChi) VALUES (?, ?, ?, ?)";
        
        int rows = DataProvider.executeUpdate(sql,
                kh.getHoTen(),
                kh.getGioiTinh(),
                kh.getSDT(),
                kh.getDiaChi()
        );
        
        return rows > 0;
    }


public boolean suaKhachHang(KhachHangDTO kh) {
        String sql = "UPDATE KhachHang SET HoTen=?, GioiTinh = ?, SoDienThoai = ?, DiaChi = ? WHERE Ma = ?";
        
        int rows = DataProvider.executeUpdate(sql,
                kh.getHoTen(),
                kh.getGioiTinh(),
                kh.getSDT(),
                kh.getDiaChi(),
                kh.getMa() 
        );
        
        return rows > 0;
    }
}