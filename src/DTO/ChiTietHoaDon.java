package DTO;

//Đang đợi class SanPham, sẽ fix lại sau ạ
public class ChiTietHoaDon {
    private SanPham SP;
    private int SoLuong;
    private double dongia;

    public ChiTietHoaDon() {
    }

    public ChiTietHoaDon(SanPham SP, int SoLuong, double dongia) {
        this.SP = SP;
        this.SoLuong = SoLuong;
        this.dongia = dongia;
    }

    public double TinhThanhtien() {
        return this.SoLuong * this.dongia;
    }

    public void Hienthichitiet() {
        String tenSP = (SP != null) ? SP.getTenSP() : "N/A";
        System.out.printf("San pham: %-15s | So luong: %-3d | Don gia: %-10.2f | Thanh tien: %-10.2f%n",
                tenSP, SoLuong, dongia, TinhThanhtien());
    }


    public SanPham getSP() { return SP; }
    public void setSP(SanPham SP) { this.SP = SP; }

    public int getSoLuong() { return SoLuong; }
    public void setSoLuong(int SoLuong) { this.SoLuong = SoLuong; }

    public double getDongia() { return dongia; }
    public void setDongia(double dongia) { this.dongia = dongia; }
}
