public class CTSanPham {
    private int MaCTSP;
    private int ID;
    private String ChatLieuVo;
    private String BaoHanh;
    private String Mausac;

    public CTSanPham() {
    }
    public CTSanPham(int MaCTSP, int ID, String ChatLieuVo,
                         String BaoHanh, String Mausac) {
        this.MaCTSP = MaCTSP;
        this.ID = ID;
        this.ChatLieuVo = ChatLieuVo;
        this.BaoHanh = BaoHanh;
        this.Mausac=Mausac;
    }
    public int getMaCTSP() {
        return MaCTSP;
    }

    public void setMaCTSP(int MaCTSP) {
        this.MaCTSP = MaCTSP;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getChatLieuVo() {
        return ChatLieuVo;
    }

    public void setChatLieuVo(String ChatLieuVo) {
        this.ChatLieuVo = ChatLieuVo;
    }

    public String getBaoHanh() {
        return BaoHanh;
    }

    public void setBaoHanh(String BaoHanh) {
        this.BaoHanh = BaoHanh;
    }


    public String getMausac(){
        return Mausac;
    }
    public void setMausac(String Mausac){
        this.Mausac=Mausac;
    }
}
