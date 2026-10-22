package SanPham;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class ReadSP {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(
                new File("SanPham.txt"), "UTF-8")) {
            System.out.printf("%-25s %-15s %-10s %-15s %-10s %-35s %-10s %-10s%n",
                    "Tên sản phẩm", "Thương hiệu",
                    "Mã loại", "Giá bán", "Số lượng",
                    "Mô tả", "Mã NCC", "Trạng thái");

            while (sc.hasNextLine()) {
                String dong = sc.nextLine();
                String[] sp = dong.split("\\|", -1);

                    System.out.printf("%-25s %-15s %-10s %-15s %-10s %-35s %-10s %-10s%n",
                            sp[0], sp[1], sp[2], sp[3], sp[4],
                            sp[5], sp[6], sp[7]);
                }

        } catch (FileNotFoundException e) {
            System.out.println("Không tìm thấy file!");
        }
    }
}