package DTO;

import java.util.ArrayList;
import java.util.List;

public class VaiTro {
    private int maVaiTro;
    private String tenVaiTro;
    private List<Quyen> danhSachQuyen; //Dung List de tao danh sach quyen cho vai tro

    public VaiTro() {
        this.danhSachQuyen = new ArrayList<>();
    }

    public VaiTro(int maVaiTro, String tenVaiTro, List<Quyen> danhSachQuyen) {
        this.maVaiTro = maVaiTro;
        this.tenVaiTro = tenVaiTro;
        if (danhSachQuyen == null) {
            this.danhSachQuyen = new ArrayList<>();
        } else {
            this.danhSachQuyen = new ArrayList<>(danhSachQuyen);
        }
    }

    public int getMaVaiTro() {
        return maVaiTro;
    }

    public void setMaVaiTro(int maVaiTro) {
        this.maVaiTro = maVaiTro;
    }

    public String getTenVaiTro() {
        return tenVaiTro;
    }

    public void setTenVaiTro(String tenVaiTro) {
        this.tenVaiTro = tenVaiTro;
    }

    public List<Quyen> getDanhSachQuyen() {
        return danhSachQuyen;
    }

    public void setDanhSachQuyen(List<Quyen> danhSachQuyen) {
        if (danhSachQuyen == null) {
            this.danhSachQuyen = new ArrayList<>();
        } else {
            this.danhSachQuyen = new ArrayList<>(danhSachQuyen);
        }
    }
}
