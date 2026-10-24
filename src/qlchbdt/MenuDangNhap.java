package qlchbdt;

import DAO.TaiKhoanDAO;
import DTO.TaiKhoan;
import UTIL.Auth;
import java.util.Scanner;

public class MenuDangNhap {

    private Scanner sc = new Scanner(System.in);
    private TaiKhoanDAO taiKhoanDAO = new TaiKhoanDAO();

    public void hienThi() {
        while (true) {
            System.out.println("\n====================================");
            System.out.println("   QUAN LY CUA HANG BAN DIEN THOAI");
            System.out.println("====================================");
            System.out.println("1. Dang nhap");
            System.out.println("0. Thoat chuong trinh");
            System.out.print("Chon: ");

            String chon = sc.nextLine().trim();

            switch (chon) {
                case "1":
                    dangNhap();
                    break;
                case "0":
                    System.out.println("Cam on ban da su dung chuong trinh!");
                    return;
                default:
                    System.out.println("Lua chon khong hop le!");
            }
        }
    }

    private void dangNhap() {
        System.out.println("\n--- DANG NHAP ---");
        System.out.print("Ten dang nhap: ");
        String tenDangNhap = sc.nextLine().trim();

        System.out.print("Mat khau: ");
        String matKhau = sc.nextLine().trim();

        if (tenDangNhap.isEmpty() || matKhau.isEmpty()) {
            System.out.println("Vui long nhap day du thong tin!");
            return;
        }

        TaiKhoan tk = taiKhoanDAO.dangNhap(tenDangNhap, matKhau);

        if (tk == null) {
            System.out.println("Sai tai khoan hoac mat khau!");
            return;
        }

        // Luu phien dang nhap
        Auth.dangNhap(tk);
        System.out.println("Dang nhap thanh cong! Xin chao " + tk.getTenDangNhap()
                + " (Vai tro: " + tk.getVaiTro() + ")");

        // Chuyen den menu tuong ung theo vai tro
        if (Auth.isAdmin()) {
            // TODO: new MenuAdmin().hienThi();
            System.out.println("--> Chuyen den Menu Admin (chua lam)");
        } else if (Auth.isQuanLy()) {
            // TODO: new MenuQuanLy().hienThi();
            System.out.println("--> Chuyen den Menu Quan Ly (chua lam)");
        } else if (Auth.isNhanVien()) {
            // TODO: new MenuNhanVien().hienThi();
            System.out.println("--> Chuyen den Menu Nhan Vien (chua lam)");
        }
    }
}

