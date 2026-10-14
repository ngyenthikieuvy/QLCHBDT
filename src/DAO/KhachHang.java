package DAO;

import DTO.KhachHang;

public class KhachHang {
    public boolean themKhachHang(KhachHang kh) {
        String sql = "INSERT INTO KhachHang (HoTen, GioiTinh, SDT, DiaChi) VALUES (?, ?, ?, ?)";
        
        int rows = DataProvider.executeUpdate(sql,
                kh.getHoTen(),
                kh.getGioiTinh(),
                kh.getSDT(),
                kh.getDiaChi()
        );
        
        return rows > 0;
    }


public boolean suaKhachHang(KhachHang kh) {
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