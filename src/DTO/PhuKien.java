public class PhuKien extends SanPham{
    private String Loai;
    private String CongSac;

    public PhuKien(){
        super();
    }

    public PhuKien(String Loai,String CongSac){
        super();
        this.Loai=Loai;
        this.CongSac=CongSac;
    }
    public String getLoai(){
        return Loai;
    }
    public void setLoai(String Loai){
        this.Loai=Loai;
    }
    public String getCongSac(){
        return CongSac;
    }
    public void setCongSac(String CongSac){
        this.CongSac=CongSac;
    }
}
