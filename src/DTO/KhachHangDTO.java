package DTO;

public class KhachHangDTO extends NguoiDTO { 
    private int DiemTichLuy;

    public KhachHangDTO() {
        super(); 
    }

    public void MuaHang() { /* Code mua hàng */ }
    public void TichDiem() { /* Code tích điểm */ }

    public int getDiemTichLuy() { return DiemTichLuy; }
    public void setDiemTichLuy(int DiemTichLuy) { this.DiemTichLuy = DiemTichLuy; }
}