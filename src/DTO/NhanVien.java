package DTO;
                
public class NhanVien extends Nguoi {

    private String maCV;
    private String maQuyen;
    private boolean trangThai;
    private String tenTaiKhoan;

    public NhanVien() {
        super();
    }

    public NhanVien(int maNV, String ho, String ten, String gioiTinh, String soDienThoai, String maCV, String maQuyen, boolean trangThai, String tenTaiKhoan) {
        super(maNV, ho, ten, gioiTinh, soDienThoai);
        this.maCV = maCV;
        this.maQuyen = maQuyen;
        this.trangThai = trangThai;
        this.tenTaiKhoan = tenTaiKhoan;
    }

    public NhanVien(int maNV, String ho, String ten, String gioiTinh, String soDienThoai, String maCV, boolean trangThai, String tenTaiKhoan) {
        super(maNV, ho, ten, gioiTinh, soDienThoai);
        this.maCV = maCV;
        this.trangThai = trangThai;
        this.tenTaiKhoan = tenTaiKhoan;
    }

    public String getMaCV() {
        return maCV;
    }

    public void setMaCV(String maCV) {
        this.maCV = maCV;
    }

    public String getMaQuyen() {
        return maQuyen;
    }

    public void setMaQuyen(String maQuyen) {
        this.maQuyen = maQuyen;
    }

    public boolean isTrangThai() {
        return trangThai;
    }

    public void setTrangThai(boolean trangThai) {
        this.trangThai = trangThai;
    }

    public String getTenTaiKhoan() {
        return tenTaiKhoan;
    }

    public void setTenTaiKhoan(String tenTaiKhoan) {
        this.tenTaiKhoan = tenTaiKhoan;
    }

    public String getMaNV() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}