package BUS;

import DAO.CTHoaDonDAO;
import DAO.KhuyenMaiDAO;
import DAO.HoaDonDAO;
import DAO.KhachHangDAO;
import DAO.NhanVienDAO;
import DAO.SanPhamDAO;
import DTO.CTHoaDon;
import DTO.HoaDon;
import DTO.SanPham;

import java.util.ArrayList;
import java.util.Date;
import javax.swing.JOptionPane;


public class HoaDonBUS {
    
    private final HoaDonDAO hoaDonDAO;
    private ArrayList<HoaDon> listHoaDon;
    private CTHoaDonDAO ctHoaDonDAO = new CTHoaDonDAO();
    private KhachHangDAO khachHangDAO = new KhachHangDAO();
    private NhanVienDAO nhanVienDAO = new NhanVienDAO();
    private KhuyenMaiDAO khuyenMaiDAO = new KhuyenMaiDAO();
    private final SanPhamDAO sanPhamDAO = new SanPhamDAO();
    
    public HoaDonBUS() {
        this.hoaDonDAO = new HoaDonDAO();
         this.listHoaDon = hoaDonDAO.selectAll();
    }
    

    /**
     * Thực hiện toàn bộ giao dịch bán hàng (Insert HD, Insert CTHD, Update tồn kho).
     * Phương thức này gọi thẳng đến DAO vì bản thân DAO đã xử lý logic Transaction.
     * @param maNV Mã nhân viên lập hóa đơn.
     * @param maKH Mã khách hàng (0 nếu là khách vãng lai).
     * @param tongTien Tổng tiền của hóa đơn.
     * @param chiTietList Danh sách CTHoaDon cần thêm.
     * @return MaHD mới được tạo, hoặc -1 nếu giao dịch thất bại.
     */
    public int thucHienGiaoDich(int maNV, int maKH, double tongTien, ArrayList<CTHoaDon> chiTietList) {
        
        // Kiểm tra điều kiện nghiệp vụ sơ bộ (nếu cần)
        if (chiTietList == null || chiTietList.isEmpty()) {
            System.err.println("BUS Error: Danh sách chi tiết hóa đơn rỗng.");
            return -1;
        }
        if (maNV <= 0) {
             System.err.println("BUS Error: Mã nhân viên không hợp lệ.");
            return -1;
        }
         
        // Gọi phương thức xử lý giao dịch từ DAO.
        // DAO sẽ chịu trách nhiệm quản lý Connection, commit/rollback, và cập nhật CSDL.
        return hoaDonDAO.thucHienGiaoDich(maNV, maKH, tongTien, chiTietList);
    }
    

    public ArrayList<DTO.HoaDon> getAllHoaDon() {
        return hoaDonDAO.selectAll(); 
    }

    public ArrayList<CTHoaDon> getCTHoaDonByMaHD(int maHD) {
        return ctHoaDonDAO.selectByMaHD(maHD); 
    }
    public HoaDon getHoaDonByMaHD(int maHD) {
        return hoaDonDAO.getHoaDonByMaHD(maHD);
    }
    
    public String getTenKhachHang (int maKH){
        return khachHangDAO.getTenKhachHang(maKH);
    }
    
    public String getTenNhanVien (int maNV){
        return nhanVienDAO.getTenNhanVien(maNV);
    }
    
    public String getTenMaGiamGia (int maGG){
        return khuyenMaiDAO.getTenMaGiamGia(maGG);
    }
    
    public boolean updateKhachHangVaGiamGia (int maHD, int maKH, int maGG, String ghiChu, double tongTienMoi){
        return hoaDonDAO.updateKhachHangVaGiamGia(maHD, maKH, maGG, ghiChu, tongTienMoi);
    }
    
   

    /**
     * Tính lại Tổng tiền mới cho Hóa đơn dựa trên Mã giảm giá mới.
     * @param maHD Mã Hóa đơn hiện tại.
     * @param newMaGG Mã giảm giá mới được chọn (0 nếu không áp dụng).
     * @return Tổng tiền mới sau khi áp dụng giảm giá.
     */
    public double tinhLaiTongTien(int maHD, int newMaGG) {
        // 1. Lấy tổng tiền thô (tổng tiền trước khi áp dụng giảm giá)
        double tongTienTho = 0;

        // Lấy danh sách Chi tiết Hóa đơn (CTHD)
        ArrayList<CTHoaDon> listCTHD = ctHoaDonDAO.selectByMaHD(maHD); 

        for (CTHoaDon cthd : listCTHD) {
            // Giả định cthd.getThanhTien() là Thành tiền của từng sản phẩm (Đơn giá * Số lượng)
            tongTienTho += cthd.getThanhTien();
        }

        // 2. Lấy phần trăm giảm giá mới
        double phanTramGiam = 0;
        if (newMaGG > 0) {
            // Cần có phương thức lấy % giảm giá từ GiamGiaDAO
            phanTramGiam = khuyenMaiDAO.getPhanTramGiam(newMaGG); 
        }

        // 3. Tính tổng tiền cuối cùng
        double tongTienMoi = tongTienTho * (1 - phanTramGiam / 100.0);

        return tongTienMoi;
    }
    
    public double getPhanTramGiam (int maGG){
        return khuyenMaiDAO.getPhanTramGiam(maGG);
    }
    
    public ArrayList<HoaDon> getListHoaDonTheoGia(String minStr, String maxStr) {
        ArrayList<HoaDon> dshd = new ArrayList<>();
        
        try {
            // Loại bỏ ký tự không phải số (dấu ',' hay 'đ')
            String minClean = minStr.replaceAll("[^\\d.]", "");
            String maxClean = maxStr.replaceAll("[^\\d.]", "");

            double minPrice = Double.parseDouble(minClean);
            double maxPrice = Double.parseDouble(maxClean);

            // Hoán đổi nếu người nhập ngược
            if (minPrice > maxPrice) {
                double tmp = minPrice;
                minPrice = maxPrice;
                maxPrice = tmp;
            }

            for (HoaDon hd : listHoaDon) {
                double tongTien = hd.getTongTien();
                // So sánh >= và <= để bao gồm cả giá trị bằng min/max
                if (tongTien >= minPrice && tongTien <= maxPrice) {
                    dshd.add(hd);
                }
            }
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Hãy nhập khoảng giá hợp lệ!", "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
        return dshd;
    }


    public ArrayList<HoaDon> getListHoaDonTheoNgay(Date minDate, Date maxDate) {
        try {
            // Chuyển sang java.sql.Date nếu cần query SQL
            java.sql.Date dateMin = new java.sql.Date(minDate.getTime());
            java.sql.Date dateMax = new java.sql.Date(maxDate.getTime());

            ArrayList<HoaDon> dshd = hoaDonDAO.getListHoaDon(dateMin, dateMax);
            return dshd;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Khoảng ngày không hợp lệ!", "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
        return null;
    }

    public String getTenSanPham(int ID) {

        ArrayList<SanPham> products = sanPhamDAO.selectByID(ID);

        if (products != null && !products.isEmpty()) {
            return products.get(0).getTenSP();
        }

        return "Sản phẩm không rõ (ID: " + ID + ")";
    }

    
    public boolean updateTrangThai(int maHD, String trangThai) {
        return hoaDonDAO.updateTrangThai(maHD, trangThai);
    }
}