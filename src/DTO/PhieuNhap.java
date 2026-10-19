package DTO;

import java.time.LocalDate;
import java.util.ArrayList;

public class PhieuNhap{
    private int maPhieuNhap;
    private int maNhaCungCap;
    private int maNhanVien;            //Nhân viên phụ trách việc nhập hàng
    private LocalDate ngayNhap;
    private double TongTien;
    private ArrayList<ChiTietPhieuNhap> danhSachChiTiet;
    
    public PhieuNhap(){
        this.danhSachChiTiet = new ArrayList<ChiTietPhieuNhap>();
        this.ngayNhap = LocalDate.now();
    }
    
    public PhieuNhap(int maPhieuNhap, int maNhaCungCap, int maNhanVien, LocalDate ngayNhap, double TongTien, ArrayList<ChiTietPhieuNhap> danhSachChiTiet){
        this.maPhieuNhap = maPhieuNhap;
        this.maNhaCungCap = maNhaCungCap;
        this.maNhanVien = maNhanVien;
        this.ngayNhap = ngayNhap;
        this.TongTien = TongTien;
        this.danhSachChiTiet = danhSachChiTiet;
    }
    
    public int getmaPhieuNhap(){
        return maPhieuNhap;
    }
    
    public void setmaPhieuNhap(int maPhieuNhap){
        this.maPhieuNhap = maPhieuNhap;
    }
    
    public int getmaNhaCungCap(){
        return maNhaCungCap;
    }
    
    public void setmaNhaCungCap(int maNhaCungCap){
        this.maNhaCungCap = maNhaCungCap;
    }
    
    public int getmaNhanVien(){
        return maNhanVien;
    }
    
    public void setmaNhanVien(int maNhanVien){
        this.maNhanVien = maNhanVien;
    }
    
    public LocalDate getNgayNhap() {
        return ngayNhap;
    }

    public void setNgayNhap(LocalDate ngayNhap) {
            this.ngayNhap = ngayNhap;
    }
    
    public double getTongTien() {
        return TongTien;
    }

    public void setTongTien(double TongTien) {
        this.TongTien = TongTien;
    }
    
    public ArrayList<ChiTietPhieuNhap> getDanhSachChiTiet() {
        return danhSachChiTiet;
    }

    public void setDanhSachChiTiet(ArrayList<ChiTietPhieuNhap> danhSachChiTiet) {
        if (danhSachChiTiet == null) {
            this.danhSachChiTiet = new ArrayList<ChiTietPhieuNhap>();
        } 
        else {
            this.danhSachChiTiet = danhSachChiTiet;
        }
    }
    
    @Override
    public String toString() {
        return "PhieuNhap{" +
                "maPhieuNhap=" + maPhieuNhap +
                ", maNhaCungCap=" + maNhaCungCap +
                ", maNhanVien=" + maNhanVien +
                ", ngayNhap=" + ngayNhap +
                ", tongTien=" + TongTien +
                ", soLuongMatHang=" + this.danhSachChiTiet.size() +
                '}';
    }
}
