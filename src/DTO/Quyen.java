package DTO;

public class Quyen {
    private int maQuyen;
    private String tenQuyen;

    public Quyen() {
    }

    public Quyen(int maQuyen, String tenQuyen) {
        this.maQuyen = maQuyen;
        this.tenQuyen = tenQuyen;
    }

    public int getMaQuyen() {
        return maQuyen;
    }

    public void setMaQuyen(int maQuyen) {
        this.maQuyen = maQuyen;
    }

    public String getTenQuyen() {
        return tenQuyen;
    }

    public void setTenQuyen(String tenQuyen) {
        this.tenQuyen = tenQuyen;
    }
}
