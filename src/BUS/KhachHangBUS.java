/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BUS;

import DAO.KhachHangDAO;
import DTO.KhachHang;

import java.util.ArrayList;

public class KhachHangBUS {

    private final KhachHangDAO khachHangDAO;

    public KhachHangBUS() {
        khachHangDAO = new KhachHangDAO();
    }

    
    public ArrayList<KhachHang> layDanhSachKhachHang() {
        return khachHangDAO.layDanhSachKhachHang();
    }

   
    public String themKhachHang(KhachHang kh) {
        
        if (kh.getHo().trim().isEmpty() || kh.getTen().trim().isEmpty()) {
            return "Họ và tên không được để trống";
        }
        
        if (kh.getSoDienThoai().trim().isEmpty()) {
            return "Số điện thoại không được để trống";
        }

      
        if (!kh.getSoDienThoai().matches("^0\\d{9}$")) {
            return "Số điện thoại không hợp lệ (phải đủ 10 số, bắt đầu bằng 0)";
        }
        
       
        if (khachHangDAO.themKhachHang(kh)) {
            return "Thêm khách hàng thành công";
        } else {
            return "Thêm khách hàng thất bại";
        }
    }

    
    public String suaKhachHang(KhachHang kh) {
        // Kiểm tra cơ bản
        if (kh.getHo().trim().isEmpty() || kh.getTen().trim().isEmpty()) {
            return "Họ và tên không được để trống";
        }
        
        if (kh.getSoDienThoai().trim().isEmpty()) {
            return "Số điện thoại không được để trống";
        }

       
        if (!kh.getSoDienThoai().matches("^0\\d{9}$")) {
            return "Số điện thoại không hợp lệ (phải đủ 10 số, bắt đầu bằng 0)";
        }

        
        if (khachHangDAO.suaKhachHang(kh)) {
            return "Sửa thông tin khách hàng thành công";
        } else {
            return "Sửa thông tin khách hàng thất bại";
        }
    }

   
    public String xoaKhachHang(int maKH) {
        if (maKH <= 0) {
            return "Mã khách hàng không hợp lệ";
        }
        
        // Gọi DAO để "xóa"
        if (khachHangDAO.xoaKhachHang(maKH)) {
            return "Xóa khách hàng thành công";
        } else {
            return "Xóa khách hàng thất bại";
        }
    }

    
    public ArrayList<KhachHang> timKiemKhachHang(String tuKhoa) {
        if (tuKhoa == null || tuKhoa.trim().isEmpty()) {
            
            return khachHangDAO.layDanhSachKhachHang();
        }
        return khachHangDAO.timkiemKhachHang(tuKhoa);
    }

    public ArrayList<String> layDanhSachChucVu() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
