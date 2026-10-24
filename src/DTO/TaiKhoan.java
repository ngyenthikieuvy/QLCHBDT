package DTO;

public class TaiKhoan {
    private int maNV;
    private String tenDangNhap;
    private String matKhau;
    private String vaiTro;      // "ADMIN", "QUANLY", "NHANVIEN"
    private boolean trangThai;

    public TaiKhoan() {
    }

    public TaiKhoan(int maNV, String tenDangNhap, String vaiTro, boolean trangThai) {
        this.maNV = maNV;
        this.tenDangNhap = tenDangNhap;
        this.vaiTro = vaiTro;
        this.trangThai = trangThai;
    }

    public int getMaNV() {
        return maNV;
    }

    public void setMaNV(int maNV) {
        this.maNV = maNV;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getVaiTro() {
        return vaiTro;
    }

    public void setVaiTro(String vaiTro) {
        this.vaiTro = vaiTro;
    }

    public boolean isTrangThai() {
        return trangThai;
    }

    public void setTrangThai(boolean trangThai) {
        this.trangThai = trangThai;
    }
}
