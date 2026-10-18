
public class SanPham {
    private int ID;
    private String TenSP;
    private String ThuongHieu;
    private String Xuatxu;
    private Integer MaLoai;
    private Double GiaBan;
    private int SoLuong;
    private String MoTa;
    private Integer maNCC;
    private Boolean TrangThai;
    private String MaSP;

    public SanPham(){
    }
    public SanPham(int ID, String TenSP, String ThuongHieu,
                      String Xuatxu, Integer MaLoai, Double GiaBan,
                      int SoLuong, String MoTa,
                      Integer maNCC, Boolean TrangThai, String MaSP) {
        this.ID = ID;
        this.TenSP = TenSP;
        this.ThuongHieu = ThuongHieu;
        this.Xuatxu = Xuatxu;
        this.MaLoai = MaLoai;
        this.GiaBan = GiaBan;
        this.SoLuong = SoLuong;
        this.MoTa = MoTa;
        this.maNCC = maNCC;
        this.TrangThai = TrangThai;
        this.MaSP = MaSP;
    }
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTenSP() {
        return TenSP;
    }

    public void setTenSP(String TenSP) {
        this.TenSP = TenSP;
    }

    public String getThuongHieu() {
        return ThuongHieu;
    }

    public void setThuongHieu(String ThuongHieu) {
        this.ThuongHieu = ThuongHieu;
    }

    public String getXuatxu() {
        return Xuatxu;
    }

    public void setXuatxu(String Xuatxu) {
        this.Xuatxu = Xuatxu;
    }

    public Integer getMaLoai() {
        return MaLoai;
    }

    public void setMaLoai(Integer MaLoai) {
        this.MaLoai = MaLoai;
    }

    public double getGiaBan() {
        return GiaBan;
    }

    public void setGiaBan(double GiaBan) {
        this.GiaBan = GiaBan;
    }

    public int getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }

    public String getMoTa() {
        return MoTa;
    }

    public void setMoTa(String MoTa) {
        this.MoTa = MoTa;
    }

    public Integer getMaNCC() {
        return maNCC;
    }

    public void setMaNCC(Integer maNCC) {
        this.maNCC = maNCC;
    }

    public Boolean getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(Boolean TrangThai) {
        this.TrangThai = TrangThai;
    }

    public String getMaSP() {
        return MaSP;
    }

    public void setMaSP(String MaSP) {
        this.MaSP = MaSP;
    }
}
