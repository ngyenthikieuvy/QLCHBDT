package DTO;

public class KhachHang extends Nguoi { 
    private int DiemTichLuy;

    public KhachHang() {
        super(); 
    }

    public int getDiemTichLuy() { return DiemTichLuy; }
    public void setDiemTichLuy(int DiemTichLuy) { this.DiemTichLuy = DiemTichLuy; }
}