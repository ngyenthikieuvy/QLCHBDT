/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

public class NhanVienBanHang extends NhanVienDTO {
    private double DoanhSo;
    private double HoaHong;

    public double getDoanhSo() {
        return DoanhSo;
    }

    public void setDoanhSo(double DoanhSo) {
        this.DoanhSo = DoanhSo;
    }

    public double getHoaHong() {
        return HoaHong;
    }

    public void setHoaHong(double HoaHong) {
        this.HoaHong = HoaHong;
    }

    public NhanVienBanHang() { super(); }

    public void TuVanSP() { /* Code tư vấn */ }
    public Double TinhHoaHong() { return DoanhSo * HoaHong; }

    
}
