package DTO;

import java.util.Date;

public class NhanVienDTO extends NguoiDTO {
    private Double Luong;
    private String Calam;
    private Date Ngayvaolam;
    private String MaTheNV;
    private Double PhanTramuudai;

    public NhanVienDTO() 
    {
        super(); 
    }

    public Double TinhLuong() { return 0.0; }
    public Double Tinhuudai() { return 0.0; }

    public Double getLuong() {
        return Luong;
    }

    public void setLuong(Double Luong) {
        this.Luong = Luong;
    }

    public String getCalam() {
        return Calam;
    }

    public void setCalam(String Calam) {
        this.Calam = Calam;
    }

    public Date getNgayvaolam() {
        return Ngayvaolam;
    }

    public void setNgayvaolam(Date Ngayvaolam) {
        this.Ngayvaolam = Ngayvaolam;
    }

    public String getMaTheNV() {
        return MaTheNV;
    }

    public void setMaTheNV(String MaTheNV) {
        this.MaTheNV = MaTheNV;
    }

    public Double getPhanTramuudai() {
        return PhanTramuudai;
    }

    public void setPhanTramuudai(Double PhanTramuudai) {
        this.PhanTramuudai = PhanTramuudai;
    }

    
}