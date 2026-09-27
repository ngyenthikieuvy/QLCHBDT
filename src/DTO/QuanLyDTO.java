/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

public class QuanLyDTO extends NhanVienDTO {
    private Double PhuCap;
    private String QuyenHan;

    public Double getPhuCap() {
        return PhuCap;
    }

    public void setPhuCap(Double PhuCap) {
        this.PhuCap = PhuCap;
    }

    public String getQuyenHan() {
        return QuyenHan;
    }

    public void setQuyenHan(String QuyenHan) {
        this.QuyenHan = QuyenHan;
    }

    public QuanLyDTO() { super(); }

    public Double TinhLuong() { 
        return 0.0; 
    }
    
    public boolean Kiemtraquyen() { return true; }

    
}