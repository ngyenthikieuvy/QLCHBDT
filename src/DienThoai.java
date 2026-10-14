public class DienThoai extends SanPham {
    private String RAM;
    private String HeDieuHanh;
    private int DungLuongPin;
    private Double Kichthuocmanhinh;

    public DienThoai(){
        super();
    }
    public  String getRAM() {
        return RAM;
    }

    public void setRAM(String RAM) {
        this.RAM = RAM;
    }

    public int getDungLuongPin() {
        return DungLuongPin;
    }

    public void setDungLuongPin(int DungLuongPin) {
        this.DungLuongPin = DungLuongPin;
    }

    public String getHeDieuHanh() {
        return HeDieuHanh;
    }

    public void setHeDieuHanh(String HeDieuHanh) {
        this.HeDieuHanh = HeDieuHanh;
    }

    public double getKichThuocManHinh() {
        return Kichthuocmanhinh;
    }

    public void setKichThuocManHinh(double KichThuocManHinh) {
        this.Kichthuocmanhinh = Kichthuocmanhinh;
    }


}
