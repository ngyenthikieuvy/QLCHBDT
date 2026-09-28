package DTO;

public class QuanLyDTO extends NhanVienDTO {
    private Double PhuCap;
    private String QuyenHan;

    public Double getPhuCap() {
        return PhuCap;
    }

    public void setPhuCap(Double PhuCap) {
        this.PhuCap = PhuCap;
    }

    public String getQuyenHan() {
        return QuyenHan;
    }

    public void setQuyenHan(String QuyenHan) {
        this.QuyenHan = QuyenHan;
    }

    public QuanLyDTO() { super(); }
    
}