package DTO;

public class ChiTietPhieuNhap {
    private int maPhieuNhap; 
    private int maSanPham;   
    private int soLuong;        
    private double donGia;      
    private double thanhTien;        // Thành tiền (soLuong * donGia)

    public ChiTietPhieuNhap() {
    }

    public ChiTietPhieuNhap(int maPhieuNhap, int maSanPham, int soLuong, double donGia) {
        this.maPhieuNhap = maPhieuNhap;
        this.maSanPham = maSanPham;
        this.soLuong = soLuong;
        this.donGia = donGia;
        this.thanhTien = soLuong * donGia; 
    }

    public int getMaPhieuNhap() {
        return maPhieuNhap;
    }

    public void setMaPhieuNhap(int maPhieuNhap) {
        this.maPhieuNhap = maPhieuNhap;
    }

    public int getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(int maSanPham) {
        this.maSanPham = maSanPham;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
        this.thanhTien = this.soLuong * this.donGia; // Cập nhật lại thành tiền khi đổi số lượng
    }

    public double getDonGia() {
        return donGia;
    }

    public void setDonGia(double donGia) {
        this.donGia = donGia;
        this.thanhTien = this.soLuong * this.donGia; // Cập nhật lại thành tiền khi đổi đơn giá
    }

    public double getThanhTien() {
        return thanhTien;
    }
    
    @Override
    public String toString() {
        return "ChiTietPhieuNhap{" +
                "maPhieuNhap=" + maPhieuNhap +
                ", maSanPham=" + maSanPham +
                ", soLuong=" + soLuong +
                ", donGia=" + donGia +
                ", thanhTien=" + thanhTien +
                '}';
    }
}