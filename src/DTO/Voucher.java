package DTO;
import java.util.Date;

public class Voucher {
    
    // Thuộc tính
    private String MaVC;
    private String TenVC;
    private Date Ngaybd;
    private Date Ngaykt;
    private double GiaToiThieu;
    private double GiaToiDa;
    private int SoLuong;
    private String Trangthai;

    public Voucher() {
    }

    public Voucher(String MaVC, String TenVC, Date Ngaybd, Date Ngaykt, 
                   double GiaToiThieu, double GiaToiDa, int SoLuong, String Trangthai) {
        this.MaVC = MaVC;
        this.TenVC = TenVC;
        this.Ngaybd = Ngaybd;
        this.Ngaykt = Ngaykt;
        this.GiaToiThieu = GiaToiThieu;
        this.GiaToiDa = GiaToiDa;
        this.SoLuong = SoLuong;
        this.Trangthai = Trangthai;
    }

    //Kiểm tra xem voucher còn hiệu lực ko
    public boolean Kiemtrahieuluc() {
        Date ngayHienTai = new Date();
        if (SoLuong <= 0) return false;
        if (Ngaybd != null && ngayHienTai.before(Ngaybd)) return false;
        if (Ngaykt != null && ngayHienTai.after(Ngaykt)) return false;
        return true;
    }

    public double Tinhtiengiam(double tongTienDonHang) {
        if (!Kiemtrahieuluc() || tongTienDonHang < GiaToiThieu) {
            return 0.0;
        }
        return Math.min(GiaToiDa, tongTienDonHang);
    }

    public void hienthithongtin() {
        System.out.println("Ma Voucher: " + MaVC + " | Ten: " + TenVC
            + " | Don toi thieu: " + GiaToiThieu
            + " | Giam toi da: " + GiaToiDa
            + " | So luong: " + SoLuong
            + " | Trang thai: " + Trangthai);
    }

    public String getMaVC() { return MaVC; }
    public void setMaVC(String maVC) { MaVC = maVC; }

    public String getTenVC() { return TenVC; }
    public void setTenVC(String tenVC) { TenVC = tenVC; }

    public Date getNgaybd() { return Ngaybd; }
    public void setNgaybd(Date ngaybd) { Ngaybd = ngaybd; }

    public Date getNgaykt() { return Ngaykt; }
    public void setNgaykt(Date ngaykt) { Ngaykt = ngaykt; }

    public double getGiaToiThieu() { return GiaToiThieu; }
    public void setGiaToiThieu(double giaToiThieu) { GiaToiThieu = giaToiThieu; }

    public double getGiaToiDa() { return GiaToiDa; }
    public void setGiaToiDa(double giaToiDa) { GiaToiDa = giaToiDa; }

    public int getSoLuong() { return SoLuong; }
    public void setSoLuong(int soLuong) { SoLuong = soLuong; }

    public String getTrangthai() { return Trangthai; }
    public void setTrangthai(String trangthai) { Trangthai = trangthai; }
}
