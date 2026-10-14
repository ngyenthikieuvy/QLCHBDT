package DTO;

public class Nguoi {
    private String Ma;
    private String HoTen;
    private String GioiTinh;
    private String SDT;
    private String DiaChi;

public Nguoi(String Ma, String HoTen, String GioiTinh, String SDT, String DiaChi) {
        this.Ma = Ma;
        this.HoTen = HoTen;
        this.GioiTinh = GioiTinh;
        this.SDT = SDT;
        this.DiaChi = DiaChi;
    }    

public Nguoi() {
    }

    public String getMa() {
        return Ma;
    }

    public void setMa(String Ma) {
        this.Ma = Ma;
    }

    public String getHoTen() {
        return HoTen;
    }

    public void setHoTen(String HoTen) {
        this.HoTen = HoTen;
    }

    public String getGioiTinh() {
        return GioiTinh;
    }

    public void setGioiTinh(String GioiTinh) {
        this.GioiTinh = GioiTinh;
    }
    
    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public String getDiaChi() {
        return DiaChi;
    }

    public void setDiaChi(String DiaChi) {
        this.DiaChi = DiaChi;
    }
}
