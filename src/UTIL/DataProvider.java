package UTIL;

import java.io.IOException;
import java.io.UncheckedIOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;

public class DataProvider {

    private static final String DATA_DIR = "data";
    private static final String SEP = "|";

    // Dòng trống và dòng bắt đầu bằng # bị bỏ qua
    public static List<String[]> readAll(String fileName) {
        Path path = Paths.get(DATA_DIR, fileName);
        List<String[]> rows = new ArrayList<>();
        if (!Files.exists(path)) {
            return rows;
        }
        try {
            for (String line : Files.readAllLines(path, StandardCharsets.UTF_8)) {
                if (line.isBlank() || line.startsWith("#")) {
                    continue;
                }
                // limit -1 giữ lại cột rỗng ở cuối dòng
                rows.add(line.split("\\" + SEP, -1));
            }
        } catch (IOException e) {
            throw new UncheckedIOException("Không đọc được " + path, e);
        }
        return rows;
    }

    public static void writeAll(String fileName, List<String[]> rows) {
        List<String> lines = new ArrayList<>();
        for (String[] row : rows) {
            lines.add(toLine(row));
        }
        Path path = Paths.get(DATA_DIR, fileName);
        try {
            Files.createDirectories(path.getParent());
            Files.write(path, lines, StandardCharsets.UTF_8);
        } catch (IOException e) {
            throw new UncheckedIOException("Không ghi được " + path, e);
        }
    }

    public static void append(String fileName, String... row) {
        Path path = Paths.get(DATA_DIR, fileName);
        try {
            Files.createDirectories(path.getParent());
            Files.write(path, List.of(toLine(row)), StandardCharsets.UTF_8,
                    StandardOpenOption.CREATE, StandardOpenOption.APPEND);
        } catch (IOException e) {
            throw new UncheckedIOException("Không ghi được " + path, e);
        }
    }

    private static String toLine(String[] row) {
        for (String field : row) {
            if (field.contains(SEP) || field.contains("\n") || field.contains("\r")) {
                throw new IllegalArgumentException("Dữ liệu không được chứa '|' hoặc xuống dòng: " + field);
            }
        }
        return String.join(SEP, row);
    }
}
