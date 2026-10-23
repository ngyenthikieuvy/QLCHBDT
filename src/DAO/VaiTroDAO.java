package DAO;

import DTO.VaiTro;
import UTIL.DataProvider;
import java.util.ArrayList;
import java.util.List;

public class VaiTroDAO {

    private static final String FILE_NAME = "PhanQuyen.txt";
    private final QuyenDAO quyenDAO = new QuyenDAO();

    // Format file: MaQuyen|TenQuyen|bit1|bit2|...|bit29

    /**
     * Lấy danh sách tất cả vai trò (kèm quyền)
     */
    public List<VaiTro> getAll() {
        List<VaiTro> list = new ArrayList<>();
        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        for (String[] row : rows) {
            String maQuyen = row[0];
            String tenQuyen = row[1];
            list.add(new VaiTro(maQuyen, tenQuyen, quyenDAO.getByVaiTro(maQuyen)));
        }
        return list;
    }

    /**
     * Lấy vai trò theo mã vai trò (kèm quyền)
     */
    public VaiTro getById(String maVaiTro) {
        List<String[]> rows = DataProvider.readAll(FILE_NAME);
        for (String[] row : rows) {
            if (row[0].equals(maVaiTro)) {
                return new VaiTro(row[0], row[1], quyenDAO.getByVaiTro(maVaiTro));
            }
        }
        return null;
    }
}
