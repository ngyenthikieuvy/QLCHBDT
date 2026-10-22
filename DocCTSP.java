package SanPham;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class DocCTSP {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(
                new File("CTSanPham.txt"), "UTF-8")) {

            System.out.printf("%-5s %-25s %-12s %-25s %-8s %-12s %-12s %-12s %-15s%n",
                    "ID", "Màn hình", "Kích thước", "CPU", "RAM",
                    "Bộ nhớ", "Pin", "Camera", "Hệ điều hành");

            System.out.println("------------------------------------------------------------------------------------------------------------------------------------------------");

            while (sc.hasNextLine()) {
                String dong = sc.nextLine();
                String[] sp = dong.split("\\|",-1);

                System.out.printf("%-5s %-25s %-12s %-25s %-8s %-12s %-12s %-12s %-15s%n",
                        sp[0], sp[1], sp[2], sp[3], sp[4],
                        sp[5], sp[6], sp[7], sp[8]);
            }
        } catch (FileNotFoundException e) {
            System.out.println("không tìm thấy file! ");
        }
    }
}
