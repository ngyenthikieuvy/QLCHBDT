USE [master]
GO
/****** Object:  Database [QLBanDienThoai]    Script Date: 24/04/2026 15:31:26 ******/
CREATE DATABASE [QLBanDienThoai]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBanDienThoai', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\QLBanDienThoai.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLBanDienThoai', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\QLBanDienThoai_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLBanDienThoai] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBanDienThoai].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBanDienThoai] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBanDienThoai] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET CURSOR_DEFAULT GLOBAL 
GO
ALTER DATABASE [QLBanDienThoai] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET ENABLE_BROKER 
GO
ALTER DATABASE [QLBanDienThoai] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBanDienThoai] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBanDienThoai] SET MULTI_USER 
GO
ALTER DATABASE [QLBanDienThoai] SET PAGE_VERIFY CHECKSUM 
GO
ALTER DATABASE [QLBanDienThoai] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBanDienThoai] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBanDienThoai] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLBanDienThoai] SET ACCELERATED_DATABASE_RECOVERY = OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBanDienThoai', N'ON'
GO
ALTER DATABASE [QLBanDienThoai] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLBanDienThoai] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLBanDienThoai]
GO

/******Object: table SanPham*******/
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
	[GiaBan] [decimal](18, 2) NULL,
	[SoLuong] [int] NULL,
	[HinhAnh] [nvarchar](255) NULL,
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

/******Object: table CTSanPham*******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTSanPham](
	[MaCTSP] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[ChatLieuVo] [nvarchar](50) NULL,
	[ChatLieuDay] [nvarchar](50) NULL,
	[BaoHanh] [nvarchar](100) NULL,
	[TrongLuong] [decimal](6, 2) NULL,
 CONSTRAINT [PK__CTSanPha__1E4FCECD7161CA13] PRIMARY KEY CLUSTERED 
(
	[MaCTSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]******/
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NOT NULL,
	[MaKH] [int] NULL,
	[NgayLap] [date] NOT NULL DEFAUTL GETDATE(),
    [TongTien] BIGINT NOT NULL DEFAULT 0,
	[MaGG] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [varchar](50) NOT NULL
	DEFAULT N'Chưa thanh toán',
	
CONSTRAINT [PK__HoaDon__2725A6E098A4995E] PRIMARY KEY CLUSTERED ( [MaHD] ASC )

CONSTRAINT [CK_HoaDon_TrangThai]
        CHECK (
            TrangThai IN (
                N'Chưa thanh toán',
                N'Đã thanh toán',
                N'Đã hủy'
            )
        )
CONSTRAINT [FK__HoaDon__MaGG__5AEE82B9] FOREIGN KEY([MaGG])
REFERENCES [dbo].[GiamGia] ([MaGG])

CONSTRAINT [FK__HoaDon__MaKH__5BE2A6F2] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])

CONSTRAINT [FK__HoaDon__MaNV__5CD6CB2B] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
)
/****** Object:  Table [dbo].[CTHoaDon]******/	
CREATE TABLE [dbo].[CTHoaDon] (
    [MaCTHD] INT IDENTITY(1,1) NOT NULL,
    [MaHD] INT NOT NULL,
    [SoLuong] INT NOT NULL,
    [GiaBan] INT NOT NULL,
    [ID] INT NOT NULL,
    [ThanhTien] AS (
    CONVERT(BIGINT, SoLuong) * GiaBan
) PERSISTED,
CONSTRAINT PK_CTHoaDon
    PRIMARY KEY CLUSTERED (MaCTHD ASC),

CONSTRAINT CK_CTHoaDon_SoLuong
CHECK (SoLuong > 0),

CONSTRAINT CK_CTHoaDon_GiaBan
CHECK (GiaBan >= 0)
	
CONSTRAINT [UQ_CTHoaDon_MaHD_ID]
UNIQUE (MaHD, ID);
	
CONSTRAINT [FK_CTHoaDon_SanPham] FOREIGN KEY (ID)
REFERENCES [dbo].[SanPham](ID)

CONSTRAINT [FK_CTHoaDon_HoaDon] FOREIGN KEY (MaHD)
REFERENCES [dbo].[HoaDon](MaHD)
)

SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (1, 1, 1, CAST(N'2025-11-01' AS Date), 1425000, 3, N'Khách thanh toán tiền mặt', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (2, 2, 2, CAST(N'2025-11-02' AS Date), 2375000, 6, N'Khách thanh toán thẻ', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (3, 3, 3, CAST(N'2025-11-03' AS Date), 1800000, 2, N'Khách thân thiết', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (4, 1, 4, CAST(N'2025-11-03' AS Date), 3200000, 5, N'Khách mua 3 sản phẩm', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (5, 2, 5, CAST(N'2025-11-04' AS Date), 1200000, 4, N'Giảm giá Noel', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (6, 3, 1, CAST(N'2025-11-04' AS Date), 2700000, 7, N'Khách VIP', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (7, 4, 2, CAST(N'2025-11-05' AS Date), 950000, 8, N'Khách học sinh', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (8, 5, 3, CAST(N'2025-11-05' AS Date), 3500000, 9, N'Mua combo 2 sản phẩm', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (9, 2, 4, CAST(N'2025-11-06' AS Date), 2100000, 6, N'Khách thân thiết', N'Ðã Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (10, 1, 5, CAST(N'2025-11-06' AS Date), 5000000, 10, N'Flash sale giờ vàng', N'Ðã Thanh Toán')
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
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (1019, 2, 2, CAST(N'2026-01-12' AS Date), 3000000, NULL, N'', N'Chưa Thanh Toán')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayLap], [TongTien], [MaGG], [GhiChu], [TrangThai]) VALUES (1020, 1, 2, CAST(N'2026-01-19' AS Date), 8500000, NULL, N'', N'Chưa Thanh Toán')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
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
