CREATE DATABASE [QLBanDienThoai]
USE [QLBanDienThoai]
GO
/****** Object:  Table [dbo].[BangLuong]    Script Date: 24/04/2026 15:31:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangLuong](
	[MaBL] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NOT NULL,
	[Thang] [int] NOT NULL,
	[Nam] [int] NOT NULL,
	[LuongCoBan] [decimal](18, 0) NOT NULL,
	[PhuCap] [decimal](18, 0) NULL,
	[Thuong] [decimal](18, 0) NULL,
	[Phat] [decimal](18, 0) NULL,
	[TongLuong] [decimal](18, 0) NOT NULL,
	[NgayTinh] [date] NOT NULL,
	[GhiChu] [nvarchar](255) NULL,
	[TrangThai] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ChucVu]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaCV] [varchar](10) NOT NULL,
	[TenCV] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTHoaDon]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHoaDon](
	[MaCTHD] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [int] NULL,
	[ThanhTien] [int] NULL,
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_CTHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaCTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTPhieuNhap]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuNhap](
	[MaPN] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[GiaNhap] [int] NULL,
	[ThanhTien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTSanPham]    Script Date: 24/04/2026 15:31:27 ******/
CREATE TABLE dbo.CTSanPham (
    MaCTSP INT IDENTITY(1,1) PRIMARY KEY,
    MaSP VARCHAR(10) NOT NULL UNIQUE,
    RAM VARCHAR(20),
    KichThuocMH DECIMAL(3,1),
    CongNgheMH NVARCHAR(50),
    ChipXuLy NVARCHAR(100),
    CameraSau NVARCHAR(100),
    DungLuongPin INT,
    HeDieuHanh NVARCHAR(50),

    CONSTRAINT CK_CTSanPham_Pin
        CHECK (DungLuongPin > 0)
);
GO
/****** Object:  Table [dbo].[DonTu]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonTu](
	[MaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NOT NULL,
	[LoaiDon] [nvarchar](50) NOT NULL,
	[NgayBatDau] [date] NOT NULL,
	[NgayKetThuc] [date] NOT NULL,
	[LyDo] [nvarchar](max) NULL,
	[TrangThai] [nvarchar](30) NULL,
	[NgayTao] [datetime] NULL,
	[NgayGui] [date] NULL,
 CONSTRAINT [PK__DonTu__3D89F568B257CBD2] PRIMARY KEY CLUSTERED 
(
	[MaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiamGia]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiamGia](
	[MaGG] [int] IDENTITY(1,1) NOT NULL,
	[TenGG] [nvarchar](255) NULL,
	[PhanTramGiam] [int] NULL,
	[DieuKien] [int] NULL,
	[NgayBD] [date] NULL,
	[NgayKT] [date] NULL,
	[TinhTrang] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NULL,
	[MaKH] [int] NULL,
	[NgayLap] [date] NULL,
	[TongTien] [int] NULL,
	[MaGG] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [varchar](50) NULL,
 CONSTRAINT [PK__HoaDon__2725A6E098A4995E] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[Ho] [nvarchar](255) NULL,
	[Ten] [nvarchar](255) NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[SoDienThoai] [nvarchar](10) NULL,
	[TongChiTieu] [int] NULL,
	[TinhTrang] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuChucVu]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuChucVu](
	[MaLS] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NULL,
	[MaCVCu] [varchar](10) NULL,
	[MaCVMoi] [varchar](10) NOT NULL,
	[NgayThayDoi] [datetime] NULL,
	[GhiChu] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loai]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](255) NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SoDienThoai] [nvarchar](11) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[Ho] [nvarchar](255) NULL,
	[Ten] [nvarchar](255) NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[SoDienThoai] [nvarchar](11) NULL,
	[MaCV] [varchar](10) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK__NhanVien__2725D70ABACF3960] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaQuyen] [varchar](50) NOT NULL,
	[TenQuyen] [nvarchar](100) NOT NULL,
	[NS_XemDanhSach] [bit] NULL,
	[NS_Them] [bit] NULL,
	[NS_Sua] [bit] NULL,
	[NS_Xoa] [bit] NULL,
	[NS_DuyetNghi] [bit] NULL,
	[NS_ThayDoiChucVu] [bit] NULL,
	[NS_TinhLuong] [bit] NULL,
	[NS_XemLuongCaNhan] [bit] NULL,
	[NS_InBangLuong] [bit] NULL,
	[KHO_XemSanPham] [bit] NULL,
	[KHO_ThemSanPham] [bit] NULL,
	[KHO_SuaSanPham] [bit] NULL,
	[KHO_XoaSanPham] [bit] NULL,
	[KHO_NhapHang] [bit] NULL,
	[KHO_QuanLyNCC] [bit] NULL,
	[KHO_BaoCaoTonKho] [bit] NULL,
	[BH_LapPhieuXuat] [bit] NULL,
	[BH_ThongKeDoanhThu] [bit] NULL,
	[BH_ThongKeLoiNhuan] [bit] NULL,
	[PQ_QuanLyPhanQuyen] [bit] NULL,
	[ADMIN_BaoCaoTongHop] [bit] NULL,
	[QLBanHang] [bit] NULL,
	[QLNhapHang] [bit] NULL,
	[QLNhanVien] [bit] NULL,
	[QLSanPham] [bit] NULL,
	[QLKhachHang] [bit] NULL,
	[QLKhuyenMai] [bit] NULL,
	[QLThongKe] [bit] NULL,
 CONSTRAINT [PK__PhanQuye__1D4B7ED4ACA600B4] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NULL,
	[MaNCC] [int] NULL,
	[NgayLap] [date] NULL,
	[TongTien] [int] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK__PhieuNha__2725E7F095A7F48C] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](255) NOT NULL,
	[ThuongHieu] [nvarchar](255) NULL,
	[Xuatxu] [nvarchar](50) NULL,
	[MaLoai] [int] NULL,
	[Mausac]  [nvarchar](50) NULL,
	[DungLuong] VARCHAR(20) NULL,
	[GiaBan] [decimal](18, 2) NULL,
	[SoLuong] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
	[maNCC] [int] NULL,
	[TrangThai] [bit] NULL,
	[MaSP]  AS ('SP'+right('000'+CONVERT([varchar](3),[ID]),(3))) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 24/04/2026 15:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaNV] [int] NOT NULL,
	[TaiKhoan] [nvarchar](255) NULL,
	[MatKhau] [nvarchar](255) NULL,
	[MaQuyen] [varchar](50) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_TaiKhoan_1] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BangLuong] ON 

INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (1, 1, 3, 2026, CAST(25000000 AS Decimal(18, 0)), CAST(10000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(35000000 AS Decimal(18, 0)), CAST(N'2026-04-08' AS Date), N'Lương tháng 3/2026', 1)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (2, 2, 3, 2026, CAST(18000000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(23000000 AS Decimal(18, 0)), CAST(N'2026-04-08' AS Date), N'Lương tháng 3/2026', 1)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (3, 3, 3, 2026, CAST(18000000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(23000000 AS Decimal(18, 0)), CAST(N'2026-04-08' AS Date), N'Lương tháng 3/2026', 1)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (4, 4, 3, 2026, CAST(18000000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(23000000 AS Decimal(18, 0)), CAST(N'2026-04-08' AS Date), N'Lương tháng 3/2026', 1)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (5, 5, 3, 2026, CAST(8000000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(9500000 AS Decimal(18, 0)), CAST(N'2026-04-08' AS Date), N'Lương tháng 3/2026', 1)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (6, 6, 3, 2026, CAST(8000000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(9500000 AS Decimal(18, 0)), CAST(N'2026-04-08' AS Date), N'Lương tháng 3/2026', 1)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (7, 7, 3, 2026, CAST(8000000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(9500000 AS Decimal(18, 0)), CAST(N'2026-04-08' AS Date), N'Lương tháng 3/2026', 1)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (8, 8, 3, 2026, CAST(8000000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(9500000 AS Decimal(18, 0)), CAST(N'2026-04-08' AS Date), N'Lương tháng 3/2026', 1)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (9, 9, 3, 2026, CAST(7000000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(8000000 AS Decimal(18, 0)), CAST(N'2026-04-08' AS Date), N'Lương tháng 3/2026', 1)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (10, 10, 3, 2026, CAST(7000000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(8000000 AS Decimal(18, 0)), CAST(N'2026-04-08' AS Date), N'Lương tháng 3/2026', 1)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (11, 12, 3, 2026, CAST(8000000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(9500000 AS Decimal(18, 0)), CAST(N'2026-04-08' AS Date), N'Lương tháng 3/2026', 1)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (12, 9, 4, 2026, CAST(7000000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(7500000 AS Decimal(18, 0)), CAST(N'2026-04-08' AS Date), NULL, 0)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (13, 3, 4, 2026, CAST(18000000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(6384615 AS Decimal(18, 0)), CAST(N'2026-04-22' AS Date), NULL, 0)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (14, 1, 1, 2026, CAST(25000000 AS Decimal(18, 0)), CAST(10000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(35961538 AS Decimal(18, 0)), CAST(N'2026-04-22' AS Date), NULL, 0)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (15, 2, 1, 2026, CAST(18000000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(23692308 AS Decimal(18, 0)), CAST(N'2026-04-22' AS Date), NULL, 0)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (16, 3, 1, 2026, CAST(18000000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(23692308 AS Decimal(18, 0)), CAST(N'2026-04-22' AS Date), NULL, 0)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (17, 4, 1, 2026, CAST(18000000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(23692308 AS Decimal(18, 0)), CAST(N'2026-04-22' AS Date), NULL, 0)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (18, 5, 1, 2026, CAST(8000000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(9307692 AS Decimal(18, 0)), CAST(N'2026-04-22' AS Date), NULL, 0)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (19, 6, 1, 2026, CAST(8000000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(9307692 AS Decimal(18, 0)), CAST(N'2026-04-22' AS Date), NULL, 0)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (20, 7, 1, 2026, CAST(8000000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(9307692 AS Decimal(18, 0)), CAST(N'2026-04-22' AS Date), NULL, 0)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (21, 8, 1, 2026, CAST(7000000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(7769231 AS Decimal(18, 0)), CAST(N'2026-04-22' AS Date), NULL, 0)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (22, 9, 1, 2026, CAST(7000000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(7769231 AS Decimal(18, 0)), CAST(N'2026-04-22' AS Date), NULL, 0)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (23, 10, 1, 2026, CAST(7000000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(7769231 AS Decimal(18, 0)), CAST(N'2026-04-22' AS Date), NULL, 0)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (24, 12, 1, 2026, CAST(8000000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(9307692 AS Decimal(18, 0)), CAST(N'2026-04-22' AS Date), NULL, 0)
INSERT [dbo].[BangLuong] ([MaBL], [MaNV], [Thang], [Nam], [LuongCoBan], [PhuCap], [Thuong], [Phat], [TongLuong], [NgayTinh], [GhiChu], [TrangThai]) VALUES (25, 6, 4, 2026, CAST(8000000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(7038462 AS Decimal(18, 0)), CAST(N'2026-04-23' AS Date), NULL, 0)
SET IDENTITY_INSERT [dbo].[BangLuong] OFF
GO

INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV01', N'Giám đốc')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV02', N'Quản lý nhân sự')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV03', N'Quản lý kho')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV04', N'Quản lý bán hàng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV05', N'Nhân viên bán hàng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV06', N'Nhân viên nhập hàng')
GO
SET IDENTITY_INSERT [dbo].[CTHoaDon] ON 

INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (1, 1, 2, 750000, 1500000, 1)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (2, 2, 5, 500000, 2500000, 2)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (3, 3, 3, 600000, 1800000, 3)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (4, 4, 4, 800000, 3200000, 4)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (5, 5, 2, 600000, 1200000, 5)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (6, 6, 3, 900000, 2700000, 6)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (7, 7, 1, 950000, 950000, 7)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (8, 8, 2, 1750000, 3500000, 8)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (9, 9, 3, 700000, 2100000, 9)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (10, 10, 5, 1000000, 5000000, 10)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (11, 14, 1, 20000000, 20000000, 5)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (12, 15, 1, 5500000, 5500000, 4)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (13, 15, 1, 40000000, 40000000, 6)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (14, 16, 1, 350000000, 350000000, 1)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (15, 16, 1, 150000000, 150000000, 10)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (16, 17, 1, 20000000, 20000000, 5)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (17, 17, 1, 5500000, 5500000, 4)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (18, 18, 1, 150000000, 150000000, 10)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (19, 19, 1, 3000000, 3000000, 3)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (20, 20, 1, 9500000, 9500000, 9)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (21, 20, 1, 8000000, 8000000, 8)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (22, 21, 1, 40000000, 40000000, 6)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (23, 22, 1, 20000000, 20000000, 5)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (24, 22, 1, 8000000, 8000000, 8)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (25, 23, 1, 3000000, 3000000, 3)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (26, 24, 1, 5500000, 5500000, 4)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (27, 25, 1, 9500000, 9500000, 9)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (1018, 1018, 7, 250000000, 250000000, 2)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (1019, 1018, 1, 20000000, 20000000, 5)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (1020, 1018, 10, 5500000, 5500000, 4)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (1021, 1019, 1, 3000000, 3000000, 3)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (1022, 1020, 1, 5500000, 5500000, 4)
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaHD], [SoLuong], [GiaBan], [ThanhTien], [ID]) VALUES (1023, 1020, 1, 3000000, 3000000, 3)
SET IDENTITY_INSERT [dbo].[CTHoaDon] OFF
GO
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (1, 1, 5, 25000000, 125000000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (2, 2, 10, 8500000, 85000000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (3, 3, 8, 8000000, 64000000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (4, 4, 4, 55000000, 220000000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (5, 5, 8, 14000000, 112000000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (6, 6, 6, 15000000, 90000000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (6, 7, 11, 25000000, 275000000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (7, 7, 5, 15000000, 75000000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (8, 8, 8, 7000000, 56000000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (9, 9, 4, 35000000, 140000000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (10, 10, 6, 30000000, 180000000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (11, 1, 13, 10000000, 130000000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (12, 3, 40, 5000000, 200000000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (13, 1, 6, 12000000, 72000000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [ID], [SoLuong], [GiaNhap], [ThanhTien]) VALUES (13, 2, 10, 1000000, 10000000)
GO

INSERT INTO dbo.CTSanPham
(MaSP, RAM, KichThuocMH, CongNgheMH, ChipXuLy, CameraSau, DungLuongPin, HeDieuHanh)
VALUES
('SP001', '8GB', 6.9, N'OLED', N'Apple A18 Pro', N'48MP + 48MP + 12MP', 4685, N'iOS 18'),
('SP002', '6GB', 6.1, N'OLED', N'Apple A16 Bionic', N'48MP + 12MP', 3349, N'iOS 17'),
('SP003', '12GB', 6.9, N'Dynamic AMOLED 2X', N'Snapdragon 8 Elite', N'200MP + 50MP + 50MP + 10MP', 5000, N'Android 15'),
('SP004', '8GB', 6.7, N'Super AMOLED', N'Exynos 1580', N'50MP + 12MP + 5MP', 5000, N'Android 15'),
('SP005', '16GB', 6.7, N'LTPO AMOLED', N'Snapdragon 8 Elite', N'50MP + 50MP + 50MP + 200MP', 5410, N'Android 15'),
('SP006', '8GB', 6.7, N'AMOLED', N'Helio G99 Ultra', N'108MP + 2MP + 2MP', 5500, N'Android 14'),
('SP007', '12GB', 6.6, N'AMOLED', N'Dimensity 8350', N'50MP + 8MP + 2MP', 5600, N'Android 15'),
('SP008', '12GB', 6.8, N'AMOLED', N'Snapdragon 7 Gen 3', N'50MP + 50MP', 6000, N'Android 15'),
('SP009', '8GB', 6.8, N'OLED', N'Dimensity 7300 Energy', N'50MP + 2MP', 6000, N'Android 15'),
('SP010', '12GB', 6.7, N'AMOLED', N'Snapdragon 7 Gen 3', N'50MP + 50MP + 12MP', 5200, N'Android 14');
GO
SET IDENTITY_INSERT [dbo].[DonTu] ON 

INSERT [dbo].[DonTu] ([MaDon], [MaNV], [LoaiDon], [NgayBatDau], [NgayKetThuc], [LyDo], [TrangThai], [NgayTao], [NgayGui]) VALUES (3, 1, N'Nghỉ phép', CAST(N'2026-03-15' AS Date), CAST(N'2026-03-17' AS Date), N'Giải quyết công việc gia đình', N'Đã duyệt', CAST(N'2026-03-12T20:11:43.227' AS DateTime), NULL)
INSERT [dbo].[DonTu] ([MaDon], [MaNV], [LoaiDon], [NgayBatDau], [NgayKetThuc], [LyDo], [TrangThai], [NgayTao], [NgayGui]) VALUES (4, 1, N'Nghỉ ốm', CAST(N'2026-03-20' AS Date), CAST(N'2026-03-21' AS Date), N'Sốt xuất huyết', N'Đã duyệt', CAST(N'2026-03-12T20:11:43.227' AS DateTime), NULL)
INSERT [dbo].[DonTu] ([MaDon], [MaNV], [LoaiDon], [NgayBatDau], [NgayKetThuc], [LyDo], [TrangThai], [NgayTao], [NgayGui]) VALUES (5, 5, N'Nghỉ phép', CAST(N'2026-04-10' AS Date), CAST(N'2026-04-10' AS Date), N'đi du lịch', N'Đã duyệt', CAST(N'2026-04-08T18:04:17.663' AS DateTime), CAST(N'2026-04-08' AS Date))
INSERT [dbo].[DonTu] ([MaDon], [MaNV], [LoaiDon], [NgayBatDau], [NgayKetThuc], [LyDo], [TrangThai], [NgayTao], [NgayGui]) VALUES (6, 3, N'Nghỉ phép', CAST(N'2026-04-24' AS Date), CAST(N'2026-04-24' AS Date), N'đi khám bệnh', N'Chờ duyệt', CAST(N'2026-04-23T08:52:33.210' AS DateTime), CAST(N'2026-04-23' AS Date))
SET IDENTITY_INSERT [dbo].[DonTu] OFF
GO
SET IDENTITY_INSERT [dbo].[GiamGia] ON 

INSERT [dbo].[GiamGia] ([MaGG], [TenGG], [PhanTramGiam], [DieuKien], [NgayBD], [NgayKT], [TinhTrang]) VALUES (1, N'Giảm 10% cho đơn trên 1.000.000đ', 10, 1000000, CAST(N'2025-11-01' AS Date), CAST(N'2025-11-30' AS Date), 1)
INSERT [dbo].[GiamGia] ([MaGG], [TenGG], [PhanTramGiam], [DieuKien], [NgayBD], [NgayKT], [TinhTrang]) VALUES (2, N'Giảm 15% dịp Black Friday', 15, 500000, CAST(N'2025-11-25' AS Date), CAST(N'2025-11-30' AS Date), 1)
INSERT [dbo].[GiamGia] ([MaGG], [TenGG], [PhanTramGiam], [DieuKien], [NgayBD], [NgayKT], [TinhTrang]) VALUES (3, N'Giảm 5% cho tất cả đơn hàng', 5, 0, CAST(N'2025-11-01' AS Date), CAST(N'2025-12-31' AS Date), 1)
INSERT [dbo].[GiamGia] ([MaGG], [TenGG], [PhanTramGiam], [DieuKien], [NgayBD], [NgayKT], [TinhTrang]) VALUES (4, N'Giảm 10% cho đơn trên 1.000.000đ', 10, 1000000, CAST(N'2025-11-01' AS Date), CAST(N'2025-11-30' AS Date), 1)
INSERT [dbo].[GiamGia] ([MaGG], [TenGG], [PhanTramGiam], [DieuKien], [NgayBD], [NgayKT], [TinhTrang]) VALUES (5, N'Giảm 15% dịp Black Friday', 15, 500000, CAST(N'2025-11-25' AS Date), CAST(N'2025-11-30' AS Date), 1)
INSERT [dbo].[GiamGia] ([MaGG], [TenGG], [PhanTramGiam], [DieuKien], [NgayBD], [NgayKT], [TinhTrang]) VALUES (6, N'Giảm 5% cho đơn hàng đầu tiên', 5, 0, CAST(N'2025-11-01' AS Date), CAST(N'2025-12-31' AS Date), 1)
INSERT [dbo].[GiamGia] ([MaGG], [TenGG], [PhanTramGiam], [DieuKien], [NgayBD], [NgayKT], [TinhTrang]) VALUES (7, N'Giảm 20% nhân dịp Giáng Sinh', 20, 800000, CAST(N'2025-12-20' AS Date), CAST(N'2025-12-26' AS Date), 1)
INSERT [dbo].[GiamGia] ([MaGG], [TenGG], [PhanTramGiam], [DieuKien], [NgayBD], [NgayKT], [TinhTrang]) VALUES (8, N'Ưu đãi 30% ngày sinh nhật khách hàng', 30, 200000, CAST(N'2025-01-01' AS Date), CAST(N'2025-12-31' AS Date), 1)
INSERT [dbo].[GiamGia] ([MaGG], [TenGG], [PhanTramGiam], [DieuKien], [NgayBD], [NgayKT], [TinhTrang]) VALUES (9, N'Giảm 25% đồng hồ đôi nhân ngày Valentine', 25, 500000, CAST(N'2026-02-10' AS Date), CAST(N'2026-02-15' AS Date), 1)
INSERT [dbo].[GiamGia] ([MaGG], [TenGG], [PhanTramGiam], [DieuKien], [NgayBD], [NgayKT], [TinhTrang]) VALUES (10, N'Flash Sale cuối tuần – Giảm 12%', 12, 300000, CAST(N'2025-11-08' AS Date), CAST(N'2025-11-10' AS Date), 0)
INSERT [dbo].[GiamGia] ([MaGG], [TenGG], [PhanTramGiam], [DieuKien], [NgayBD], [NgayKT], [TinhTrang]) VALUES (12, N'Giảm 2% nhân diệp kỉ niểm thành lập', 2, 0, CAST(N'2025-08-20' AS Date), CAST(N'2025-08-20' AS Date), 0)
SET IDENTITY_INSERT [dbo].[GiamGia] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (1, 1, 1, CAST(N'2025-11-01' AS Date), 1425000, 3, N'Khách thanh toán ti?n m?t', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (2, 2, 2, CAST(N'2025-11-02' AS Date), 2375000, 6, N'Khách thanh toán th?', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (3, 3, 3, CAST(N'2025-11-03' AS Date), 1800000, 2, N'Khách thân thi?t', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (4, 1, 4, CAST(N'2025-11-03' AS Date), 3200000, 5, N'Khách mua 3 s?n ph?m', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (5, 2, 5, CAST(N'2025-11-04' AS Date), 1200000, 4, N'Gi?m giá Noel', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (6, 3, 1, CAST(N'2025-11-04' AS Date), 2700000, 7, N'Khách VIP', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (7, 4, 2, CAST(N'2025-11-05' AS Date), 950000, 8, N'Khách h?c sinh', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (8, 5, 3, CAST(N'2025-11-05' AS Date), 3500000, 9, N'Mua combo 2 s?n ph?m', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (9, 2, 4, CAST(N'2025-11-06' AS Date), 2100000, 6, N'Khách thân thi?t', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (10, 1, 5, CAST(N'2025-11-06' AS Date), 5000000, 10, N'Flash sale gi? vàng', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (14, 1, 2, CAST(N'2025-11-08' AS Date), 19000000, 6, N'', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (15, 1, 2, CAST(N'2025-11-10' AS Date), 43225000, 3, N'Khách hàng thân thiết', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (16, 1, 2, CAST(N'2025-11-10' AS Date), 500000000, NULL, N'', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (17, 1, 2, CAST(N'2025-11-11' AS Date), 24225000, 3, N'', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (18, 1, 5, CAST(N'2025-11-20' AS Date), 135000000, 1, N'', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (19, 2, 2, CAST(N'2025-11-20' AS Date), 3000000, NULL, N'', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (20, 1, 2, CAST(N'2025-11-20' AS Date), 17500000, NULL, N'', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (21, 4, 2, CAST(N'2025-11-20' AS Date), 40000000, NULL, N'', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (22, 1, 2, CAST(N'2025-11-21' AS Date), 28000000, NULL, N'', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (23, 5, 2, CAST(N'2025-11-21' AS Date), 3000000, NULL, N'', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (24, 6, 2, CAST(N'2025-11-21' AS Date), 5500000, NULL, N'', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (25, 8, 2, CAST(N'2025-11-21' AS Date), 9500000, NULL, N'', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (1018, 1, 2, CAST(N'2025-11-21' AS Date), 1825000000, NULL, N'', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (1019, 2, 2, CAST(N'2026-01-12' AS Date), 3000000, NULL, N'', N'Chua Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (1020, 1, 2, CAST(N'2026-01-19' AS Date), 8500000, NULL, N'', N'Chua Thanh Toán')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [GioiTinh], [SoDienThoai], [TongChiTieu], [TinhTrang]) VALUES (1, N'Phạm Văn', N'T', N'Nam', N'0678934234', 0, 1)
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [GioiTinh], [SoDienThoai], [TongChiTieu], [TinhTrang]) VALUES (2, N'Huỳnh', N'Thu V', N'Nam', N'0156793556', 0, 0)
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [GioiTinh], [SoDienThoai], [TongChiTieu], [TinhTrang]) VALUES (3, N'Trần', N'Nam', N'Nam', N'0911111111', 15000000, 1)
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [GioiTinh], [SoDienThoai], [TongChiTieu], [TinhTrang]) VALUES (4, N'Lê', N'Hà', N'Nữ', N'0922222222', 8000000, 1)
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [GioiTinh], [SoDienThoai], [TongChiTieu], [TinhTrang]) VALUES (5, N'Nguyễn', N'Khoa', N'Nam', N'0933333333', 20000000, 1)
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [GioiTinh], [SoDienThoai], [TongChiTieu], [TinhTrang]) VALUES (6, N'Phạm', N'Huyền', N'Nữ', N'0944444444', 12000000, 1)
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [GioiTinh], [SoDienThoai], [TongChiTieu], [TinhTrang]) VALUES (7, N'Đỗ', N'Thắng', N'Nam', N'0955555555', 9000000, 1)
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [GioiTinh], [SoDienThoai], [TongChiTieu], [TinhTrang]) VALUES (8, N'Hoàng', N'Thu', N'Nữ', N'0966666666', 30000000, 1)
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [GioiTinh], [SoDienThoai], [TongChiTieu], [TinhTrang]) VALUES (9, N'Vũ', N'Phong', N'Nam', N'0977777777', 25000000, 1)
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [GioiTinh], [SoDienThoai], [TongChiTieu], [TinhTrang]) VALUES (10, N'Phan', N'Trâm', N'Nữ', N'0988888888', 6000000, 1)
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [GioiTinh], [SoDienThoai], [TongChiTieu], [TinhTrang]) VALUES (11, N'Ngô', N'Đức', N'Nam', N'0999999999', 15000000, 1)
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [GioiTinh], [SoDienThoai], [TongChiTieu], [TinhTrang]) VALUES (12, N'Lưu', N'Tiên', N'Nữ', N'0900000000', 22000000, 1)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LichSuChucVu] ON 

INSERT [dbo].[LichSuChucVu] ([MaLS], [MaNV], [MaCVCu], [MaCVMoi], [NgayThayDoi], [GhiChu]) VALUES (1, 2, N'CV05', N'CV02', CAST(N'2025-01-01T00:00:00.000' AS DateTime), N'Thăng chức lên Quản lý nhân sự')
INSERT [dbo].[LichSuChucVu] ([MaLS], [MaNV], [MaCVCu], [MaCVMoi], [NgayThayDoi], [GhiChu]) VALUES (2, 5, N'CV06', N'CV05', CAST(N'2025-06-15T00:00:00.000' AS DateTime), N'Chuyển từ nhập hàng sang bán hàng')
INSERT [dbo].[LichSuChucVu] ([MaLS], [MaNV], [MaCVCu], [MaCVMoi], [NgayThayDoi], [GhiChu]) VALUES (3, 12, N'CV05', N'CV04', CAST(N'2026-02-01T00:00:00.000' AS DateTime), N'Thăng chức lên Quản lý bán hàng')
INSERT [dbo].[LichSuChucVu] ([MaLS], [MaNV], [MaCVCu], [MaCVMoi], [NgayThayDoi], [GhiChu]) VALUES (4, 8, N'CV05', N'CV06', CAST(N'2026-04-09T00:00:00.000' AS DateTime), N'Cập nhật chức vụ từ giao diện sửa nhân viên')
INSERT [dbo].[LichSuChucVu] ([MaLS], [MaNV], [MaCVCu], [MaCVMoi], [NgayThayDoi], [GhiChu]) VALUES (5, 11, NULL, N'CV06', CAST(N'2026-04-22T00:00:00.000' AS DateTime), N'thay đổi thành nv nhập hàng')
SET IDENTITY_INSERT [dbo].[LichSuChucVu] OFF
GO

USE QLBanDienThoai;
GO

INSERT INTO dbo.loai (TenLoai, MoTa)
VALUES
(N'iPhone', N'Điện thoại Apple sử dụng hệ điều hành iOS'),
(N'Samsung Galaxy S', N'Dòng điện thoại cao cấp của Samsung'),
(N'Samsung Galaxy A', N'Dòng điện thoại tầm trung của Samsung'),
(N'Xiaomi', N'Điện thoại Xiaomi cấu hình mạnh'),
(N'Redmi', N'Dòng điện thoại phổ thông của Xiaomi'),
(N'OPPO Reno', N'Dòng điện thoại OPPO chú trọng camera'),
(N'vivo V', N'Dòng điện thoại vivo thiết kế thời trang'),
(N'realme', N'Điện thoại realme hiệu năng tốt'),
(N'HONOR', N'Điện thoại HONOR thiết kế hiện đại'),
(N'Điện thoại khác', N'Các dòng điện thoại khác');
GO

INSERT INTO dbo.NhaCungCap
    (TenNCC, DiaChi, SoDienThoai, TrangThai)
VALUES
(N'Apple Việt Nam', N'TP. Hồ Chí Minh', N'0901111111', 1),
(N'Samsung Việt Nam', N'Hà Nội', N'0902222222', 1),
(N'Xiaomi Việt Nam', N'TP. Hồ Chí Minh', N'0903333333', 1),
(N'OPPO Việt Nam', N'TP. Hồ Chí Minh', N'0904444444', 1),
(N'vivo Việt Nam', N'TP. Hồ Chí Minh', N'0905555555', 1),
(N'realme Việt Nam', N'Đà Nẵng', N'0906666666', 1),
(N'HONOR Việt Nam', N'Hà Nội', N'0907777777', 1),
(N'Nokia Việt Nam', N'Hải Phòng', N'0908888888', 1),
(N'Motorola Việt Nam', N'Cần Thơ', N'0909999999', 1),
(N'ASUS Việt Nam', N'Bình Dương', N'0910000000', 1);
GO

SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [SoDienThoai], [MaCV], [TrangThai]) VALUES (1, N'Nguyễn Thị', N'Kiều Hương', N'Nữ', N'0835800069', N'CV01', 1)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [SoDienThoai], [MaCV], [TrangThai]) VALUES (2, N'Nguyễn', N'A', N'Nữ', N'0835800068', N'CV02', 1)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [SoDienThoai], [MaCV], [TrangThai]) VALUES (3, N'Nguyễn ', N'B', N'Nam', N'0835800069', N'CV03', 1)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [SoDienThoai], [MaCV], [TrangThai]) VALUES (4, N'Nguyễn', N'C', N'Nam', N'0857565571', N'CV04', 1)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [SoDienThoai], [MaCV], [TrangThai]) VALUES (5, N'Đỗ', N'Nga', N'Nữ', N'0923456789', N'CV05', 1)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [SoDienThoai], [MaCV], [TrangThai]) VALUES (6, N'Hoàng', N'Tú', N'Nam', N'0976543210', N'CV05', 1)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [SoDienThoai], [MaCV], [TrangThai]) VALUES (7, N'Vũ', N'Lan Anh', N'Nữ', N'0911223344', N'CV05', 1)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [SoDienThoai], [MaCV], [TrangThai]) VALUES (8, N'Ngô', N'Minh', N'Nam', N'0966554433', N'CV06', 1)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [SoDienThoai], [MaCV], [TrangThai]) VALUES (9, N'Phan', N'Thảo', N'Nữ', N'0944332211', N'CV05', 1)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [SoDienThoai], [MaCV], [TrangThai]) VALUES (10, N'Đinh', N'Quân', N'Nam', N'0955667788', N'CV06', 1)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [SoDienThoai], [MaCV], [TrangThai]) VALUES (11, N'Phạm', N'Hân', N'Nữ', N'0375683322', N'CV06', 0)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [SoDienThoai], [MaCV], [TrangThai]) VALUES (12, N'Đỗ', N'An', N'Nam', N'0857565572', N'CV05', 1)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [SoDienThoai], [MaCV], [TrangThai]) VALUES (17, N'Nguyễn', N'Z', N'Nam', N'0845723457', N'CV06', 1)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen], [NS_XemDanhSach], [NS_Them], [NS_Sua], [NS_Xoa], [NS_DuyetNghi], [NS_ThayDoiChucVu], [NS_TinhLuong], [NS_XemLuongCaNhan], [NS_InBangLuong], [NS_ChamCong], [KHO_XemSanPham], [KHO_ThemSanPham], [KHO_SuaSanPham], [KHO_XoaSanPham], [KHO_NhapHang], [KHO_QuanLyNCC], [KHO_BaoCaoTonKho], [BH_LapPhieuXuat], [BH_ThongKeDoanhThu], [BH_ThongKeLoiNhuan], [PQ_QuanLyPhanQuyen], [ADMIN_BaoCaoTongHop], [QLBanHang], [QLNhapHang], [QLNhanVien], [QLSanPham], [QLKhachHang], [QLKhuyenMai], [QLThongKe]) VALUES (N'ADMIN', N'Quản trị viên', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen], [NS_XemDanhSach], [NS_Them], [NS_Sua], [NS_Xoa], [NS_DuyetNghi], [NS_ThayDoiChucVu], [NS_TinhLuong], [NS_XemLuongCaNhan], [NS_InBangLuong], [NS_ChamCong], [KHO_XemSanPham], [KHO_ThemSanPham], [KHO_SuaSanPham], [KHO_XoaSanPham], [KHO_NhapHang], [KHO_QuanLyNCC], [KHO_BaoCaoTonKho], [BH_LapPhieuXuat], [BH_ThongKeDoanhThu], [BH_ThongKeLoiNhuan], [PQ_QuanLyPhanQuyen], [ADMIN_BaoCaoTongHop], [QLBanHang], [QLNhapHang], [QLNhanVien], [QLSanPham], [QLKhachHang], [QLKhuyenMai], [QLThongKe]) VALUES (N'NVBH', N'Nhân viên bán hàng', 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen], [NS_XemDanhSach], [NS_Them], [NS_Sua], [NS_Xoa], [NS_DuyetNghi], [NS_ThayDoiChucVu], [NS_TinhLuong], [NS_XemLuongCaNhan], [NS_InBangLuong], [NS_ChamCong], [KHO_XemSanPham], [KHO_ThemSanPham], [KHO_SuaSanPham], [KHO_XoaSanPham], [KHO_NhapHang], [KHO_QuanLyNCC], [KHO_BaoCaoTonKho], [BH_LapPhieuXuat], [BH_ThongKeDoanhThu], [BH_ThongKeLoiNhuan], [PQ_QuanLyPhanQuyen], [ADMIN_BaoCaoTongHop], [QLBanHang], [QLNhapHang], [QLNhanVien], [QLSanPham], [QLKhachHang], [QLKhuyenMai], [QLThongKe]) VALUES (N'NVNH', N'Nhân viên nhập hàng', 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen], [NS_XemDanhSach], [NS_Them], [NS_Sua], [NS_Xoa], [NS_DuyetNghi], [NS_ThayDoiChucVu], [NS_TinhLuong], [NS_XemLuongCaNhan], [NS_InBangLuong], [NS_ChamCong], [KHO_XemSanPham], [KHO_ThemSanPham], [KHO_SuaSanPham], [KHO_XoaSanPham], [KHO_NhapHang], [KHO_QuanLyNCC], [KHO_BaoCaoTonKho], [BH_LapPhieuXuat], [BH_ThongKeDoanhThu], [BH_ThongKeLoiNhuan], [PQ_QuanLyPhanQuyen], [ADMIN_BaoCaoTongHop], [QLBanHang], [QLNhapHang], [QLNhanVien], [QLSanPham], [QLKhachHang], [QLKhuyenMai], [QLThongKe]) VALUES (N'QL_KHO', N'Quản lý Kho', 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen], [NS_XemDanhSach], [NS_Them], [NS_Sua], [NS_Xoa], [NS_DuyetNghi], [NS_ThayDoiChucVu], [NS_TinhLuong], [NS_XemLuongCaNhan], [NS_InBangLuong], [NS_ChamCong], [KHO_XemSanPham], [KHO_ThemSanPham], [KHO_SuaSanPham], [KHO_XoaSanPham], [KHO_NhapHang], [KHO_QuanLyNCC], [KHO_BaoCaoTonKho], [BH_LapPhieuXuat], [BH_ThongKeDoanhThu], [BH_ThongKeLoiNhuan], [PQ_QuanLyPhanQuyen], [ADMIN_BaoCaoTongHop], [QLBanHang], [QLNhapHang], [QLNhanVien], [QLSanPham], [QLKhachHang], [QLKhuyenMai], [QLThongKe]) VALUES (N'QL_KINHDOANH', N'Quản lý Kinh doanh', 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1)
INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen], [NS_XemDanhSach], [NS_Them], [NS_Sua], [NS_Xoa], [NS_DuyetNghi], [NS_ThayDoiChucVu], [NS_TinhLuong], [NS_XemLuongCaNhan], [NS_InBangLuong], [NS_ChamCong], [KHO_XemSanPham], [KHO_ThemSanPham], [KHO_SuaSanPham], [KHO_XoaSanPham], [KHO_NhapHang], [KHO_QuanLyNCC], [KHO_BaoCaoTonKho], [BH_LapPhieuXuat], [BH_ThongKeDoanhThu], [BH_ThongKeLoiNhuan], [PQ_QuanLyPhanQuyen], [ADMIN_BaoCaoTongHop], [QLBanHang], [QLNhapHang], [QLNhanVien], [QLSanPham], [QLKhachHang], [QLKhuyenMai], [QLThongKe]) VALUES (N'QL_NHANSU', N'Quản lý Nhân sự', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayLap], [TongTien], [TrangThai]) VALUES (1, 1, 1, CAST(N'2025-01-05' AS Date), 125000000, NULL)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayLap], [TongTien], [TrangThai]) VALUES (2, 2, 2, CAST(N'2025-01-08' AS Date), 85000000, NULL)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayLap], [TongTien], [TrangThai]) VALUES (3, 3, 3, CAST(N'2025-01-10' AS Date), 64000000, NULL)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayLap], [TongTien], [TrangThai]) VALUES (4, 4, 4, CAST(N'2025-01-15' AS Date), 220000000, NULL)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayLap], [TongTien], [TrangThai]) VALUES (5, 5, 5, CAST(N'2025-01-20' AS Date), 112000000, NULL)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayLap], [TongTien], [TrangThai]) VALUES (6, 2, 6, CAST(N'2025-02-02' AS Date), 365000000, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayLap], [TongTien], [TrangThai]) VALUES (7, 3, 7, CAST(N'2025-02-10' AS Date), 75000000, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayLap], [TongTien], [TrangThai]) VALUES (8, 1, 8, CAST(N'2025-02-15' AS Date), 56000000, NULL)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayLap], [TongTien], [TrangThai]) VALUES (9, 4, 9, CAST(N'2025-03-01' AS Date), 140000000, NULL)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayLap], [TongTien], [TrangThai]) VALUES (10, 5, 10, CAST(N'2025-03-10' AS Date), 180000000, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayLap], [TongTien], [TrangThai]) VALUES (11, NULL, 1, CAST(N'2025-11-11' AS Date), 130000000, NULL)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayLap], [TongTien], [TrangThai]) VALUES (12, NULL, 1, CAST(N'2025-11-21' AS Date), 200000000, NULL)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayLap], [TongTien], [TrangThai]) VALUES (13, NULL, 1, CAST(N'2025-11-21' AS Date), 82000000, 1)
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT INTO dbo.SanPham
(MaSP, TenSP, ThuongHieu, XuatXu, MaLoai, MauSac, DungLuong, GiaBan, SoLuong, MoTa, MaNCC, TrangThai)
VALUES
('SP001', N'iPhone 16 Pro Max', N'Apple', N'Trung Quốc', 1, N'Titan Sa Mạc', '256GB', 34990000, 20, N'Điện thoại Apple cao cấp', 1, 1),
('SP002', N'iPhone 15', N'Apple', N'Trung Quốc', 1, N'Hồng', '128GB', 16990000, 30, N'Điện thoại Apple iPhone 15', 1, 1),
('SP003', N'Samsung Galaxy S25 Ultra', N'Samsung', N'Việt Nam', 1, N'Xám Titan', '256GB', 29990000, 15, N'Điện thoại Samsung cao cấp', 2, 1),
('SP004', N'Samsung Galaxy A56', N'Samsung', N'Việt Nam', 1, N'Đen', '128GB', 9990000, 25, N'Điện thoại Samsung tầm trung', 2, 1),
('SP005', N'Xiaomi 15 Ultra', N'Xiaomi', N'Trung Quốc', 1, N'Đen', '512GB', 32990000, 10, N'Điện thoại Xiaomi cao cấp', 3, 1),
('SP006', N'Xiaomi Redmi Note 14', N'Xiaomi', N'Trung Quốc', 1, N'Xanh', '256GB', 5990000, 40, N'Điện thoại Xiaomi giá tốt', 3, 1),
('SP007', N'OPPO Reno13', N'OPPO', N'Trung Quốc', 1, N'Trắng', '256GB', 15990000, 18, N'Điện thoại OPPO Reno', 4, 1),
('SP008', N'vivo V50', N'vivo', N'Trung Quốc', 1, N'Xanh', '256GB', 12990000, 22, N'Điện thoại vivo V series', 5, 1),
('SP009', N'realme 14 Pro', N'realme', N'Trung Quốc', 1, N'Trắng', '256GB', 11990000, 16, N'Điện thoại realme hiệu năng tốt', 6, 1),
('SP010', N'HONOR 200', N'HONOR', N'Trung Quốc', 1, N'Đen', '256GB', 10990000, 12, N'Điện thoại HONOR thiết kế đẹp', 7, 1);
GO

INSERT [dbo].[TaiKhoan] ([MaNV], [TaiKhoan], [MatKhau], [MaQuyen], [TrangThai]) VALUES (1, N'admin', N'admin', N'ADMIN', 1)
INSERT [dbo].[TaiKhoan] ([MaNV], [TaiKhoan], [MatKhau], [MaQuyen], [TrangThai]) VALUES (2, N'nv1', N'12345', N'QL_NHANSU', 1)
INSERT [dbo].[TaiKhoan] ([MaNV], [TaiKhoan], [MatKhau], [MaQuyen], [TrangThai]) VALUES (3, N'nv2', N'nv2', N'QL_KHO', 1)
INSERT [dbo].[TaiKhoan] ([MaNV], [TaiKhoan], [MatKhau], [MaQuyen], [TrangThai]) VALUES (4, N'nv3', N'nv3', N'QL_KINHDOANH', 1)
INSERT [dbo].[TaiKhoan] ([MaNV], [TaiKhoan], [MatKhau], [MaQuyen], [TrangThai]) VALUES (5, N'nv4', N'nv4', N'NVBH', 1)
INSERT [dbo].[TaiKhoan] ([MaNV], [TaiKhoan], [MatKhau], [MaQuyen], [TrangThai]) VALUES (6, N'nv5', N'nv5', N'NVBH', 1)
INSERT [dbo].[TaiKhoan] ([MaNV], [TaiKhoan], [MatKhau], [MaQuyen], [TrangThai]) VALUES (7, N'nv6', N'nv6', N'NVBH', 1)
INSERT [dbo].[TaiKhoan] ([MaNV], [TaiKhoan], [MatKhau], [MaQuyen], [TrangThai]) VALUES (8, N'nv7', N'nv7', N'NVNH', 1)
INSERT [dbo].[TaiKhoan] ([MaNV], [TaiKhoan], [MatKhau], [MaQuyen], [TrangThai]) VALUES (9, N'nv8', N'nv8', N'NVBH', 1)
INSERT [dbo].[TaiKhoan] ([MaNV], [TaiKhoan], [MatKhau], [MaQuyen], [TrangThai]) VALUES (10, N'nv9', N'nv9', N'NVNH', 1)
INSERT [dbo].[TaiKhoan] ([MaNV], [TaiKhoan], [MatKhau], [MaQuyen], [TrangThai]) VALUES (11, N'nv10', N'nv10', N'NVNH', 0)
INSERT [dbo].[TaiKhoan] ([MaNV], [TaiKhoan], [MatKhau], [MaQuyen], [TrangThai]) VALUES (12, N'nv11', N'nv11', N'NVBH', 1)
INSERT [dbo].[TaiKhoan] ([MaNV], [TaiKhoan], [MatKhau], [MaQuyen], [TrangThai]) VALUES (17, N'nv13', N'nv13', N'NVNH', 1)
GO
/****** Object:  Index [UQ_BangLuong_MaNV_Thang_Nam]    Script Date: 24/04/2026 15:31:27 ******/
ALTER TABLE [dbo].[BangLuong] ADD  CONSTRAINT [UQ_BangLuong_MaNV_Thang_Nam] UNIQUE NONCLUSTERED 
(
	[MaNV] ASC,
	[Thang] ASC,
	[Nam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PhanQuye__5637EE795EAD7574]    Script Date: 24/04/2026 15:31:27 ******/
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [UQ__PhanQuye__5637EE795EAD7574] UNIQUE NONCLUSTERED 
(
	[TenQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TaiKhoan__D5B8C7F079445354]    Script Date: 24/04/2026 15:31:27 ******/
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [UQ__TaiKhoan__D5B8C7F079445354] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BangLuong] ADD  DEFAULT ((0)) FOR [PhuCap]
GO
ALTER TABLE [dbo].[BangLuong] ADD  DEFAULT ((0)) FOR [Thuong]
GO
ALTER TABLE [dbo].[BangLuong] ADD  DEFAULT ((0)) FOR [Phat]
GO
ALTER TABLE [dbo].[BangLuong] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[DonTu] ADD  CONSTRAINT [DF__DonTu__TrangThai__43D61337]  DEFAULT (N'Chờ duyệt') FOR [TrangThai]
GO
ALTER TABLE [dbo].[DonTu] ADD  CONSTRAINT [DF__DonTu__NgayTao__44CA3770]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[DonTu] ADD  DEFAULT (getdate()) FOR [NgayGui]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF__HoaDon__NgayLap__5165187F]  DEFAULT (getdate()) FOR [NgayLap]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF__HoaDon__TongTien__52593CB8]  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT ((0)) FOR [TongChiTieu]
GO
ALTER TABLE [dbo].[LichSuChucVu] ADD  DEFAULT (getdate()) FOR [NgayThayDoi]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__NS_Xe__531856C7]  DEFAULT ((0)) FOR [NS_XemDanhSach]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__NS_Th__540C7B00]  DEFAULT ((0)) FOR [NS_Them]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__NS_Su__55009F39]  DEFAULT ((0)) FOR [NS_Sua]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__NS_Xo__55F4C372]  DEFAULT ((0)) FOR [NS_Xoa]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__NS_Du__56E8E7AB]  DEFAULT ((0)) FOR [NS_DuyetNghi]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__NS_Th__57DD0BE4]  DEFAULT ((0)) FOR [NS_ThayDoiChucVu]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__NS_Ti__58D1301D]  DEFAULT ((0)) FOR [NS_TinhLuong]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__NS_Xe__59C55456]  DEFAULT ((0)) FOR [NS_XemLuongCaNhan]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__NS_In__5AB9788F]  DEFAULT ((0)) FOR [NS_InBangLuong]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__KHO_X__5BAD9CC8]  DEFAULT ((0)) FOR [KHO_XemSanPham]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__KHO_T__5CA1C101]  DEFAULT ((0)) FOR [KHO_ThemSanPham]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__KHO_S__5D95E53A]  DEFAULT ((0)) FOR [KHO_SuaSanPham]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__KHO_X__5E8A0973]  DEFAULT ((0)) FOR [KHO_XoaSanPham]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__KHO_N__5F7E2DAC]  DEFAULT ((0)) FOR [KHO_NhapHang]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__KHO_Q__607251E5]  DEFAULT ((0)) FOR [KHO_QuanLyNCC]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__KHO_B__6166761E]  DEFAULT ((0)) FOR [KHO_BaoCaoTonKho]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__BH_La__625A9A57]  DEFAULT ((0)) FOR [BH_LapPhieuXuat]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__BH_Th__634EBE90]  DEFAULT ((0)) FOR [BH_ThongKeDoanhThu]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__BH_Th__6442E2C9]  DEFAULT ((0)) FOR [BH_ThongKeLoiNhuan]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__PQ_Qu__65370702]  DEFAULT ((0)) FOR [PQ_QuanLyPhanQuyen]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__ADMIN__662B2B3B]  DEFAULT ((0)) FOR [ADMIN_BaoCaoTongHop]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__QLBan__671F4F74]  DEFAULT ((0)) FOR [QLBanHang]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__QLNha__681373AD]  DEFAULT ((0)) FOR [QLNhapHang]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__QLNha__690797E6]  DEFAULT ((0)) FOR [QLNhanVien]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__QLSan__69FBBC1F]  DEFAULT ((0)) FOR [QLSanPham]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__QLKha__6AEFE058]  DEFAULT ((0)) FOR [QLKhachHang]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__QLKhu__6BE40491]  DEFAULT ((0)) FOR [QLKhuyenMai]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF__PhanQuyen__QLTho__6CD828CA]  DEFAULT ((0)) FOR [QLThongKe]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [DF__PhieuNhap__NgayL__5441852A]  DEFAULT (getdate()) FOR [NgayLap]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [DF__PhieuNhap__TongT__5535A963]  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[BangLuong]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[ChamCong]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK__CTHoaDon__ID__0B91BA14] FOREIGN KEY([ID])
REFERENCES [dbo].[SanPham] ([ID])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK__CTHoaDon__ID__0B91BA14]
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK__CTHoaDon__MaHD__04E4BC85] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK__CTHoaDon__MaHD__04E4BC85]
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK__CTPhieuNha__MaPN__5812160E] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [FK__CTPhieuNha__MaPN__5812160E]
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD FOREIGN KEY([ID])
REFERENCES [dbo].[SanPham] ([ID])
GO
ALTER TABLE [dbo].[CTSanPham]  WITH CHECK ADD  CONSTRAINT [FK__CTSanPham__ID__59FA5E80] FOREIGN KEY([ID])
REFERENCES [dbo].[SanPham] ([ID])
GO
ALTER TABLE [dbo].[CTSanPham] CHECK CONSTRAINT [FK__CTSanPham__ID__59FA5E80]
GO
ALTER TABLE [dbo].[DonTu]  WITH CHECK ADD  CONSTRAINT [FK_DonTu_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[DonTu] CHECK CONSTRAINT [FK_DonTu_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaGG__5AEE82B9] FOREIGN KEY([MaGG])
REFERENCES [dbo].[GiamGia] ([MaGG])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaGG__5AEE82B9]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaKH__5BE2A6F2] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaKH__5BE2A6F2]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaNV__5CD6CB2B] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaNV__5CD6CB2B]
GO
ALTER TABLE [dbo].[LichSuChucVu]  WITH CHECK ADD  CONSTRAINT [FK_LSCV_ChucVu_Cuu] FOREIGN KEY([MaCVCu])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[LichSuChucVu] CHECK CONSTRAINT [FK_LSCV_ChucVu_Cuu]
GO
ALTER TABLE [dbo].[LichSuChucVu]  WITH CHECK ADD  CONSTRAINT [FK_LSCV_ChucVu_Moi] FOREIGN KEY([MaCVMoi])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[LichSuChucVu] CHECK CONSTRAINT [FK_LSCV_ChucVu_Moi]
GO
ALTER TABLE [dbo].[LichSuChucVu]  WITH CHECK ADD  CONSTRAINT [FK_LSCV_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[LichSuChucVu] CHECK CONSTRAINT [FK_LSCV_NhanVien]
GO
ALTER TABLE [dbo].[LuongCoBanTheoChucVu]  WITH CHECK ADD  CONSTRAINT [FK_LuongCoBanTheoChucVu_ChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[LuongCoBanTheoChucVu] CHECK CONSTRAINT [FK_LuongCoBanTheoChucVu_ChucVu]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChucVu]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK__PhieuNhap__MaNCC__5DCAEF64] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK__PhieuNhap__MaNCC__5DCAEF64]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK__PhieuNhap__MaNV__5EBF139D] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK__PhieuNhap__MaNV__5EBF139D]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[loai] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([maNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_NhanVien]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_PhanQuyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[PhanQuyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_PhanQuyen]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([GiaBan]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([SoLuong]>=(0)))
GO

