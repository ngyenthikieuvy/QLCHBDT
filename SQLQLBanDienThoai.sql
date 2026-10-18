USE [QuanLiBanDienThoai]
/* Chức vụ */
CREATE TABLE dbo.ChucVu (
    MaCV INT IDENTITY(1,1) PRIMARY KEY,
    TenCV NVARCHAR(100) NOT NULL
);

INSERT INTO dbo.ChucVu (TenCV)
VALUES
(N'Giám đốc'),
(N'Quản lý cửa hàng'),
(N'Quản lý nhân sự'),
(N'Quản lý kho'),
(N'Nhân viên bán hàng'),
(N'Nhân viên thu ngân'),
(N'Nhân viên kỹ thuật'),
(N'Nhân viên chăm sóc khách hàng'),
(N'Nhân viên kế toán'),
(N'Nhân viên kho');

/* Nhân viên*/
CREATE TABLE dbo.NhanVien (
    MaNV INT IDENTITY(1,1) PRIMARY KEY,
    Ho NVARCHAR(50) NOT NULL,
    Ten NVARCHAR(50) NOT NULL,
    GioiTinh NVARCHAR(10),
    SoDienThoai VARCHAR(15),
    MaCV INT NOT NULL,
    TrangThai BIT DEFAULT 1,

    CONSTRAINT FK_NhanVien_ChucVu
        FOREIGN KEY (MaCV)
        REFERENCES dbo.ChucVu(MaCV)
);

INSERT INTO dbo.NhanVien
    (Ho, Ten, GioiTinh, SoDienThoai, MaCV, TrangThai)
VALUES
(N'Nguyễn Văn', N'An', N'Nam', '0901111111', 1, 1),
(N'Trần Thị', N'Bình', N'Nữ', '0902222222', 2, 1),
(N'Lê Văn', N'Cường', N'Nam', '0903333333', 3, 1),
(N'Phạm Thị', N'Dung', N'Nữ', '0904444444', 4, 1),
(N'Hoàng Văn', N'Em', N'Nam', '0905555555', 5, 1),
(N'Võ Thị', N'Giang', N'Nữ', '0906666666', 6, 1),
(N'Đặng Văn', N'Hùng', N'Nam', '0907777777', 7, 1),
(N'Bùi Thị', N'Lan', N'Nữ', '0908888888', 8, 1),
(N'Đỗ Văn', N'Minh', N'Nam', '0909999999', 9, 1),
(N'Ngô Thị', N'Ngọc', N'Nữ', '0910000000', 10, 1);

/* Bảng Luong*/
CREATE TABLE dbo.BangLuong (
    MaBangLuong INT IDENTITY(1,1) PRIMARY KEY,
    MaNV INT NOT NULL,
    Thang INT NOT NULL,
    Nam INT NOT NULL,
    LuongCoBan DECIMAL(18,2) NOT NULL,
    PhuCap DECIMAL(18,2) DEFAULT 0,
    Thuong DECIMAL(18,2) DEFAULT 0,
    KhauTru DECIMAL(18,2) DEFAULT 0,
    TongLuong DECIMAL(18,2),
    NgayThanhToan DATE,
    TrangThai NVARCHAR(50) DEFAULT N'Chưa thanh toán',

    CONSTRAINT FK_BangLuong_NhanVien
        FOREIGN KEY (MaNV)
        REFERENCES dbo.NhanVien(MaNV),

    CONSTRAINT CK_BangLuong_Thang
        CHECK (Thang BETWEEN 1 AND 12),

    CONSTRAINT CK_BangLuong_Nam
        CHECK (Nam >= 2000),

    CONSTRAINT UQ_BangLuong_NhanVien_Thang_Nam
        UNIQUE (MaNV, Thang, Nam)
);

INSERT INTO dbo.BangLuong
    (MaNV, Thang, Nam, LuongCoBan, PhuCap,
     Thuong, KhauTru, TongLuong, NgayThanhToan, TrangThai)
VALUES
(1, 10, 2026, 15000000, 2000000, 3000000, 500000, 19500000, '2026-11-05', N'Chưa thanh toán'),
(2, 10, 2026, 12000000, 1500000, 2000000, 300000, 15200000, '2026-11-05', N'Chưa thanh toán'),
(3, 10, 2026, 11000000, 1000000, 1500000, 200000, 13300000, '2026-11-05', N'Chưa thanh toán'),
(4, 10, 2026, 10000000, 1000000, 2000000, 200000, 12800000, '2026-11-05', N'Chưa thanh toán'),
(5, 10, 2026,  8500000,  500000, 1000000, 100000,  9900000, '2026-11-05', N'Chưa thanh toán'),
(6, 10, 2026,  8000000,  500000, 1500000, 100000,  9900000, '2026-11-05', N'Chưa thanh toán'),
(7, 10, 2026,  8500000,  700000, 1200000, 200000, 10200000, '2026-11-05', N'Chưa thanh toán'),
(8, 10, 2026,  7500000,  500000, 1000000, 100000,  8900000, '2026-11-05', N'Chưa thanh toán'),
(9, 10, 2026,  8000000,  600000, 1200000, 100000,  9700000, '2026-11-05', N'Chưa thanh toán'),
(10, 10, 2026, 7500000,  500000,  800000, 100000,  8700000, '2026-11-05', N'Chưa thanh toán');
/* KhachHang*/
CREATE TABLE dbo.KhachHang (
    MaKH INT IDENTITY(1,1) PRIMARY KEY,
    Ho NVARCHAR(50) NOT NULL,
    Ten NVARCHAR(50) NOT NULL,
    GioiTinh NVARCHAR(10),
    SoDienThoai VARCHAR(15),
    TongChiTieu DECIMAL(18,2) DEFAULT 0,
    TinhTrang BIT DEFAULT 1
);

INSERT INTO dbo.KhachHang
    (Ho, Ten, GioiTinh, SoDienThoai, TongChiTieu, TinhTrang)
VALUES
(N'Nguyễn Văn', N'An', N'Nam', '0901234561', 34990000, 1),
(N'Trần Thị', N'Bình', N'Nữ', '0901234562', 19990000, 1),
(N'Lê Văn', N'Cường', N'Nam', '0901234563', 25990000, 1),
(N'Phạm Thị', N'Dung', N'Nữ', '0901234564', 15990000, 1),
(N'Hoàng Văn', N'Đức', N'Nam', '0901234565', 12990000, 1),
(N'Võ Thị', N'Hà', N'Nữ', '0901234566', 8990000, 1),
(N'Đặng Văn', N'Hùng', N'Nam', '0901234567', 10990000, 1),
(N'Bùi Thị', N'Lan', N'Nữ', '0901234568', 7990000, 1),
(N'Đỗ Văn', N'Minh', N'Nam', '0901234569', 6990000, 1),
(N'Ngô Thị', N'Ngọc', N'Nữ', '0901234570', 5990000, 1);

/*Giam gia*/
CREATE TABLE dbo.GiamGia (
    MaGG INT IDENTITY(1,1) PRIMARY KEY,
    TenGG NVARCHAR(100) NOT NULL,
    PhanTramGiam DECIMAL(5,2) NOT NULL,
    DieuKien DECIMAL(18,2) DEFAULT 0,
    NgayBD DATE NOT NULL,
    NgayKT DATE NOT NULL,
    TinhTrang BIT DEFAULT 1,

    CONSTRAINT CK_GiamGia_PhanTram
        CHECK (PhanTramGiam BETWEEN 0 AND 100),

    CONSTRAINT CK_GiamGia_Ngay
        CHECK (NgayKT >= NgayBD)
);
INSERT INTO dbo.GiamGia
    (TenGG, PhanTramGiam, DieuKien, NgayBD, NgayKT, TinhTrang)
VALUES
(N'Khuyến mãi đầu tháng', 5, 5000000, '2026-10-01', '2026-10-31', 1),
(N'Giảm giá iPhone', 10, 15000000, '2026-10-01', '2026-11-30', 1),
(N'Ưu đãi Samsung', 8, 10000000, '2026-10-01', '2026-11-15', 1),
(N'Khách hàng thân thiết', 5, 3000000, '2026-10-01', '2026-12-31', 1),
(N'Khuyến mãi cuối tuần', 7, 7000000, '2026-10-10', '2026-10-25', 1),
(N'Ưu đãi sinh viên', 5, 5000000, '2026-09-01', '2026-12-31', 1),
(N'Giảm giá Xiaomi', 12, 8000000, '2026-10-01', '2026-11-30', 1),
(N'Ưu đãi khách hàng mới', 3, 2000000, '2026-10-01', '2026-12-31', 1),
(N'Black Friday', 15, 10000000, '2026-11-20', '2026-11-30', 1),
(N'Khuyến mãi cuối năm', 10, 12000000, '2026-12-01', '2026-12-31', 1);

/*Loai*/
CREATE TABLE dbo.Loai (
    MaLoai INT IDENTITY(1,1) PRIMARY KEY,
    TenLoai NVARCHAR(100) NOT NULL,
    MoTa NVARCHAR(255)
);

INSERT INTO dbo.Loai (TenLoai, MoTa)
VALUES
(N'iPhone', N'Điện thoại thông minh Apple'),
(N'Samsung', N'Điện thoại thông minh Samsung'),
(N'Xiaomi', N'Điện thoại Xiaomi, Redmi và POCO'),
(N'OPPO', N'Điện thoại thông minh OPPO'),
(N'vivo', N'Điện thoại thông minh vivo'),
(N'realme', N'Điện thoại thông minh realme'),
(N'HONOR', N'Điện thoại thông minh HONOR');

/*Nhà cung cấp*/
CREATE TABLE dbo.NhaCungCap (
    MaNCC INT IDENTITY(1,1) PRIMARY KEY,
    TenNCC NVARCHAR(150) NOT NULL,
    DiaChi NVARCHAR(255),
    SoDienThoai VARCHAR(15),
    TrangThai BIT NOT NULL DEFAULT 1
);

INSERT INTO dbo.NhaCungCap
    (TenNCC, DiaChi, SoDienThoai, TrangThai)
VALUES
(N'Apple Việt Nam', N'TP. Hồ Chí Minh', '0901111111', 1),
(N'Samsung Việt Nam', N'Hà Nội', '0902222222', 1),
(N'Xiaomi Việt Nam', N'TP. Hồ Chí Minh', '0903333333', 1),
(N'OPPO Việt Nam', N'TP. Hồ Chí Minh', '0904444444', 1),
(N'vivo Việt Nam', N'TP. Hồ Chí Minh', '0905555555', 1),
(N'realme Việt Nam', N'Đà Nẵng', '0906666666', 1),
(N'HONOR Việt Nam', N'Hà Nội', '0907777777', 1);

/* Sản Phẩm*/
CREATE TABLE dbo.SanPham (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    TenSP NVARCHAR(150) NOT NULL,
    ThuongHieu NVARCHAR(100),
    XuatXu NVARCHAR(100),
    MaLoai INT NOT NULL,
    GiaBan DECIMAL(18,2) NOT NULL,
    SoLuong INT NOT NULL DEFAULT 0,
    MoTa NVARCHAR(500),
    maNCC INT NOT NULL,
    TrangThai BIT NOT NULL DEFAULT 1,

    CONSTRAINT FK_SanPham_Loai
        FOREIGN KEY (MaLoai)
        REFERENCES dbo.Loai(MaLoai),

    CONSTRAINT FK_SanPham_NhaCungCap
        FOREIGN KEY (maNCC)
        REFERENCES dbo.NhaCungCap(MaNCC),

    CONSTRAINT CK_SanPham_GiaBan
        CHECK (GiaBan >= 0),

    CONSTRAINT CK_SanPham_SoLuong
        CHECK (SoLuong >= 0)
);

INSERT INTO dbo.SanPham
    (TenSP, ThuongHieu, XuatXu, MaLoai,
     GiaBan, SoLuong, MoTa, maNCC, TrangThai)
VALUES
(N'iPhone 16 Pro Max', N'Apple', N'Trung Quốc', 1,
 34990000, 20, N'iPhone 16 Pro Max 256GB', 1, 1),

(N'iPhone 16 Pro', N'Apple', N'Trung Quốc', 1,
 28990000, 25, N'iPhone 16 Pro 128GB', 1, 1),

(N'iPhone 16', N'Apple', N'Trung Quốc', 1,
 21990000, 30, N'iPhone 16 128GB', 1, 1),

(N'iPhone 15', N'Apple', N'Trung Quốc', 1,
 16990000, 35, N'iPhone 15 128GB', 1, 1),

(N'Samsung Galaxy S25 Ultra', N'Samsung', N'Việt Nam', 2,
 33990000, 15, N'Galaxy S25 Ultra 256GB', 2, 1),

(N'Samsung Galaxy S25+', N'Samsung', N'Việt Nam', 2,
 26990000, 20, N'Galaxy S25 Plus 256GB', 2, 1),

(N'Samsung Galaxy A56', N'Samsung', N'Việt Nam', 2,
 10990000, 40, N'Galaxy A56 128GB', 2, 1),

(N'Xiaomi 15 Ultra', N'Xiaomi', N'Trung Quốc', 3,
 29990000, 15, N'Xiaomi 15 Ultra 512GB', 3, 1),

(N'Redmi Note 14 Pro', N'Xiaomi', N'Trung Quốc', 3,
 8990000, 50, N'Redmi Note 14 Pro 256GB', 3, 1),

(N'POCO X7 Pro', N'Xiaomi', N'Trung Quốc', 3,
 9990000, 30, N'POCO X7 Pro 256GB', 3, 1),

(N'OPPO Reno13', N'OPPO', N'Trung Quốc', 4,
 15990000, 25, N'OPPO Reno13 256GB', 4, 1),

(N'OPPO A5 Pro', N'OPPO', N'Trung Quốc', 4,
 6990000, 45, N'OPPO A5 Pro 128GB', 4, 1),

(N'vivo V50', N'vivo', N'Trung Quốc', 5,
 12990000, 30, N'vivo V50 256GB', 5, 1),

(N'realme 14 Pro+', N'realme', N'Trung Quốc', 6,
 11990000, 25, N'realme 14 Pro Plus 256GB', 6, 1),

(N'HONOR 400 Pro', N'HONOR', N'Trung Quốc', 7,
 17990000, 20, N'HONOR 400 Pro 512GB', 7, 1);

/* UPDATE: Thêm cột MaSP*/
ALTER TABLE dbo.SanPham
ADD MaSP VARCHAR(20);

UPDATE dbo.SanPham
SET MaSP = CASE
    WHEN ID = 1 THEN 'SP001' WHEN ID = 2 THEN 'SP002' WHEN ID = 3 THEN 'SP003'
    WHEN ID = 4 THEN 'SP004' WHEN ID = 5 THEN 'SP005' WHEN ID = 6 THEN 'SP006'
    WHEN ID = 7 THEN 'SP007' WHEN ID = 8 THEN 'SP008' WHEN ID = 9 THEN 'SP009'
    WHEN ID = 10 THEN 'SP010' WHEN ID = 11 THEN 'SP011' WHEN ID = 12 THEN 'SP012'
    WHEN ID = 13 THEN 'SP013' WHEN ID = 14 THEN 'SP014' WHEN ID = 15 THEN 'SP015'
    ELSE MaSP
END
WHERE ID BETWEEN 1 AND 15;


 /* Chi Tiết Sản Phẩm*/
 CREATE TABLE dbo.CTSanPham (
    MaCTSP INT IDENTITY(1,1) PRIMARY KEY,
    ID INT NOT NULL UNIQUE,
    ManHinh NVARCHAR(100),
    KichThuocMH DECIMAL(3,1),
    CPU NVARCHAR(100),
    RAM VARCHAR(20),
    BoNhoTrong VARCHAR(20),
    DungLuongPin INT,
    CameraSau NVARCHAR(100),
    HeDieuHanh NVARCHAR(50),

    CONSTRAINT FK_CTSanPham_SanPham
        FOREIGN KEY (ID)
        REFERENCES dbo.SanPham(ID),

    CONSTRAINT CK_CTSanPham_Pin
        CHECK (DungLuongPin > 0)
);
INSERT INTO dbo.CTSanPham
    (ID, ManHinh, KichThuocMH, CPU, RAM,
     BoNhoTrong, DungLuongPin, CameraSau, HeDieuHanh)
VALUES
(1, N'OLED Super Retina XDR', 6.9, N'Apple A18 Pro',
 '8GB', '256GB', 4685, N'48MP', N'iOS 18'),

(2, N'OLED Super Retina XDR', 6.3, N'Apple A18 Pro',
 '8GB', '128GB', 3582, N'48MP', N'iOS 18'),

(3, N'OLED Super Retina XDR', 6.1, N'Apple A18',
 '8GB', '128GB', 3561, N'48MP', N'iOS 18'),

(4, N'OLED Super Retina XDR', 6.1, N'Apple A16 Bionic',
 '6GB', '128GB', 3349, N'48MP', N'iOS 17'),

(5, N'Dynamic AMOLED 2X', 6.9, N'Snapdragon 8 Elite',
 '12GB', '256GB', 5000, N'200MP', N'Android 15'),

(6, N'Dynamic AMOLED 2X', 6.7, N'Snapdragon 8 Elite',
 '12GB', '256GB', 4900, N'50MP', N'Android 15'),

(7, N'Super AMOLED', 6.7, N'Exynos 1580',
 '8GB', '128GB', 5000, N'50MP', N'Android 15'),

(8, N'AMOLED', 6.7, N'Snapdragon 8 Elite',
 '16GB', '512GB', 5410, N'50MP', N'Android 15'),

(9, N'AMOLED', 6.7, N'Dimensity 7300 Ultra',
 '8GB', '256GB', 5500, N'200MP', N'Android 14'),

(10, N'AMOLED', 6.7, N'Dimensity 8400 Ultra',
 '12GB', '256GB', 6000, N'50MP', N'Android 15'),

(11, N'AMOLED', 6.6, N'Dimensity 8350',
 '12GB', '256GB', 5600, N'50MP', N'Android 15'),

(12, N'LCD', 6.7, N'Snapdragon 6s Gen 1',
 '8GB', '128GB', 5800, N'50MP', N'Android 15'),

(13, N'AMOLED', 6.7, N'Snapdragon 7 Gen 3',
 '12GB', '256GB', 6000, N'50MP', N'Android 15'),

(14, N'OLED', 6.8, N'Snapdragon 7s Gen 3',
 '12GB', '256GB', 6000, N'50MP', N'Android 15'),

(15, N'AMOLED', 6.7, N'Snapdragon 8 Gen 3',
 '12GB', '512GB', 5300, N'200MP', N'Android 15');

 /*Hóa Đơn*/

CREATE TABLE dbo.HoaDon (
    MaHD INT IDENTITY(1,1) PRIMARY KEY,
    MaNV INT NOT NULL,
    MaKH INT NOT NULL,
    NgayLap DATE NOT NULL DEFAULT GETDATE(),
    TongTien DECIMAL(18,2) DEFAULT 0,
    MaGG INT NULL,
    GhiChu NVARCHAR(255),
    TrangThai NVARCHAR(50) DEFAULT N'Chưa thanh toán',

    CONSTRAINT FK_HoaDon_NhanVien
        FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien(MaNV),

    CONSTRAINT FK_HoaDon_KhachHang
        FOREIGN KEY (MaKH) REFERENCES dbo.KhachHang(MaKH),

    CONSTRAINT FK_HoaDon_GiamGia
        FOREIGN KEY (MaGG) REFERENCES dbo.GiamGia(MaGG)
);

INSERT INTO dbo.HoaDon (MaNV, MaKH, NgayLap, TongTien, MaGG, GhiChu, TrangThai) VALUES (1, 1, '2026-10-01', 34990000, NULL, N'Khách thanh toán tiền mặt', N'Đã thanh toán');
INSERT INTO dbo.HoaDon (MaNV, MaKH, NgayLap, TongTien, MaGG, GhiChu, TrangThai) VALUES (2, 2, '2026-10-02', 28990000, NULL, N'Khách thanh toán chuyển khoản', N'Đã thanh toán');
INSERT INTO dbo.HoaDon (MaNV, MaKH, NgayLap, TongTien, MaGG, GhiChu, TrangThai) VALUES (3, 3, '2026-10-03', 21990000, NULL, N'Khách thanh toán bằng thẻ', N'Đã thanh toán');
INSERT INTO dbo.HoaDon (MaNV, MaKH, NgayLap, TongTien, MaGG, GhiChu, TrangThai) VALUES (4, 4, '2026-10-04', 16990000, NULL, N'Khách mua tại cửa hàng', N'Đã thanh toán');
INSERT INTO dbo.HoaDon (MaNV, MaKH, NgayLap, TongTien, MaGG, GhiChu, TrangThai) VALUES (5, 5, '2026-10-05', 33990000, NULL, N'Khách mua Samsung Galaxy', N'Đã thanh toán');
INSERT INTO dbo.HoaDon (MaNV, MaKH, NgayLap, TongTien, MaGG, GhiChu, TrangThai) VALUES (6, 6, '2026-10-06', 26990000, NULL, N'Khách thanh toán tiền mặt', N'Đã thanh toán');
INSERT INTO dbo.HoaDon (MaNV, MaKH, NgayLap, TongTien, MaGG, GhiChu, TrangThai) VALUES (7, 7, '2026-10-07', 10990000, NULL, N'Khách mua Samsung Galaxy A56', N'Đã thanh toán');
INSERT INTO dbo.HoaDon (MaNV, MaKH, NgayLap, TongTien, MaGG, GhiChu, TrangThai) VALUES (8, 8, '2026-10-08', 29990000, NULL, N'Khách mua Xiaomi 15 Ultra', N'Đã thanh toán');
INSERT INTO dbo.HoaDon (MaNV, MaKH, NgayLap, TongTien, MaGG, GhiChu, TrangThai) VALUES (9, 9, '2026-10-09', 8990000, NULL, N'Khách mua Redmi Note 14 Pro', N'Đã thanh toán');
INSERT INTO dbo.HoaDon (MaNV, MaKH, NgayLap, TongTien, MaGG, GhiChu, TrangThai) VALUES (10, 10, '2026-10-10', 9990000, NULL, N'Khách mua POCO X7 Pro', N'Đã thanh toán');

/* Chi Tiết Hóa Đơn*/
CREATE TABLE dbo.CTHoaDon (
    MaCTHD INT IDENTITY(1,1) PRIMARY KEY,
    MaHD INT NOT NULL,
    SoLuong INT NOT NULL,
    GiaBan DECIMAL(18,2) NOT NULL,
    ThanhTien AS (SoLuong * GiaBan) PERSISTED,
    ID INT NOT NULL,

    CONSTRAINT FK_CTHoaDon_HoaDon
        FOREIGN KEY (MaHD)
        REFERENCES dbo.HoaDon(MaHD),

    CONSTRAINT FK_CTHoaDon_SanPham
        FOREIGN KEY (ID)
        REFERENCES dbo.SanPham(ID),

    CONSTRAINT CK_CTHoaDon_SoLuong
        CHECK (SoLuong > 0),

    CONSTRAINT CK_CTHoaDon_GiaBan
        CHECK (GiaBan >= 0),

    CONSTRAINT UQ_CTHoaDon_MaHD_ID
        UNIQUE (MaHD, ID)
);
INSERT INTO dbo.CTHoaDon (MaHD, SoLuong, GiaBan, ID) VALUES (1, 1, 34990000, 1);
INSERT INTO dbo.CTHoaDon (MaHD, SoLuong, GiaBan, ID) VALUES (2, 1, 19990000, 2);
INSERT INTO dbo.CTHoaDon (MaHD, SoLuong, GiaBan, ID) VALUES (3, 1, 25990000, 3);
INSERT INTO dbo.CTHoaDon (MaHD, SoLuong, GiaBan, ID) VALUES (4, 1, 15990000, 4);
INSERT INTO dbo.CTHoaDon (MaHD, SoLuong, GiaBan, ID) VALUES (5, 1, 12990000, 5);
INSERT INTO dbo.CTHoaDon (MaHD, SoLuong, GiaBan, ID) VALUES (6, 1, 8990000, 6);
INSERT INTO dbo.CTHoaDon (MaHD, SoLuong, GiaBan, ID) VALUES (7, 1, 10990000, 7);
INSERT INTO dbo.CTHoaDon (MaHD, SoLuong, GiaBan, ID) VALUES (8, 1, 7990000, 8);
INSERT INTO dbo.CTHoaDon (MaHD, SoLuong, GiaBan, ID) VALUES (9, 1, 6990000, 9);
INSERT INTO dbo.CTHoaDon (MaHD, SoLuong, GiaBan, ID) VALUES (10, 1, 5990000, 10);

/* Phiếu nhập*/

CREATE TABLE dbo.PhieuNhap (
    MaPN INT IDENTITY(1,1) PRIMARY KEY,
    MaNV INT NOT NULL,
    MaNCC INT NOT NULL,
    NgayLap DATE NOT NULL DEFAULT GETDATE(),
    TongTien DECIMAL(18,2) NOT NULL DEFAULT 0,
    TrangThai NVARCHAR(50) NOT NULL DEFAULT N'Chờ nhập',

    CONSTRAINT FK_PhieuNhap_NhanVien
        FOREIGN KEY (MaNV)
        REFERENCES dbo.NhanVien(MaNV),

    CONSTRAINT FK_PhieuNhap_NhaCungCap
        FOREIGN KEY (MaNCC)
        REFERENCES dbo.NhaCungCap(MaNCC),

    CONSTRAINT CK_PhieuNhap_TongTien
        CHECK (TongTien >= 0)
);

INSERT INTO dbo.PhieuNhap
    (MaNV, MaNCC, NgayLap, TongTien, TrangThai)
VALUES
(1, 1, '2026-09-01', 350000000, N'Đã nhập'),
(2, 2, '2026-09-03', 280000000, N'Đã nhập'),
(3, 3, '2026-09-05', 150000000, N'Đã nhập'),
(4, 4, '2026-09-07', 120000000, N'Đã nhập'),
(5, 5, '2026-09-10', 100000000, N'Đã nhập'),
(6, 6, '2026-09-12',  90000000, N'Đã nhập'),
(7, 7, '2026-09-15', 110000000, N'Đã nhập'),
(8, 1, '2026-09-18', 250000000, N'Đã nhập'),
(9, 2, '2026-09-20', 180000000, N'Chờ nhập'),
(10, 3, '2026-09-22', 130000000, N'Chờ nhập');

CREATE TABLE dbo.CTPhieuNhap (
    MaPN INT NOT NULL,
    ID INT NOT NULL,
    SoLuong INT NOT NULL,
    GiaNhap DECIMAL(18,2) NOT NULL,
    ThanhTien AS (SoLuong * GiaNhap) PERSISTED,

    CONSTRAINT PK_CTPhieuNhap
        PRIMARY KEY (MaPN, ID),

    CONSTRAINT FK_CTPhieuNhap_PhieuNhap
        FOREIGN KEY (MaPN)
        REFERENCES dbo.PhieuNhap(MaPN),

    CONSTRAINT FK_CTPhieuNhap_SanPham
        FOREIGN KEY (ID)
        REFERENCES dbo.SanPham(ID),

    CONSTRAINT CK_CTPhieuNhap_SoLuong
        CHECK (SoLuong > 0),

    CONSTRAINT CK_CTPhieuNhap_GiaNhap
        CHECK (GiaNhap >= 0)
);

INSERT INTO dbo.CTPhieuNhap
    (MaPN, ID, SoLuong, GiaNhap)
VALUES
(1, 1, 10, 30000000),
(1, 2,  2, 25000000),
(2, 5,  8, 30000000),
(2, 6,  2, 20000000),
(3, 8,  5, 26000000),
(3, 9,  2, 10000000),
(4, 11, 10, 12000000),
(5, 13, 10, 10000000),
(6, 14, 10,  9000000),
(7, 15, 10, 11000000),
(8, 3,  10, 20000000),
(8, 4,   5, 10000000),
(9, 7,  20,  9000000),
(10, 9, 10,  7000000),
(10, 10, 6, 10000000);

/* Phan Quyền*/

CREATE TABLE dbo.PhanQuyen (
    MaQuyen VARCHAR(30) PRIMARY KEY,
    TenQuyen NVARCHAR(100) NOT NULL,

    NS_XemDanhSach BIT NOT NULL DEFAULT 0,
    NS_Them BIT NOT NULL DEFAULT 0,
    NS_Sua BIT NOT NULL DEFAULT 0,
    NS_Xoa BIT NOT NULL DEFAULT 0,
    NS_DuyetNghi BIT NOT NULL DEFAULT 0,
    NS_ThayDoiChucVu BIT NOT NULL DEFAULT 0,
    NS_TinhLuong BIT NOT NULL DEFAULT 0,
    NS_XemLuongCaNhan BIT NOT NULL DEFAULT 0,
    NS_InBangLuong BIT NOT NULL DEFAULT 0,
    NS_ChamCong BIT NOT NULL DEFAULT 0,

    KHO_XemSanPham BIT NOT NULL DEFAULT 0,
    KHO_ThemSanPham BIT NOT NULL DEFAULT 0,
    KHO_SuaSanPham BIT NOT NULL DEFAULT 0,
    KHO_XoaSanPham BIT NOT NULL DEFAULT 0,
    KHO_NhapHang BIT NOT NULL DEFAULT 0,
    KHO_QuanLyNCC BIT NOT NULL DEFAULT 0,
    KHO_BaoCaoTonKho BIT NOT NULL DEFAULT 0,

    BH_LapPhieuXuat BIT NOT NULL DEFAULT 0,
    BH_ThongKeDoanhThu BIT NOT NULL DEFAULT 0,
    BH_ThongKeLoiNhuan BIT NOT NULL DEFAULT 0,

    PQ_QuanLyPhanQuyen BIT NOT NULL DEFAULT 0,
    ADMIN_BaoCaoTongHop BIT NOT NULL DEFAULT 0,

    QLBanHang BIT NOT NULL DEFAULT 0,
    QLNhapHang BIT NOT NULL DEFAULT 0,
    QLNhanVien BIT NOT NULL DEFAULT 0,
    QLSanPham BIT NOT NULL DEFAULT 0,
    QLKhachHang BIT NOT NULL DEFAULT 0,
    QLKhuyenMai BIT NOT NULL DEFAULT 0,
    QLThongKe BIT NOT NULL DEFAULT 0
);
INSERT INTO dbo.PhanQuyen (MaQuyen, TenQuyen) VALUES ('ADMIN', N'Quản trị viên');
INSERT INTO dbo.PhanQuyen (MaQuyen, TenQuyen) VALUES ('QL_NHANSU', N'Quản lý nhân sự');
INSERT INTO dbo.PhanQuyen (MaQuyen, TenQuyen) VALUES ('QL_KHO', N'Quản lý kho');
INSERT INTO dbo.PhanQuyen (MaQuyen, TenQuyen) VALUES ('QL_KINHDOANH', N'Quản lý kinh doanh');

/*ADMIN: toàn bộ quyền*/
UPDATE dbo.PhanQuyen SET
    NS_XemDanhSach = 1, NS_Them = 1, NS_Sua = 1, NS_Xoa = 1, NS_DuyetNghi = 1,
    NS_ThayDoiChucVu = 1, NS_TinhLuong = 1, NS_XemLuongCaNhan = 1, NS_InBangLuong = 1, NS_ChamCong = 1,
    KHO_XemSanPham = 1, KHO_ThemSanPham = 1, KHO_SuaSanPham = 1, KHO_XoaSanPham = 1,
    KHO_NhapHang = 1, KHO_QuanLyNCC = 1, KHO_BaoCaoTonKho = 1,
    BH_LapPhieuXuat = 1, BH_ThongKeDoanhThu = 1, BH_ThongKeLoiNhuan = 1,
    PQ_QuanLyPhanQuyen = 1, ADMIN_BaoCaoTongHop = 1,
    QLBanHang = 1, QLNhapHang = 1, QLNhanVien = 1, QLSanPham = 1,
    QLKhachHang = 1, QLKhuyenMai = 1, QLThongKe = 1
WHERE MaQuyen = 'ADMIN';

/*QL_NHANSU: nhân sự, lương, chấm công*/
UPDATE dbo.PhanQuyen SET
    NS_XemDanhSach = 1, NS_Them = 1, NS_Sua = 1, NS_Xoa = 1, NS_DuyetNghi = 1,
    NS_ThayDoiChucVu = 1, NS_TinhLuong = 1, NS_XemLuongCaNhan = 1, NS_InBangLuong = 1, NS_ChamCong = 1,
    QLNhanVien = 1
WHERE MaQuyen = 'QL_NHANSU';

/*QL_KHO: sản phẩm, nhập hàng, nhà cung cấp, tồn kho*/
UPDATE dbo.PhanQuyen SET
    NS_XemLuongCaNhan = 1, NS_ChamCong = 1,
    KHO_XemSanPham = 1, KHO_ThemSanPham = 1, KHO_SuaSanPham = 1, KHO_XoaSanPham = 1,
    KHO_NhapHang = 1, KHO_QuanLyNCC = 1, KHO_BaoCaoTonKho = 1,
    QLNhapHang = 1, QLSanPham = 1
WHERE MaQuyen = 'QL_KHO';

/*QL_KINHDOANH: bán hàng, khách hàng, khuyến mãi, thống kê*/
UPDATE dbo.PhanQuyen SET
    NS_XemLuongCaNhan = 1, NS_ChamCong = 1,
    KHO_XemSanPham = 1,
    BH_LapPhieuXuat = 1, BH_ThongKeDoanhThu = 1, BH_ThongKeLoiNhuan = 1,
    QLBanHang = 1, QLKhachHang = 1, QLKhuyenMai = 1, QLThongKe = 1
WHERE MaQuyen = 'QL_KINHDOANH';

/*Tài Khoản*/

CREATE TABLE dbo.TaiKhoan (
    MaNV INT PRIMARY KEY,
    TaiKhoan VARCHAR(50) NOT NULL UNIQUE,
    MatKhau VARCHAR(255) NOT NULL,
    MaQuyen VARCHAR(30) NOT NULL,
    TrangThai BIT NOT NULL DEFAULT 1,

    CONSTRAINT FK_TaiKhoan_NhanVien
        FOREIGN KEY (MaNV)
        REFERENCES dbo.NhanVien(MaNV),

    CONSTRAINT FK_TaiKhoan_PhanQuyen
        FOREIGN KEY (MaQuyen)
        REFERENCES dbo.PhanQuyen(MaQuyen)
);

INSERT INTO dbo.TaiKhoan (MaNV, TaiKhoan, MatKhau, MaQuyen, TrangThai) VALUES (1, 'admin', CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', 'admin123'), 2), 'ADMIN', 1);
INSERT INTO dbo.TaiKhoan (MaNV, TaiKhoan, MatKhau, MaQuyen, TrangThai) VALUES (2, 'nv1', CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', '123456'), 2), 'QL_NHANSU', 1);
INSERT INTO dbo.TaiKhoan (MaNV, TaiKhoan, MatKhau, MaQuyen, TrangThai) VALUES (3, 'nv2', CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', '123456'), 2), 'QL_KHO', 1);
INSERT INTO dbo.TaiKhoan (MaNV, TaiKhoan, MatKhau, MaQuyen, TrangThai) VALUES (4, 'nv3', CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', '123456'), 2), 'QL_KINHDOANH', 1);
INSERT INTO dbo.TaiKhoan (MaNV, TaiKhoan, MatKhau, MaQuyen, TrangThai) VALUES (5, 'nv4', CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', '123456'), 2), 'QL_KHO', 1);
INSERT INTO dbo.TaiKhoan (MaNV, TaiKhoan, MatKhau, MaQuyen, TrangThai) VALUES (6, 'nv5', CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', '123456'), 2), 'QL_KINHDOANH', 1);
INSERT INTO dbo.TaiKhoan (MaNV, TaiKhoan, MatKhau, MaQuyen, TrangThai) VALUES (7, 'nv6', CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', '123456'), 2), 'QL_NHANSU', 1);
INSERT INTO dbo.TaiKhoan (MaNV, TaiKhoan, MatKhau, MaQuyen, TrangThai) VALUES (8, 'nv7', CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', '123456'), 2), 'QL_KHO', 1);
INSERT INTO dbo.TaiKhoan (MaNV, TaiKhoan, MatKhau, MaQuyen, TrangThai) VALUES (9, 'nv8', CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', '123456'), 2), 'QL_KINHDOANH', 1);
INSERT INTO dbo.TaiKhoan (MaNV, TaiKhoan, MatKhau, MaQuyen, TrangThai) VALUES (10, 'nv9', CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', '123456'), 2), 'QL_NHANSU', 1);
