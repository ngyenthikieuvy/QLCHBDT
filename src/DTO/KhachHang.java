package DTO;

public class KhachHang extends Nguoi {

    private int tongChiTieu; 
    private boolean tinhTrang; 

    public KhachHang() {
        super();
    }

    public KhachHang(int maKH, String ho, String ten, String gioiTinh, String soDienThoai, int tongChiTieu, boolean tinhTrang) {
        super(maKH, ho, ten, gioiTinh, soDienThoai);
        this.tongChiTieu = tongChiTieu;
        this.tinhTrang = tinhTrang;
    }

    public int getTongChiTieu() {
        return tongChiTieu;
    }

    public void setTongChiTieu(int tongChiTieu) {
        this.tongChiTieu = tongChiTieu;
    }

    public boolean isTinhTrang() { 
        return tinhTrang;
    }

    public void setTinhTrang(boolean tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

    public String getMaKH() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}