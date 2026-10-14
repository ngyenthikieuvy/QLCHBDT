package DTO;

public class ChiTietHoaDon{
    private int maHD;
    private int maSP;
    private int soLuong;
    private double donGia;
    private double thanhTien;
    private int ID;
    
public ChiTietHoaDon {
}
    
public CTHoaDon(int maHD, int soLuong, double donGia, double thanhTien, int ID) {
        this.maHD = maHD;
        this.maSP =maSP;
        this.soLuong = soLuong;
        this.donGia = donGia;
        this.thanhTien = thanhTien;
        this.ID = ID;
}

public int getmaHD() {
    return maHD;
    }
    
public void setmaHD() {
    this.maHD = maHD;
    }
    
public int getmaSP() {
    return maSP;
    }
    
public void setmaSP() {
    this.maSP = maSP;
    }
public int getSoLuong() {
        return soLuong;
    }
public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

public double getDonGia() {
        return donGia;
    }

public void setDonGia(double donGia) {
        this.donGia = donGia;
    }

public double getThanhTien() {
        return thanhTien;
    }

public void setThanhTien(double thanhTien) {
        this.thanhTien = thanhTien;
    }

public int getID() {
        return ID;
    }

public void setID(int ID) {
        this.ID = ID;
    } 
}




