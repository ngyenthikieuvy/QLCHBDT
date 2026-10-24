package DTO;
                
public class NhanVien extends Nguoi {

    private String maCV;
    private boolean trangThai;


    public NhanVien() {
        super();
    }

    public NhanVien(int maNV, String ho, String ten, String gioiTinh, String soDienThoai, String maCV, boolean trangThai) {
        super(maNV, ho, ten, gioiTinh, soDienThoai);
        this.maCV = maCV;
        this.trangThai = trangThai;
    }
    
    public String getMaCV() {
        return maCV;
    }

    public void setMaCV(String maCV) {
        this.maCV = maCV;
    }

    public boolean isTrangThai() {
        return trangThai;
    }

    public void setTrangThai(boolean trangThai) {
        this.trangThai = trangThai;
    }

}