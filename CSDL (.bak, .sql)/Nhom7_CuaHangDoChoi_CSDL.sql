-- LỚP: DBMS330284_03 
-- NHÓM THỰC HIỆN: NHÓM 7
-- ĐỀ TÀI: QUẢN LÝ HÀNG HOÁ CỦA CỬA HÀNG ĐỒ CHƠI
-- THÀNH VIÊN:
-- Phan Quan Huy - 20110652
-- Hoàng Thị Mỹ Huyền - 20110337
-- Nguyễn Văn Sang - 20110711
-- Nguyễn Văn Thuận (Nhóm trưởng) - 20110732

CREATE DATABASE CuaHangDoChoi
GO

USE CuaHangDoChoi
GO

CREATE TABLE DanhMucDoChoi(
	MaLoaiDoChoi CHAR(6) PRIMARY KEY,
	TenLoaiDoChoi NVARCHAR(100),
);
GO

CREATE TABLE NhaSanXuat(
	MaNSX CHAR(5) PRIMARY KEY,
	TenNSX NVARCHAR(100),
	TenQuocGia NVARCHAR(100),
);
GO

CREATE TABLE NganKe(
	MaNganKe CHAR(4) PRIMARY KEY,
	ViTri NVARCHAR(100) NOT NULL,
	SucChua INT CHECK(SucChua > 0)
);
GO

CREATE TABLE NhanVien(
	MaNhanVien CHAR(5) PRIMARY KEY,
	CCCD CHAR(12) UNIQUE,
	TenNhanVien NVARCHAR(100),
	GioiTinh NVARCHAR(3),
	NamSinh INT,
	QueQuan NVARCHAR(100),
	Luong INT CHECK(Luong > 0),
	NgayVaoLam DATETIME,
	TrangThai INT CHECK(TrangThai = 0 or TrangThai = 1),
);
GO

CREATE TABLE DoChoi(
	MaDoChoi CHAR(6) PRIMARY KEY,
	TenDoChoi NVARCHAR(100),
	GiaTien INT CHECK(GiaTien > 0),
	MaLoaiDoChoi CHAR(6) REFERENCES DanhMucDoChoi(MaLoaiDoChoi),
	MaNSX CHAR(5) REFERENCES NhaSanXuat(MaNSX), 
	MaNganKe CHAR(4) REFERENCES NganKe(MaNganKe),
);
GO

--Tao bang Hoa Don Nhap--
CREATE TABLE HoaDonNhap(
	MaHoaDonNhap CHAR(6) PRIMARY KEY,
	NgayNhap DATE NOT NULL,
	MaNhanVien CHAR(5) REFERENCES NhanVien(MaNhanVien)
);
GO

--Tao bang Hoa Don Ban--
CREATE TABLE HoaDonBan(
	MaHoaDonBan CHAR(6) PRIMARY KEY,
	NgayBan DATE NOT NULL,
	MaNhanVien CHAR(5) REFERENCES NhanVien(MaNhanVien)
);
GO

--Tao bang Chi Tiet Hoa Don Nhap--
CREATE TABLE ChiTietHoaDonNhap(
	MaNhap CHAR(6) PRIMARY KEY,
	MaHoaDonNhap CHAR(6) REFERENCES HoaDonNhap(MaHoaDonNhap),
	MaDoChoi CHAR(6) REFERENCES DoChoi(MaDoChoi),
	GiaNhap INT CHECK(GiaNhap > 0)
);
GO

--Tao bang Chi Tiet Hoa Don Ban--
CREATE TABLE ChiTietHoaDonBan(
	MaBan CHAR(6) PRIMARY KEY,
	MaHoaDonBan CHAR(6) REFERENCES HoaDonBan(MaHoaDonBan),
	MaDoChoi CHAR(6) REFERENCES DoChoi(MaDoChoi),
	GiaBan INT CHECK(GiaBan > 0)
);
GO

CREATE TABLE TaiKhoan(
	TenNguoiDung CHAR(20) PRIMARY KEY,
	MatKhau VARCHAR(20),
	LoaiNguoiDung VARCHAR(20),
);
GO

USE CuaHangDoChoi
GO
-- Nhà sản xuất
INSERT INTO NhaSanXuat(MaNSX, TenNSX, TenQuocGia)
VALUES ('NSX01', N'Hoa Sen Hồng', N'Việt Nam')

INSERT INTO NhaSanXuat(MaNSX, TenNSX, TenQuocGia)
VALUES ('NSX02', N'Hoàng Gia Sơn', N'Việt Nam')

INSERT INTO NhaSanXuat(MaNSX, TenNSX, TenQuocGia)
VALUES ('NSX03', N'Tân Phát', N'Việt Nam')

INSERT INTO NhaSanXuat(MaNSX, TenNSX, TenQuocGia)
VALUES ('NSX04', N'Ân Hồng Hạnh', N'Việt Nam')

INSERT INTO NhaSanXuat(MaNSX, TenNSX, TenQuocGia)
VALUES ('NSX05', N'Lego ', N'Denmark')

INSERT INTO NhaSanXuat(MaNSX, TenNSX, TenQuocGia)
VALUES ('NSX06', N'Bandai Namco', N'Japan')

INSERT INTO NhaSanXuat(MaNSX, TenNSX, TenQuocGia)
VALUES ('NSX07', N'Hasbro ', N'USA')

INSERT INTO NhaSanXuat(MaNSX, TenNSX, TenQuocGia)
VALUES ('NSX08', N'Mattel', N'USA')

--Ngăn kệ
INSERT INTO NganKe(MaNganKe, ViTri, SucChua)
VALUES ('K001', N'Ngăn trên tủ A', 25)

INSERT INTO NganKe(MaNganKe, ViTri, SucChua)
VALUES ('K002', N'Ngăn giữa tủ A', 25)

INSERT INTO NganKe(MaNganKe, ViTri, SucChua)
VALUES ('K003', N'Ngăn dưới tủ A', 25)

INSERT INTO NganKe(MaNganKe, ViTri, SucChua)
VALUES ('K004', N'Ngăn trên tủ B', 25)

INSERT INTO NganKe(MaNganKe, ViTri, SucChua)
VALUES ('K005', N'Ngăn giữa tủ B', 25)

INSERT INTO NganKe(MaNganKe, ViTri, SucChua)
VALUES ('K006', N'Ngăn dưới tủ B', 25)

INSERT INTO NganKe(MaNganKe, ViTri, SucChua)
VALUES ('K007', N'Ngăn trên tủ C', 25)

INSERT INTO NganKe(MaNganKe, ViTri, SucChua)
VALUES ('K008', N'Ngăn giữa tủ C', 25)

INSERT INTO NganKe(MaNganKe, ViTri, SucChua)
VALUES ('K009', N'Ngăn dưới tủ C', 25)

INSERT INTO NganKe(MaNganKe, ViTri, SucChua)
VALUES ('K010', N'Ngăn trên tủ D', 30)

INSERT INTO NganKe(MaNganKe, ViTri, SucChua)
VALUES ('K011', N'Ngăn giữa tủ D', 30)

INSERT INTO NganKe(MaNganKe, ViTri, SucChua)
VALUES ('K012', N'Ngăn dưới tủ D', 30)

-- Nhân viên
INSERT INTO NhanVien(MaNhanVien, CCCD, TenNhanVien, GioiTinh, NamSinh, QueQuan, Luong, NgayVaoLam, TrangThai)
VALUES ('NV001', '272897765891', N'Nguyễn Văn Nam', 'Nam', 1993, N'Bình Định', 5000000, '2021-01-10', 0)

INSERT INTO NhanVien(MaNhanVien, CCCD, TenNhanVien, GioiTinh, NamSinh, QueQuan, Luong, NgayVaoLam, TrangThai)
VALUES ('NV002', '272333445556', N'Nguyễn Văn Thuận', 'Nam', 1991, N'Bình Dương', 7000000, '2021-01-10', 0)

INSERT INTO NhanVien(MaNhanVien, CCCD, TenNhanVien, GioiTinh, NamSinh, QueQuan, Luong, NgayVaoLam, TrangThai)
VALUES ('NV003', '272998887776', N'Nguyễn Thị Cẩm', N'Nữ', 1990, N'Quảng Ngãi', 10000000, '2021-04-22', 1)

INSERT INTO NhanVien(MaNhanVien, CCCD, TenNhanVien, GioiTinh, NamSinh, QueQuan, Luong, NgayVaoLam, TrangThai)
VALUES ('NV004', '272333444556', N'Trần Văn Nam', 'Nam', 1990, N'Bến Tre', 5000000, '2021-08-20', 1)

INSERT INTO NhanVien(MaNhanVien, CCCD, TenNhanVien, GioiTinh, NamSinh, QueQuan, Luong, NgayVaoLam, TrangThai)
VALUES ('NV005', '277773364448', N'Ngô Đình Nghĩa', 'Nam', 1995, N'Bình Định', 5000000, '2022-02-08', 1)
GO

--- Nhập dữ liệu cho DanhMucDoChoi (Danh Mục Đồ Chơi)
--- Phân loại thành 10 loại đồ chơi phổ biến
INSERT INTO DanhMucDoChoi VALUES ('LDC001', N'Đồ chơi ô tô')
INSERT INTO DanhMucDoChoi VALUES ('LDC002', N'Đồ chơi pokemon')
INSERT INTO DanhMucDoChoi VALUES ('LDC003', N'Đồ chơi đất nặn')
INSERT INTO DanhMucDoChoi VALUES ('LDC004', N'Đồ chơi gỗ')
INSERT INTO DanhMucDoChoi VALUES ('LDC005', N'Đồ chơi giáo dục')
INSERT INTO DanhMucDoChoi VALUES ('LDC006', N'Đồ chơi thông minh')
INSERT INTO DanhMucDoChoi VALUES ('LDC007', N'Đồ chơi mô hình')
INSERT INTO DanhMucDoChoi VALUES ('LDC008', N'Đồ chơi nhà bếp')
INSERT INTO DanhMucDoChoi VALUES ('LDC009', N'Đồ chơi Barbie')
INSERT INTO DanhMucDoChoi VALUES ('LDC010', N'Đồ chơi bông vải')
GO

--- Nhập dữ liệu cho DoChoi (Đồ Chơi)
--- Đồ Chơi Ô TÔ
INSERT INTO DoChoi VALUES ('DC001', N'Xe ô tô vận chuyển khủng long', 150000, 'LDC001', 'NSX01', 'K001')
INSERT INTO DoChoi VALUES ('DC002', N'Xe ô tô vận chuyển khủng long', 150000, 'LDC001', 'NSX01', 'K001')
INSERT INTO DoChoi VALUES ('DC003', N'Xe ô tô vận chuyển khủng long', 150000, 'LDC001', 'NSX01', 'K001')
INSERT INTO DoChoi VALUES ('DC004', N'Xe ô tô vận chuyển khủng long', 150000, 'LDC001', 'NSX01', 'K001')
INSERT INTO DoChoi VALUES ('DC005', N'Xe ô tô vận chuyển khủng long', 150000, 'LDC001', 'NSX01', 'K001')

INSERT INTO DoChoi VALUES ('DC006', N'Xe ô tô - xe công trình chuyên dụng', 400000, 'LDC001', 'NSX02', 'K004')
INSERT INTO DoChoi VALUES ('DC007', N'Xe ô tô - xe công trình chuyên dụng', 400000, 'LDC001', 'NSX02', 'K004')
INSERT INTO DoChoi VALUES ('DC008', N'Xe ô tô - xe công trình chuyên dụng', 400000, 'LDC001', 'NSX02', 'K004')
INSERT INTO DoChoi VALUES ('DC009', N'Xe ô tô - xe công trình chuyên dụng', 400000, 'LDC001', 'NSX02', 'K004')
INSERT INTO DoChoi VALUES ('DC010', N'Xe ô tô - xe công trình chuyên dụng', 400000, 'LDC001', 'NSX02', 'K004')

INSERT INTO DoChoi VALUES ('DC011', N'Xe đồ chơi mini', 100000, 'LDC001', 'NSX03', 'K001')
INSERT INTO DoChoi VALUES ('DC012', N'Xe đồ chơi mini', 100000, 'LDC001', 'NSX03', 'K001')
INSERT INTO DoChoi VALUES ('DC013', N'Xe đồ chơi mini', 100000, 'LDC001', 'NSX03', 'K001')
INSERT INTO DoChoi VALUES ('DC014', N'Xe đồ chơi mini', 100000, 'LDC001', 'NSX03', 'K001')
INSERT INTO DoChoi VALUES ('DC015', N'Xe đồ chơi mini', 100000, 'LDC001', 'NSX03', 'K001')

INSERT INTO DoChoi VALUES ('DC016', N'Xe địa hình cảnh sát', 70000, 'LDC001', 'NSX04', 'K004')
INSERT INTO DoChoi VALUES ('DC017', N'Xe địa hình cảnh sát', 70000, 'LDC001', 'NSX04', 'K004')
INSERT INTO DoChoi VALUES ('DC018', N'Xe địa hình cảnh sát', 70000, 'LDC001', 'NSX04', 'K004')
INSERT INTO DoChoi VALUES ('DC019', N'Xe địa hình cảnh sát', 70000, 'LDC001', 'NSX04', 'K004')
INSERT INTO DoChoi VALUES ('DC020', N'Xe địa hình cảnh sát', 70000, 'LDC001', 'NSX04', 'K004')

INSERT INTO DoChoi VALUES ('DC021', N'Xe biến hình Robot', 95000, 'LDC001', 'NSX05', 'K005')
INSERT INTO DoChoi VALUES ('DC022', N'Xe biến hình Robot', 95000, 'LDC001', 'NSX05', 'K005')
INSERT INTO DoChoi VALUES ('DC023', N'Xe biến hình Robot', 95000, 'LDC001', 'NSX05', 'K005')
INSERT INTO DoChoi VALUES ('DC024', N'Xe biến hình Robot', 95000, 'LDC001', 'NSX05', 'K005')
INSERT INTO DoChoi VALUES ('DC025', N'Xe biến hình Robot', 95000, 'LDC001', 'NSX05', 'K005')

INSERT INTO DoChoi VALUES ('DC026', N'Máy kéo bánh xích điều khiển từ xa', 325000, 'LDC001', 'NSX06', 'K001')
INSERT INTO DoChoi VALUES ('DC027', N'Máy kéo bánh xích điều khiển từ xa', 325000, 'LDC001', 'NSX06', 'K001')
INSERT INTO DoChoi VALUES ('DC028', N'Máy kéo bánh xích điều khiển từ xa', 325000, 'LDC001', 'NSX06', 'K001')
INSERT INTO DoChoi VALUES ('DC029', N'Máy kéo bánh xích điều khiển từ xa', 325000, 'LDC001', 'NSX06', 'K001')
INSERT INTO DoChoi VALUES ('DC030', N'Máy kéo bánh xích điều khiển từ xa', 325000, 'LDC001', 'NSX06', 'K001')

INSERT INTO DoChoi VALUES ('DC031', N'Xe kim loại quân sự', 85000, 'LDC001', 'NSX07', 'K005')
INSERT INTO DoChoi VALUES ('DC032', N'Xe kim loại quân sự', 85000, 'LDC001', 'NSX07', 'K005')
INSERT INTO DoChoi VALUES ('DC033', N'Xe kim loại quân sự', 85000, 'LDC001', 'NSX07', 'K005')
INSERT INTO DoChoi VALUES ('DC034', N'Xe kim loại quân sự', 85000, 'LDC001', 'NSX07', 'K005')
INSERT INTO DoChoi VALUES ('DC035', N'Xe kim loại quân sự', 85000, 'LDC001', 'NSX07', 'K005')

INSERT INTO DoChoi VALUES ('DC036', N'Xe ô tô, máy bay, xe buýt giao thông thành phố', 200000, 'LDC001', 'NSX08', 'K005')
INSERT INTO DoChoi VALUES ('DC037', N'Xe ô tô, máy bay, xe buýt giao thông thành phố', 200000, 'LDC001', 'NSX08', 'K005')
INSERT INTO DoChoi VALUES ('DC038', N'Xe ô tô, máy bay, xe buýt giao thông thành phố', 200000, 'LDC001', 'NSX08', 'K005')
INSERT INTO DoChoi VALUES ('DC039', N'Xe ô tô, máy bay, xe buýt giao thông thành phố', 200000, 'LDC001', 'NSX08', 'K005')
INSERT INTO DoChoi VALUES ('DC040', N'Xe ô tô, máy bay, xe buýt giao thông thành phố', 200000, 'LDC001', 'NSX08', 'K005')

INSERT INTO DoChoi VALUES ('DC041', N'Xe chòi chân 4 bánh tự cân bằng', 170000, 'LDC001', 'NSX01', 'K009')
INSERT INTO DoChoi VALUES ('DC042', N'Xe chòi chân 4 bánh tự cân bằng', 170000, 'LDC001', 'NSX01', 'K009')
INSERT INTO DoChoi VALUES ('DC043', N'Xe chòi chân 4 bánh tự cân bằng', 170000, 'LDC001', 'NSX01', 'K009')
INSERT INTO DoChoi VALUES ('DC044', N'Xe chòi chân 4 bánh tự cân bằng', 170000, 'LDC001', 'NSX01', 'K009')
INSERT INTO DoChoi VALUES ('DC045', N'Xe chòi chân 4 bánh tự cân bằng', 170000, 'LDC001', 'NSX01', 'K009')

INSERT INTO DoChoi VALUES ('DC046', N'Xe vượt địa hình', 500000, 'LDC001', 'NSX02', 'K001')
INSERT INTO DoChoi VALUES ('DC047', N'Xe vượt địa hình', 500000, 'LDC001', 'NSX02', 'K001')
INSERT INTO DoChoi VALUES ('DC048', N'Xe vượt địa hình', 500000, 'LDC001', 'NSX02', 'K001')
INSERT INTO DoChoi VALUES ('DC049', N'Xe vượt địa hình', 500000, 'LDC001', 'NSX02', 'K001')
INSERT INTO DoChoi VALUES ('DC050', N'Xe vượt địa hình', 500000, 'LDC001', 'NSX02', 'K001')
GO

--- Đồ chơi Pokemon
INSERT INTO DoChoi VALUES ('DC051', N'Lắp ráp Pokemon', 1200000, 'LDC002', 'NSX01', 'K001')
INSERT INTO DoChoi VALUES ('DC052', N'Lắp ráp Pokemon', 1200000, 'LDC002', 'NSX01', 'K001')
INSERT INTO DoChoi VALUES ('DC053', N'Lắp ráp Pokemon', 1200000, 'LDC002', 'NSX01', 'K001')
INSERT INTO DoChoi VALUES ('DC054', N'Lắp ráp Pokemon', 1200000, 'LDC002', 'NSX01', 'K001')
INSERT INTO DoChoi VALUES ('DC055', N'Lắp ráp Pokemon', 1200000, 'LDC002', 'NSX01', 'K001')

INSERT INTO DoChoi VALUES ('DC056', N'Bộ sưu tập mô hình Pokemon', 1500000, 'LDC002', 'NSX02', 'K004')
INSERT INTO DoChoi VALUES ('DC057', N'Bộ sưu tập mô hình Pokemon', 1500000, 'LDC002', 'NSX02', 'K004')
INSERT INTO DoChoi VALUES ('DC058', N'Bộ sưu tập mô hình Pokemon', 1500000, 'LDC002', 'NSX02', 'K004')
INSERT INTO DoChoi VALUES ('DC059', N'Bộ sưu tập mô hình Pokemon', 1500000, 'LDC002', 'NSX02', 'K004')
INSERT INTO DoChoi VALUES ('DC060', N'Bộ sưu tập mô hình Pokemon', 1500000, 'LDC002', 'NSX02', 'K004')

INSERT INTO DoChoi VALUES ('DC061', N'Quả cầu Pokemon', 50000, 'LDC002', 'NSX03', 'K002')
INSERT INTO DoChoi VALUES ('DC062', N'Quả cầu Pokemon', 50000, 'LDC002', 'NSX03', 'K002')
INSERT INTO DoChoi VALUES ('DC063', N'Quả cầu Pokemon', 50000, 'LDC002', 'NSX03', 'K002')
INSERT INTO DoChoi VALUES ('DC064', N'Quả cầu Pokemon', 50000, 'LDC002', 'NSX03', 'K002')
INSERT INTO DoChoi VALUES ('DC065', N'Quả cầu Pokemon', 50000, 'LDC002', 'NSX03', 'K002')

INSERT INTO DoChoi VALUES ('DC066', N'Thẻ bài Pokemon', 60000, 'LDC002', 'NSX04', 'K005')
INSERT INTO DoChoi VALUES ('DC067', N'Thẻ bài Pokemon', 60000, 'LDC002', 'NSX04', 'K005')
INSERT INTO DoChoi VALUES ('DC068', N'Thẻ bài Pokemon', 60000, 'LDC002', 'NSX04', 'K005')
INSERT INTO DoChoi VALUES ('DC069', N'Thẻ bài Pokemon', 60000, 'LDC002', 'NSX04', 'K005')
INSERT INTO DoChoi VALUES ('DC070', N'Thẻ bài Pokemon', 60000, 'LDC002', 'NSX04', 'K005')

INSERT INTO DoChoi VALUES ('DC071', N'Pokemon điện tử', 450000, 'LDC002', 'NSX05', 'K006')
INSERT INTO DoChoi VALUES ('DC072', N'Pokemon điện tử', 450000, 'LDC002', 'NSX05', 'K006')
INSERT INTO DoChoi VALUES ('DC073', N'Pokemon điện tử', 450000, 'LDC002', 'NSX05', 'K006')
INSERT INTO DoChoi VALUES ('DC074', N'Pokemon điện tử', 450000, 'LDC002', 'NSX05', 'K006')
INSERT INTO DoChoi VALUES ('DC075', N'Pokemon điện tử', 450000, 'LDC002', 'NSX05', 'K006')

INSERT INTO DoChoi VALUES ('DC076', N'Quyển bí kiếp Pokemon cỡ nhỏ', 30000, 'LDC002', 'NSX06', 'K005')
INSERT INTO DoChoi VALUES ('DC077', N'Quyển bí kiếp Pokemon cỡ nhỏ', 30000, 'LDC002', 'NSX06', 'K005')
INSERT INTO DoChoi VALUES ('DC078', N'Quyển bí kiếp Pokemon cỡ nhỏ', 30000, 'LDC002', 'NSX06', 'K005')
INSERT INTO DoChoi VALUES ('DC079', N'Quyển bí kiếp Pokemon cỡ nhỏ', 30000, 'LDC002', 'NSX06', 'K005')
INSERT INTO DoChoi VALUES ('DC080', N'Quyển bí kiếp Pokemon cỡ nhỏ', 30000, 'LDC002', 'NSX06', 'K005')

INSERT INTO DoChoi VALUES ('DC081', N'Quyển bí kiếp Pokemon cỡ lớn', 100000, 'LDC002', 'NSX07', 'K006')
INSERT INTO DoChoi VALUES ('DC082', N'Quyển bí kiếp Pokemon cỡ lớn', 100000, 'LDC002', 'NSX07', 'K006')
INSERT INTO DoChoi VALUES ('DC083', N'Quyển bí kiếp Pokemon cỡ lớn', 100000, 'LDC002', 'NSX07', 'K006')
INSERT INTO DoChoi VALUES ('DC084', N'Quyển bí kiếp Pokemon cỡ lớn', 100000, 'LDC002', 'NSX07', 'K006')
INSERT INTO DoChoi VALUES ('DC085', N'Quyển bí kiếp Pokemon cỡ lớn', 100000, 'LDC002', 'NSX07', 'K006')

INSERT INTO DoChoi VALUES ('DC086', N'Hình dán Pokemon', 60000, 'LDC002', 'NSX08', 'K004')
INSERT INTO DoChoi VALUES ('DC087', N'Hình dán Pokemon', 60000, 'LDC002', 'NSX08', 'K004')
INSERT INTO DoChoi VALUES ('DC088', N'Hình dán Pokemon', 60000, 'LDC002', 'NSX08', 'K004')
INSERT INTO DoChoi VALUES ('DC089', N'Hình dán Pokemon', 60000, 'LDC002', 'NSX08', 'K004')
INSERT INTO DoChoi VALUES ('DC090', N'Hình dán Pokemon', 60000, 'LDC002', 'NSX08', 'K004')

INSERT INTO DoChoi VALUES ('DC091', N'Bộ thẻ bài Pokemon kim loại', 90000, 'LDC002', 'NSX03', 'K007')
INSERT INTO DoChoi VALUES ('DC092', N'Bộ thẻ bài Pokemon kim loại', 90000, 'LDC002', 'NSX03', 'K007')
INSERT INTO DoChoi VALUES ('DC093', N'Bộ thẻ bài Pokemon kim loại', 90000, 'LDC002', 'NSX03', 'K007')
INSERT INTO DoChoi VALUES ('DC094', N'Bộ thẻ bài Pokemon kim loại', 90000, 'LDC002', 'NSX03', 'K007')
INSERT INTO DoChoi VALUES ('DC095', N'Bộ thẻ bài Pokemon kim loại', 90000, 'LDC002', 'NSX03', 'K007')

INSERT INTO DoChoi VALUES ('DC096', N'Móc khóa Pokemon', 30000, 'LDC002', 'NSX04', 'K007')
INSERT INTO DoChoi VALUES ('DC097', N'Móc khóa Pokemon', 30000, 'LDC002', 'NSX04', 'K007')
INSERT INTO DoChoi VALUES ('DC098', N'Móc khóa Pokemon', 30000, 'LDC002', 'NSX04', 'K007')
INSERT INTO DoChoi VALUES ('DC099', N'Móc khóa Pokemon', 30000, 'LDC002', 'NSX04', 'K007')
INSERT INTO DoChoi VALUES ('DC100', N'Móc khóa Pokemon', 30000, 'LDC002', 'NSX04', 'K007')
GO

--- Đồ chơi đất nặn 
INSERT INTO DoChoi VALUES ('DC101', N'Đất nặn 36 màu kèm khuôn', 180000, 'LDC003', 'NSX01', 'K002')
INSERT INTO DoChoi VALUES ('DC102', N'Đất nặn 36 màu kèm khuôn', 180000, 'LDC003', 'NSX01', 'K002')
INSERT INTO DoChoi VALUES ('DC103', N'Đất nặn 36 màu kèm khuôn', 180000, 'LDC003', 'NSX01', 'K002')
INSERT INTO DoChoi VALUES ('DC104', N'Đất nặn 36 màu kèm khuôn', 180000, 'LDC003', 'NSX01', 'K002')
INSERT INTO DoChoi VALUES ('DC105', N'Đất nặn 36 màu kèm khuôn', 180000, 'LDC003', 'NSX01', 'K002')

INSERT INTO DoChoi VALUES ('DC106', N'Đất nặn làm bánh', 470000, 'LDC003', 'NSX02', 'K002')
INSERT INTO DoChoi VALUES ('DC107', N'Đất nặn làm bánh', 470000, 'LDC003', 'NSX02', 'K002')
INSERT INTO DoChoi VALUES ('DC108', N'Đất nặn làm bánh', 470000, 'LDC003', 'NSX02', 'K002')
INSERT INTO DoChoi VALUES ('DC109', N'Đất nặn làm bánh', 470000, 'LDC003', 'NSX02', 'K002')
INSERT INTO DoChoi VALUES ('DC110', N'Đất nặn làm bánh', 470000, 'LDC003', 'NSX02', 'K002')

INSERT INTO DoChoi VALUES ('DC111', N'Đất nặn Nara', 70000, 'LDC003', 'NSX03', 'K006')
INSERT INTO DoChoi VALUES ('DC112', N'Đất nặn Nara', 70000, 'LDC003', 'NSX03', 'K006')
INSERT INTO DoChoi VALUES ('DC113', N'Đất nặn Nara', 70000, 'LDC003', 'NSX03', 'K006')
INSERT INTO DoChoi VALUES ('DC114', N'Đất nặn Nara', 70000, 'LDC003', 'NSX03', 'K006')
INSERT INTO DoChoi VALUES ('DC115', N'Đất nặn Nara', 70000, 'LDC003', 'NSX03', 'K006')

INSERT INTO DoChoi VALUES ('DC116', N'Đất nặn xô 12 màu', 65000, 'LDC003', 'NSX04', 'K007')
INSERT INTO DoChoi VALUES ('DC117', N'Đất nặn xô 12 màu', 65000, 'LDC003', 'NSX04', 'K007')
INSERT INTO DoChoi VALUES ('DC118', N'Đất nặn xô 12 màu', 65000, 'LDC003', 'NSX04', 'K007')
INSERT INTO DoChoi VALUES ('DC119', N'Đất nặn xô 12 màu', 65000, 'LDC003', 'NSX04', 'K007')
INSERT INTO DoChoi VALUES ('DC120', N'Đất nặn xô 12 màu', 65000, 'LDC003', 'NSX04', 'K007')

INSERT INTO DoChoi VALUES ('DC121', N'Đất nặn nhiều màu Deli', 63000, 'LDC003', 'NSX05', 'K005')
INSERT INTO DoChoi VALUES ('DC122', N'Đất nặn nhiều màu Deli', 63000, 'LDC003', 'NSX05', 'K005')
INSERT INTO DoChoi VALUES ('DC123', N'Đất nặn nhiều màu Deli', 63000, 'LDC003', 'NSX05', 'K005')
INSERT INTO DoChoi VALUES ('DC124', N'Đất nặn nhiều màu Deli', 63000, 'LDC003', 'NSX05', 'K005')
INSERT INTO DoChoi VALUES ('DC125', N'Đất nặn nhiều màu Deli', 63000, 'LDC003', 'NSX05', 'K005')

INSERT INTO DoChoi VALUES ('DC126', N'Đất nặn Mic 10 màu', 40000, 'LDC003', 'NSX06', 'K007')
INSERT INTO DoChoi VALUES ('DC127', N'Đất nặn Mic 10 màu', 40000, 'LDC003', 'NSX06', 'K007')
INSERT INTO DoChoi VALUES ('DC128', N'Đất nặn Mic 10 màu', 40000, 'LDC003', 'NSX06', 'K007')
INSERT INTO DoChoi VALUES ('DC129', N'Đất nặn Mic 10 màu', 40000, 'LDC003', 'NSX06', 'K007')
INSERT INTO DoChoi VALUES ('DC130', N'Đất nặn Mic 10 màu', 40000, 'LDC003', 'NSX06', 'K007')

INSERT INTO DoChoi VALUES ('DC131', N'Đất nặn kèm 14 khuôn tạo hình nghộ nghĩnh', 90000, 'LDC003', 'NSX07', 'K008')
INSERT INTO DoChoi VALUES ('DC132', N'Đất nặn kèm 14 khuôn tạo hình nghộ nghĩnh', 90000, 'LDC003', 'NSX07', 'K008')
INSERT INTO DoChoi VALUES ('DC133', N'Đất nặn kèm 14 khuôn tạo hình nghộ nghĩnh', 90000, 'LDC003', 'NSX07', 'K008')
INSERT INTO DoChoi VALUES ('DC134', N'Đất nặn kèm 14 khuôn tạo hình nghộ nghĩnh', 90000, 'LDC003', 'NSX07', 'K008')
INSERT INTO DoChoi VALUES ('DC135', N'Đất nặn kèm 14 khuôn tạo hình nghộ nghĩnh', 90000, 'LDC003', 'NSX07', 'K008')

INSERT INTO DoChoi VALUES ('DC136', N'Đất nặn và khuôn nhựa TAKACOL', 80000, 'LDC003', 'NSX08', 'K007')
INSERT INTO DoChoi VALUES ('DC137', N'Đất nặn và khuôn nhựa TAKACOL', 80000, 'LDC003', 'NSX08', 'K007')
INSERT INTO DoChoi VALUES ('DC138', N'Đất nặn và khuôn nhựa TAKACOL', 80000, 'LDC003', 'NSX08', 'K007')
INSERT INTO DoChoi VALUES ('DC139', N'Đất nặn và khuôn nhựa TAKACOL', 80000, 'LDC003', 'NSX08', 'K007')
INSERT INTO DoChoi VALUES ('DC140', N'Đất nặn và khuôn nhựa TAKACOL', 80000, 'LDC003', 'NSX08', 'K007')

INSERT INTO DoChoi VALUES ('DC141', N'Đất nặn an toàn TEDU', 87000, 'LDC003', 'NSX05', 'K001')
INSERT INTO DoChoi VALUES ('DC142', N'Đất nặn an toàn TEDU', 87000, 'LDC003', 'NSX05', 'K001')
INSERT INTO DoChoi VALUES ('DC143', N'Đất nặn an toàn TEDU', 87000, 'LDC003', 'NSX05', 'K001')
INSERT INTO DoChoi VALUES ('DC144', N'Đất nặn an toàn TEDU', 87000, 'LDC003', 'NSX05', 'K002')
INSERT INTO DoChoi VALUES ('DC145', N'Đất nặn an toàn TEDU', 87000, 'LDC003', 'NSX05', 'K002')

INSERT INTO DoChoi VALUES ('DC146', N'Đất nặn heo làm mì', 100000, 'LDC003', 'NSX06', 'K003')
INSERT INTO DoChoi VALUES ('DC147', N'Đất nặn heo làm mì', 100000, 'LDC003', 'NSX06', 'K003')
INSERT INTO DoChoi VALUES ('DC148', N'Đất nặn heo làm mì', 100000, 'LDC003', 'NSX06', 'K003')
INSERT INTO DoChoi VALUES ('DC149', N'Đất nặn heo làm mì', 100000, 'LDC003', 'NSX06', 'K003')
INSERT INTO DoChoi VALUES ('DC150', N'Đất nặn heo làm mì', 100000, 'LDC003', 'NSX06', 'K003')
GO

--- Đồ chơi bằng gỗ
INSERT INTO DoChoi VALUES ('DC151', N'Bộ xếp hình 100 khối gỗ trơn không màu', 350000, 'LDC004', 'NSX01', 'K002')
INSERT INTO DoChoi VALUES ('DC152', N'Bộ xếp hình 100 khối gỗ trơn không màu', 350000, 'LDC004', 'NSX01', 'K002')
INSERT INTO DoChoi VALUES ('DC153', N'Bộ xếp hình 100 khối gỗ trơn không màu', 350000, 'LDC004', 'NSX01', 'K002')
INSERT INTO DoChoi VALUES ('DC154', N'Bộ xếp hình 100 khối gỗ trơn không màu', 350000, 'LDC004', 'NSX01', 'K002')
INSERT INTO DoChoi VALUES ('DC155', N'Bộ xếp hình 100 khối gỗ trơn không màu', 350000, 'LDC004', 'NSX01', 'K002')

INSERT INTO DoChoi VALUES ('DC156', N'Lắp ráp mô hình hệ mặt trời bằng gỗ', 600000, 'LDC004', 'NSX02', 'K006')
INSERT INTO DoChoi VALUES ('DC157', N'Lắp ráp mô hình hệ mặt trời bằng gỗ', 600000, 'LDC004', 'NSX02', 'K006')
INSERT INTO DoChoi VALUES ('DC158', N'Lắp ráp mô hình hệ mặt trời bằng gỗ', 600000, 'LDC004', 'NSX02', 'K006')
INSERT INTO DoChoi VALUES ('DC159', N'Lắp ráp mô hình hệ mặt trời bằng gỗ', 600000, 'LDC004', 'NSX02', 'K006')
INSERT INTO DoChoi VALUES ('DC160', N'Lắp ráp mô hình hệ mặt trời bằng gỗ', 600000, 'LDC004', 'NSX02', 'K006')

INSERT INTO DoChoi VALUES ('DC161', N'Bộ xếp hình thành phố bằng gỗ', 380000, 'LDC004', 'NSX03', 'K006')
INSERT INTO DoChoi VALUES ('DC162', N'Bộ xếp hình thành phố bằng gỗ', 380000, 'LDC004', 'NSX03', 'K006')
INSERT INTO DoChoi VALUES ('DC163', N'Bộ xếp hình thành phố bằng gỗ', 380000, 'LDC004', 'NSX03', 'K006')
INSERT INTO DoChoi VALUES ('DC164', N'Bộ xếp hình thành phố bằng gỗ', 380000, 'LDC004', 'NSX03', 'K006')
INSERT INTO DoChoi VALUES ('DC165', N'Bộ xếp hình thành phố bằng gỗ', 380000, 'LDC004', 'NSX03', 'K006')

INSERT INTO DoChoi VALUES ('DC166', N'Bộ ghép hình gỗ 12 chủ đề', 110000, 'LDC004', 'NSX04', 'K007')
INSERT INTO DoChoi VALUES ('DC167', N'Bộ ghép hình gỗ 12 chủ đề', 110000, 'LDC004', 'NSX04', 'K007')
INSERT INTO DoChoi VALUES ('DC168', N'Bộ ghép hình gỗ 12 chủ đề', 110000, 'LDC004', 'NSX04', 'K007')
INSERT INTO DoChoi VALUES ('DC169', N'Bộ ghép hình gỗ 12 chủ đề', 110000, 'LDC004', 'NSX04', 'K007')
INSERT INTO DoChoi VALUES ('DC170', N'Bộ ghép hình gỗ 12 chủ đề', 110000, 'LDC004', 'NSX04', 'K007')

INSERT INTO DoChoi VALUES ('DC171', N'Thùng đồ chơi kỹ thuật bằng gỗ', 320000, 'LDC004', 'NSX05', 'K008')
INSERT INTO DoChoi VALUES ('DC172', N'Thùng đồ chơi kỹ thuật bằng gỗ', 320000, 'LDC004', 'NSX05', 'K008')
INSERT INTO DoChoi VALUES ('DC173', N'Thùng đồ chơi kỹ thuật bằng gỗ', 320000, 'LDC004', 'NSX05', 'K008')
INSERT INTO DoChoi VALUES ('DC174', N'Thùng đồ chơi kỹ thuật bằng gỗ', 320000, 'LDC004', 'NSX05', 'K008')
INSERT INTO DoChoi VALUES ('DC175', N'Thùng đồ chơi kỹ thuật bằng gỗ', 320000, 'LDC004', 'NSX05', 'K008')

INSERT INTO DoChoi VALUES ('DC176', N'Đồ chơi trang điểm bằng gỗ', 900000, 'LDC004', 'NSX06', 'K009')
INSERT INTO DoChoi VALUES ('DC177', N'Đồ chơi trang điểm bằng gỗ', 900000, 'LDC004', 'NSX06', 'K009')
INSERT INTO DoChoi VALUES ('DC178', N'Đồ chơi trang điểm bằng gỗ', 900000, 'LDC004', 'NSX06', 'K009')
INSERT INTO DoChoi VALUES ('DC179', N'Đồ chơi trang điểm bằng gỗ', 900000, 'LDC004', 'NSX06', 'K009')
INSERT INTO DoChoi VALUES ('DC180', N'Đồ chơi trang điểm bằng gỗ', 900000, 'LDC004', 'NSX06', 'K009')

INSERT INTO DoChoi VALUES ('DC181', N'Xe đập chuột bằng gỗ', 400000, 'LDC004', 'NSX07', 'K002')
INSERT INTO DoChoi VALUES ('DC182', N'Xe đập chuột bằng gỗ', 400000, 'LDC004', 'NSX07', 'K002')
INSERT INTO DoChoi VALUES ('DC183', N'Xe đập chuột bằng gỗ', 400000, 'LDC004', 'NSX07', 'K002')
INSERT INTO DoChoi VALUES ('DC184', N'Xe đập chuột bằng gỗ', 400000, 'LDC004', 'NSX07', 'K002')
INSERT INTO DoChoi VALUES ('DC185', N'Xe đập chuột bằng gỗ', 400000, 'LDC004', 'NSX07', 'K002')

INSERT INTO DoChoi VALUES ('DC186', N'Mảnh ghép hình bằng gỗ', 390000, 'LDC004', 'NSX08', 'K009')
INSERT INTO DoChoi VALUES ('DC187', N'Mảnh ghép hình bằng gỗ', 390000, 'LDC004', 'NSX08', 'K009')
INSERT INTO DoChoi VALUES ('DC188', N'Mảnh ghép hình bằng gỗ', 390000, 'LDC004', 'NSX08', 'K009')
INSERT INTO DoChoi VALUES ('DC189', N'Mảnh ghép hình bằng gỗ', 390000, 'LDC004', 'NSX08', 'K009')
INSERT INTO DoChoi VALUES ('DC190', N'Mảnh ghép hình bằng gỗ', 390000, 'LDC004', 'NSX08', 'K009')

INSERT INTO DoChoi VALUES ('DC191', N'Bộ cờ tứ mã bằng gỗ', 290000, 'LDC004', 'NSX07', 'K003')
INSERT INTO DoChoi VALUES ('DC192', N'Bộ cờ tứ mã bằng gỗ', 290000, 'LDC004', 'NSX07', 'K003')
INSERT INTO DoChoi VALUES ('DC193', N'Bộ cờ tứ mã bằng gỗ', 290000, 'LDC004', 'NSX07', 'K003')
INSERT INTO DoChoi VALUES ('DC194', N'Bộ cờ tứ mã bằng gỗ', 290000, 'LDC004', 'NSX07', 'K003')
INSERT INTO DoChoi VALUES ('DC195', N'Bộ cờ tứ mã bằng gỗ', 290000, 'LDC004', 'NSX07', 'K003')

INSERT INTO DoChoi VALUES ('DC196', N'Bộ gạch gỗ xây dựng', 570000, 'LDC004', 'NSX08', 'K003')
INSERT INTO DoChoi VALUES ('DC197', N'Bộ gạch gỗ xây dựng', 570000, 'LDC004', 'NSX08', 'K003')
INSERT INTO DoChoi VALUES ('DC198', N'Bộ gạch gỗ xây dựng', 570000, 'LDC004', 'NSX08', 'K003')
INSERT INTO DoChoi VALUES ('DC199', N'Bộ gạch gỗ xây dựng', 570000, 'LDC004', 'NSX08', 'K003')
INSERT INTO DoChoi VALUES ('DC200', N'Bộ gạch gỗ xây dựng', 570000, 'LDC004', 'NSX08', 'K003')
GO

--- Đồ chơi giáo dục
INSERT INTO DoChoi VALUES ('DC201', N'Bảng chữ cái', 30000, 'LDC005', 'NSX01', 'K012')
INSERT INTO DoChoi VALUES ('DC202', N'Bảng chữ cái', 30000, 'LDC005', 'NSX01', 'K012')
INSERT INTO DoChoi VALUES ('DC203', N'Bảng chữ cái', 30000, 'LDC005', 'NSX01', 'K012')
INSERT INTO DoChoi VALUES ('DC204', N'Bảng chữ cái', 30000, 'LDC005', 'NSX01', 'K012')
INSERT INTO DoChoi VALUES ('DC205', N'Bảng chữ cái', 30000, 'LDC005', 'NSX01', 'K012')

INSERT INTO DoChoi VALUES ('DC206', N'Tranh ghép 9 mảnh', 40000, 'LDC005', 'NSX02', 'K001')
INSERT INTO DoChoi VALUES ('DC207', N'Tranh ghép 9 mảnh', 40000, 'LDC005', 'NSX02', 'K001')
INSERT INTO DoChoi VALUES ('DC208', N'Tranh ghép 9 mảnh', 40000, 'LDC005', 'NSX02', 'K001')
INSERT INTO DoChoi VALUES ('DC209', N'Tranh ghép 9 mảnh', 40000, 'LDC005', 'NSX02', 'K001')
INSERT INTO DoChoi VALUES ('DC210', N'Tranh ghép 9 mảnh', 40000, 'LDC005', 'NSX02', 'K001')

INSERT INTO DoChoi VALUES ('DC211', N'Tranh cát màu thú vị', 50000, 'LDC005', 'NSX03', 'K001')
INSERT INTO DoChoi VALUES ('DC212', N'Tranh cát màu thú vị', 50000, 'LDC005', 'NSX03', 'K001')
INSERT INTO DoChoi VALUES ('DC213', N'Tranh cát màu thú vị', 50000, 'LDC005', 'NSX03', 'K001')
INSERT INTO DoChoi VALUES ('DC214', N'Tranh cát màu thú vị', 50000, 'LDC005', 'NSX03', 'K001')
INSERT INTO DoChoi VALUES ('DC215', N'Tranh cát màu thú vị', 50000, 'LDC005', 'NSX03', 'K001')

INSERT INTO DoChoi VALUES ('DC216', N'Bộ thẻ học thông minh', 100000, 'LDC005', 'NSX04', 'K002')
INSERT INTO DoChoi VALUES ('DC217', N'Bộ thẻ học thông minh', 100000, 'LDC005', 'NSX04', 'K002')
INSERT INTO DoChoi VALUES ('DC218', N'Bộ thẻ học thông minh', 100000, 'LDC005', 'NSX04', 'K002')
INSERT INTO DoChoi VALUES ('DC219', N'Bộ thẻ học thông minh', 100000, 'LDC005', 'NSX04', 'K002')
INSERT INTO DoChoi VALUES ('DC220', N'Bộ thẻ học thông minh', 100000, 'LDC005', 'NSX04', 'K002')

INSERT INTO DoChoi VALUES ('DC221', N'Bảng vẻ điện tử', 150000, 'LDC005', 'NSX05', 'K002')
INSERT INTO DoChoi VALUES ('DC222', N'Bảng vẻ điện tử', 150000, 'LDC005', 'NSX05', 'K002')
INSERT INTO DoChoi VALUES ('DC223', N'Bảng vẻ điện tử', 150000, 'LDC005', 'NSX05', 'K002')
INSERT INTO DoChoi VALUES ('DC224', N'Bảng vẻ điện tử', 150000, 'LDC005', 'NSX05', 'K002')
INSERT INTO DoChoi VALUES ('DC225', N'Bảng vẻ điện tử', 150000, 'LDC005', 'NSX05', 'K002')

INSERT INTO DoChoi VALUES ('DC226', N'Bộ 100 thẻ song ngữ Anh Việt', 110000, 'LDC005', 'NSX06', 'K004')
INSERT INTO DoChoi VALUES ('DC227', N'Bộ 100 thẻ song ngữ Anh Việt', 110000, 'LDC005', 'NSX06', 'K004')
INSERT INTO DoChoi VALUES ('DC228', N'Bộ 100 thẻ song ngữ Anh Việt', 110000, 'LDC005', 'NSX06', 'K004')
INSERT INTO DoChoi VALUES ('DC229', N'Bộ 100 thẻ song ngữ Anh Việt', 110000, 'LDC005', 'NSX06', 'K004')
INSERT INTO DoChoi VALUES ('DC230', N'Bộ 100 thẻ song ngữ Anh Việt', 110000, 'LDC005', 'NSX06', 'K004')

INSERT INTO DoChoi VALUES ('DC231', N'Bộ dụng cụ hỗ trợ học toán cho trẻ', 30000, 'LDC005', 'NSX07', 'K004')
INSERT INTO DoChoi VALUES ('DC232', N'Bộ dụng cụ hỗ trợ học toán cho trẻ', 30000, 'LDC005', 'NSX07', 'K004')
INSERT INTO DoChoi VALUES ('DC233', N'Bộ dụng cụ hỗ trợ học toán cho trẻ', 30000, 'LDC005', 'NSX07', 'K004')
INSERT INTO DoChoi VALUES ('DC234', N'Bộ dụng cụ hỗ trợ học toán cho trẻ', 30000, 'LDC005', 'NSX07', 'K004')
INSERT INTO DoChoi VALUES ('DC235', N'Bộ dụng cụ hỗ trợ học toán cho trẻ', 30000, 'LDC005', 'NSX07', 'K004')

INSERT INTO DoChoi VALUES ('DC236', N'Ghép bảng chữ cái', 45000, 'LDC005', 'NSX08', 'K005')
INSERT INTO DoChoi VALUES ('DC237', N'Ghép bảng chữ cái', 45000, 'LDC005', 'NSX08', 'K005')
INSERT INTO DoChoi VALUES ('DC238', N'Ghép bảng chữ cái', 45000, 'LDC005', 'NSX08', 'K005')
INSERT INTO DoChoi VALUES ('DC239', N'Ghép bảng chữ cái', 45000, 'LDC005', 'NSX08', 'K002')
INSERT INTO DoChoi VALUES ('DC240', N'Ghép bảng chữ cái', 45000, 'LDC005', 'NSX08', 'K005')

INSERT INTO DoChoi VALUES ('DC241', N'Bảng chữ cái phát âm', 170000, 'LDC005', 'NSX01', 'K005')
INSERT INTO DoChoi VALUES ('DC242', N'Bảng chữ cái phát âm', 170000, 'LDC005', 'NSX01', 'K005')
INSERT INTO DoChoi VALUES ('DC243', N'Bảng chữ cái phát âm', 170000, 'LDC005', 'NSX01', 'K005')
INSERT INTO DoChoi VALUES ('DC244', N'Bảng chữ cái phát âm', 170000, 'LDC005', 'NSX01', 'K005')
INSERT INTO DoChoi VALUES ('DC245', N'Bảng chữ cái phát âm', 170000, 'LDC005', 'NSX01', 'K005')

INSERT INTO DoChoi VALUES ('DC246', N'Tranh ghép động vật', 30000, 'LDC005', 'NSX02', 'K007')
INSERT INTO DoChoi VALUES ('DC247', N'Tranh ghép động vật', 30000, 'LDC005', 'NSX02', 'K007')
INSERT INTO DoChoi VALUES ('DC248', N'Tranh ghép động vật', 30000, 'LDC005', 'NSX02', 'K007')
INSERT INTO DoChoi VALUES ('DC249', N'Tranh ghép động vật', 30000, 'LDC005', 'NSX02', 'K007')
INSERT INTO DoChoi VALUES ('DC250', N'Tranh ghép động vật', 30000, 'LDC005', 'NSX02', 'K007')
GO

--- Đồ chơi thông minh
INSERT INTO DoChoi VALUES ('DC251', N'Mê cung thần kì Amaze', 320000, 'LDC006', 'NSX01', 'K003')
INSERT INTO DoChoi VALUES ('DC252', N'Mê cung thần kì Amaze', 320000, 'LDC006', 'NSX01', 'K003')
INSERT INTO DoChoi VALUES ('DC253', N'Mê cung thần kì Amaze', 320000, 'LDC006', 'NSX01', 'K003')
INSERT INTO DoChoi VALUES ('DC254', N'Mê cung thần kì Amaze', 320000, 'LDC006', 'NSX01', 'K003')
INSERT INTO DoChoi VALUES ('DC255', N'Mê cung thần kì Amaze', 320000, 'LDC006', 'NSX01', 'K003')

INSERT INTO DoChoi VALUES ('DC256', N'Cờ vua phù thủy', 2000000, 'LDC006', 'NSX02', 'K003')
INSERT INTO DoChoi VALUES ('DC257', N'Cờ vua phù thủy', 2000000, 'LDC006', 'NSX02', 'K003')
INSERT INTO DoChoi VALUES ('DC258', N'Cờ vua phù thủy', 2000000, 'LDC006', 'NSX02', 'K003')
INSERT INTO DoChoi VALUES ('DC259', N'Cờ vua phù thủy', 2000000, 'LDC006', 'NSX02', 'K003')
INSERT INTO DoChoi VALUES ('DC260', N'Cờ vua phù thủy', 2000000, 'LDC006', 'NSX02', 'K003')

INSERT INTO DoChoi VALUES ('DC261', N'Tương tác 3 trong 1 (từ vựng, toán học, đếm số)', 350000, 'LDC006', 'NSX03', 'K008')
INSERT INTO DoChoi VALUES ('DC262', N'Tương tác 3 trong 1 (từ vựng, toán học, đếm số)', 350000, 'LDC006', 'NSX03', 'K008')
INSERT INTO DoChoi VALUES ('DC263', N'Tương tác 3 trong 1 (từ vựng, toán học, đếm số)', 350000, 'LDC006', 'NSX03', 'K008')
INSERT INTO DoChoi VALUES ('DC264', N'Tương tác 3 trong 1 (từ vựng, toán học, đếm số)', 350000, 'LDC006', 'NSX03', 'K008')
INSERT INTO DoChoi VALUES ('DC265', N'Tương tác 3 trong 1 (từ vựng, toán học, đếm số)', 350000, 'LDC006', 'NSX03', 'K008')

INSERT INTO DoChoi VALUES ('DC266', N'Xếp hình phản trên gương', 180000, 'LDC006', 'NSX04', 'K008')
INSERT INTO DoChoi VALUES ('DC267', N'Xếp hình phản trên gương', 180000, 'LDC006', 'NSX04', 'K008')
INSERT INTO DoChoi VALUES ('DC268', N'Xếp hình phản trên gương', 180000, 'LDC006', 'NSX04', 'K008')
INSERT INTO DoChoi VALUES ('DC269', N'Xếp hình phản trên gương', 180000, 'LDC006', 'NSX04', 'K008')
INSERT INTO DoChoi VALUES ('DC270', N'Xếp hình phản trên gương', 180000, 'LDC006', 'NSX04', 'K008')

INSERT INTO DoChoi VALUES ('DC271', N'Giải câu đố', 200000, 'LDC006', 'NSX05', 'K009')
INSERT INTO DoChoi VALUES ('DC272', N'Giải câu đố', 200000, 'LDC006', 'NSX05', 'K009')
INSERT INTO DoChoi VALUES ('DC273', N'Giải câu đố', 200000, 'LDC006', 'NSX05', 'K009')
INSERT INTO DoChoi VALUES ('DC274', N'Giải câu đố', 200000, 'LDC006', 'NSX05', 'K009')
INSERT INTO DoChoi VALUES ('DC275', N'Giải câu đố', 200000, 'LDC006', 'NSX05', 'K009')

INSERT INTO DoChoi VALUES ('DC276', N'Xếp hình tư duy Logic', 200000, 'LDC006', 'NSX06', 'K001')
INSERT INTO DoChoi VALUES ('DC277', N'Xếp hình tư duy Logic', 200000, 'LDC006', 'NSX06', 'K001')
INSERT INTO DoChoi VALUES ('DC278', N'Xếp hình tư duy Logic', 200000, 'LDC006', 'NSX06', 'K001')
INSERT INTO DoChoi VALUES ('DC279', N'Xếp hình tư duy Logic', 200000, 'LDC006', 'NSX06', 'K001')
INSERT INTO DoChoi VALUES ('DC280', N'Xếp hình tư duy Logic', 200000, 'LDC006', 'NSX06', 'K001')

INSERT INTO DoChoi VALUES ('DC281', N'Xếp hình nam châm thông minh', 190000, 'LDC006', 'NSX07', 'K002')
INSERT INTO DoChoi VALUES ('DC282', N'Xếp hình nam châm thông minh', 190000, 'LDC006', 'NSX07', 'K002')
INSERT INTO DoChoi VALUES ('DC283', N'Xếp hình nam châm thông minh', 190000, 'LDC006', 'NSX07', 'K002')
INSERT INTO DoChoi VALUES ('DC284', N'Xếp hình nam châm thông minh', 190000, 'LDC006', 'NSX07', 'K002')
INSERT INTO DoChoi VALUES ('DC285', N'Xếp hình nam châm thông minh', 190000, 'LDC006', 'NSX07', 'K002')

INSERT INTO DoChoi VALUES ('DC286', N'Đèn pin chiếu hình thông minh', 100000, 'LDC006', 'NSX08', 'K008')
INSERT INTO DoChoi VALUES ('DC287', N'Đèn pin chiếu hình thông minh', 100000, 'LDC006', 'NSX08', 'K008')
INSERT INTO DoChoi VALUES ('DC288', N'Đèn pin chiếu hình thông minh', 100000, 'LDC006', 'NSX08', 'K008')
INSERT INTO DoChoi VALUES ('DC289', N'Đèn pin chiếu hình thông minh', 100000, 'LDC006', 'NSX08', 'K008')
INSERT INTO DoChoi VALUES ('DC290', N'Đèn pin chiếu hình thông minh', 100000, 'LDC006', 'NSX08', 'K008')

INSERT INTO DoChoi VALUES ('DC291', N'Rubik', 80000, 'LDC006', 'NSX03', 'K004')
INSERT INTO DoChoi VALUES ('DC292', N'Rubik', 80000, 'LDC006', 'NSX03', 'K004')
INSERT INTO DoChoi VALUES ('DC293', N'Rubik', 80000, 'LDC006', 'NSX03', 'K004')
INSERT INTO DoChoi VALUES ('DC294', N'Rubik', 80000, 'LDC006', 'NSX03', 'K004')
INSERT INTO DoChoi VALUES ('DC295', N'Rubik', 80000, 'LDC006', 'NSX03', 'K004')

INSERT INTO DoChoi VALUES ('DC296', N'Khối lắp ráp 3D', 50000, 'LDC006', 'NSX04', 'K005')
INSERT INTO DoChoi VALUES ('DC297', N'Khối lắp ráp 3D', 50000, 'LDC006', 'NSX04', 'K005')
INSERT INTO DoChoi VALUES ('DC298', N'Khối lắp ráp 3D', 50000, 'LDC006', 'NSX04', 'K005')
INSERT INTO DoChoi VALUES ('DC299', N'Khối lắp ráp 3D', 50000, 'LDC006', 'NSX04', 'K005')
INSERT INTO DoChoi VALUES ('DC300', N'Khối lắp ráp 3D', 50000, 'LDC006', 'NSX04', 'K005')
GO

--- Đồ chơi mô hình
INSERT INTO DoChoi VALUES ('DC301', N'Siêu nhân khủng long', 500000, 'LDC007', 'NSX01', 'K003')
INSERT INTO DoChoi VALUES ('DC302', N'Siêu nhân khủng long', 500000, 'LDC007', 'NSX01', 'K003')
INSERT INTO DoChoi VALUES ('DC303', N'Siêu nhân khủng long', 500000, 'LDC007', 'NSX01', 'K003')
INSERT INTO DoChoi VALUES ('DC304', N'Siêu nhân khủng long', 500000, 'LDC007', 'NSX01', 'K003')
INSERT INTO DoChoi VALUES ('DC305', N'Siêu nhân khủng long', 500000, 'LDC007', 'NSX01', 'K003')

INSERT INTO DoChoi VALUES ('DC306', N'Siêu nhân cuồng phong', 700000, 'LDC007', 'NSX02', 'K009')
INSERT INTO DoChoi VALUES ('DC307', N'Siêu nhân cuồng phong', 700000, 'LDC007', 'NSX02', 'K009')
INSERT INTO DoChoi VALUES ('DC308', N'Siêu nhân cuồng phong', 700000, 'LDC007', 'NSX02', 'K009')
INSERT INTO DoChoi VALUES ('DC309', N'Siêu nhân cuồng phong', 700000, 'LDC007', 'NSX02', 'K009')
INSERT INTO DoChoi VALUES ('DC310', N'Siêu nhân cuồng phong', 700000, 'LDC007', 'NSX02', 'K009')

INSERT INTO DoChoi VALUES ('DC311', N'Siêu nhân Gao', 700000, 'LDC007', 'NSX03', 'K003')
INSERT INTO DoChoi VALUES ('DC312', N'Siêu nhân Gao', 700000, 'LDC007', 'NSX03', 'K003')
INSERT INTO DoChoi VALUES ('DC313', N'Siêu nhân Gao', 700000, 'LDC007', 'NSX03', 'K003')
INSERT INTO DoChoi VALUES ('DC314', N'Siêu nhân Gao', 700000, 'LDC007', 'NSX03', 'K003')
INSERT INTO DoChoi VALUES ('DC315', N'Siêu nhân Gao', 700000, 'LDC007', 'NSX03', 'K003')

INSERT INTO DoChoi VALUES ('DC316', N'Robot trái cây', 750000, 'LDC007', 'NSX04', 'K004')
INSERT INTO DoChoi VALUES ('DC317', N'Robot trái cây', 750000, 'LDC007', 'NSX04', 'K004')
INSERT INTO DoChoi VALUES ('DC318', N'Robot trái cây', 750000, 'LDC007', 'NSX04', 'K004')
INSERT INTO DoChoi VALUES ('DC319', N'Robot trái cây', 750000, 'LDC007', 'NSX04', 'K004')
INSERT INTO DoChoi VALUES ('DC320', N'Robot trái cây', 750000, 'LDC007', 'NSX04', 'K004')

INSERT INTO DoChoi VALUES ('DC321', N'Khu vui chơi', 1000000, 'LDC007', 'NSX05', 'K001')
INSERT INTO DoChoi VALUES ('DC322', N'Khu vui chơi', 1000000, 'LDC007', 'NSX05', 'K001')
INSERT INTO DoChoi VALUES ('DC323', N'Khu vui chơi', 1000000, 'LDC007', 'NSX05', 'K001')
INSERT INTO DoChoi VALUES ('DC324', N'Khu vui chơi', 1000000, 'LDC007', 'NSX05', 'K001')
INSERT INTO DoChoi VALUES ('DC325', N'Khu vui chơi', 1000000, 'LDC007', 'NSX05', 'K001')

INSERT INTO DoChoi VALUES ('DC326', N'Xây dựng thành phố trong mơ', 1800000, 'LDC007', 'NSX06', 'K002')
INSERT INTO DoChoi VALUES ('DC327', N'Xây dựng thành phố trong mơ', 1800000, 'LDC007', 'NSX06', 'K002')
INSERT INTO DoChoi VALUES ('DC328', N'Xây dựng thành phố trong mơ', 1800000, 'LDC007', 'NSX06', 'K002')
INSERT INTO DoChoi VALUES ('DC329', N'Xây dựng thành phố trong mơ', 1800000, 'LDC007', 'NSX06', 'K002')
INSERT INTO DoChoi VALUES ('DC330', N'Xây dựng thành phố trong mơ', 1800000, 'LDC007', 'NSX06', 'K006')

INSERT INTO DoChoi VALUES ('DC331', N'Nhân vật siêu anh hùng', 600000, 'LDC007', 'NSX07', 'K005')
INSERT INTO DoChoi VALUES ('DC332', N'Nhân vật siêu anh hùng', 600000, 'LDC007', 'NSX07', 'K005')
INSERT INTO DoChoi VALUES ('DC333', N'Nhân vật siêu anh hùng', 600000, 'LDC007', 'NSX07', 'K005')
INSERT INTO DoChoi VALUES ('DC334', N'Nhân vật siêu anh hùng', 600000, 'LDC007', 'NSX07', 'K005')
INSERT INTO DoChoi VALUES ('DC335', N'Nhân vật siêu anh hùng', 600000, 'LDC007', 'NSX07', 'K005')

INSERT INTO DoChoi VALUES ('DC336', N'Nội thất nhà tí hon', 900000, 'LDC007', 'NSX08', 'K010')
INSERT INTO DoChoi VALUES ('DC337', N'Nội thất nhà tí hon', 900000, 'LDC007', 'NSX08', 'K010')
INSERT INTO DoChoi VALUES ('DC338', N'Nội thất nhà tí hon', 900000, 'LDC007', 'NSX08', 'K010')
INSERT INTO DoChoi VALUES ('DC339', N'Nội thất nhà tí hon', 900000, 'LDC007', 'NSX08', 'K010')
INSERT INTO DoChoi VALUES ('DC340', N'Nội thất nhà tí hon', 900000, 'LDC007', 'NSX08', 'K010')

INSERT INTO DoChoi VALUES ('DC341', N'Nhân vật hoạt hình Minions', 900000, 'LDC007', 'NSX05', 'K011')
INSERT INTO DoChoi VALUES ('DC342', N'Nhân vật hoạt hình Minions', 900000, 'LDC007', 'NSX05', 'K011')
INSERT INTO DoChoi VALUES ('DC343', N'Nhân vật hoạt hình Minions', 900000, 'LDC007', 'NSX05', 'K011')
INSERT INTO DoChoi VALUES ('DC344', N'Nhân vật hoạt hình Minions', 900000, 'LDC007', 'NSX05', 'K011')
INSERT INTO DoChoi VALUES ('DC345', N'Nhân vật hoạt hình Minions', 900000, 'LDC007', 'NSX05', 'K011')

INSERT INTO DoChoi VALUES ('DC346', N'Thế giới động vật', 4000000, 'LDC007', 'NSX06', 'K011')
INSERT INTO DoChoi VALUES ('DC347', N'Thế giới động vật', 4000000, 'LDC007', 'NSX06', 'K011')
INSERT INTO DoChoi VALUES ('DC348', N'Thế giới động vật', 4000000, 'LDC007', 'NSX06', 'K011')
INSERT INTO DoChoi VALUES ('DC349', N'Thế giới động vật', 4000000, 'LDC007', 'NSX06', 'K011')
INSERT INTO DoChoi VALUES ('DC350', N'Thế giới động vật', 4000000, 'LDC007', 'NSX06', 'K011')
GO

--- Đồ chơi nhà bếp 
INSERT INTO DoChoi VALUES ('DC351', N'Hàng nấu ăn', 450000, 'LDC008', 'NSX01', 'K004')
INSERT INTO DoChoi VALUES ('DC352', N'Hàng nấu ăn', 450000, 'LDC008', 'NSX01', 'K004')
INSERT INTO DoChoi VALUES ('DC353', N'Hàng nấu ăn', 450000, 'LDC008', 'NSX01', 'K004')
INSERT INTO DoChoi VALUES ('DC354', N'Hàng nấu ăn', 450000, 'LDC008', 'NSX01', 'K004')
INSERT INTO DoChoi VALUES ('DC355', N'Hàng nấu ăn', 450000, 'LDC008', 'NSX01', 'K004')

INSERT INTO DoChoi VALUES ('DC356', N'Nhà bếp cho bé tập nấu ăn', 250000, 'LDC008', 'NSX02', 'K001')
INSERT INTO DoChoi VALUES ('DC357', N'Nhà bếp cho bé tập nấu ăn', 250000, 'LDC008', 'NSX02', 'K001')
INSERT INTO DoChoi VALUES ('DC358', N'Nhà bếp cho bé tập nấu ăn', 250000, 'LDC008', 'NSX02', 'K001')
INSERT INTO DoChoi VALUES ('DC359', N'Nhà bếp cho bé tập nấu ăn', 250000, 'LDC008', 'NSX02', 'K001')
INSERT INTO DoChoi VALUES ('DC360', N'Nhà bếp cho bé tập nấu ăn', 250000, 'LDC008', 'NSX02', 'K001')

INSERT INTO DoChoi VALUES ('DC361', N'Bếp nhà xưa', 860000, 'LDC008', 'NSX03', 'K003')
INSERT INTO DoChoi VALUES ('DC362', N'Bếp nhà xưa', 860000, 'LDC008', 'NSX03', 'K003')
INSERT INTO DoChoi VALUES ('DC363', N'Bếp nhà xưa', 860000, 'LDC008', 'NSX03', 'K003')
INSERT INTO DoChoi VALUES ('DC364', N'Bếp nhà xưa', 860000, 'LDC008', 'NSX03', 'K003')
INSERT INTO DoChoi VALUES ('DC365', N'Bếp nhà xưa', 860000, 'LDC008', 'NSX03', 'K003')

INSERT INTO DoChoi VALUES ('DC366', N'Đồ dùng nhà bếp', 470000, 'LDC008', 'NSX04', 'K003')
INSERT INTO DoChoi VALUES ('DC367', N'Đồ dùng nhà bếp', 470000, 'LDC008', 'NSX04', 'K003')
INSERT INTO DoChoi VALUES ('DC368', N'Đồ dùng nhà bếp', 470000, 'LDC008', 'NSX04', 'K003')
INSERT INTO DoChoi VALUES ('DC369', N'Đồ dùng nhà bếp', 470000, 'LDC008', 'NSX04', 'K003')
INSERT INTO DoChoi VALUES ('DC370', N'Đồ dùng nhà bếp', 470000, 'LDC008', 'NSX04', 'K003')

INSERT INTO DoChoi VALUES ('DC371', N'Nhà bếp phong cách Bắc Âu', 1200000, 'LDC008', 'NSX05', 'K004')
INSERT INTO DoChoi VALUES ('DC372', N'Nhà bếp phong cách Bắc Âu', 1200000, 'LDC008', 'NSX05', 'K004')
INSERT INTO DoChoi VALUES ('DC373', N'Nhà bếp phong cách Bắc Âu', 1200000, 'LDC008', 'NSX05', 'K004')
INSERT INTO DoChoi VALUES ('DC374', N'Nhà bếp phong cách Bắc Âu', 1200000, 'LDC008', 'NSX05', 'K004')
INSERT INTO DoChoi VALUES ('DC375', N'Nhà bếp phong cách Bắc Âu', 1200000, 'LDC008', 'NSX05', 'K004')

INSERT INTO DoChoi VALUES ('DC376', N'Bán đồ ăn nhanh', 1400000, 'LDC008', 'NSX06', 'K005')
INSERT INTO DoChoi VALUES ('DC377', N'Bán đồ ăn nhanh', 1400000, 'LDC008', 'NSX06', 'K005')
INSERT INTO DoChoi VALUES ('DC378', N'Bán đồ ăn nhanh', 1400000, 'LDC008', 'NSX06', 'K005')
INSERT INTO DoChoi VALUES ('DC379', N'Bán đồ ăn nhanh', 1400000, 'LDC008', 'NSX06', 'K005')
INSERT INTO DoChoi VALUES ('DC380', N'Bán đồ ăn nhanh', 1400000, 'LDC008', 'NSX06', 'K005')

INSERT INTO DoChoi VALUES ('DC381', N'Nhà bếp Miền Tây', 1100000, 'LDC008', 'NSX07', 'K010')
INSERT INTO DoChoi VALUES ('DC382', N'Nhà bếp Miền Tây', 1100000, 'LDC008', 'NSX07', 'K010')
INSERT INTO DoChoi VALUES ('DC383', N'Nhà bếp Miền Tây', 1100000, 'LDC008', 'NSX07', 'K010')
INSERT INTO DoChoi VALUES ('DC384', N'Nhà bếp Miền Tây', 1100000, 'LDC008', 'NSX07', 'K010')
INSERT INTO DoChoi VALUES ('DC385', N'Nhà bếp Miền Tây', 1100000, 'LDC008', 'NSX07', 'K010')

INSERT INTO DoChoi VALUES ('DC386', N'Quán ăn mini', 800000, 'LDC008', 'NSX08', 'K011')
INSERT INTO DoChoi VALUES ('DC387', N'Quán ăn mini', 800000, 'LDC008', 'NSX08', 'K011')
INSERT INTO DoChoi VALUES ('DC388', N'Quán ăn mini', 800000, 'LDC008', 'NSX08', 'K011')
INSERT INTO DoChoi VALUES ('DC389', N'Quán ăn mini', 800000, 'LDC008', 'NSX08', 'K011')
INSERT INTO DoChoi VALUES ('DC390', N'Quán ăn mini', 800000, 'LDC008', 'NSX08', 'K011')

INSERT INTO DoChoi VALUES ('DC391', N'Nhà bếp sành điệu', 990000, 'LDC008', 'NSX07', 'K011')
INSERT INTO DoChoi VALUES ('DC392', N'Nhà bếp sành điệu', 990000, 'LDC008', 'NSX07', 'K011')
INSERT INTO DoChoi VALUES ('DC393', N'Nhà bếp sành điệu', 990000, 'LDC008', 'NSX07', 'K011')
INSERT INTO DoChoi VALUES ('DC394', N'Nhà bếp sành điệu', 990000, 'LDC008', 'NSX07', 'K011')
INSERT INTO DoChoi VALUES ('DC395', N'Nhà bếp sành điệu', 990000, 'LDC008', 'NSX07', 'K011')

INSERT INTO DoChoi VALUES ('DC396', N'Tủ bán hàng', 500000, 'LDC008', 'NSX08', 'K012')
INSERT INTO DoChoi VALUES ('DC397', N'Tủ bán hàng', 500000, 'LDC008', 'NSX08', 'K012')
INSERT INTO DoChoi VALUES ('DC398', N'Tủ bán hàng', 500000, 'LDC008', 'NSX08', 'K012')
INSERT INTO DoChoi VALUES ('DC399', N'Tủ bán hàng', 500000, 'LDC008', 'NSX08', 'K012')
INSERT INTO DoChoi VALUES ('DC400', N'Tủ bán hàng', 500000, 'LDC008', 'NSX08', 'K012')
GO

--- Đồ chơi Barbie
INSERT INTO DoChoi VALUES ('DC401', N'Tiệm hoa của Barbie', 520000, 'LDC009', 'NSX01', 'K004')
INSERT INTO DoChoi VALUES ('DC402', N'Tiệm hoa của Barbie', 520000, 'LDC009', 'NSX01', 'K004')
INSERT INTO DoChoi VALUES ('DC403', N'Tiệm hoa của Barbie', 520000, 'LDC009', 'NSX01', 'K005')
INSERT INTO DoChoi VALUES ('DC404', N'Tiệm hoa của Barbie', 520000, 'LDC009', 'NSX01', 'K005')
INSERT INTO DoChoi VALUES ('DC405', N'Tiệm hoa của Barbie', 520000, 'LDC009', 'NSX01', 'K005')

INSERT INTO DoChoi VALUES ('DC406', N'Nội thất của Barbie', 950000, 'LDC009', 'NSX02', 'K010')
INSERT INTO DoChoi VALUES ('DC407', N'Nội thất của Barbie', 950000, 'LDC009', 'NSX02', 'K010')
INSERT INTO DoChoi VALUES ('DC408', N'Nội thất của Barbie', 950000, 'LDC009', 'NSX02', 'K010')
INSERT INTO DoChoi VALUES ('DC409', N'Nội thất của Barbie', 950000, 'LDC009', 'NSX02', 'K010')
INSERT INTO DoChoi VALUES ('DC410', N'Nội thất của Barbie', 950000, 'LDC009', 'NSX02', 'K010')

INSERT INTO DoChoi VALUES ('DC411', N'Phụ kiện của Barbie', 250000, 'LDC009', 'NSX03', 'K010')
INSERT INTO DoChoi VALUES ('DC412', N'Phụ kiện của Barbie', 250000, 'LDC009', 'NSX03', 'K010')
INSERT INTO DoChoi VALUES ('DC413', N'Phụ kiện của Barbie', 250000, 'LDC009', 'NSX03', 'K010')
INSERT INTO DoChoi VALUES ('DC414', N'Phụ kiện của Barbie', 250000, 'LDC009', 'NSX03', 'K010')
INSERT INTO DoChoi VALUES ('DC415', N'Phụ kiện của Barbie', 250000, 'LDC009', 'NSX03', 'K010')

INSERT INTO DoChoi VALUES ('DC416', N'Barbie tiên cánh bướm', 720000, 'LDC009', 'NSX04', 'K011')
INSERT INTO DoChoi VALUES ('DC417', N'Barbie tiên cánh bướm', 720000, 'LDC009', 'NSX04', 'K011')
INSERT INTO DoChoi VALUES ('DC418', N'Barbie tiên cánh bướm', 720000, 'LDC009', 'NSX04', 'K011')
INSERT INTO DoChoi VALUES ('DC419', N'Barbie tiên cánh bướm', 720000, 'LDC009', 'NSX04', 'K011')
INSERT INTO DoChoi VALUES ('DC420', N'Barbie tiên cánh bướm', 720000, 'LDC009', 'NSX04', 'K011')

INSERT INTO DoChoi VALUES ('DC421', N'Phòng tắm Barbie', 880000, 'LDC009', 'NSX05', 'K012')
INSERT INTO DoChoi VALUES ('DC422', N'Phòng tắm Barbie', 880000, 'LDC009', 'NSX05', 'K012')
INSERT INTO DoChoi VALUES ('DC423', N'Phòng tắm Barbie', 880000, 'LDC009', 'NSX05', 'K012')
INSERT INTO DoChoi VALUES ('DC424', N'Phòng tắm Barbie', 880000, 'LDC009', 'NSX05', 'K012')
INSERT INTO DoChoi VALUES ('DC425', N'Phòng tắm Barbie', 880000, 'LDC009', 'NSX05', 'K012')

INSERT INTO DoChoi VALUES ('DC426', N'Barbie mua sắm', 630000, 'LDC009', 'NSX06', 'K012')
INSERT INTO DoChoi VALUES ('DC427', N'Barbie mua sắm', 630000, 'LDC009', 'NSX06', 'K012')
INSERT INTO DoChoi VALUES ('DC428', N'Barbie mua sắm', 630000, 'LDC009', 'NSX06', 'K012')
INSERT INTO DoChoi VALUES ('DC429', N'Barbie mua sắm', 630000, 'LDC009', 'NSX06', 'K012')
INSERT INTO DoChoi VALUES ('DC430', N'Barbie mua sắm', 630000, 'LDC009', 'NSX06', 'K012')

INSERT INTO DoChoi VALUES ('DC431', N'Barbie tí hon', 300000, 'LDC009', 'NSX07', 'K008')
INSERT INTO DoChoi VALUES ('DC432', N'Barbie tí hon', 300000, 'LDC009', 'NSX07', 'K008')
INSERT INTO DoChoi VALUES ('DC433', N'Barbie tí hon', 300000, 'LDC009', 'NSX07', 'K008')
INSERT INTO DoChoi VALUES ('DC434', N'Barbie tí hon', 300000, 'LDC009', 'NSX07', 'K008')
INSERT INTO DoChoi VALUES ('DC435', N'Barbie tí hon', 300000, 'LDC009', 'NSX07', 'K008')

INSERT INTO DoChoi VALUES ('DC436', N'Trang phục Barbie', 600000, 'LDC009', 'NSX08', 'K002')
INSERT INTO DoChoi VALUES ('DC437', N'Trang phục Barbie', 600000, 'LDC009', 'NSX08', 'K002')
INSERT INTO DoChoi VALUES ('DC438', N'Trang phục Barbie', 600000, 'LDC009', 'NSX08', 'K002')
INSERT INTO DoChoi VALUES ('DC439', N'Trang phục Barbie', 600000, 'LDC009', 'NSX08', 'K002')
INSERT INTO DoChoi VALUES ('DC440', N'Trang phục Barbie', 600000, 'LDC009', 'NSX08', 'K002')

INSERT INTO DoChoi VALUES ('DC441', N'Barbie cổ tích', 900000, 'LDC009', 'NSX01', 'K005')
INSERT INTO DoChoi VALUES ('DC442', N'Barbie cổ tích', 900000, 'LDC009', 'NSX01', 'K005')
INSERT INTO DoChoi VALUES ('DC443', N'Barbie cổ tích', 900000, 'LDC009', 'NSX01', 'K005')
INSERT INTO DoChoi VALUES ('DC444', N'Barbie cổ tích', 900000, 'LDC009', 'NSX01', 'K005')
INSERT INTO DoChoi VALUES ('DC445', N'Barbie cổ tích', 900000, 'LDC009', 'NSX01', 'K005')

INSERT INTO DoChoi VALUES ('DC446', N'Phép thuật Winx', 1200000, 'LDC009', 'NSX02', 'K011')
INSERT INTO DoChoi VALUES ('DC447', N'Phép thuật Winx', 1200000, 'LDC009', 'NSX02', 'K011')
INSERT INTO DoChoi VALUES ('DC448', N'Phép thuật Winx', 1200000, 'LDC009', 'NSX02', 'K011')
INSERT INTO DoChoi VALUES ('DC449', N'Phép thuật Winx', 1200000, 'LDC009', 'NSX02', 'K011')
INSERT INTO DoChoi VALUES ('DC450', N'Phép thuật Winx', 1200000, 'LDC009', 'NSX02', 'K011')
GO

--- Đồ chơi bông vải
INSERT INTO DoChoi VALUES ('DC451', N'Chim cánh cụt', 200000, 'LDC010', 'NSX01', 'K010')
INSERT INTO DoChoi VALUES ('DC452', N'Chim cánh cụt', 200000, 'LDC010', 'NSX01', 'K010')
INSERT INTO DoChoi VALUES ('DC453', N'Chim cánh cụt', 200000, 'LDC010', 'NSX01', 'K010')
INSERT INTO DoChoi VALUES ('DC454', N'Chim cánh cụt', 200000, 'LDC010', 'NSX01', 'K010')
INSERT INTO DoChoi VALUES ('DC455', N'Chim cánh cụt', 200000, 'LDC010', 'NSX01', 'K010')

INSERT INTO DoChoi VALUES ('DC456', N'Cừu con ngồi', 200000, 'LDC010', 'NSX02', 'K012')
INSERT INTO DoChoi VALUES ('DC457', N'Cừu con ngồi', 200000, 'LDC010', 'NSX02', 'K012')
INSERT INTO DoChoi VALUES ('DC458', N'Cừu con ngồi', 200000, 'LDC010', 'NSX02', 'K012')
INSERT INTO DoChoi VALUES ('DC459', N'Cừu con ngồi', 200000, 'LDC010', 'NSX02', 'K012')
INSERT INTO DoChoi VALUES ('DC460', N'Cừu con ngồi', 200000, 'LDC010', 'NSX02', 'K012')

INSERT INTO DoChoi VALUES ('DC461', N'Kangaroo', 300000, 'LDC010', 'NSX03', 'K003')
INSERT INTO DoChoi VALUES ('DC462', N'Kangaroo', 300000, 'LDC010', 'NSX03', 'K003')
INSERT INTO DoChoi VALUES ('DC463', N'Kangaroo', 300000, 'LDC010', 'NSX03', 'K003')
INSERT INTO DoChoi VALUES ('DC464', N'Kangaroo', 300000, 'LDC010', 'NSX03', 'K003')
INSERT INTO DoChoi VALUES ('DC465', N'Kangaroo', 300000, 'LDC010', 'NSX03', 'K003')

INSERT INTO DoChoi VALUES ('DC466', N'Gấu Bobbie', 200000, 'LDC010', 'NSX04', 'K006')
INSERT INTO DoChoi VALUES ('DC467', N'Gấu Bobbie', 200000, 'LDC010', 'NSX04', 'K006')
INSERT INTO DoChoi VALUES ('DC468', N'Gấu Bobbie', 200000, 'LDC010', 'NSX04', 'K006')
INSERT INTO DoChoi VALUES ('DC469', N'Gấu Bobbie', 200000, 'LDC010', 'NSX04', 'K006')
INSERT INTO DoChoi VALUES ('DC470', N'Gấu Bobbie', 200000, 'LDC010', 'NSX04', 'K006')

INSERT INTO DoChoi VALUES ('DC471', N'Sư tử con', 300000, 'LDC010', 'NSX05', 'K010')
INSERT INTO DoChoi VALUES ('DC472', N'Sư tử con', 300000, 'LDC010', 'NSX05', 'K010')
INSERT INTO DoChoi VALUES ('DC473', N'Sư tử con', 300000, 'LDC010', 'NSX05', 'K010')
INSERT INTO DoChoi VALUES ('DC474', N'Sư tử con', 300000, 'LDC010', 'NSX05', 'K010')
INSERT INTO DoChoi VALUES ('DC475', N'Sư tử con', 300000, 'LDC010', 'NSX05', 'K010')

INSERT INTO DoChoi VALUES ('DC476', N'Hươu cao cổ', 200000, 'LDC010', 'NSX06', 'K012')
INSERT INTO DoChoi VALUES ('DC477', N'Hươu cao cổ', 200000, 'LDC010', 'NSX06', 'K012')
INSERT INTO DoChoi VALUES ('DC478', N'Hươu cao cổ', 200000, 'LDC010', 'NSX06', 'K012')
INSERT INTO DoChoi VALUES ('DC479', N'Hươu cao cổ', 200000, 'LDC010', 'NSX06', 'K012')
INSERT INTO DoChoi VALUES ('DC480', N'Hươu cao cổ', 200000, 'LDC010', 'NSX06', 'K012')

INSERT INTO DoChoi VALUES ('DC481', N'Người tuyết quàng khăn', 400000, 'LDC010', 'NSX07', 'K003')
INSERT INTO DoChoi VALUES ('DC482', N'Người tuyết quàng khăn', 400000, 'LDC010', 'NSX07', 'K003')
INSERT INTO DoChoi VALUES ('DC483', N'Người tuyết quàng khăn', 400000, 'LDC010', 'NSX07', 'K003')
INSERT INTO DoChoi VALUES ('DC484', N'Người tuyết quàng khăn', 400000, 'LDC010', 'NSX07', 'K003')
INSERT INTO DoChoi VALUES ('DC485', N'Người tuyết quàng khăn', 400000, 'LDC010', 'NSX07', 'K003')

INSERT INTO DoChoi VALUES ('DC486', N'Heo đóm', 300000, 'LDC010', 'NSX08', 'K005')
INSERT INTO DoChoi VALUES ('DC487', N'Heo đóm', 300000, 'LDC010', 'NSX08', 'K005')
INSERT INTO DoChoi VALUES ('DC488', N'Heo đóm', 300000, 'LDC010', 'NSX08', 'K005')
INSERT INTO DoChoi VALUES ('DC489', N'Heo đóm', 300000, 'LDC010', 'NSX08', 'K005')
INSERT INTO DoChoi VALUES ('DC490', N'Heo đóm', 300000, 'LDC010', 'NSX08', 'K005')

INSERT INTO DoChoi VALUES ('DC491', N'Ếch ngộ nghĩnh', 200000, 'LDC010', 'NSX05', 'K006')
INSERT INTO DoChoi VALUES ('DC492', N'Ếch ngộ nghĩnh', 200000, 'LDC010', 'NSX05', 'K006')
INSERT INTO DoChoi VALUES ('DC493', N'Ếch ngộ nghĩnh', 200000, 'LDC010', 'NSX05', 'K006')
INSERT INTO DoChoi VALUES ('DC494', N'Ếch ngộ nghĩnh', 200000, 'LDC010', 'NSX05', 'K006')
INSERT INTO DoChoi VALUES ('DC495', N'Ếch ngộ nghĩnh', 200000, 'LDC010', 'NSX05', 'K006')

INSERT INTO DoChoi VALUES ('DC496', N'Hello Kitty', 400000, 'LDC010', 'NSX06', 'K009')
INSERT INTO DoChoi VALUES ('DC497', N'Hello Kitty', 400000, 'LDC010', 'NSX06', 'K009')
INSERT INTO DoChoi VALUES ('DC498', N'Hello Kitty', 400000, 'LDC010', 'NSX06', 'K009')
INSERT INTO DoChoi VALUES ('DC499', N'Hello Kitty', 400000, 'LDC010', 'NSX06', 'K009')
INSERT INTO DoChoi VALUES ('DC500', N'Hello Kitty', 400000, 'LDC010', 'NSX06', 'K009')
GO
-- Nhập Hoá đơn nhập
INSERT INTO HoaDonNhap VALUES ('HDN001', '2021-01-15', 'NV001');
INSERT INTO HoaDonNhap VALUES ('HDN002', '2021-02-15', 'NV002');
INSERT INTO HoaDonNhap VALUES ('HDN003', '2021-03-15', 'NV001');
INSERT INTO HoaDonNhap VALUES ('HDN004', '2021-04-15', 'NV002');
INSERT INTO HoaDonNhap VALUES ('HDN005', '2021-05-15', 'NV003');
INSERT INTO HoaDonNhap VALUES ('HDN006', '2021-06-15', 'NV002');
INSERT INTO HoaDonNhap VALUES ('HDN007', '2021-07-15', 'NV002');
INSERT INTO HoaDonNhap VALUES ('HDN008', '2021-08-15', 'NV003');
INSERT INTO HoaDonNhap VALUES ('HDN009', '2021-09-15', 'NV004');
INSERT INTO HoaDonNhap VALUES ('HDN010', '2021-10-15', 'NV002');
INSERT INTO HoaDonNhap VALUES ('HDN011', '2021-11-15', 'NV004');
INSERT INTO HoaDonNhap VALUES ('HDN012', '2021-12-15', 'NV002');
INSERT INTO HoaDonNhap VALUES ('HDN013', '2022-01-15', 'NV004');
INSERT INTO HoaDonNhap VALUES ('HDN014', '2022-02-15', 'NV002');
INSERT INTO HoaDonNhap VALUES ('HDN015', '2022-03-15', 'NV005');
INSERT INTO HoaDonNhap VALUES ('HDN016', '2022-04-15', 'NV002');
INSERT INTO HoaDonNhap VALUES ('HDN017', '2022-05-15', 'NV005');
INSERT INTO HoaDonNhap VALUES ('HDN018', '2022-06-15', 'NV004');
INSERT INTO HoaDonNhap VALUES ('HDN019', '2022-07-15', 'NV002');
INSERT INTO HoaDonNhap VALUES ('HDN020', '2022-10-15', 'NV005');
GO

-- Nhập Chi tiết hoá đơn nhập
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0001', 'HDN001', 'DC001', 109000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0002', 'HDN001', 'DC002', 109000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0003', 'HDN001', 'DC003', 109000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0004', 'HDN001', 'DC004', 109000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0005', 'HDN001', 'DC005', 109000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0006', 'HDN001', 'DC011', 60000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0007', 'HDN001', 'DC012', 60000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0008', 'HDN001', 'DC013', 60000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0009', 'HDN001', 'DC014', 60000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0010', 'HDN001', 'DC015', 60000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0011', 'HDN001', 'DC026', 290000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0012', 'HDN001', 'DC027', 290000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0013', 'HDN001', 'DC028', 290000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0014', 'HDN001', 'DC029', 290000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0015', 'HDN001', 'DC030', 290000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0016', 'HDN001', 'DC046', 466000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0017', 'HDN001', 'DC047', 466000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0018', 'HDN001', 'DC048', 466000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0019', 'HDN001', 'DC049', 466000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0020', 'HDN001', 'DC050', 466000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0021', 'HDN001', 'DC051', 1020000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0022', 'HDN001', 'DC052', 1020000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0023', 'HDN001', 'DC053', 1020000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0024', 'HDN001', 'DC054', 1020000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0025', 'HDN001', 'DC055', 1020000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0026', 'HDN001', 'DC061', 35000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0027', 'HDN001', 'DC062', 35000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0028', 'HDN001', 'DC063', 35000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0029', 'HDN001', 'DC064', 35000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0030', 'HDN001', 'DC065', 35000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0031', 'HDN001', 'DC101', 147000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0032', 'HDN001', 'DC102', 147000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0033', 'HDN001', 'DC103', 147000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0034', 'HDN001', 'DC104', 147000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0035', 'HDN001', 'DC105', 147000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0036', 'HDN001', 'DC106', 429000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0037', 'HDN001', 'DC107', 429000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0038', 'HDN001', 'DC108', 429000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0039', 'HDN001', 'DC109', 429000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0040', 'HDN001', 'DC110', 429000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0041', 'HDN001', 'DC121', 48000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0042', 'HDN001', 'DC122', 48000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0043', 'HDN001', 'DC123', 48000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0044', 'HDN001', 'DC124', 48000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0045', 'HDN001', 'DC125', 48000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0046', 'HDN001', 'DC151', 313000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0047', 'HDN001', 'DC152', 313000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0048', 'HDN001', 'DC153', 313000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0049', 'HDN001', 'DC154', 313000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0050', 'HDN001', 'DC155', 313000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0051', 'HDN001', 'DC196', 508000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0052', 'HDN001', 'DC197', 508000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0053', 'HDN001', 'DC198', 508000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0054', 'HDN001', 'DC199', 508000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0055', 'HDN001', 'DC200', 508000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0056', 'HDN001', 'DC251', 279000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0057', 'HDN001', 'DC252', 279000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0058', 'HDN001', 'DC253', 279000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0059', 'HDN001', 'DC254', 279000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0060', 'HDN001', 'DC255', 279000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0061', 'HDN001', 'DC256', 1889000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0062', 'HDN001', 'DC257', 1889000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0063', 'HDN001', 'DC258', 1889000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0064', 'HDN001', 'DC259', 1889000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0065', 'HDN001', 'DC260', 1889000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0066', 'HDN001', 'DC301', 462000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0067', 'HDN001', 'DC302', 462000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0068', 'HDN001', 'DC303', 462000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0069', 'HDN001', 'DC304', 462000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0070', 'HDN001', 'DC305', 462000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0071', 'HDN001', 'DC311', 560000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0072', 'HDN001', 'DC312', 560000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0073', 'HDN001', 'DC313', 560000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0074', 'HDN001', 'DC314', 560000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0075', 'HDN001', 'DC315', 560000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0076', 'HDN001', 'DC351', 10000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0077', 'HDN001', 'DC352', 10000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0078', 'HDN001', 'DC353', 10000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0079', 'HDN001', 'DC354', 10000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0080', 'HDN001', 'DC355', 10000);
-- Hoá đơn nhập 1
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0081', 'HDN002', 'DC006', 321000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0082', 'HDN002', 'DC007', 321000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0083', 'HDN002', 'DC008', 321000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0084', 'HDN002', 'DC009', 321000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0085', 'HDN002', 'DC010', 321000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0086', 'HDN002', 'DC016', 41000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0087', 'HDN002', 'DC017', 41000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0088', 'HDN002', 'DC018', 41000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0089', 'HDN002', 'DC019', 41000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0090', 'HDN002', 'DC020', 41000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0091', 'HDN002', 'DC056', 1315000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0092', 'HDN002', 'DC057', 1315000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0093', 'HDN002', 'DC058', 1315000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0094', 'HDN002', 'DC059', 1315000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0095', 'HDN002', 'DC060', 1315000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0096', 'HDN002', 'DC086', 39000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0097', 'HDN002', 'DC087', 39000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0098', 'HDN002', 'DC088', 39000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0099', 'HDN002', 'DC089', 39000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0100', 'HDN002', 'DC090', 39000);


---------200

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0101', 'HDN003', 'DC021', 50000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0102', 'HDN003', 'DC022', 50000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0103', 'HDN003', 'DC023', 50000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0104', 'HDN003', 'DC024', 50000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0105', 'HDN003', 'DC025', 50000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0106', 'HDN003', 'DC031', 40000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0107', 'HDN003', 'DC032', 40000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0108', 'HDN003', 'DC033', 40000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0109', 'HDN003', 'DC034', 40000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0110', 'HDN003', 'DC035', 40000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0111', 'HDN003', 'DC036', 152000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0112', 'HDN003', 'DC037', 152000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0113', 'HDN003', 'DC038', 152000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0114', 'HDN003', 'DC039', 152000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0115', 'HDN003', 'DC040', 152000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0116', 'HDN003', 'DC066', 33000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0117', 'HDN003', 'DC067', 33000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0118', 'HDN003', 'DC068', 33000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0119', 'HDN003', 'DC069', 33000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0120', 'HDN003', 'DC070', 33000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0121', 'HDN004', 'DC076', 11000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0122', 'HDN004', 'DC077', 11000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0123', 'HDN004', 'DC078', 11000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0124', 'HDN004', 'DC079', 11000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0125', 'HDN004', 'DC080', 11000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0126', 'HDN004', 'DC081', 76000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0127', 'HDN004', 'DC082', 76000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0128', 'HDN004', 'DC083', 76000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0129', 'HDN004', 'DC084', 76000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0130', 'HDN004', 'DC085', 76000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0131', 'HDN004', 'DC111', 47000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0132', 'HDN004', 'DC112', 47000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0133', 'HDN004', 'DC113', 47000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0134', 'HDN004', 'DC114', 47000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0135', 'HDN004', 'DC115', 47000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0136', 'HDN004', 'DC156', 439000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0137', 'HDN004', 'DC157', 439000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0138', 'HDN004', 'DC158', 439000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0139', 'HDN004', 'DC159', 439000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0140', 'HDN004', 'DC160', 439000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0141', 'HDN004', 'DC161', 278000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0142', 'HDN004', 'DC162', 278000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0143', 'HDN004', 'DC163', 278000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0144', 'HDN004', 'DC164', 278000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0145', 'HDN004', 'DC165', 278000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0146', 'HDN005', 'DC071', 385000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0147', 'HDN005', 'DC072', 385000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0148', 'HDN005', 'DC073', 385000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0149', 'HDN005', 'DC074', 385000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0150', 'HDN005', 'DC075', 385000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0151', 'HDN005', 'DC091', 52000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0152', 'HDN005', 'DC092', 52000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0153', 'HDN005', 'DC093', 52000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0154', 'HDN005', 'DC094', 52000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0155', 'HDN005', 'DC095', 52000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0156', 'HDN005', 'DC096', 15000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0157', 'HDN005', 'DC097', 15000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0158', 'HDN005', 'DC098', 15000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0159', 'HDN005', 'DC099', 15000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0160', 'HDN005', 'DC100', 15000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0161', 'HDN005', 'DC116', 30000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0162', 'HDN005', 'DC117', 30000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0163', 'HDN005', 'DC118', 30000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0164', 'HDN005', 'DC119', 30000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0165', 'HDN005', 'DC120', 30000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0166', 'HDN005', 'DC166', 87000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0167', 'HDN005', 'DC167', 87000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0168', 'HDN005', 'DC168', 87000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0169', 'HDN005', 'DC169', 87000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0170', 'HDN005', 'DC170', 87000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0171', 'HDN006', 'DC126', 21000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0172', 'HDN006', 'DC127', 21000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0173', 'HDN006', 'DC128', 21000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0174', 'HDN006', 'DC129', 21000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0175', 'HDN006', 'DC130', 21000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0176', 'HDN006', 'DC171', 276000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0177', 'HDN006', 'DC172', 27600);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0178', 'HDN006', 'DC173', 276000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0179', 'HDN006', 'DC174', 276000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0180', 'HDN006', 'DC175', 276000);
-- Hoá đơn nhập 1
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0181', 'HDN006', 'DC261', 290000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0182', 'HDN006', 'DC262', 290000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0183', 'HDN006', 'DC263', 290000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0184', 'HDN006', 'DC264', 290000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0185', 'HDN006', 'DC265', 290000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0186', 'HDN006', 'DC266', 142000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0187', 'HDN006', 'DC267', 142000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0188', 'HDN006', 'DC268', 142000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0189', 'HDN006', 'DC269', 142000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0190', 'HDN006', 'DC270', 142000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0191', 'HDN006', 'DC286', 69000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0192', 'HDN006', 'DC287', 69000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0193', 'HDN006', 'DC288', 69000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0194', 'HDN006', 'DC289', 69000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0195', 'HDN006', 'DC290', 69000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0196', 'HDN007', 'DC131', 59000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0197', 'HDN007', 'DC132', 59000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0198', 'HDN007', 'DC133', 59000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0199', 'HDN007', 'DC134', 59000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0200', 'HDN007', 'DC135', 59000);


INSERT INTO ChiTietHoaDonNhap VALUES ('DN0201', 'HDN007', 'DC176', 750000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0202', 'HDN007', 'DC177', 750000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0203', 'HDN007', 'DC178', 750000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0204', 'HDN007', 'DC179', 750000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0205', 'HDN007', 'DC180', 750000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0206', 'HDN007', 'DC271', 145000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0207', 'HDN007', 'DC272', 145000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0208', 'HDN007', 'DC273', 145000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0209', 'HDN007', 'DC274', 145000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0210', 'HDN007', 'DC275', 145000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0211', 'HDN007', 'DC306', 583000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0212', 'HDN007', 'DC307', 583000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0213', 'HDN007', 'DC308', 583000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0214', 'HDN007', 'DC309', 583000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0215', 'HDN007', 'DC310', 583000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0216', 'HDN008', 'DC041', 66000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0217', 'HDN008', 'DC042', 66000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0218', 'HDN008', 'DC043', 66000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0219', 'HDN008', 'DC044', 66000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0220', 'HDN008', 'DC045', 66000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0221', 'HDN008', 'DC186', 312000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0222', 'HDN008', 'DC187', 312000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0223', 'HDN008', 'DC188', 312000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0224', 'HDN008', 'DC189', 312000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0225', 'HDN008', 'DC190', 312000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0226', 'HDN008', 'DC276', 132000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0227', 'HDN008', 'DC277', 132000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0228', 'HDN008', 'DC278', 132000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0229', 'HDN008', 'DC279', 132000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0230', 'HDN008', 'DC280', 132000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0231', 'HDN008', 'DC321', 823000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0232', 'HDN008', 'DC322', 823000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0233', 'HDN008', 'DC323', 823000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0234', 'HDN008', 'DC324', 823000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0235', 'HDN008', 'DC325', 823000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0236', 'HDN008', 'DC356', 177000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0237', 'HDN008', 'DC357', 177000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0238', 'HDN008', 'DC358', 177000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0239', 'HDN008', 'DC359', 177000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0240', 'HDN008', 'DC360', 177000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0241', 'HDN009', 'DC141', 48000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0242', 'HDN009', 'DC142', 48000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0243', 'HDN009', 'DC143', 48000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0244', 'HDN009', 'DC144', 48000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0245', 'HDN009', 'DC145', 48000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0246', 'HDN009', 'DC181', 295000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0247', 'HDN009', 'DC182', 295000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0248', 'HDN009', 'DC183', 295000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0249', 'HDN009', 'DC184', 295000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0250', 'HDN009', 'DC185', 295000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0251', 'HDN009', 'DC281', 136000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0252', 'HDN009', 'DC282', 136000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0253', 'HDN009', 'DC283', 136000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0254', 'HDN009', 'DC284', 136000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0255', 'HDN009', 'DC285', 136000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0256', 'HDN009', 'DC326', 1611000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0257', 'HDN009', 'DC327', 1611000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0258', 'HDN009', 'DC328', 1611000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0259', 'HDN009', 'DC329', 1611000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0260', 'HDN009', 'DC330', 1611000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0261', 'HDN009', 'DC361', 750000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0262', 'HDN009', 'DC362', 750000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0263', 'HDN009', 'DC363', 750000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0264', 'HDN009', 'DC364', 750000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0265', 'HDN009', 'DC365', 750000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0266', 'HDN009', 'DC366', 360000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0267', 'HDN009', 'DC367', 360000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0268', 'HDN009', 'DC368', 360000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0269', 'HDN009', 'DC369', 360000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0270', 'HDN009', 'DC370', 360000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0271', 'HDN010', 'DC146', 70000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0272', 'HDN010', 'DC147', 70000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0273', 'HDN010', 'DC148', 70000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0274', 'HDN010', 'DC149', 70000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0275', 'HDN010', 'DC150', 70000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0276', 'HDN010', 'DC191', 252000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0277', 'HDN010', 'DC192', 252000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0278', 'HDN010', 'DC193', 252000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0279', 'HDN010', 'DC194', 252000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0280', 'HDN010', 'DC195', 252000);
-- Hoá đơn nhập 1
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0281', 'HDN010', 'DC291', 59000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0282', 'HDN010', 'DC292', 59000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0283', 'HDN010', 'DC293', 59000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0284', 'HDN010', 'DC294', 59000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0285', 'HDN010', 'DC295', 59000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0286', 'HDN010', 'DC316', 658000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0287', 'HDN010', 'DC317', 658000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0288', 'HDN010', 'DC318', 658000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0289', 'HDN010', 'DC319', 658000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0290', 'HDN010', 'DC320', 658000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0291', 'HDN010', 'DC371', 1070000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0292', 'HDN010', 'DC372', 1070000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0293', 'HDN010', 'DC373', 1070000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0294', 'HDN010', 'DC374', 1070000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0295', 'HDN010', 'DC375', 1070000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0296', 'HDN010', 'DC401', 412000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0297', 'HDN010', 'DC402', 412000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0298', 'HDN010', 'DC403', 412000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0299', 'HDN010', 'DC404', 412000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0300', 'HDN010', 'DC405', 412000);


INSERT INTO ChiTietHoaDonNhap VALUES ('DN0301', 'HDN011', 'DC296', 31000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0302', 'HDN011', 'DC297', 31000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0303', 'HDN011', 'DC298', 31000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0304', 'HDN011', 'DC299', 31000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0305', 'HDN011', 'DC300', 31000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0306', 'HDN011', 'DC331', 500000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0307', 'HDN011', 'DC332', 500000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0308', 'HDN011', 'DC333', 500000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0309', 'HDN011', 'DC334', 500000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0310', 'HDN011', 'DC335', 500000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0311', 'HDN011', 'DC376', 1356000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0312', 'HDN011', 'DC377', 1356000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0313', 'HDN011', 'DC378', 1356000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0314', 'HDN011', 'DC379', 1356000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0315', 'HDN011', 'DC380', 1356000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0316', 'HDN011', 'DC406', 826000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0317', 'HDN011', 'DC407', 826000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0318', 'HDN011', 'DC408', 826000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0319', 'HDN011', 'DC409', 826000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0320', 'HDN011', 'DC410', 826000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0321', 'HDN012', 'DC336', 789000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0322', 'HDN012', 'DC337', 789000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0323', 'HDN012', 'DC338', 789000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0324', 'HDN012', 'DC339', 789000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0325', 'HDN012', 'DC340', 789000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0326', 'HDN012', 'DC381', 938000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0327', 'HDN012', 'DC382', 938000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0328', 'HDN012', 'DC383', 938000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0329', 'HDN012', 'DC384', 938000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0330', 'HDN012', 'DC385', 938000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0331', 'HDN012', 'DC411', 187000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0332', 'HDN012', 'DC412', 187000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0333', 'HDN012', 'DC413', 187000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0334', 'HDN012', 'DC414', 187000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0335', 'HDN012', 'DC415', 187000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0336', 'HDN012', 'DC451', 149000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0337', 'HDN012', 'DC452', 149000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0338', 'HDN012', 'DC453', 149000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0339', 'HDN012', 'DC454', 149000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0340', 'HDN012', 'DC455', 149000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0341', 'HDN012', 'DC471', 218000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0342', 'HDN012', 'DC472', 218000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0343', 'HDN012', 'DC473', 218000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0344', 'HDN012', 'DC474', 218000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0345', 'HDN012', 'DC475', 218000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0346', 'HDN013', 'DC341', 788000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0347', 'HDN013', 'DC342', 788000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0348', 'HDN013', 'DC343', 788000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0349', 'HDN013', 'DC344', 788000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0350', 'HDN013', 'DC345', 788000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0351', 'HDN013', 'DC386', 689000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0352', 'HDN013', 'DC387', 689000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0353', 'HDN013', 'DC388', 689000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0354', 'HDN013', 'DC389', 689000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0355', 'HDN013', 'DC390', 689000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0356', 'HDN013', 'DC416', 600000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0357', 'HDN013', 'DC417', 600000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0358', 'HDN013', 'DC418', 600000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0359', 'HDN013', 'DC419', 600000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0360', 'HDN013', 'DC420', 600000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0361', 'HDN013', 'DC446', 1110000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0362', 'HDN013', 'DC447', 1110000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0363', 'HDN013', 'DC448', 1110000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0364', 'HDN013', 'DC449', 1110000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0365', 'HDN013', 'DC450', 1110000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0366', 'HDN014', 'DC346', 3782000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0367', 'HDN014', 'DC347', 3782000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0368', 'HDN014', 'DC348', 3782000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0369', 'HDN014', 'DC349', 3782000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0370', 'HDN014', 'DC350', 3782000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0371', 'HDN014', 'DC391', 810000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0372', 'HDN014', 'DC392', 810000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0373', 'HDN014', 'DC393', 810000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0374', 'HDN014', 'DC394', 810000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0375', 'HDN014', 'DC395', 810000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0376', 'HDN014', 'DC421', 700000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0377', 'HDN014', 'DC422', 700000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0378', 'HDN014', 'DC423', 700000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0379', 'HDN014', 'DC424', 700000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0380', 'HDN014', 'DC425', 700000);
-- Hoá đơn nhập 1
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0381', 'HDN015', 'DC396', 401000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0382', 'HDN015', 'DC397', 401000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0383', 'HDN015', 'DC398', 401000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0384', 'HDN015', 'DC399', 401000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0385', 'HDN015', 'DC400', 401000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0386', 'HDN015', 'DC426', 500000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0387', 'HDN015', 'DC427', 500000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0388', 'HDN015', 'DC428', 500000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0389', 'HDN015', 'DC429', 500000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0390', 'HDN015', 'DC430', 500000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0391', 'HDN015', 'DC456', 123000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0392', 'HDN015', 'DC457', 123000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0393', 'HDN015', 'DC458', 123000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0394', 'HDN015', 'DC459', 123000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0395', 'HDN015', 'DC460', 123000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0396', 'HDN015', 'DC476', 115000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0397', 'HDN015', 'DC477', 115000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0398', 'HDN015', 'DC478', 115000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0399', 'HDN015', 'DC479', 115000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0400', 'HDN015', 'DC480', 115000);


INSERT INTO ChiTietHoaDonNhap VALUES ('DN0401', 'HDN016', 'DC201', 11000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0402', 'HDN016', 'DC202', 11000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0403', 'HDN016', 'DC203', 11000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0404', 'HDN016', 'DC204', 11000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0405', 'HDN016', 'DC205', 11000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0406', 'HDN016', 'DC206', 19000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0407', 'HDN016', 'DC207', 19000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0408', 'HDN016', 'DC208', 19000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0409', 'HDN016', 'DC209', 19000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0410', 'HDN016', 'DC210', 19000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0411', 'HDN016', 'DC211', 21000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0412', 'HDN016', 'DC212', 21000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0413', 'HDN016', 'DC213', 21000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0414', 'HDN016', 'DC214', 21000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0415', 'HDN016', 'DC215', 21000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0416', 'HDN016', 'DC436', 466000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0417', 'HDN016', 'DC437', 466000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0418', 'HDN016', 'DC438', 466000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0419', 'HDN016', 'DC439', 466000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0420', 'HDN016', 'DC440', 466000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0421', 'HDN017', 'DC216', 49000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0422', 'HDN017', 'DC217', 49000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0423', 'HDN017', 'DC218', 49000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0424', 'HDN017', 'DC219', 49000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0425', 'HDN017', 'DC220', 49000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0426', 'HDN017', 'DC221', 89000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0427', 'HDN017', 'DC222', 89000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0428', 'HDN017', 'DC223', 89000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0429', 'HDN017', 'DC224', 89000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0430', 'HDN017', 'DC225', 89000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0431', 'HDN017', 'DC461', 195000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0432', 'HDN017', 'DC462', 195000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0433', 'HDN017', 'DC463', 195000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0434', 'HDN017', 'DC464', 195000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0435', 'HDN017', 'DC465', 195000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0436', 'HDN017', 'DC481', 299000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0437', 'HDN017', 'DC482', 299000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0438', 'HDN017', 'DC483', 299000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0439', 'HDN017', 'DC484', 299000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0440', 'HDN017', 'DC485', 299000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0441', 'HDN018', 'DC226', 68000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0442', 'HDN018', 'DC227', 68000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0443', 'HDN018', 'DC228', 68000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0444', 'HDN018', 'DC229', 68000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0445', 'HDN018', 'DC230', 68000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0446', 'HDN018', 'DC231', 13000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0447', 'HDN018', 'DC232', 13000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0448', 'HDN018', 'DC233', 13000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0449', 'HDN018', 'DC234', 13000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0450', 'HDN018', 'DC235', 13000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0451', 'HDN018', 'DC441', 788000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0452', 'HDN018', 'DC442', 788000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0453', 'HDN018', 'DC443', 788000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0454', 'HDN018', 'DC444', 788000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0455', 'HDN018', 'DC445', 788000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0456', 'HDN018', 'DC486', 312000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0457', 'HDN018', 'DC487', 312000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0458', 'HDN018', 'DC488', 312000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0459', 'HDN018', 'DC489', 312000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0460', 'HDN018', 'DC490', 312000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0461', 'HDN019', 'DC236', 21000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0462', 'HDN019', 'DC237', 21000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0463', 'HDN019', 'DC238', 21000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0464', 'HDN019', 'DC239', 21000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0465', 'HDN019', 'DC240', 21000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0466', 'HDN019', 'DC241', 99000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0467', 'HDN019', 'DC242', 99000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0468', 'HDN019', 'DC243', 99000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0469', 'HDN019', 'DC244', 99000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0470', 'HDN019', 'DC245', 99000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0471', 'HDN019', 'DC466', 112000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0472', 'HDN019', 'DC467', 112000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0473', 'HDN019', 'DC468', 112000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0474', 'HDN019', 'DC469', 112000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0475', 'HDN019', 'DC470', 112000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0476', 'HDN019', 'DC491', 135000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0477', 'HDN019', 'DC492', 135000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0478', 'HDN019', 'DC493', 13500);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0479', 'HDN019', 'DC494', 135000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0480', 'HDN019', 'DC495', 135000);
-- Hoá đơn nhập 1
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0481', 'HDN020', 'DC136', 321000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0482', 'HDN020', 'DC137', 321000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0483', 'HDN020', 'DC138', 321000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0484', 'HDN020', 'DC139', 321000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0485', 'HDN020', 'DC140', 321000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0486', 'HDN020', 'DC246', 16000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0487', 'HDN020', 'DC247', 16000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0488', 'HDN020', 'DC248', 16000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0489', 'HDN020', 'DC249', 16000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0490', 'HDN020', 'DC250', 16000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0491', 'HDN020', 'DC431', 39000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0492', 'HDN020', 'DC432', 39000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0493', 'HDN020', 'DC433', 39000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0494', 'HDN020', 'DC434', 39000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0495', 'HDN020', 'DC435', 39000);

INSERT INTO ChiTietHoaDonNhap VALUES ('DN0496', 'HDN020', 'DC496', 300000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0497', 'HDN020', 'DC497', 300000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0498', 'HDN020', 'DC498', 300000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0499', 'HDN020', 'DC499', 300000);
INSERT INTO ChiTietHoaDonNhap VALUES ('DN0500', 'HDN020', 'DC500', 300000);

INSERT INTO HoaDonBan VALUES('HDB001','2021-02-15', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB002','2021-02-17', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB003','2021-02-20', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB004','2021-02-25', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB005','2021-02-27', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB006','2021-03-14', 'NV005')
INSERT INTO HoaDonBan VALUES('HDB007','2021-03-18', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB008','2021-03-19', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB009','2021-03-21', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB010','2021-03-22', 'NV001')

INSERT INTO HoaDonBan VALUES('HDB011','2021-04-16', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB012','2021-04-17', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB013','2021-04-18', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB014','2021-04-29', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB015','2021-04-30', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB016','2021-05-01', 'NV005')
INSERT INTO HoaDonBan VALUES('HDB017','2021-05-02', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB018','2021-05-15', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB019','2021-05-18', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB020','2021-05-27', 'NV001')

INSERT INTO HoaDonBan VALUES('HDB021','2021-06-11', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB022','2021-06-15', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB023','2021-06-21', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB024','2021-06-25', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB025','2021-06-29', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB026','2021-07-01', 'NV005')
INSERT INTO HoaDonBan VALUES('HDB027','2021-07-15', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB028','2021-07-17', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB029','2021-07-25', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB030','2021-07-29', 'NV001')

INSERT INTO HoaDonBan VALUES('HDB031','2021-08-07', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB032','2021-08-15', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB033','2021-08-17', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB034','2021-08-23', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB035','2021-08-29', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB036','2021-09-11', 'NV005')
INSERT INTO HoaDonBan VALUES('HDB037','2021-09-15', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB038','2021-09-18', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB039','2021-09-19', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB040','2021-09-29', 'NV001')

INSERT INTO HoaDonBan VALUES('HDB041','2021-10-05', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB042','2021-10-15', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB043','2021-10-25', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB044','2021-10-28', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB045','2021-10-29', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB046','2021-11-01', 'NV005')
INSERT INTO HoaDonBan VALUES('HDB047','2021-11-03', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB048','2021-11-05', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB049','2021-11-07', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB050','2021-11-09', 'NV001')

INSERT INTO HoaDonBan VALUES('HDB051','2021-11-11', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB052','2021-11-13', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB053','2021-11-17', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB054','2021-11-19', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB055','2021-11-23', 'NV001')

INSERT INTO HoaDonBan VALUES('HDB056','2021-12-01', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB057','2021-12-03', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB058','2021-12-05', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB059','2021-12-07', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB060','2021-12-09', 'NV002')

INSERT INTO HoaDonBan VALUES('HDB061','2021-12-11', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB062','2021-12-13', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB063','2021-12-15', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB064','2021-12-17', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB065','2021-12-19', 'NV003')

INSERT INTO HoaDonBan VALUES('HDB066','2022-01-01', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB067','2022-01-03', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB068','2022-01-05', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB069','2022-01-07', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB070','2022-01-09', 'NV004')

INSERT INTO HoaDonBan VALUES('HDB071','2022-01-11', 'NV005')
INSERT INTO HoaDonBan VALUES('HDB072','2022-01-13', 'NV005')
INSERT INTO HoaDonBan VALUES('HDB073','2022-01-17', 'NV005')
INSERT INTO HoaDonBan VALUES('HDB074','2022-01-23', 'NV005')
INSERT INTO HoaDonBan VALUES('HDB075','2022-01-29', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB076','2022-02-01', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB077','2022-02-03', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB078','2022-02-05', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB079','2022-02-07', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB080','2022-02-09', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB081','2022-02-11', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB082','2022-02-13', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB083','2022-02-17', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB084','2022-02-23', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB085','2022-02-28', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB086','2022-03-09', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB087','2022-03-12', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB088','2022-03-15', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB089','2022-03-23', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB090','2022-03-29', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB091','2022-04-09', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB092','2022-04-12', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB093','2022-04-15', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB094','2022-04-23', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB095','2022-04-29', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB096','2022-05-09', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB097','2022-05-12', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB098','2022-05-15', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB099','2022-05-23', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB100','2022-05-29', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB101','2022-06-09', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB102','2022-06-12', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB103','2022-06-15', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB104','2022-06-23', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB105','2022-06-29', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB106','2022-07-09', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB107','2022-07-12', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB108','2022-07-15', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB109','2022-07-23', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB110','2022-07-29', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB111','2022-08-01', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB112','2022-08-03', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB113','2022-08-05', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB114','2022-08-07', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB115','2022-08-09', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB116','2022-08-16', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB117','2022-08-23', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB118','2022-08-29', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB119','2022-09-09', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB120','2022-09-15', 'NV005')

INSERT INTO HoaDonBan VALUES('HDB121','2022-09-16', 'NV001')
INSERT INTO HoaDonBan VALUES('HDB122','2022-09-23', 'NV002')
INSERT INTO HoaDonBan VALUES('HDB123','2022-10-27', 'NV003')
INSERT INTO HoaDonBan VALUES('HDB124','2022-10-01', 'NV004')
INSERT INTO HoaDonBan VALUES('HDB125','2022-10-07', 'NV005')
GO
--Phần nhập liệu cho ChiTietHoaDonBan

INSERT INTO ChiTietHoaDonBan VALUES('MB001','HDB001', 'DC351', 15000)
INSERT INTO ChiTietHoaDonBan VALUES('MB002','HDB002', 'DC311', 590000)
INSERT INTO ChiTietHoaDonBan VALUES('MB003','HDB002', 'DC301', 490000)
INSERT INTO ChiTietHoaDonBan VALUES('MB004','HDB003', 'DC256', 1999000)
INSERT INTO ChiTietHoaDonBan VALUES('MB005','HDB003', 'DC251', 300000)
INSERT INTO ChiTietHoaDonBan VALUES('MB006','HDB003', 'DC196', 540000)
INSERT INTO ChiTietHoaDonBan VALUES('MB007','HDB004', 'DC151', 340000)
INSERT INTO ChiTietHoaDonBan VALUES('MB008','HDB004', 'DC121', 60000)
INSERT INTO ChiTietHoaDonBan VALUES('MB009','HDB004', 'DC106', 450000)
INSERT INTO ChiTietHoaDonBan VALUES('MB010','HDB004', 'DC101', 180000)
INSERT INTO ChiTietHoaDonBan VALUES('MB011','HDB005', 'DC061', 55000)
INSERT INTO ChiTietHoaDonBan VALUES('MB012','HDB005', 'DC051', 1080000)
INSERT INTO ChiTietHoaDonBan VALUES('MB013','HDB005', 'DC046', 490000)
INSERT INTO ChiTietHoaDonBan VALUES('MB014','HDB005', 'DC026', 310000)
INSERT INTO ChiTietHoaDonBan VALUES('MB015','HDB005', 'DC011', 80000)

INSERT INTO ChiTietHoaDonBan VALUES('MB016','HDB006', 'DC002', 130000)
INSERT INTO ChiTietHoaDonBan VALUES('MB017','HDB007', 'DC012', 80000)
INSERT INTO ChiTietHoaDonBan VALUES('MB018','HDB007', 'DC027', 310000)
INSERT INTO ChiTietHoaDonBan VALUES('MB019','HDB008', 'DC047', 490000)
INSERT INTO ChiTietHoaDonBan VALUES('MB020','HDB008', 'DC052', 1080000)
INSERT INTO ChiTietHoaDonBan VALUES('MB021','HDB008', 'DC062', 55000)
INSERT INTO ChiTietHoaDonBan VALUES('MB022','HDB009', 'DC102', 180000)
INSERT INTO ChiTietHoaDonBan VALUES('MB023','HDB009', 'DC107', 450000)
INSERT INTO ChiTietHoaDonBan VALUES('MB024','HDB009', 'DC122', 60000)
INSERT INTO ChiTietHoaDonBan VALUES('MB025','HDB009', 'DC152', 340000)
INSERT INTO ChiTietHoaDonBan VALUES('MB026','HDB010', 'DC197', 540000)
INSERT INTO ChiTietHoaDonBan VALUES('MB027','HDB010', 'DC252', 300000)
INSERT INTO ChiTietHoaDonBan VALUES('MB028','HDB010', 'DC257', 1999000)
INSERT INTO ChiTietHoaDonBan VALUES('MB029','HDB010', 'DC302', 490000)
INSERT INTO ChiTietHoaDonBan VALUES('MB030','HDB010', 'DC312', 590000)

INSERT INTO ChiTietHoaDonBan VALUES('MB031','HDB011', 'DC353', 15000)
INSERT INTO ChiTietHoaDonBan VALUES('MB032','HDB012', 'DC313', 590000)
INSERT INTO ChiTietHoaDonBan VALUES('MB033','HDB012', 'DC303', 490000)
INSERT INTO ChiTietHoaDonBan VALUES('MB034','HDB013', 'DC258', 1999000)
INSERT INTO ChiTietHoaDonBan VALUES('MB035','HDB013', 'DC253', 300000)
INSERT INTO ChiTietHoaDonBan VALUES('MB036','HDB013', 'DC198', 540000)
INSERT INTO ChiTietHoaDonBan VALUES('MB037','HDB014', 'DC153', 340000)
INSERT INTO ChiTietHoaDonBan VALUES('MB038','HDB014', 'DC123', 60000)
INSERT INTO ChiTietHoaDonBan VALUES('MB039','HDB014', 'DC108', 450000)
INSERT INTO ChiTietHoaDonBan VALUES('MB040','HDB014', 'DC103', 180000)
INSERT INTO ChiTietHoaDonBan VALUES('MB041','HDB015', 'DC063', 55000)
INSERT INTO ChiTietHoaDonBan VALUES('MB042','HDB015', 'DC053', 1080000)
INSERT INTO ChiTietHoaDonBan VALUES('MB043','HDB015', 'DC048', 490000)
INSERT INTO ChiTietHoaDonBan VALUES('MB044','HDB015', 'DC028', 310000)
INSERT INTO ChiTietHoaDonBan VALUES('MB045','HDB015', 'DC013', 80000)

INSERT INTO ChiTietHoaDonBan VALUES('MB046','HDB016', 'DC004', 130000)
INSERT INTO ChiTietHoaDonBan VALUES('MB047','HDB017', 'DC014', 80000)
INSERT INTO ChiTietHoaDonBan VALUES('MB048','HDB017', 'DC029', 310000)
INSERT INTO ChiTietHoaDonBan VALUES('MB049','HDB018', 'DC049', 490000)
INSERT INTO ChiTietHoaDonBan VALUES('MB050','HDB018', 'DC054', 1080000)
INSERT INTO ChiTietHoaDonBan VALUES('MB051','HDB018', 'DC064', 55000)
INSERT INTO ChiTietHoaDonBan VALUES('MB052','HDB019', 'DC104', 180000)
INSERT INTO ChiTietHoaDonBan VALUES('MB053','HDB019', 'DC109', 450000)
INSERT INTO ChiTietHoaDonBan VALUES('MB054','HDB019', 'DC124', 60000)
INSERT INTO ChiTietHoaDonBan VALUES('MB055','HDB019', 'DC154', 340000)
INSERT INTO ChiTietHoaDonBan VALUES('MB056','HDB020', 'DC199', 540000)
INSERT INTO ChiTietHoaDonBan VALUES('MB057','HDB020', 'DC254', 300000)
INSERT INTO ChiTietHoaDonBan VALUES('MB058','HDB020', 'DC259', 1999000)
INSERT INTO ChiTietHoaDonBan VALUES('MB059','HDB020', 'DC304', 490000)
INSERT INTO ChiTietHoaDonBan VALUES('MB060','HDB020', 'DC314', 590000)

INSERT INTO ChiTietHoaDonBan VALUES('MB061','HDB021', 'DC086', 60000)
INSERT INTO ChiTietHoaDonBan VALUES('MB062','HDB022', 'DC056', 1380000)
INSERT INTO ChiTietHoaDonBan VALUES('MB063','HDB022', 'DC016', 61000)
INSERT INTO ChiTietHoaDonBan VALUES('MB064','HDB023', 'DC006', 351000)
INSERT INTO ChiTietHoaDonBan VALUES('MB065','HDB023', 'DC087', 60000)
INSERT INTO ChiTietHoaDonBan VALUES('MB066','HDB023', 'DC057', 1380000)
INSERT INTO ChiTietHoaDonBan VALUES('MB067','HDB024', 'DC017', 21000)
INSERT INTO ChiTietHoaDonBan VALUES('MB068','HDB024', 'DC007', 351000)
INSERT INTO ChiTietHoaDonBan VALUES('MB069','HDB024', 'DC008', 351000)
INSERT INTO ChiTietHoaDonBan VALUES('MB070','HDB024', 'DC018', 61000)
INSERT INTO ChiTietHoaDonBan VALUES('MB071','HDB025', 'DC058', 1380000)
INSERT INTO ChiTietHoaDonBan VALUES('MB072','HDB025', 'DC088', 30000)
INSERT INTO ChiTietHoaDonBan VALUES('MB073','HDB025', 'DC089', 60000)
INSERT INTO ChiTietHoaDonBan VALUES('MB074','HDB025', 'DC059', 1380000)
INSERT INTO ChiTietHoaDonBan VALUES('MB075','HDB025', 'DC019', 61000)

INSERT INTO ChiTietHoaDonBan VALUES('MB076','HDB026', 'DC066', 53000)
INSERT INTO ChiTietHoaDonBan VALUES('MB077','HDB027', 'DC036', 172000)
INSERT INTO ChiTietHoaDonBan VALUES('MB078','HDB027', 'DC031', 60000)
INSERT INTO ChiTietHoaDonBan VALUES('MB079','HDB028', 'DC021', 70000)
INSERT INTO ChiTietHoaDonBan VALUES('MB080','HDB028', 'DC022', 70000)
INSERT INTO ChiTietHoaDonBan VALUES('MB081','HDB028', 'DC032', 60000)
INSERT INTO ChiTietHoaDonBan VALUES('MB082','HDB029', 'DC037', 172000)
INSERT INTO ChiTietHoaDonBan VALUES('MB083','HDB029', 'DC067', 53000)
INSERT INTO ChiTietHoaDonBan VALUES('MB084','HDB029', 'DC068', 53000)
INSERT INTO ChiTietHoaDonBan VALUES('MB085','HDB029', 'DC038', 172000)
INSERT INTO ChiTietHoaDonBan VALUES('MB086','HDB030', 'DC033', 60000)
INSERT INTO ChiTietHoaDonBan VALUES('MB087','HDB030', 'DC023', 70000)
INSERT INTO ChiTietHoaDonBan VALUES('MB088','HDB030', 'DC024', 70000)
INSERT INTO ChiTietHoaDonBan VALUES('MB089','HDB030', 'DC034', 60000)
INSERT INTO ChiTietHoaDonBan VALUES('MB090','HDB030', 'DC039', 82000)

INSERT INTO ChiTietHoaDonBan VALUES('MB091','HDB031', 'DC161', 298000)
INSERT INTO ChiTietHoaDonBan VALUES('MB092','HDB032', 'DC156', 459000)
INSERT INTO ChiTietHoaDonBan VALUES('MB093','HDB032', 'DC111', 67000)
INSERT INTO ChiTietHoaDonBan VALUES('MB094','HDB033', 'DC081', 96000)
INSERT INTO ChiTietHoaDonBan VALUES('MB095','HDB033', 'DC076', 31000)
INSERT INTO ChiTietHoaDonBan VALUES('MB096','HDB033', 'DC077', 31000)
INSERT INTO ChiTietHoaDonBan VALUES('MB097','HDB034', 'DC082', 96000)
INSERT INTO ChiTietHoaDonBan VALUES('MB098','HDB034', 'DC112', 67000)
INSERT INTO ChiTietHoaDonBan VALUES('MB099','HDB034', 'DC157', 459000)
INSERT INTO ChiTietHoaDonBan VALUES('MB100','HDB034', 'DC162', 298000)
INSERT INTO ChiTietHoaDonBan VALUES('MB101','HDB035', 'DC163', 298000)
INSERT INTO ChiTietHoaDonBan VALUES('MB102','HDB035', 'DC158', 300000)
INSERT INTO ChiTietHoaDonBan VALUES('MB103','HDB035', 'DC113', 67000)
INSERT INTO ChiTietHoaDonBan VALUES('MB104','HDB035', 'DC083', 96000)
INSERT INTO ChiTietHoaDonBan VALUES('MB105','HDB035', 'DC078', 31000)

INSERT INTO ChiTietHoaDonBan VALUES('MB106','HDB036', 'DC166', 107000)
INSERT INTO ChiTietHoaDonBan VALUES('MB107','HDB037', 'DC116', 50000)
INSERT INTO ChiTietHoaDonBan VALUES('MB108','HDB037', 'DC096', 35000)
INSERT INTO ChiTietHoaDonBan VALUES('MB109','HDB038', 'DC091', 72000)
INSERT INTO ChiTietHoaDonBan VALUES('MB110','HDB038', 'DC071', 400000)
INSERT INTO ChiTietHoaDonBan VALUES('MB111','HDB038', 'DC072', 400000)
INSERT INTO ChiTietHoaDonBan VALUES('MB112','HDB039', 'DC092', 49000)
INSERT INTO ChiTietHoaDonBan VALUES('MB113','HDB039', 'DC097', 35000)
INSERT INTO ChiTietHoaDonBan VALUES('MB114','HDB039', 'DC117', 50000)
INSERT INTO ChiTietHoaDonBan VALUES('MB115','HDB039', 'DC167', 107000)
INSERT INTO ChiTietHoaDonBan VALUES('MB116','HDB040', 'DC168', 107000)
INSERT INTO ChiTietHoaDonBan VALUES('MB117','HDB040', 'DC118', 50000)
INSERT INTO ChiTietHoaDonBan VALUES('MB118','HDB040', 'DC098', 35000)
INSERT INTO ChiTietHoaDonBan VALUES('MB119','HDB040', 'DC093', 40000)
INSERT INTO ChiTietHoaDonBan VALUES('MB120','HDB040', 'DC073', 400000)

INSERT INTO ChiTietHoaDonBan VALUES('MB121','HDB041', 'DC286', 89000)
INSERT INTO ChiTietHoaDonBan VALUES('MB122','HDB042', 'DC266', 162000)
INSERT INTO ChiTietHoaDonBan VALUES('MB123','HDB042', 'DC261', 310000)
INSERT INTO ChiTietHoaDonBan VALUES('MB124','HDB043', 'DC171', 296000)
INSERT INTO ChiTietHoaDonBan VALUES('MB125','HDB043', 'DC126', 41000)
INSERT INTO ChiTietHoaDonBan VALUES('MB126','HDB043', 'DC127', 9000)
INSERT INTO ChiTietHoaDonBan VALUES('MB127','HDB044', 'DC172', 296000)
INSERT INTO ChiTietHoaDonBan VALUES('MB128','HDB044', 'DC262', 310000)
INSERT INTO ChiTietHoaDonBan VALUES('MB129','HDB044', 'DC267', 162000)
INSERT INTO ChiTietHoaDonBan VALUES('MB130','HDB044', 'DC287', 89000)
INSERT INTO ChiTietHoaDonBan VALUES('MB131','HDB045', 'DC288', 89000)
INSERT INTO ChiTietHoaDonBan VALUES('MB132','HDB045', 'DC268', 162000)
INSERT INTO ChiTietHoaDonBan VALUES('MB133','HDB045', 'DC263', 310000)
INSERT INTO ChiTietHoaDonBan VALUES('MB134','HDB045', 'DC173', 296000)
INSERT INTO ChiTietHoaDonBan VALUES('MB135','HDB045', 'DC128', 19000)

INSERT INTO ChiTietHoaDonBan VALUES('MB136','HDB046', 'DC306', 600000)
INSERT INTO ChiTietHoaDonBan VALUES('MB137','HDB047', 'DC271', 165000)
INSERT INTO ChiTietHoaDonBan VALUES('MB138','HDB047', 'DC176', 599000)
INSERT INTO ChiTietHoaDonBan VALUES('MB139','HDB048', 'DC131', 79000)
INSERT INTO ChiTietHoaDonBan VALUES('MB140','HDB048', 'DC132', 79000)
INSERT INTO ChiTietHoaDonBan VALUES('MB141','HDB048', 'DC177', 770000)
INSERT INTO ChiTietHoaDonBan VALUES('MB142','HDB049', 'DC272', 165000)
INSERT INTO ChiTietHoaDonBan VALUES('MB143','HDB049', 'DC307', 600000)
INSERT INTO ChiTietHoaDonBan VALUES('MB144','HDB049', 'DC308', 600000)
INSERT INTO ChiTietHoaDonBan VALUES('MB145','HDB049', 'DC273', 165000)
INSERT INTO ChiTietHoaDonBan VALUES('MB146','HDB050', 'DC178', 770000)
INSERT INTO ChiTietHoaDonBan VALUES('MB147','HDB050', 'DC133', 79000)
INSERT INTO ChiTietHoaDonBan VALUES('MB148','HDB050', 'DC134', 79000)
INSERT INTO ChiTietHoaDonBan VALUES('MB149','HDB050', 'DC179', 770000)
INSERT INTO ChiTietHoaDonBan VALUES('MB150','HDB050', 'DC274', 165000)

INSERT INTO ChiTietHoaDonBan VALUES('MB151','HDB051', 'DC356', 197000)
INSERT INTO ChiTietHoaDonBan VALUES('MB152','HDB052', 'DC321', 843000)
INSERT INTO ChiTietHoaDonBan VALUES('MB153','HDB052', 'DC276', 152000)
INSERT INTO ChiTietHoaDonBan VALUES('MB154','HDB053', 'DC186', 332000)
INSERT INTO ChiTietHoaDonBan VALUES('MB155','HDB053', 'DC041', 86000)
INSERT INTO ChiTietHoaDonBan VALUES('MB156','HDB053', 'DC042', 86000)
INSERT INTO ChiTietHoaDonBan VALUES('MB157','HDB054', 'DC187', 332000)
INSERT INTO ChiTietHoaDonBan VALUES('MB158','HDB054', 'DC277', 152000)
INSERT INTO ChiTietHoaDonBan VALUES('MB159','HDB054', 'DC322', 843000)
INSERT INTO ChiTietHoaDonBan VALUES('MB160','HDB054', 'DC357', 119000)
INSERT INTO ChiTietHoaDonBan VALUES('MB161','HDB055', 'DC358', 119000)
INSERT INTO ChiTietHoaDonBan VALUES('MB162','HDB055', 'DC323', 843000)
INSERT INTO ChiTietHoaDonBan VALUES('MB163','HDB055', 'DC278', 152000)
INSERT INTO ChiTietHoaDonBan VALUES('MB164','HDB055', 'DC188', 332000)
INSERT INTO ChiTietHoaDonBan VALUES('MB165','HDB055', 'DC043', 49000)

INSERT INTO ChiTietHoaDonBan VALUES('MB166','HDB056', 'DC281', 156000)
INSERT INTO ChiTietHoaDonBan VALUES('MB167','HDB057', 'DC181', 209000)
INSERT INTO ChiTietHoaDonBan VALUES('MB168','HDB057', 'DC141', 68000)
INSERT INTO ChiTietHoaDonBan VALUES('MB169','HDB058', 'DC142', 68000)
INSERT INTO ChiTietHoaDonBan VALUES('MB170','HDB058', 'DC182', 315000)
INSERT INTO ChiTietHoaDonBan VALUES('MB171','HDB058', 'DC282', 156000)
INSERT INTO ChiTietHoaDonBan VALUES('MB172','HDB059', 'DC283', 156000)
INSERT INTO ChiTietHoaDonBan VALUES('MB173','HDB059', 'DC183', 315000)
INSERT INTO ChiTietHoaDonBan VALUES('MB174','HDB059', 'DC143', 68000)
INSERT INTO ChiTietHoaDonBan VALUES('MB175','HDB059', 'DC144', 68000)
INSERT INTO ChiTietHoaDonBan VALUES('MB176','HDB060', 'DC184', 315000)
INSERT INTO ChiTietHoaDonBan VALUES('MB177','HDB060', 'DC284', 156000)
INSERT INTO ChiTietHoaDonBan VALUES('MB178','HDB060', 'DC285', 156000)
INSERT INTO ChiTietHoaDonBan VALUES('MB179','HDB060', 'DC185', 315000)
INSERT INTO ChiTietHoaDonBan VALUES('MB180','HDB060', 'DC145', 68000)

INSERT INTO ChiTietHoaDonBan VALUES('MB181','HDB061', 'DC366', 380000)
INSERT INTO ChiTietHoaDonBan VALUES('MB182','HDB062', 'DC361', 770000)
INSERT INTO ChiTietHoaDonBan VALUES('MB183','HDB062', 'DC326', 1631000)
INSERT INTO ChiTietHoaDonBan VALUES('MB184','HDB063', 'DC327', 1631000)
INSERT INTO ChiTietHoaDonBan VALUES('MB185','HDB063', 'DC362', 770000)
INSERT INTO ChiTietHoaDonBan VALUES('MB186','HDB063', 'DC367', 380000)
INSERT INTO ChiTietHoaDonBan VALUES('MB187','HDB064', 'DC368', 199000)
INSERT INTO ChiTietHoaDonBan VALUES('MB188','HDB064', 'DC363', 770000)
INSERT INTO ChiTietHoaDonBan VALUES('MB189','HDB064', 'DC328', 1431000)
INSERT INTO ChiTietHoaDonBan VALUES('MB190','HDB064', 'DC329', 1631000)
INSERT INTO ChiTietHoaDonBan VALUES('MB191','HDB065', 'DC364', 770000)
INSERT INTO ChiTietHoaDonBan VALUES('MB192','HDB065', 'DC369', 380000)
INSERT INTO ChiTietHoaDonBan VALUES('MB193','HDB065', 'DC370', 380000)
INSERT INTO ChiTietHoaDonBan VALUES('MB194','HDB065', 'DC365', 770000)
INSERT INTO ChiTietHoaDonBan VALUES('MB195','HDB065', 'DC330', 1631000)

INSERT INTO ChiTietHoaDonBan VALUES('MB196','HDB066', 'DC401', 432000)
INSERT INTO ChiTietHoaDonBan VALUES('MB197','HDB067', 'DC371', 1090000)
INSERT INTO ChiTietHoaDonBan VALUES('MB198','HDB067', 'DC316', 678000)
INSERT INTO ChiTietHoaDonBan VALUES('MB199','HDB068', 'DC291', 79000)
INSERT INTO ChiTietHoaDonBan VALUES('MB200','HDB068', 'DC191', 272000)
INSERT INTO ChiTietHoaDonBan VALUES('MB201','HDB068', 'DC146', 90000)
INSERT INTO ChiTietHoaDonBan VALUES('MB202','HDB069', 'DC147', 90000)
INSERT INTO ChiTietHoaDonBan VALUES('MB203','HDB069', 'DC192', 272000)
INSERT INTO ChiTietHoaDonBan VALUES('MB204','HDB069', 'DC292', 79000)
INSERT INTO ChiTietHoaDonBan VALUES('MB205','HDB069', 'DC317', 678000)
INSERT INTO ChiTietHoaDonBan VALUES('MB206','HDB070', 'DC372', 1090000)
INSERT INTO ChiTietHoaDonBan VALUES('MB207','HDB070', 'DC402', 432000)
INSERT INTO ChiTietHoaDonBan VALUES('MB208','HDB070', 'DC403', 432000)
INSERT INTO ChiTietHoaDonBan VALUES('MB209','HDB070', 'DC373', 1090000)
INSERT INTO ChiTietHoaDonBan VALUES('MB210','HDB070', 'DC318', 678000)

INSERT INTO ChiTietHoaDonBan VALUES('MB211','HDB071', 'DC406', 846000)
INSERT INTO ChiTietHoaDonBan VALUES('MB212','HDB072', 'DC376', 1376000)
INSERT INTO ChiTietHoaDonBan VALUES('MB213','HDB072', 'DC331', 299000)
INSERT INTO ChiTietHoaDonBan VALUES('MB214','HDB073', 'DC296', 51000)
INSERT INTO ChiTietHoaDonBan VALUES('MB215','HDB073', 'DC297', 51000)
INSERT INTO ChiTietHoaDonBan VALUES('MB216','HDB073', 'DC332', 520000)
INSERT INTO ChiTietHoaDonBan VALUES('MB217','HDB074', 'DC377', 1376000)
INSERT INTO ChiTietHoaDonBan VALUES('MB218','HDB074', 'DC407', 846000)
INSERT INTO ChiTietHoaDonBan VALUES('MB219','HDB074', 'DC408', 846000)
INSERT INTO ChiTietHoaDonBan VALUES('MB220','HDB074', 'DC378', 1376000)
INSERT INTO ChiTietHoaDonBan VALUES('MB221','HDB075', 'DC333', 520000)
INSERT INTO ChiTietHoaDonBan VALUES('MB222','HDB075', 'DC298', 51000)
INSERT INTO ChiTietHoaDonBan VALUES('MB223','HDB075', 'DC299', 51000)
INSERT INTO ChiTietHoaDonBan VALUES('MB224','HDB075', 'DC334', 520000)
INSERT INTO ChiTietHoaDonBan VALUES('MB225','HDB075', 'DC379', 1376000)

INSERT INTO ChiTietHoaDonBan VALUES('MB226','HDB076', 'DC471', 159000)
INSERT INTO ChiTietHoaDonBan VALUES('MB227','HDB077', 'DC451', 169000)
INSERT INTO ChiTietHoaDonBan VALUES('MB228','HDB077', 'DC411', 207000)
INSERT INTO ChiTietHoaDonBan VALUES('MB229','HDB078', 'DC381', 958000)
INSERT INTO ChiTietHoaDonBan VALUES('MB230','HDB078', 'DC336', 809000)
INSERT INTO ChiTietHoaDonBan VALUES('MB231','HDB078', 'DC337', 809000)
INSERT INTO ChiTietHoaDonBan VALUES('MB232','HDB079', 'DC382', 958000)
INSERT INTO ChiTietHoaDonBan VALUES('MB233','HDB079', 'DC412', 207000)
INSERT INTO ChiTietHoaDonBan VALUES('MB234','HDB079', 'DC452', 169000)
INSERT INTO ChiTietHoaDonBan VALUES('MB235','HDB079', 'DC472', 238000)
INSERT INTO ChiTietHoaDonBan VALUES('MB236','HDB080', 'DC473', 238000)
INSERT INTO ChiTietHoaDonBan VALUES('MB237','HDB080', 'DC453', 99000)
INSERT INTO ChiTietHoaDonBan VALUES('MB238','HDB080', 'DC413', 207000)
INSERT INTO ChiTietHoaDonBan VALUES('MB239','HDB080', 'DC383', 958000)
INSERT INTO ChiTietHoaDonBan VALUES('MB240','HDB080', 'DC338', 809000)

INSERT INTO ChiTietHoaDonBan VALUES('MB241','HDB081', 'DC446', 699000)
INSERT INTO ChiTietHoaDonBan VALUES('MB242','HDB082', 'DC416', 620000)
INSERT INTO ChiTietHoaDonBan VALUES('MB243','HDB082', 'DC386', 709000)
INSERT INTO ChiTietHoaDonBan VALUES('MB244','HDB083', 'DC341', 808000)
INSERT INTO ChiTietHoaDonBan VALUES('MB245','HDB083', 'DC342', 808000)
INSERT INTO ChiTietHoaDonBan VALUES('MB246','HDB083', 'DC387', 709000)
INSERT INTO ChiTietHoaDonBan VALUES('MB247','HDB084', 'DC417', 620000)
INSERT INTO ChiTietHoaDonBan VALUES('MB248','HDB084', 'DC447', 1130000)
INSERT INTO ChiTietHoaDonBan VALUES('MB249','HDB084', 'DC448', 1130000)
INSERT INTO ChiTietHoaDonBan VALUES('MB250','HDB084', 'DC418', 620000)
INSERT INTO ChiTietHoaDonBan VALUES('MB251','HDB085', 'DC388', 709000)
INSERT INTO ChiTietHoaDonBan VALUES('MB252','HDB085', 'DC343', 808000)
INSERT INTO ChiTietHoaDonBan VALUES('MB253','HDB085', 'DC344', 808000)
INSERT INTO ChiTietHoaDonBan VALUES('MB254','HDB085', 'DC389', 599000)
INSERT INTO ChiTietHoaDonBan VALUES('MB255','HDB085', 'DC419', 620000)

INSERT INTO ChiTietHoaDonBan VALUES('MB256','HDB086', 'DC421', 720000)
INSERT INTO ChiTietHoaDonBan VALUES('MB257','HDB087', 'DC391', 830000)
INSERT INTO ChiTietHoaDonBan VALUES('MB258','HDB087', 'DC346', 3802000)
INSERT INTO ChiTietHoaDonBan VALUES('MB259','HDB088', 'DC347', 3802000)
INSERT INTO ChiTietHoaDonBan VALUES('MB260','HDB088', 'DC392', 830000)
INSERT INTO ChiTietHoaDonBan VALUES('MB261','HDB088', 'DC422', 720000)
INSERT INTO ChiTietHoaDonBan VALUES('MB262','HDB089', 'DC423', 720000)
INSERT INTO ChiTietHoaDonBan VALUES('MB263','HDB089', 'DC393', 830000)
INSERT INTO ChiTietHoaDonBan VALUES('MB264','HDB089', 'DC348', 3802000)
INSERT INTO ChiTietHoaDonBan VALUES('MB265','HDB089', 'DC349', 3802000)
INSERT INTO ChiTietHoaDonBan VALUES('MB266','HDB090', 'DC394', 830000)
INSERT INTO ChiTietHoaDonBan VALUES('MB267','HDB090', 'DC424', 720000)
INSERT INTO ChiTietHoaDonBan VALUES('MB268','HDB090', 'DC425', 720000)
INSERT INTO ChiTietHoaDonBan VALUES('MB269','HDB090', 'DC395', 830000)
INSERT INTO ChiTietHoaDonBan VALUES('MB270','HDB090', 'DC350', 3802000)

INSERT INTO ChiTietHoaDonBan VALUES('MB271','HDB091', 'DC476', 135000)
INSERT INTO ChiTietHoaDonBan VALUES('MB272','HDB092', 'DC456', 143000)
INSERT INTO ChiTietHoaDonBan VALUES('MB273','HDB092', 'DC426', 520000)
INSERT INTO ChiTietHoaDonBan VALUES('MB274','HDB093', 'DC396', 421000)
INSERT INTO ChiTietHoaDonBan VALUES('MB275','HDB093', 'DC397', 421000)
INSERT INTO ChiTietHoaDonBan VALUES('MB276','HDB093', 'DC427', 520000)
INSERT INTO ChiTietHoaDonBan VALUES('MB277','HDB094', 'DC457', 143000)
INSERT INTO ChiTietHoaDonBan VALUES('MB278','HDB094', 'DC477', 135000)
INSERT INTO ChiTietHoaDonBan VALUES('MB279','HDB094', 'DC478', 135000)
INSERT INTO ChiTietHoaDonBan VALUES('MB280','HDB094', 'DC458', 143000)
INSERT INTO ChiTietHoaDonBan VALUES('MB281','HDB095', 'DC428', 520000)
INSERT INTO ChiTietHoaDonBan VALUES('MB282','HDB095', 'DC398', 421000)
INSERT INTO ChiTietHoaDonBan VALUES('MB283','HDB095', 'DC399', 421000)
INSERT INTO ChiTietHoaDonBan VALUES('MB284','HDB095', 'DC429', 520000)
INSERT INTO ChiTietHoaDonBan VALUES('MB285','HDB095', 'DC459', 143000)

INSERT INTO ChiTietHoaDonBan VALUES('MB286','HDB096', 'DC436', 486000)
INSERT INTO ChiTietHoaDonBan VALUES('MB287','HDB097', 'DC211', 19000)
INSERT INTO ChiTietHoaDonBan VALUES('MB288','HDB097', 'DC206', 39000)
INSERT INTO ChiTietHoaDonBan VALUES('MB289','HDB098', 'DC201', 31000)
INSERT INTO ChiTietHoaDonBan VALUES('MB290','HDB098', 'DC202', 31000)
INSERT INTO ChiTietHoaDonBan VALUES('MB291','HDB098', 'DC207', 39000)
INSERT INTO ChiTietHoaDonBan VALUES('MB292','HDB099', 'DC212', 41000)
INSERT INTO ChiTietHoaDonBan VALUES('MB293','HDB099', 'DC437', 369000)
INSERT INTO ChiTietHoaDonBan VALUES('MB294','HDB099', 'DC438', 369000)
INSERT INTO ChiTietHoaDonBan VALUES('MB295','HDB099', 'DC213', 41000)
INSERT INTO ChiTietHoaDonBan VALUES('MB296','HDB100', 'DC208', 39000)
INSERT INTO ChiTietHoaDonBan VALUES('MB297','HDB100', 'DC203', 31000)
INSERT INTO ChiTietHoaDonBan VALUES('MB298','HDB100', 'DC204', 31000)
INSERT INTO ChiTietHoaDonBan VALUES('MB299','HDB100', 'DC209', 39000)
INSERT INTO ChiTietHoaDonBan VALUES('MB300','HDB100', 'DC214', 41000)

INSERT INTO ChiTietHoaDonBan VALUES('MB301','HDB101', 'DC481', 319000)
INSERT INTO ChiTietHoaDonBan VALUES('MB302','HDB102', 'DC461', 215000)
INSERT INTO ChiTietHoaDonBan VALUES('MB303','HDB102', 'DC221', 109000)
INSERT INTO ChiTietHoaDonBan VALUES('MB304','HDB103', 'DC216', 69000)
INSERT INTO ChiTietHoaDonBan VALUES('MB305','HDB103', 'DC217', 69000)
INSERT INTO ChiTietHoaDonBan VALUES('MB306','HDB103', 'DC222', 109000)
INSERT INTO ChiTietHoaDonBan VALUES('MB307','HDB104', 'DC462', 215000)
INSERT INTO ChiTietHoaDonBan VALUES('MB308','HDB104', 'DC482', 319000)
INSERT INTO ChiTietHoaDonBan VALUES('MB309','HDB104', 'DC483', 319000)
INSERT INTO ChiTietHoaDonBan VALUES('MB310','HDB104', 'DC463', 215000)
INSERT INTO ChiTietHoaDonBan VALUES('MB311','HDB105', 'DC223', 109000)
INSERT INTO ChiTietHoaDonBan VALUES('MB312','HDB105', 'DC218', 30000)
INSERT INTO ChiTietHoaDonBan VALUES('MB313','HDB105', 'DC219', 69000)
INSERT INTO ChiTietHoaDonBan VALUES('MB314','HDB105', 'DC224', 109000)
INSERT INTO ChiTietHoaDonBan VALUES('MB315','HDB105', 'DC464', 215000)

INSERT INTO ChiTietHoaDonBan VALUES('MB316','HDB106', 'DC486', 332000)
INSERT INTO ChiTietHoaDonBan VALUES('MB317','HDB107', 'DC441', 808000)
INSERT INTO ChiTietHoaDonBan VALUES('MB318','HDB107', 'DC231', 33000)
INSERT INTO ChiTietHoaDonBan VALUES('MB319','HDB108', 'DC226', 88000)
INSERT INTO ChiTietHoaDonBan VALUES('MB320','HDB108', 'DC227', 88000)
INSERT INTO ChiTietHoaDonBan VALUES('MB321','HDB108', 'DC232', 33000)
INSERT INTO ChiTietHoaDonBan VALUES('MB322','HDB109', 'DC442', 808000)
INSERT INTO ChiTietHoaDonBan VALUES('MB323','HDB109', 'DC487', 332000)
INSERT INTO ChiTietHoaDonBan VALUES('MB324','HDB109', 'DC488', 332000)
INSERT INTO ChiTietHoaDonBan VALUES('MB325','HDB109', 'DC443', 808000)
INSERT INTO ChiTietHoaDonBan VALUES('MB326','HDB110', 'DC233', 33000)
INSERT INTO ChiTietHoaDonBan VALUES('MB327','HDB110', 'DC228', 88000)
INSERT INTO ChiTietHoaDonBan VALUES('MB328','HDB110', 'DC229', 88000)
INSERT INTO ChiTietHoaDonBan VALUES('MB329','HDB110', 'DC234', 33000)
INSERT INTO ChiTietHoaDonBan VALUES('MB330','HDB110', 'DC444', 808000)

INSERT INTO ChiTietHoaDonBan VALUES('MB331','HDB111', 'DC491', 155000)
INSERT INTO ChiTietHoaDonBan VALUES('MB332','HDB112', 'DC466', 132000)
INSERT INTO ChiTietHoaDonBan VALUES('MB333','HDB112', 'DC241', 69000)
INSERT INTO ChiTietHoaDonBan VALUES('MB334','HDB113', 'DC236', 41000)
INSERT INTO ChiTietHoaDonBan VALUES('MB335','HDB113', 'DC237', 41000)
INSERT INTO ChiTietHoaDonBan VALUES('MB336','HDB113', 'DC242', 119000)
INSERT INTO ChiTietHoaDonBan VALUES('MB337','HDB114', 'DC467', 132000)
INSERT INTO ChiTietHoaDonBan VALUES('MB338','HDB114', 'DC492', 155000)
INSERT INTO ChiTietHoaDonBan VALUES('MB339','HDB114', 'DC493', 15500)
INSERT INTO ChiTietHoaDonBan VALUES('MB340','HDB114', 'DC468', 132000)
INSERT INTO ChiTietHoaDonBan VALUES('MB341','HDB115', 'DC243', 119000)
INSERT INTO ChiTietHoaDonBan VALUES('MB342','HDB115', 'DC238', 31000)
INSERT INTO ChiTietHoaDonBan VALUES('MB343','HDB115', 'DC239', 31000)
INSERT INTO ChiTietHoaDonBan VALUES('MB344','HDB115', 'DC244', 119000)
INSERT INTO ChiTietHoaDonBan VALUES('MB345','HDB115', 'DC469', 132000)

INSERT INTO ChiTietHoaDonBan VALUES('MB346','HDB116', 'DC496', 320000)
INSERT INTO ChiTietHoaDonBan VALUES('MB347','HDB117', 'DC431', 59000)
INSERT INTO ChiTietHoaDonBan VALUES('MB348','HDB117', 'DC246', 36000)
INSERT INTO ChiTietHoaDonBan VALUES('MB349','HDB118', 'DC136', 341000)
INSERT INTO ChiTietHoaDonBan VALUES('MB350','HDB118', 'DC137', 341000)
INSERT INTO ChiTietHoaDonBan VALUES('MB351','HDB118', 'DC247', 36000)
INSERT INTO ChiTietHoaDonBan VALUES('MB352','HDB119', 'DC432', 59000)
INSERT INTO ChiTietHoaDonBan VALUES('MB353','HDB119', 'DC497', 320000)
INSERT INTO ChiTietHoaDonBan VALUES('MB354','HDB119', 'DC498', 320000)
INSERT INTO ChiTietHoaDonBan VALUES('MB355','HDB119', 'DC433', 59000)
INSERT INTO ChiTietHoaDonBan VALUES('MB356','HDB120', 'DC248', 36000)
INSERT INTO ChiTietHoaDonBan VALUES('MB357','HDB120', 'DC138', 199000)
INSERT INTO ChiTietHoaDonBan VALUES('MB358','HDB120', 'DC139', 199000)
INSERT INTO ChiTietHoaDonBan VALUES('MB359','HDB120', 'DC249', 36000)
INSERT INTO ChiTietHoaDonBan VALUES('MB360','HDB120', 'DC434', 59000)

INSERT INTO ChiTietHoaDonBan VALUES('MB361','HDB121', 'DC355', 30000)
INSERT INTO ChiTietHoaDonBan VALUES('MB362','HDB122', 'DC315', 760000)
INSERT INTO ChiTietHoaDonBan VALUES('MB363','HDB122', 'DC305', 482000)
INSERT INTO ChiTietHoaDonBan VALUES('MB364','HDB123', 'DC260', 1909000)
INSERT INTO ChiTietHoaDonBan VALUES('MB365','HDB123', 'DC255', 299000)
INSERT INTO ChiTietHoaDonBan VALUES('MB366','HDB123', 'DC200', 528000)
INSERT INTO ChiTietHoaDonBan VALUES('MB367','HDB124', 'DC155', 333000)
INSERT INTO ChiTietHoaDonBan VALUES('MB368','HDB124', 'DC125', 68000)
INSERT INTO ChiTietHoaDonBan VALUES('MB369','HDB124', 'DC110', 449000)
INSERT INTO ChiTietHoaDonBan VALUES('MB370','HDB124', 'DC105', 89000)
INSERT INTO ChiTietHoaDonBan VALUES('MB371','HDB125', 'DC065', 55000)
INSERT INTO ChiTietHoaDonBan VALUES('MB372','HDB125', 'DC055', 899000)
INSERT INTO ChiTietHoaDonBan VALUES('MB373','HDB125', 'DC050', 486000)
INSERT INTO ChiTietHoaDonBan VALUES('MB374','HDB125', 'DC030', 310000)
INSERT INTO ChiTietHoaDonBan VALUES('MB375','HDB125', 'DC015', 49000)

--Phần nhập liệu cho TaiKhoan 
INSERT INTO TaiKhoan VALUES('nguyenvannam','123456','Admin')
INSERT INTO TaiKhoan VALUES('nguyenvanthuan','thuan111#','User')
INSERT INTO TaiKhoan VALUES('nguyenthicam','cam@111','User')
INSERT INTO TaiKhoan VALUES('tranvannam','nam12345','User')
INSERT INTO TaiKhoan VALUES('ngodinhnghia','123456nghia@','User')

USE CuaHangDoChoi
GO

--VIEW
--Danh sách các đồ chơi chưa bán.
CREATE VIEW DoChoiChuaBan AS
	SELECT dc.MaDoChoi, dc.TenDoChoi, dc.GiaTien
	FROM DoChoi as dc
	WHERE dc.MaDoChoi NOT IN (SELECT MaDoChoi FROM ChiTietHoaDonBan);
GO

--Danh sách đồ chơi đã bán.
CREATE VIEW DoChoiDaBan AS
	SELECT DC.MaDoChoi, DC.TenDoChoi, DC.GiaTien FROM DoChoi as DC, ChiTietHoaDonBan
	WHERE DC.MaDoChoi = ChiTietHoaDonBan.MaDoChoi
GO

--Tổng doanh thu theo từng loại đồ chơi.
CREATE VIEW TongDoanhThuDoChoi AS
	SELECT dmdc.MaLoaiDoChoi, dmdc.TenLoaiDoChoi, SUM(GiaBan) as TongDoanhThu
	FROM DanhMucDoChoi as dmdc, DoChoi as dc, ChiTietHoaDonBan as cthdb
	WHERE dmdc.MaLoaiDoChoi = dc.MaLoaiDoChoi
	AND dc.MaDoChoi = cthdb.MaDoChoi
	GROUP By dmdc.MaLoaiDoChoi, dmdc.TenLoaiDoChoi
GO

--Tổng chi phí nhập theo từng loại đồ chơi.
CREATE VIEW TongNhapTheoLoai 
AS
	SELECT TenLoaiDoChoi, DoChoi.MaLoaiDoChoi, SUM(GiaNhap) AS TongNhap
	FROM DanhMucDoChoi, DoChoi, ChiTietHoaDonNhap
	WHERE DoChoi.MaLoaiDoChoi = DanhMucDoChoi.MaLoaiDoChoi AND DoChoi.MaDoChoi = ChiTietHoaDonNhap.MaDoChoi
	GROUP BY DoChoi.MaLoaiDoChoi, TenLoaiDoChoi
GO

--Danh sách nhân viên đang làm việc.
CREATE VIEW NhanVienDangLamViec AS
	SELECT nv.MaNhanVien, nv.TenNhanVien
	FROM NhanVien as nv
	WHERE TrangThai = 1;
GO

--Tổng tiền nhập theo tháng
CREATE VIEW TienNhapTheoThang AS
SELECT Thang, SUM(GiaNhap) AS TongNhap
FROM
	(SELECT GiaNhap, FORMAT(CAST(NgayNhap AS DATE), 'yyyy-MM') AS Thang 
	FROM HoaDonNhap, ChiTietHoaDonNhap
	WHERE HoaDonNhap.MaHoaDonNhap = ChiTietHoaDonNhap.MaHoaDonNhap) AS TinhTienNhap
GROUP BY Thang
GO

--Doanh thu theo tháng
CREATE VIEW DoanhThuTheoThang AS
SELECT Thang, SUM(GiaBan) AS DoanhThu
FROM
	(SELECT GiaBan, FORMAT(CAST(NgayBan AS DATE), 'yyyy-MM') AS Thang 
	FROM HoaDonBan, ChiTietHoaDonBan 
	WHERE HoaDonBan.MaHoaDonBan = ChiTietHoaDonBan.MaHoaDonBan) AS TinhDoanhThu
GROUP BY Thang
GO

--Các ngăn kệ, sức chứa và số lượng hiện tại 
CREATE VIEW NgankeSucchuaSoluong AS
SELECT NganKe.MaNganKe, SucChua, slht as SoLuongHienTai
FROM NganKe, (SELECT Count(DoChoi.MaDoChoi) as slht, MaNganKe 
				FROM DoChoi left outer join ChiTietHoaDonBan on DoChoi.MaDoChoi = ChiTietHoaDonBan.MaDoChoi 
				WHERE MaHoaDonBan is NULL 
				GROUP BY MaNganKe) Q1
	WHERE NganKe.MaNganKe = Q1.MaNganKe
GO

--Loại đồ chơi bán chạy nhất.
CREATE VIEW BanChayNhat AS
	SELECT DanhMucDoChoi.MaLoaiDoChoi, DanhMucDoChoi.TenLoaiDoChoi, MAX(TongSoBan) as TongDoChoiDaBan
	FROM DanhMucDoChoi, (SELECT DoChoi.MaLoaiDoChoi, COUNT(*) AS TongSoBan 
		FROM ChiTietHoaDonBan, DoChoi 
WHERE ChiTietHoaDonBan.MaDoChoi = DoChoi.MaDoChoi AND GiaBan <> 0		
GROUP BY DoChoi.MaLoaiDoChoi) AS DemLuongBan
	WHERE DanhMucDoChoi.MaLoaiDoChoi = DemLuongBan.MaLoaiDoChoi
	GROUP BY DanhMucDoChoi.MaLoaiDoChoi, DanhMucDoChoi.TenLoaiDoChoi
GO

--TRIGGER
-- Khi xếp đồ chơi vào ngăn kệ phải đảm bảo không vượt quá sức chứa của kệ.
CREATE TRIGGER KiemTraSucChua ON DoChoi
AFTER INSERT AS
DECLARE @TongDoChoi INT, @SucChuaKe INT
SELECT @TongDoChoi = Q.Tong, @SucChuaKe = NganKe.SucChua
FROM (SELECT MaNganKe, COUNT(*) as Tong
		FROM DoChoi LEFT OUTER JOIN ChiTietHoaDonBan ON DoChoi.MaDoChoi = ChiTietHoaDonBan.MaDoChoi
		WHERE MaHoaDonBan IS NULL 
		GROUP BY MaNganKe) as Q, inserted, NganKe
WHERE Q.MaNganKe = inserted.MaNganKe AND Q.MaNganKe = NganKe.MaNganKe
IF (@TongDoChoi > @SucChuaKe)
BEGIN
	PRINT N'Vượt quá sức chứa của ngăn kệ!';
	ROLLBACK;
END
GO

--Không được bán đồ chơi đã được bán rồi.
CREATE TRIGGER KiemTraHang ON ChiTietHoaDonBan
AFTER INSERT AS
DECLARE @Tong INT
SELECT @Tong = COUNT(*)
FROM inserted, ChiTietHoaDonBan
WHERE inserted.MaDoChoi = ChiTietHoaDonBan.MaDoChoi
IF (@Tong = 2)
BEGIN
	PRINT N'Đồ chơi này đã bán!' ;
	ROLLBACK;
END
GO

--THỦ TỤC KHÔNG CÓ THAM SỐ
--Câu 1. Danh sách các đồ chơi chưa bán.
CREATE PROC USP_DoChoiChuaBan
AS
	SELECT * FROM DoChoiChuaBan
GO

--EXEC USP_DoChoiChuaBan

--Câu 2. Danh sách đồ chơi đã bán.
CREATE PROC USP_DoChoiDaBan
AS
	SELECT * FROM DoChoiDaBan
GO

--EXEC USP_DoChoiDaBan

--Câu 3. Tổng doanh thu theo từng loại đồ chơi.
CREATE PROC USP_TongDoanhThuLoaiDoChoi
AS
	SELECT * FROM TongDoanhThuDoChoi
GO

--EXEC USP_TongDoanhThuLoaiDoChoi

--Câu 4. Tổng chi phí nhập theo từng loại đồ chơi.
CREATE PROC USP_TongChiPhiNhapLoaiDoChoi
AS
	SELECT * FROM TongNhapTheoLoai
GO

--EXEC USP_TongChiPhiNhapLoaiDoChoi

--Câu 5. Danh sách nhân viên đang làm việc.
CREATE PROC USP_NhanVienDangLamViec
AS
	SELECT * FROM NhanVienDangLamViec
GO

--EXEC USP_NhanVienDangLamViec

--Câu 6. Các ngăn kệ, sức chứa và số lượng hiện tại.
CREATE PROC USP_NgankeSucchuaSoluong
AS 
	SELECT * FROM NgankeSucchuaSoluong
GO

--EXEC USP_NgankeSucchuaSoluong

--Câu 7. Loại đồ chơi bán chạy nhất.
CREATE PROC USP_LoaiDoChoiBanChayNhat
AS
	SELECT * FROM BanChayNhat
GO

--EXEC USP_BanChayNhat

--Câu 8. Lấy danh sách danh mục đồ chơi
CREATE PROC USP_LayDanhMucDoChoi
AS
	SELECT * FROM DanhMucDoChoi
GO
--EXEC USP_LayDanhMucDoChoi

--Câu 9. Lấy danh sách các đồ chơi.
CREATE PROC USP_LayDoChoi
AS
	SELECT * FROM DoChoi
GO
--EXEC USP_LayDoChoi

--Câu 10. Lấy danh sách nhà sản xuất.
CREATE PROC USP_LayNhaSanXuat
AS
	SELECT * FROM NhaSanXuat
GO
--EXEC USP_LayNhaSanXuat

--Câu 11. Lấy danh sách ngăn kệ.
CREATE PROC USP_LayNganKe
AS
	SELECT * FROM NganKe
GO
--EXEC USP_LayNganKe

--Câu 12. Lấy danh sách nhân viên.
CREATE PROC USP_LayNhanVien
AS
	SELECT * FROM NhanVien
GO
--EXEC USP_LayNhanVien

--Câu 13. Lấy danh sách tài khoản.
CREATE PROC USP_LayTaiKhoan
AS
	SELECT * FROM TaiKhoan
GO
--EXEC USP_LayTaiKhoan 

--THỦ TỤC CÓ THAM SỐ
--Câu 14. Thêm danh mục đồ chơi: USP_ThemDanhMucDoChoi 
CREATE PROC USP_ThemDanhMucDoChoi @maloai CHAR(6), 
								  @tenloai NVARCHAR(100)
AS
BEGIN TRANSACTION
	INSERT INTO DanhMucDoChoi VALUES (@maloai, @tenloai)
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO

--EXEC USP_ThemDanhMucDoChoi "LDC011", "Đồ chơi siêu nhân"

--Câu 15. Cập nhật danh mục đồ chơi: USP_CapNhatDanhMucDoChoi 
CREATE PROC USP_CapNhatDanhMucDoChoi(@MaLoaiDoChoi CHAR(6), @TenLoaiDoChoi NVARCHAR(100))
AS
BEGIN TRANSACTION
	BEGIN
		UPDATE dbo.DanhMucDoChoi 
		SET TenLoaiDoChoi = @TenLoaiDoChoi
		WHERE MaLoaiDoChoi = @MaLoaiDoChoi
	END
	IF(@@ERROR <> 0)
		BEGIN
			RAISERROR('Error!', 16, 1)
			ROLLBACK
			RETURN
		END
COMMIT TRANSACTION
GO
--EXEC USP_CapNhatDanhMucDoChoi 'ml001', 'Bong da'

--Câu 16. Xoá danh mục đồ chơi: USP_XoaDanhMucDoChoi 
CREATE PROC USP_XoaDanhMucDoChoi @maloai CHAR(6)
AS
BEGIN TRANSACTION
	DELETE FROM  DanhMucDoChoi WHERE MaLoaiDoChoi = @maloai
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO

--Gọi thủ tục
--USP_XoaDanhMucDoChoi 'L'

--Câu 17. Thêm đồ chơi: USP_ThemDoChoi
CREATE PROCEDURE USP_ThemDoChoi @ma_do_choi CHAR(6),
								@ten_do_choi NVARCHAR(100),
								@gia_tien INT = NULL,
								@ma_loai_do_choi CHAR(6),
								@ma_nsx CHAR(5),
								@ma_ngan_ke CHAR(4)
AS
BEGIN TRANSACTION
	INSERT INTO DoChoi (MaDoChoi, TenDoChoi, GiaTien, MaLoaiDoChoi, MaNSX, MaNganKe)
	VALUES (@ma_do_choi, @ten_do_choi, @gia_tien, @ma_loai_do_choi, @ma_nsx, @ma_ngan_ke)
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO
--EXEC USP_ThemDoChoi 'dc021', 'Rut go', 180000, 'ml004', 'ns004', 'n004'

--Câu 18. Cập nhật đồ chơi: USP_CapNhatDoChoi 
CREATE PROC USP_CapNhatDoChoi @madochoi CHAR(6),
							  @tendochoi NVARCHAR(100),
							  @giatien INT,
							  @maloaidochoi CHAR(6),
							  @maNSX CHAR(5),
							  @manganke CHAR(4)
AS
BEGIN TRANSACTION
	BEGIN
		UPDATE DoChoi 
		SET TenDoChoi = @tendochoi, 
			GiaTien = @giatien, 
			MaLoaiDoChoi = @maloaidochoi, 
			MaNSX = @maNSX,
			MaNganKe = @manganke
		WHERE MaDoChoi = @madochoi
	END
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO

--Câu 19. Xoá đồ chơi: USP_XoaDoChoi 
CREATE PROC USP_XoaDoChoi (@MaDoChoi CHAR(6))
AS
BEGIN TRANSACTION
	BEGIN
		DELETE dbo.DoChoi
		WHERE MaDoChoi = @MaDoChoi
	END
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO
--EXEC USP_XoaDoChoi 'dc020'

--Câu 20. Thêm nhà sản xuất: USP_ThemNSX 
CREATE PROC USP_ThemNSX @mansx CHAR(5), @tennsx NVARCHAR(100), @tenquocgia NVARCHAR(100)
AS
BEGIN TRANSACTION
	INSERT INTO NhaSanXuat VALUES (@mansx, @tennsx, @tenquocgia)
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO
--Gọi thủ tục
--USP_ThemNSX 'ns111', 'Tuoi Tho', 'Viet Nam'

--Câu 21. Cập nhật nhà sản xuất: USP_CapNhatNSX
CREATE PROCEDURE USP_CapNhatNSX @ma_nsx CHAR(5),
								@ten_nsx NVARCHAR(100),
								@ten_quoc_gia NVARCHAR(100)
AS
BEGIN TRANSACTION
	UPDATE NhaSanXuat
	SET TenNSX = @ten_nsx, TenQuocGia = @ten_quoc_gia
	WHERE MaNSX = @ma_nsx
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO
--EXEC USP_CapNhatNSX 'ns004', 'Lego', 'My'

--Câu 22. Xoá nhà sản xuất: USP_XoaNSX 
CREATE PROC USP_XoaNSX @maNSX CHAR(5)
AS
BEGIN TRANSACTION
	DELETE 
	FROM NhaSanXuat
	WHERE MaNSX = @maNSX
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO

--Câu 23. Thêm ngăn kệ: USP_ThemNganKe 
CREATE PROC USP_ThemNganKe (@MaNganKe CHAR(4), @ViTri NVARCHAR(100), @SucChua INT)
AS
BEGIN TRANSACTION
	IF(@ViTri is NULL)
	BEGIN
		RAISERROR('Vị trí không được để trống!', 16, 1)
		ROLLBACK
		RETURN
	END
	IF(@SucChua is NULL)
	BEGIN
		RAISERROR('Sức chứa không được để trống!', 16, 1)
		ROLLBACK
		RETURN
	END
	INSERT INTO dbo.NganKe(MaNganKe, ViTri, SucChua) VALUES (@MaNganKe, @ViTri, @SucChua)
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO
--EXEC USP_ThemNganKe @MaNganKe='K002', @ViTri='Ngan cuoi', @GhiChu='Khong co ghi chu', @SucChua=50

--Câu 24. Cập nhật ngăn kệ: USP_CapNhatNganKe
CREATE PROC USP_CapNhatNganKe @manganke CHAR(4), @vitri NVARCHAR(100), @succhua INT
AS
BEGIN TRANSACTION
	IF(@ViTri is NULL)
	BEGIN
		RAISERROR('Vị trí không được để trống!', 16, 1)
		ROLLBACK
		RETURN
	END
	IF(@SucChua is NULL)
	BEGIN
		RAISERROR('Sức chứa không được để trống!', 16, 1)
		ROLLBACK
		RETURN
	END
	UPDATE NganKe SET ViTri = @vitri, SucChua = @succhua
	WHERE MaNganKe = @manganke
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO
--Gọi thủ tục
--USP_CapNhatNganKe 'n111', 'hang 2 tang 0', 'hang trung bay', 100

--Câu 25. Xoá ngăn kệ: USP_XoaNganKe
CREATE PROCEDURE USP_XoaNganKe @ma_ngan_ke CHAR(4)
AS
BEGIN TRANSACTION
	DELETE FROM NganKe WHERE MaNganKe = @ma_ngan_ke
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO
--EXEC USP_XoaNganKe 'n005'

--Câu 26. Thêm nhân viên: USP_ThemNhanVien  
CREATE PROC USP_ThemNhanVien @manhanvien CHAR(6),
						     @cccd CHAR(12),
							 @tennhanvien NVARCHAR(100),
							 @gioitinh NVARCHAR(3),
							 @namsinh INT,
							 @quequan NVARCHAR(100),
							 @luong INT,
							 @ngayvaolam DATETIME,
							 @trangthai INT
AS
BEGIN TRANSACTION
	IF(@tennhanvien is NULL)
	BEGIN
		RAISERROR('Tên nhân viên không được để trống!', 16, 1)
		ROLLBACK
		RETURN
	END
	IF(@cccd is NULL)
	BEGIN
		RAISERROR('CCCD không được để trống!', 16, 1)
		ROLLBACK
		RETURN
	END
	IF(@ngayvaolam is NULL)
	BEGIN
		RAISERROR('Ngày vào làm không được để trống!', 16, 1)
		ROLLBACK
		RETURN
	END
	INSERT INTO NhanVien VALUES (@manhanvien,
								 @cccd,
								 @tennhanvien,
								 @gioitinh,
								 @namsinh,
								 @quequan,
								 @luong,
								 @ngayvaolam,
								 @trangthai
	)
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO

--Câu 27. Cập nhật nhân viên: USP_CapNhatNhanVien
CREATE PROC USP_CapNhatNhanVien(@MaNhanVien CHAR(5), @CCCD CHAR(12)=NULL,@TenNhanVien NVARCHAR(100)=NULL, @GioiTinh NVARCHAR(3)=NULL, @NamSinh INT=NULL, @QueQuan NVARCHAR(100)=NULL,@Luong INT=NULL, @NgayVaoLam datetime=NULL,@TrangThai INT=NULL)
AS
BEGIN TRANSACTION
	BEGIN
		DECLARE @old_CCCD CHAR(12), @old_TenNhanVien NVARCHAR(100), @old_GioiTinh NVARCHAR(3), @old_NamSinh INT, @old_QueQuan NVARCHAR(100), @old_Luong INT, @old_NgayVaoLam datetime, @old_TrangThai INT
		SELECT @old_CCCD=CCCD,@old_TenNhanVien=TenNhanVien,@old_GioiTinh=GioiTinh,@old_NamSinh=NamSinh,@old_QueQuan=QueQuan,@old_Luong=Luong,@old_NgayVaoLam=NgayVaoLam,@old_TrangThai=TrangThai FROM dbo.NhanVien WHERE MaNhanVien=@MaNhanVien
		IF @CCCD IS NULL
			SET @CCCD = @old_CCCD
		IF @TenNhanVien IS NULL
			SET @TenNhanVien=@old_TenNhanVien
		IF @GioiTinh IS NULL
			SET @GioiTinh=@old_GioiTinh
		IF @NamSinh IS NULL
			SET @NamSinh=@old_NamSinh
		IF @QueQuan IS NULL
			SET @QueQuan=@old_QueQuan
		IF @Luong IS NULL
			SET @Luong=@old_Luong
		IF @NgayVaoLam IS NULL
			SET @NgayVaoLam=@old_NgayVaoLam
		IF @TrangThai IS NULL
			SET @TrangThai=@old_TrangThai
		UPDATE dbo.NhanVien
		SET CCCD = @CCCD, TenNhanVien=@TenNhanVien, NamSinh=@NamSinh, QueQuan=@QueQuan, Luong=@Luong, NgayVaoLam=@NgayVaoLam, TrangThai=@TrangThai
		WHERE MaNhanVien=@MaNhanVien
	END
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO

--EXEC USP_CapNhatNhanVien @MaNhanVien='nv005', @TenNhanVien='Nguyen Van C', @CCCD='29200098712'

--Câu 28. Xoá nhân viên: USP_XoaNhanVien
CREATE PROC USP_XoaNhanVien @manhanvien CHAR(5)
AS
BEGIN TRANSACTION
	DELETE FROM  NhanVien WHERE MaNhanVien = @manhanvien
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO

--Gọi thủ tục
--USP_XoaNhanVien 'nv007'

--Câu 29. Thêm hoá đơn nhập: USP_ThemHoaDonNhap
CREATE PROCEDURE USP_ThemHoaDonNhap @ma_hoa_don_nhap CHAR(6),
									@ngay_nhap DATE,
									@ma_nhan_vien CHAR(5)
AS 
BEGIN TRANSACTION
	IF(@ngay_nhap = '')
	BEGIN
		RAISERROR('Khong duoc de trong ngay nhap', 16, 1)
		ROLLBACK
		RETURN
	END
	INSERT INTO HoaDonNhap (MaHoaDonNhap, NgayNhap, MaNhanVien)
	VALUES (@ma_hoa_don_nhap, @ngay_nhap, @ma_nhan_vien)
	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR('Error!', 16, 1)
		ROLLBACK
		RETURN
	END
COMMIT TRANSACTION
GO

--EXEC USP_ThemHoaDonNhap 'hdn011', '2022-10-10', 'nv001'

--Câu 30. Cập nhật hoá đơn nhập: USP_CapNhatHoaDonNhap 
CREATE PROC USP_CapNhatHoaDonNhap @mahoadonnhap CHAR(6),
								  @ngaynhap DATE, 
								  @manhanvien CHAR(5)
AS
BEGIN TRAN
IF(@ngaynhap = '')
BEGIN
	RAISERROR('Khong duoc de trong ngay nhap', 16, 1)
	ROLLBACK
	RETURN
END
	UPDATE HoaDonNhap
	SET NgayNhap = @ngaynhap,
		MaNhanVien = @manhanvien
	WHERE MaHoaDonNhap = @mahoadonnhap
IF(@@ERROR <>0)
BEGIN
	RAISERROR('Error', 16, 1)
	ROLLBACK
	RETURN
END
COMMIT TRAN
GO

--Câu 31. Xoá hoá đơn nhập: USP_XoaHoaDonNhap  
CREATE PROC USP_XoaHoaDonNhap(@MaHoaDonNhap CHAR(6))
AS
BEGIN TRAN
	DELETE FROM dbo.HoaDonNhap WHERE MaHoaDonNhap=@MaHoaDonNhap
IF(@@ERROR <>0)
BEGIN
	RAISERROR('Error', 16, 1)
	ROLLBACK
	RETURN
END
COMMIT TRAN
GO

--Câu 32. Thêm hoá đơn bán: USP_ThemHoaDonBan
CREATE PROC USP_ThemHoaDonBan @mahoadonban CHAR(6), @ngayban date, @manhanvien CHAR(5)
AS
BEGIN TRAN
IF(@ngayBan = '')
BEGIN
	RAISERROR('Khong duoc de trong ngay ban', 16, 1)
	ROLLBACK
	RETURN
END
	INSERT INTO HoaDonBan VALUES (@mahoadonban, @ngayBan, @manhanvien)
IF(@@ERROR <>0)
BEGIN
	RAISERROR('Error', 16, 1)
	ROLLBACK
	RETURN
END
COMMIT TRAN
GO
--Gọi thủ tục
--USP_ThemHoaDonBan 'hdb111', '2021-02-19', 'nv001'

--Câu 33. Cập nhật hoá đơn bán: USP_CapNhatHoaDonBan voi Transaction
CREATE PROCEDURE USP_CapNhatHoaDonBan @ma_hoa_don_ban CHAR(6),
									  @ngay_ban DATE,
									  @ma_nhan_vien CHAR(5)
AS
BEGIN TRAN
IF(@ngay_ban = '')
BEGIN
	RAISERROR('Khong duoc de trong ngay ban', 16, 1)
	ROLLBACK
	RETURN
END
	UPDATE HoaDonBan 
	SET NgayBan = @ngay_ban, MaNhanVien = @ma_nhan_vien
	WHERE MaHoaDonBan = @ma_hoa_don_ban
IF(@@ERROR <>0)
BEGIN
	RAISERROR('Error', 16, 1)
	ROLLBACK
	RETURN
END
COMMIT TRAN
GO

--EXEC USP_CapNhatHoaDonBan 'hdb005', '2022-09-20', 'nv003'

--Câu 34. Xoá hoá đơn bán: USP_XoaHoaDonBan voi Transaction
CREATE PROC USP_XoaHoaDonBan @mahoadonban CHAR(6)
AS
BEGIN TRAN
	DELETE
	FROM HoaDonBan
	WHERE MaHoaDonBan = @mahoadonban
IF(@@ERROR <>0)
BEGIN
	RAISERROR('Error', 16, 1)
	ROLLBACK
	RETURN
END
COMMIT TRAN
GO

--Câu 35. Thêm chi tiết hoá đơn nhập: USP_ThemChiTietHoaDonNhap voi Transaction
CREATE PROC USP_ThemChiTietHoaDonNhap(@MaNhap CHAR(5), @MaHoaDonNhap CHAR(6), @MaDoChoi CHAR(6), @GiaNhap INT)
AS
BEGIN TRAN
IF(@GiaNhap <= 0)
BEGIN
	RAISERROR('Gia nhap phai lon hon 0', 16, 1)
	ROLLBACK
	RETURN
END
	INSERT INTO ChiTietHoaDonNhap(MaNhap, MaHoaDonNhap, MaDoChoi, GiaNhap)
	VALUES (@MaNhap, @MaHoaDonNhap, @MaDoChoi, @GiaNhap)
IF(@@ERROR <>0)
BEGIN
	RAISERROR('Error', 16, 1)
	ROLLBACK
	RETURN
END
COMMIT TRAN
GO

--Câu 36. Cập nhật chi tiết hoá đơn nhập: USP_CapNhatChiTietHoaDonNhap voi Transaction
CREATE PROC USP_CapNhatChiTietHoaDonNhap @manhap CHAR(6), @mahoadonnhap CHAR(6), @madochoi CHAR(6), @gianhap INT
AS
BEGIN TRAN
IF(@GiaNhap <= 0)
BEGIN
	RAISERROR('Gia nhap phai lon hon 0', 16, 1)
	ROLLBACK
	RETURN
END
	UPDATE ChiTietHoaDonNhap SET MaHoaDonNhap = @mahoadonnhap, MaDoChoi = @madochoi, GiaNhap = @gianhap
	WHERE MaNhap = @manhap
IF(@@ERROR <>0)
BEGIN
	RAISERROR('Error', 16, 1)
	ROLLBACK
	RETURN
END
COMMIT TRAN
GO

--Câu 37. Xoá chi tiết hoá đơn nhập: USP_XoaChiTietHoaDonNhap voi Transaction
CREATE PROCEDURE USP_XoaChiTietHoaDonNhap @ma_nhap CHAR(6)
AS
BEGIN TRAN
	DELETE FROM ChiTietHoaDonNhap WHERE MaNhap = @ma_nhap
IF(@@ERROR <>0)
BEGIN
	RAISERROR('Error', 16, 1)
	ROLLBACK
	RETURN
END
COMMIT TRAN
GO

--Câu 38. Thêm chi tiết hoá đơn bán: USP_ThemChiTietHoaDonBan voi Transaction
CREATE PROC USP_ThemChiTietHoaDonBan @maban CHAR(6),
									 @mahoadon CHAR(6),
									 @madochoi CHAR(6),
									 @giaban INT
AS
BEGIN TRAN
IF(@giaban <= 0)
BEGIN
	RAISERROR('Gia ban phai lon hon 0', 16, 1)
	ROLLBACK
	RETURN
END
	INSERT INTO ChiTietHoaDonBan VALUES (@maban,
										 @mahoadon,
										 @madochoi,
										 @giaban
	)
IF(@@ERROR <>0)
BEGIN
	RAISERROR('Error', 16, 1)
	ROLLBACK
	RETURN
END
COMMIT TRAN
GO

--Câu 39. Cập nhật chi tiết hoá đơn bán USP_CapNhatChiTietHoaDonBan voi Transaction 
CREATE PROC USP_CapNhatChiTietHoaDonBan(@MaBan CHAR(6), @MaHoaDonBan CHAR(6), @MaDoChoi CHAR(6), @GiaBan INT)
AS
BEGIN TRAN
IF(@GiaBan <= 0)
BEGIN
	RAISERROR('Gia ban phai lon hon 0', 16, 1)
	ROLLBACK
	RETURN
END
	UPDATE dbo.ChiTietHoaDonBan 
	SET MaHoaDonBan = @MaHoaDonBan, MaDoChoi = @MaDoChoi, GiaBan = @GiaBan 
	WHERE MaBan = @MaBan
IF(@@ERROR <>0)
BEGIN
	RAISERROR('Error', 16, 1)
	ROLLBACK
	RETURN
END
COMMIT TRAN
GO

--Câu 40. Xoá chi tiết hoá đơn bán: USP_XoaChiTietHoaDonBan voi Transaction
CREATE PROC USP_XoaChiTietHoaDonBan @maban CHAR(6)
AS
BEGIN TRAN
	DELETE FROM  ChiTietHoaDonBan WHERE MaBan = @maban
IF(@@ERROR <>0)
BEGIN
	RAISERROR('Error', 16, 1)
	ROLLBACK
	RETURN
END
COMMIT TRAN
GO

--Câu 41. Thêm tài khoản mới: USP_ThemTaiKhoan voi Transaction
CREATE PROCEDURE USP_ThemTaiKhoan @ten_nguoi_dung CHAR(20),
								  @mat_khau VARCHAR(20),
								  @loai_nguoi_dung VARCHAR(20)
AS 
BEGIN TRAN
IF(@mat_khau = '')
BEGIN
	RAISERROR('Phai nhap mat khau cu the', 16, 1)
	ROLLBACK
	RETURN
END
	INSERT INTO TaiKhoan (TenNguoiDung, MatKhau, LoaiNguoiDung)
	VALUES (@ten_nguoi_dung, @mat_khau, @loai_nguoi_dung)
IF(@@ERROR <>0)
BEGIN
	RAISERROR('Error', 16, 1)
	ROLLBACK
	RETURN
END
COMMIT TRAN
GO

--Câu 42. Cập nhật tài khoản: USP_CapNhatTaiKhoan voi Transaction 
CREATE PROC USP_CapNhatTaiKhoan @tennguoidung CHAR(20), @matkhau VARCHAR(20), @loainguoidung VARCHAR(20)
AS
BEGIN TRAN
IF(@matkhau = '' OR @loainguoidung = '')
BEGIN
	RAISERROR('Phai nhap mat khau va loai nguoi dung cu the', 16, 1)
	ROLLBACK
	RETURN
END
	UPDATE TaiKhoan
	SET MatKhau = @matkhau, LoaiNguoiDung = @loainguoidung
	WHERE TenNguoiDung = @tennguoidung
IF(@@ERROR <>0)
BEGIN
	RAISERROR('Error', 16, 1)
	ROLLBACK
	RETURN
END
COMMIT TRAN
GO

--USE CuaHangDoChoi
--GO
--EXEC USP_CapNhatTaiKhoan 'nguyenvanthuan', 'thuan@@@', 'User'
--GO

--Câu 43. Xoá tài khoản: USP_XoaTaiKhoan voi Transaction 
CREATE PROC USP_XoaTaiKhoan(@TenNguoiDung CHAR(20))
AS
BEGIN TRAN
	DELETE FROM dbo.TaiKhoan WHERE TenNguoiDung=@TenNguoiDung
IF(@@ERROR <>0)
BEGIN
	RAISERROR('Error', 16, 1)
	ROLLBACK
	RETURN
END
COMMIT TRAN 
GO

-- HÀM TRẢ VỀ MỘT GIÁ TRỊ
--Câu 44. Doanh thu tháng hiện tại: UDF_DoanhThuThang
CREATE FUNCTION UDF_DoanhThuThang() Returns INT
AS
BEGIN
	DECLARE @doanhthu INT
	SELECT @doanhthu = sum(GiaBan)
	FROM ChiTietHoaDonBan, HoaDonBan
	WHERE ChiTietHoaDonBan.MaHoaDonBan = HoaDonBan.MaHoaDonBan
	AND MONTH(GETDATE()) = MONTH(NgayBan)
	AND YEAR(NgayBan) = YEAR(GETDATE())
	RETURN @doanhthu
END
GO

--Gọi hàm
--select dbo.UDF_DoanhThuThang()
--GO

--Câu 45. Lợi nhuận tháng này: UDF_LoiNhuanThang 
CREATE FUNCTION UDF_LoiNhuanThang() Returns INT
AS
BEGIN
	DECLARE @loinhuan INT
	IF MONTH(GETDATE()) - 1 = 0 
		BEGIN
			SELECT @loinhuan = sum(GiaBan) - sum(GiaNhap)
			FROM ChiTietHoaDonNhap, ChiTietHoaDonBan, HoaDonNhap, HoaDonBan
			WHERE ChiTietHoaDonNhap.MaHoaDonNhap = HoaDonNhap.MaHoaDonNhap
			AND ChiTietHoaDonBan.MaHoaDonBan = HoaDonBan.MaHoaDonBan
			AND ChiTietHoaDonNhap.MaDoChoi = ChiTietHoaDonBan.MaDoChoi
			AND MONTH(GETDATE()) = MONTH(NgayBan)
			AND YEAR(NgayBan) = YEAR(GETDATE())
		END
	RETURN @loinhuan
END
GO

--Gọi hàm
--select dbo.UDF_LoiNhuanThang()
--GO

--Câu 46. Tổng doanh thu từ trước đến nay: UDF_TongDoanhThu
CREATE FUNCTION UDF_TongDoanhThu ()
RETURNS INT
AS
BEGIN
	DECLARE @total INT
	SELECT @total = SUM(GiaBan)
	FROM ChiTietHoaDonBan
	RETURN @total
END
GO
--SELECT dbo.UDF_TongDoanhThu()

--Câu 47. Tổng lợi nhuận từ trước đến nay: UDF_TongLoiNhuan
CREATE FUNCTION UDF_TongLoiNhuan ()
RETURNS INT
AS
BEGIN
	DECLARE @total INT
	SELECT @total = SUM(GiaBan) - SUM(GiaNhap)
	FROM ChiTietHoaDonBan, ChiTietHoaDonNhap
	WHERE ChiTietHoaDonBan.MaDoChoi = ChiTietHoaDonNhap.MaDoChoi
	RETURN @total
END
GO
--SELECT dbo.UDF_TongLoiNhuan()

--Câu 48. Lợi nhuận theo năm: UDF_LoiNhuanNam
CREATE FUNCTION UDF_LoiNhuanNam (@Nam INT) RETURNS INT
AS
BEGIN
	DECLARE @TongLoiNhuan INT
	SELECT @TongLoiNhuan = sum(GiaBan - GiaNhap)
	FROM ChiTietHoaDonBan, ChiTietHoaDonNhap, HoaDonBan
	WHERE HoaDonBan.MaHoaDonBan = ChiTietHoaDonBan.MaHoaDonBan
		AND ChiTietHoaDonBan.MaDoChoi = ChiTietHoaDonNhap.MaDoChoi
		AND YEAR(NgayBan) = @Nam 
	RETURN @TongLoiNhuan
END
GO 

--SELECT dbo.UDF_LoiNhuanNam(2021)

--Câu 49. Doanh thu theo năm: UDF_DoanhThuNam 
CREATE FUNCTION UDF_DoanhThuNam(@Nam INT) RETURNS INT
AS
BEGIN
	DECLARE @DoanhThu INT 
	SELECT  @DoanhThu = sum(GiaBan) 
	FROM dbo.HoaDonBan, dbo.ChiTietHoaDonBan
	WHERE YEAR(NgayBan) = @Nam and HoaDonBan.MaHoaDonBan = ChiTietHoaDonBan.MaHoaDonBan
	RETURN @DoanhThu
END
GO
--SELECT dbo.UDF_DoanhThuNam(2021)

--HÀM TRẢ VỀ MỘT BẢNG CÓ MỘT CÂU LỆNH
--Câu 50. Tìm kiếm đồ chơi theo mã: UDF_TimDoChoiTheoMa
CREATE FUNCTION UDF_TimDoChoiTheoMa (@MaDoChoi CHAR(6))
	RETURNS TABLE
AS
	RETURN (SELECT *
			FROM DoChoi
			WHERE MaDoChoi LIKE '%'+@MaDoChoi+'%'
			)
GO
--SELECT * FROM UDF_TimDoChoiTheoMa('DC001')

--Câu 51. Tìm kiếm đồ chơi theo tên: UDF_TimDoChoiTheoTen 
CREATE FUNCTION UDF_TimDoChoiTheoTen(@TenDoChoi NVARCHAR(100)) RETURNS table
AS
	RETURN(SELECT * 
	FROM DoChoi
	WHERE TenDochoi LIKE '%'+@TenDoChoi+'%')
GO

--SELECT * FROM UDF_TimDoChoiTheoTen('Xe Cuu Ho')

-- Câu 52. Xác thực tài khoản: UDF_XacThucTaiKhoan
CREATE FUNCTION UDF_XacThucTaiKhoan(@tennguoidung CHAR(20), @matkhau VARCHAR(20))
	RETURNS table
AS
	RETURN (SELECT *
			FROM TaiKhoan
			WHERE TenNguoiDung = @tennguoidung
			AND MatKhau = @matkhau)
GO

--Gọi hàm
--SELECT * FROM UDF_XacThucTaiKhoan('nguyenvanthuan','thuan111#')
--GO

--Câu 53. Lấy danh sách hoá đơn nhập: UDF_LayHoaDonNhap
CREATE FUNCTION UDF_LayHoaDonNhap ()
	RETURNS TABLE
AS
	RETURN (SELECT *
			FROM HoaDonNhap
			)
GO
--SELECT * FROM UDF_LayHoaDonNhap()

--Câu 54. Lấy danh sách Chi tiết hoá đơn nhập: UDF_LayChiTietHoaDonNhap
CREATE FUNCTION UDF_LayChiTietHoaDonNhap ()
	RETURNS TABLE
AS
	RETURN (SELECT *
			FROM ChiTietHoaDonNhap
			)
GO
--SELECT * FROM UDF_LayChiTietHoaDonNhap()

--Câu 55. Lấy danh sách hoá đơn bán: UDF_LayHoaDonBan
CREATE FUNCTION UDF_LayHoaDonBan ()
	RETURNS TABLE
AS
	RETURN (SELECT *
			FROM HoaDonBan
			)
GO
--SELECT * FROM UDF_LayHoaDonBan()

--Câu 56. Lấy danh sách chi tiết hoá đơn bán: UDF_LayChiTietHoaDonBan
CREATE FUNCTION UDF_LayChiTietHoaDonBan ()
	RETURNS TABLE
AS
	RETURN (SELECT *
			FROM ChiTietHoaDonBan
			)
GO
--SELECT * FROM UDF_LayChiTietHoaDonBan()

--HÀM TRẢ VỀ MỘT BẢNG CÓ NHIỀU CÂU LỆNH
--Câu 57. Thống kê đồ chơi đã nhập tháng vừa rồi: UDF_ThongKeDoChoiNhapThangVuaQua 
CREATE FUNCTION UDF_ThongKeDoChoiNhapThangVuaQua()
RETURNS @table table(MaDoChoi CHAR(6), TenDoChoi NVARCHAR(100), GiaNhap INT, NgayNhap DATE, MaHoaDonNhap CHAR(6))
AS
BEGIN
	INSERT @table SELECT DoChoi.MaDoChoi, TenDoChoi, GiaNhap, NgayNhap, HoaDonNhap.MaHoaDonNhap
	FROM dbo.HoaDonNhap, dbo.ChiTietHoaDonNhap, dbo.DoChoi
	WHERE HoaDonNhap.MaHoaDonNhap=ChiTietHoaDonNhap.MaHoaDonNhap 
	AND ChiTietHoaDonNhap.MaDoChoi=DoChoi.MaDoChoi
	AND MONTH(HoaDonNhap.NgayNhap) = (CASE 
										WHEN MONTH(GETDATE()) = 1 THEN 12
										ELSE MONTH(GETDATE()) - 1
									END)
	AND YEAR(HoaDonNhap.NgayNhap) = (CASE 
										WHEN MONTH(GETDATE()) = 1 THEN YEAR(HoaDonNhap.NgayNhap) - 1
										ELSE YEAR(HoaDonNhap.NgayNhap)
									END)
	RETURN
END
GO
--SELECT * FROM UDF_ThongKeDoChoiNhapThangVuaQua()

--Câu 58. Thống kê đồ chơi đã bán tháng vừa rồi: UDF_ThongKeDoChoiBanThangVuaQua
CREATE FUNCTION UDF_ThongKeDoChoiBanThangVuaQua()
RETURNS
	@table table (MaDoChoi CHAR(6), TenDoChoi NVARCHAR(100), GiaBan INT, NgayBan date, MaNhanVien CHAR(5), MaHoaDonBan CHAR(6))
AS
BEGIN
	INSERT @table	
		SELECT DoChoi.MaDoChoi, TenDoChoi, GiaBan, NgayBan, MaNhanVien, HoaDonBan.MaHoaDonBan
		FROM DoChoi, ChiTietHoaDonBan, HoaDonBan
		WHERE DoChoi.MaDoChoi = ChiTietHoaDonBan.MaDoChoi
		AND HoaDonBan.MaHoaDonBan = ChiTietHoaDonBan.MaHoaDonBan
		AND MONTH(HoaDonBan.NgayBan) = (CASE 
											WHEN MONTH(GETDATE()) = 1 THEN 12
											ELSE MONTH(GETDATE()) - 1
										END)
		AND YEAR(HoaDonBan.NgayBan) = (CASE 
											WHEN MONTH(GETDATE()) = 1 THEN YEAR(HoaDonBan.NgayBan) - 1
											ELSE YEAR(HoaDonBan.NgayBan)
										END)
	RETURN
END
GO
--Gọi hàm
--SELECT * FROM UDF_ThongKeDoChoiBanThangVuaQua()

--Câu 59. Thống kê tiền lời của mỗi đồ chơi: UDF_TienLoi
CREATE FUNCTION UDF_TienLoi ()
RETURNS @TABLE TABLE(MaDoChoi CHAR(6), TenDoChoi NVARCHAR(100), NgayNhap DATE, GiaNhap INT, NgayBan DATE, GiaBan INT, TienLoi INT)
AS
BEGIN
	INSERT @TABLE 
		SELECT DoChoi.MaDoChoi, TenDoChoi, NgayNhap, GiaNhap, NgayBan, GiaBan, (GiaBan - GiaNhap) AS TienLoi
		FROM DoChoi, ChiTietHoaDonBan, ChiTietHoaDonNhap, HoaDonNhap, HoaDonBan
		WHERE DoChoi.MaDoChoi = ChiTietHoaDonBan.MaDoChoi
			AND DoChoi.MaDoChoi = ChiTietHoaDonNhap.MaDoChoi
			AND ChiTietHoaDonNhap.MaHoaDonNhap = HoaDonNhap.MaHoaDonNhap
			AND ChiTietHoaDonBan.MaHoaDonBan = HoaDonBan.MaHoaDonBan
			AND DoChoi.MaDoChoi IN (SELECT MaDoChoi FROM ChiTietHoaDonBan)
			AND GiaBan >= GiaNhap
	RETURN
END
GO

--SELECT * FROM UDF_TienLoi()

--Câu 60. Thống kê tiền lỗ của mỗi đồ chơi: UDF_TienLo 
CREATE FUNCTION UDF_TienLo ()
RETURNS @TABLE TABLE(MaDoChoi CHAR(6), TenDoChoi NVARCHAR(100), NgayNhap DATE, GiaNhap INT, NgayBan DATE, GiaBan INT, TienLo INT)
AS
BEGIN
	INSERT @TABLE 
		SELECT DoChoi.MaDoChoi, TenDoChoi, NgayNhap, GiaNhap, NgayBan, GiaBan, (GiaNhap - GiaBan) AS TienLo
		FROM DoChoi, ChiTietHoaDonBan, ChiTietHoaDonNhap, HoaDonNhap, HoaDonBan
		WHERE DoChoi.MaDoChoi = ChiTietHoaDonBan.MaDoChoi
			AND DoChoi.MaDoChoi = ChiTietHoaDonNhap.MaDoChoi
			AND ChiTietHoaDonNhap.MaHoaDonNhap = HoaDonNhap.MaHoaDonNhap
			AND ChiTietHoaDonBan.MaHoaDonBan = HoaDonBan.MaHoaDonBan
			AND DoChoi.MaDoChoi IN (SELECT MaDoChoi FROM ChiTietHoaDonBan)
			AND GiaBan < GiaNhap
	RETURN
END
GO
--SELECT * FROM UDF_TienLo ()

--Câu 61. Thống kê doanh thu và lợi nhuận theo từng tháng: UDF_DoanhThuLoiNhuan
CREATE FUNCTION UDF_DoanhThuLoiNhuan()
	RETURNS
		@table table (Thang CHAR(10), DoanhThu INT, LoiNhuan INT)
AS
	BEGIN
			INSERT @table	
				SELECT DoanhThuTheoThang.Thang, DoanhThu, (DoanhThu - TongNhap) AS LoiNhuan
				FROM DoanhThuTheoThang, TienNhapTheoThang
				WHERE DoanhThuTheoThang.Thang = TienNhapTheoThang.Thang
				ORDER BY DoanhThuTheoThang.Thang
		RETURN
	END
GO

--DROP FUNCTION UDF_DoanhThuLoiNhuan
--SELECT * FROM UDF_DoanhThuLoiNhuan()

--Phân quyền Admin, User 
CREATE login ngodinhnghia with Password='123456nghia@'
CREATE user ngodinhnghia for login ngodinhnghia
GRANT Select, Insert, Update on ChiTietHoaDonBan to ngodinhnghia
GRANT Select, Insert, Update on ChiTietHoaDonNhap to ngodinhnghia
GRANT Select, Insert, Update on DanhMucDoChoi to ngodinhnghia
GRANT Select, Insert, Update on DoChoi to ngodinhnghia
GRANT Select, Insert, Update on HoaDonBan to ngodinhnghia
GRANT Select, Insert, Update on HoaDonNhap to ngodinhnghia
GRANT Select, Insert, Update on NganKe to ngodinhnghia
GRANT Select, Insert, Update on NhaSanXuat to ngodinhnghia

CREATE login nguyenthicam with Password='cam@111'
CREATE user nguyenthicam for login nguyenthicam
GRANT Select, Insert, Update on ChiTietHoaDonBan to nguyenthicam
GRANT Select, Insert, Update on ChiTietHoaDonNhap to nguyenthicam
GRANT Select, Insert, Update on DanhMucDoChoi to nguyenthicam
GRANT Select, Insert, Update on DoChoi to nguyenthicam
GRANT Select, Insert, Update on HoaDonBan to nguyenthicam
GRANT Select, Insert, Update on HoaDonNhap to nguyenthicam
GRANT Select, Insert, Update on NganKe to nguyenthicam
GRANT Select, Insert, Update on NhaSanXuat to nguyenthicam

CREATE login nguyenvannam with Password='123456'
CREATE user nguyenvannam for login nguyenvannam
GRANT Select, Insert, Update on ChiTietHoaDonBan to nguyenvannam
GRANT Select, Insert, Update on ChiTietHoaDonNhap to nguyenvannam
GRANT Select, Insert, Update on DanhMucDoChoi to nguyenvannam
GRANT Select, Insert, Update on DoChoi to nguyenvannam
GRANT Select, Insert, Update on HoaDonBan to nguyenvannam
GRANT Select, Insert, Update on HoaDonNhap to nguyenvannam
GRANT Select, Insert, Update on NganKe to nguyenvannam
GRANT Select, Insert, Update on NhaSanXuat to nguyenvannam
GRANT Select, Insert, Update on NhanVien to nguyenvannam
GRANT Select, Insert, Update on TaiKhoan to nguyenvannam

CREATE login nguyenvanthuan with Password='thuan111#'
CREATE user nguyenvanthuan for login nguyenvanthuan
GRANT Select, Insert, Update on ChiTietHoaDonBan to nguyenvanthuan
GRANT Select, Insert, Update on ChiTietHoaDonNhap to nguyenvanthuan
GRANT Select, Insert, Update on DanhMucDoChoi to nguyenvanthuan
GRANT Select, Insert, Update on DoChoi to nguyenvanthuan
GRANT Select, Insert, Update on HoaDonBan to nguyenvanthuan
GRANT Select, Insert, Update on HoaDonNhap to nguyenvanthuan
GRANT Select, Insert, Update on NganKe to nguyenvanthuan
GRANT Select, Insert, Update on NhaSanXuat to nguyenvanthuan

CREATE login tranvannam with Password='nam12345'
CREATE user tranvannam for login tranvannam
GRANT Select, Insert, Update on ChiTietHoaDonBan to tranvannam
GRANT Select, Insert, Update on ChiTietHoaDonNhap to tranvannam
GRANT Select, Insert, Update on DanhMucDoChoi to tranvannam
GRANT Select, Insert, Update on DoChoi to tranvannam
GRANT Select, Insert, Update on HoaDonBan to tranvannam
GRANT Select, Insert, Update on HoaDonNhap to tranvannam
GRANT Select, Insert, Update on NganKe to tranvannam
GRANT Select, Insert, Update on NhaSanXuat to tranvannam
GO




