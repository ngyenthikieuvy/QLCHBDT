package DTO;

//Đang đợi class SanPham, sẽ fix lại sau ạ
import java.util.Arrays;
import java.util.Date;

public class HoaDon {
    private String MaHD;
    private Date Ngay;
    private NhanVienDTO nhanvien;
    private KhachHangDTO khachhang;
    private Double Giamgia;
    private Voucher Voucher;
    private String TrangThai;

    // Mảng chi tiết hóa đơn
    private ChiTietHoaDon[] dsChiTiet;

    // Constructors
    public HoaDon() {
        this.Ngay = new Date();
        this.Giamgia = 0.0;
        this.dsChiTiet = new ChiTietHoaDon[0]; 
    }

    public HoaDon(String MaHD, Date Ngay, NhanVienDTO nhanvien, KhachHangDTO khachhang, 
                  Double Giamgia, Voucher Voucher, String TrangThai, ChiTietHoaDon[] dsChiTiet) {
        this.MaHD = MaHD;
        this.Ngay = Ngay;
        this.nhanvien = nhanvien;
        this.khachhang = khachhang;
        this.Giamgia = Giamgia;
        this.Voucher = Voucher;
        this.TrangThai = TrangThai;
        this.dsChiTiet = (dsChiTiet != null) ? dsChiTiet : new ChiTietHoaDon[0];
    }

    // Thêm sản phẩm vào chi tiết hóa đơn
    public void Them(ChiTietHoaDon ct) {
        if (ct == null) return;
        int n = dsChiTiet.length;
        dsChiTiet = Arrays.copyOf(dsChiTiet, n + 1);
        dsChiTiet[n] = ct;
        TinhGiaGiam(); 
    }

    // Xóa sản phẩm khỏi chi tiết hóa đơn theo mã SP
    public void Xoa(String maSP) {
        int index = -1;
        for (int i = 0; i < dsChiTiet.length; i++) {
            if (dsChiTiet[i].getSP() != null && 
                dsChiTiet[i].getSP().getMaSP().equalsIgnoreCase(maSP)) {
                index = i;
                break;
            }
        }

        if (index != -1) {
            ChiTietHoaDon[] newArray = new ChiTietHoaDon[dsChiTiet.length - 1];
            for (int i = 0, k = 0; i < dsChiTiet.length; i++) {
                if (i == index) continue;
                newArray[k++] = dsChiTiet[i];
            }
            dsChiTiet = newArray;
            TinhGiaGiam();
        }
    }

    
    public Double Tinhtongtien() {
        Double tong = 0.0;
        for (ChiTietHoaDon ct : dsChiTiet) {
            if (ct != null) {
                tong += ct.TinhThanhtien();
            }
        }
        return tong;
    }

    
    public Double TinhGiaGiam() {
        if (this.Voucher != null) {
            this.Giamgia = this.Voucher.Tinhtiengiam(Tinhtongtien());
        } else {
            this.Giamgia = 0.0;
        }
        return this.Giamgia;
    }


    public Double tinhThanhTien() {
        return Tinhtongtien() - TinhGiaGiam();
    }

    public void Hienthihoadon() {
        System.out.println("================ HOA DON ================");
        System.out.println("Ma HD: " + MaHD);
        System.out.println("Ngay: " + Ngay);
        System.out.println("Nhan vien: " + (nhanvien != null ? nhanvien.getHoTen() : "N/A"));
        System.out.println("Khach hang: " + (khachhang != null ? khachhang.getHoTen() : "N/A"));
        if (Voucher != null) {
            System.out.println("Voucher: " + Voucher.getTenVC());
        }
        System.out.println("-----------------------------------------");
        System.out.println("DANH SACH SAN PHAM MUA:");
        for (ChiTietHoaDon ct : dsChiTiet) {
            if (ct != null) {
                ct.Hienthichitiet();
            }
        }
        System.out.println("-----------------------------------------");
        System.out.printf("Tong tien hang: %.2f VND%n", Tinhtongtien());
        System.out.printf("Giam gia:       -%.2f VND%n", TinhGiaGiam());
        System.out.printf("THANH TOAN:     %.2f VND%n", tinhThanhTien());
        System.out.println("Trang thai: " + TrangThai);
        System.out.println("=========================================");
    }

    public String getMaHD() { return MaHD; }
    public void setMaHD(String maHD) { MaHD = maHD; }

    public Date getNgay() { return Ngay; }
    public void setNgay(Date ngay) { Ngay = ngay; }

    public NhanVienDTO getNhanvien() { return nhanvien; }
    public void setNhanvien(NhanVienDTO nhanvien) { this.nhanvien = nhanvien; }

    public KhachHangDTO getKhachhang() { return khachhang; }
    public void setKhachhang(KhachHangDTO khachhang) { this.khachhang = khachhang; }

    public Double getGiamgia() { return Giamgia; }
    public void setGiamgia(Double giamgia) { Giamgia = giamgia; }

    public Voucher getVoucher() { return Voucher; }
    public void setVoucher(Voucher voucher) { 
        this.Voucher = voucher; 
        TinhGiaGiam(); 
    }

    public String getTrangThai() { return TrangThai; }
    public void setTrangThai(String trangThai) { TrangThai = trangThai; }

    public ChiTietHoaDon[] getDsChiTiet() { return dsChiTiet; }
    public void setDsChiTiet(ChiTietHoaDon[] dsChiTiet) { this.dsChiTiet = dsChiTiet; }
}