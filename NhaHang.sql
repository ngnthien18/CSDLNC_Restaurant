create database NH
use NH

--Loại Nhân Viên
create table LoaiNV(
	MaLoaiNV char(4) not null,
	TenLoaiNV nvarchar(100)
)
--Nhân Viên
create table NhanVien(
	MaNV char(4) not null,
	HoTen nvarchar(100),
	NgaySinh date,
	GioiTinh nvarchar(5),
	SDT char(10),
	DiaChi nvarchar(100),
	MaLoaiNV char(4)
)
--Loại Khách Hàng
create table LoaiKH(
	MaLoaiKH char(4) not null,
	TenLoaiKH nvarchar(100),
	GiamGia float
)
--Khách Hàng
create table KhachHang(
	MaKH char(4) not null,
	HoTen nvarchar(100),
	SDT char(10),
	GioiTinh nvarchar(5),
	NgaySinh date,
	MaLoaiKH char(4)
)
--Bàn
create table Ban(
	MaBan char(4) not null,
	TrangThai nvarchar(30),
	SucChua int
)
--Phục Vụ
create table PhucVu(
	MaBan char(4) not null,
	MaNV char(4) not null
)
--Đặt Bàn
create table DatBan(
	MaKH char(4) not null,
	MaBan char(4) not null,
	ThoiGianDat date not null
)
--Loại Món Ăn
create table LoaiMonAn(
	MaLoai char(4) not null,
	TenLoai nvarchar(100)
)
--Món Ăn
create table MonAn(
	MaMonAn char(4) not null,
	TenMonAn nvarchar(100),
	MaLoai char(4),
	SoLuong int
)
--Đơn Hàng
create table DonHang(
	MaDH char(4) not null,
	TongTien int,
	NgayTao date,
	HinhThucTT nvarchar(30),
	MaBan char(4),
	MaNV char(4),
	MaKH char(4)
)
--Chi Tiết Đơn Hàng
create table ChiTietDonHang(
	MaDH char(4) not null,
	MaMonAn char(4) not null,
	GiaBanRa int,
	SoLuong int
)
--Biến Động Giá
create table BienDongGia(
	MaBDG char(4) not null,
	GiaMonAn int,
	NgayCapNhat date,
	MaMonAn char(4)
)
--Nhà Cung Cấp
create table NhaCungCap(
	MaNCC char(4) not null,
	TenNCC nvarchar(100),
	SDT char(10),
	DiaChi nvarchar(100),
	Email nvarchar(100),
	LoaiSPCungCap nvarchar(50)
)
--Nhà Sản Xuất
create table NhaSanXuat(
	MaNSX char(4) not null,
	TenNSX nvarchar(100),
	SDT char(10),
	DiaChi nvarchar(100),
	Email nvarchar(100),
	LoaiSPSanXuat nvarchar(50)
)
--Xuất Xứ Nguyên Liệu
create table XuatXuNL(
	MaXuatXu char(4) not null,
	DiaDiem nvarchar(100)
)
--Nguyên Liệu
create table NguyenLieu(
	MaNL char(4) not null,
	NgaySX date,
	TenNL nvarchar(100),
	HSD date,
	TongSL int,
	DVT nvarchar(30),
	MaNCC char(4),
	MaXuatXu char(4),
	MaNSX char(4)
)
--Chế Biến
create table CheBien(
	MaMonAn char(4) not null,
	MaNL char(4) not null,
	NgayCB date not null,
	ThoiGianCB int,
	LuongHaoHut int
)
--Phiếu Nhập
create table PhieuNhap(
	MaPN char(4) not null,
	NgayNhap date,
	TongTien int,
	MaNV char(4)
)
--Chi Tiết Phiếu Nhập
create table ChiTietPhieuNhap(
	MaPN char(4) not null,
	MaNL char(4) not null,
	GiaNhapVao int,
	SoLuong int
)

-- Khóa chính
ALTER TABLE LoaiNV ADD CONSTRAINT PK_LoaiNV PRIMARY KEY (MaLoaiNV);
ALTER TABLE NhanVien ADD CONSTRAINT PK_NhanVien PRIMARY KEY (MaNV);
ALTER TABLE LoaiKH ADD CONSTRAINT PK_LoaiKH PRIMARY KEY (MaLoaiKH);
ALTER TABLE KhachHang ADD CONSTRAINT PK_KhachHang PRIMARY KEY (MaKH);
ALTER TABLE Ban ADD CONSTRAINT PK_Ban PRIMARY KEY (MaBan);
ALTER TABLE PhucVu ADD CONSTRAINT PK_PhucVu PRIMARY KEY (MaBan, MaNV);
ALTER TABLE DatBan ADD CONSTRAINT PK_DatBan PRIMARY KEY (MaKH, MaBan, ThoiGianDat);
ALTER TABLE LoaiMonAn ADD CONSTRAINT PK_LoaiMonAn PRIMARY KEY (MaLoai);
ALTER TABLE MonAn ADD CONSTRAINT PK_MonAn PRIMARY KEY (MaMonAn);
ALTER TABLE DonHang ADD CONSTRAINT PK_DonHang PRIMARY KEY (MaDH);
ALTER TABLE ChiTietDonHang ADD CONSTRAINT PK_ChiTietDonHang PRIMARY KEY (MaDH, MaMonAn);
ALTER TABLE BienDongGia ADD CONSTRAINT PK_BienDongGia PRIMARY KEY (MaBDG);
ALTER TABLE NhaCungCap ADD CONSTRAINT PK_NhaCungCap PRIMARY KEY (MaNCC);
ALTER TABLE NhaSanXuat ADD CONSTRAINT PK_NhaSanXuat PRIMARY KEY (MaNSX);
ALTER TABLE XuatXuNL ADD CONSTRAINT PK_XuatXuNL PRIMARY KEY (MaXuatXu);
ALTER TABLE NguyenLieu ADD CONSTRAINT PK_NguyenLieu PRIMARY KEY (MaNL);
ALTER TABLE CheBien ADD CONSTRAINT PK_CheBien PRIMARY KEY (MaMonAn, MaNL, NgayCB);
ALTER TABLE PhieuNhap ADD CONSTRAINT PK_PhieuNhap PRIMARY KEY (MaPN);
ALTER TABLE ChiTietPhieuNhap ADD CONSTRAINT PK_ChiTietPhieuNhap PRIMARY KEY (MaPN, MaNL);

--Khóa ngoại
--Nhân Viên
ALTER TABLE NhanVien ADD CONSTRAINT FK_NhanVien_LoaiNhanVien FOREIGN KEY (MaLoaiNV) REFERENCES LoaiNV(MaLoaiNV)
--Khách Hàng
ALTER TABLE KhachHang ADD CONSTRAINT FK_KhachHang_LoaiKhachHang FOREIGN KEY (MaLoaiKH) REFERENCES LoaiKH(MaLoaiKH)
--Phục Vụ
ALTER TABLE PhucVu ADD CONSTRAINT FK_PhucVu_Ban FOREIGN KEY (MaBan) REFERENCES Ban(MaBan)
ALTER TABLE PhucVu ADD CONSTRAINT FK_PhucVu_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
--Đặt Bàn
ALTER TABLE DatBan ADD CONSTRAINT FK_DatBan_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
ALTER TABLE DatBan ADD CONSTRAINT FK_DatBan_Ban FOREIGN KEY (MaBan) REFERENCES Ban(MaBan)
--Món Ăn
ALTER TABLE MonAn ADD CONSTRAINT FK_MonAn_LoaiMonAn FOREIGN KEY (MaLoai) REFERENCES LoaiMonAn(MaLoai)
--Đơn Hàng
ALTER TABLE DonHang ADD CONSTRAINT FK_DonHang_Ban FOREIGN KEY (MaBan) REFERENCES Ban(MaBan)
ALTER TABLE DonHang ADD CONSTRAINT FK_DonHang_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
ALTER TABLE DonHang ADD CONSTRAINT FK_DonHang_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
--Chi Tiết Đơn Hàng
ALTER TABLE ChiTietDonHang ADD CONSTRAINT FK_ChiTietDonHang_DonHang FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH)
ALTER TABLE ChiTietDonHang ADD CONSTRAINT FK_ChiTietDonHang_MonAn FOREIGN KEY (MaMonAn) REFERENCES MonAn(MaMonAn)
--Biến Động Giá
ALTER TABLE BienDongGia ADD CONSTRAINT FK_BienDongGia_MonAn FOREIGN KEY (MaMonAn) REFERENCES MonAn(MaMonAn)
--Nguyên Liệu
ALTER TABLE NguyenLieu ADD CONSTRAINT FK_NguyenLieu_NhaCungCap FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
ALTER TABLE NguyenLieu ADD CONSTRAINT FK_NguyenLieu_XuatXuNL FOREIGN KEY (MaXuatXu) REFERENCES XuatXuNL(MaXuatXu)
ALTER TABLE NguyenLieu ADD CONSTRAINT FK_NguyenLieu_NhaSanXuat FOREIGN KEY (MaNSX) REFERENCES NhaSanXuat(MaNSX)
--Chế Biến
ALTER TABLE CheBien ADD CONSTRAINT FK_CheBien_MonAn FOREIGN KEY (MaMonAn) REFERENCES MonAn(MaMonAn)
ALTER TABLE CheBien ADD CONSTRAINT FK_CheBien_NguyenLieu FOREIGN KEY (MaNL) REFERENCES NguyenLieu(MaNL)
--Phiếu Nhập
ALTER TABLE PhieuNhap ADD CONSTRAINT FK_PhieuNhap_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
--Chi Tiết Phiếu Nhập
ALTER TABLE ChiTietPhieuNhap ADD CONSTRAINT FK_ChiTietPhieuNhap_PhieuNhap FOREIGN KEY (MaPN) REFERENCES PhieuNhap(MaPN)
ALTER TABLE ChiTietPhieuNhap ADD CONSTRAINT FK_ChiTietPhieuNhap_NguyenLieu FOREIGN KEY (MaNL) REFERENCES NguyenLieu(MaNL)

--Nhập Dữ Liệu
--Loại Nhân Viên
insert into LoaiNV(MaLoaiNV,TenLoaiNV)
values ('LN01',N'Quản Lý'),
	   ('LN02',N'Đầu Bếp'),
	   ('LN03',N'Phục Vụ'),
	   ('LN04',N'Kế Toán')
--Nhân Viên
insert into NhanVien(MaNV,HoTen,NgaySinh,GioiTinh,SDT,DiaChi,MaLoaiNV) 
values ('NV01',N'Nguyễn Ngọc Anh Thiên','2003-1-18',N'Nam','0912345678',N'828 Sư Vạn Hạnh','LN01'),
	('NV02',N'Nguyễn Quốc Khánh','2003-1-1',N'Nam','0987654321',N'13 Lê Duẩn','LN02'),
	('NV03',N'Cao Đình Tuấn Anh','2003-2-2',N'Nam','0909876543',N'15 Trương Định','LN02'),
	('NV04',N'Lê Khánh Linh','2004-3-3',N'Nữ','0976543210',N'32 Lý Thái Tổ','LN03'),
	('NV05',N'Nguyễn An Phong','2004-4-4',N'Nam','0943210765',N'478 Lê Đại Hành','LN03'),
	('NV06',N'Phạm Thanh Hà','2002-5-5',N'Nữ','0965432109',N'58 Hai Bà Trưng','LN01'),
	('NV07',N'Vũ Minh Đức','2002-6-6',N'Nam','0910192837',N'95 Nguyễn Huệ','LN02'),
	('NV08',N'Lâm Thị Mai','2002-7-7',N'Nữ','0987654321',N'32 Trần Phú','LN02'),
	('NV09',N'Trần Văn Đạt','2001-8-8',N'Nam','0976543210',N'789 Nguyễn Văn Linh','LN03'),
	('NV10',N'Nguyễn Thị An','2001-9-9',N'Nữ','0943210765',N'123 Lê Lợi','LN03'),
	('NV11',N'Phan Văn Tuấn','2000-10-10',N'Nam','0909876543',N'123 Trần Hưng Đạo','LN01'),
	('NV12',N'Đinh Thị Trang','2000-11-11',N'Nữ','0912345678',N'456 Trần Quốc Toản','LN02'),
	('NV13',N'Trần Minh Huy','1999-12-12',N'Nam','0987654321',N'789 Lê Lai','LN02'),
	('NV14',N'Lê Thị Mai','1999-11-13',N'Nữ','0909876543',N'555 Lý Thái Tổ','LN03'),
	('NV15',N'Nguyễn Văn Nam','1998-10-14',N'Nam','0976543210',N'111 Nguyễn Huệ','LN03'),
	('NV16',N'Trần Thị Anh','1998-9-15',N'Nữ','0943210765',N'456 Hai Bà Trưng','LN01'),
	('NV17',N'Phạm Minh Tuấn','1997-8-16',N'Nam','0965432109',N'888 Lê Duẩn','LN02'),
	('NV18',N'Vũ Thị Lan','1997-7-17',N'Nữ','0910192837',N'999 Trần Phú','LN02'),
	('NV19',N'Lâm Văn Đạt','1996-6-18',N'Nam','0908765432',N'147 Nguyễn Văn Linh','LN03'),
	('NV20',N'Nguyễn Thị Hương','1996-5-19',N'Nữ','0987654321',N'369 Lê Lợi','LN04')


--Loại Khách Hàng
insert into LoaiKH(MaLoaiKH, TenLoaiKH, GiamGia) values
('LK01', N'Thân Thiết', 0.15),
('LK02', N'Vãng Lai', 0),
('LK03', N'VIP', 0.2),
('LK04', N'Khách lẻ', 0),
('LK05', N'Đại lý', 0.1),
('LK06', N'Nhóm', 0.1),
('LK07', N'Sinh viên', 0.1),
('LK08', N'Khách mua lần đầu', 0.05),
('LK09', N'Đối tác', 0.2),
('LK10', N'Người nước ngoài', 0.15);

--Khách Hàng
insert into KhachHang(MaKH, HoTen, SDT, GioiTinh, NgaySinh, MaLoaiKH) values
('KH01', N'Nguyễn Thế Minh', '0965432109', N'Nam', '1999-5-5', 'LK01'),
('KH02', N'Lý Xuân Hoa', '0932109876', N'Nữ', '1998-6-6', 'LK02'),
('KH03', N'Trần Văn Đạt', '0910192837', N'Nam', '1999-4-12', 'LK03'),
('KH04', N'Lê Thị Mai', '0943210765', N'Nữ', '1997-12-25', 'LK04'),
('KH05', N'Vũ Minh Tuấn', '0987654321', N'Nam', '2000-8-3', 'LK05'),
('KH06', N'Nguyễn Anh Thư', '0909876543', N'Nữ', '1998-10-20', 'LK06'),
('KH07', N'Phạm Văn Tùng', '0976543210', N'Nam', '2001-9-15', 'LK07'),
('KH08', N'Huỳnh Thị Hạnh', '0945678901', N'Nữ', '1997-7-8', 'LK08'),
('KH09', N'Lâm Văn Hùng', '0964321098', N'Nam', '2002-3-1', 'LK09'),
('KH10', N'John Smith', '0932108765', N'Nam', '2002-11-18', 'LK10'),
('KH11', N'Phan Văn Hiếu', '0923456789', N'Nam', '2003-2-28', 'LK01'),
('KH12', N'Trần Thị Thu', '0908765432', N'Nữ', '2003-1-10', 'LK02'),
('KH13', N'Nguyễn Văn Tuấn', '0965432109', N'Nam', '1999-5-5', 'LK03'),
('KH14', N'Lê Thị Hà', '0987654321', N'Nữ', '1998-6-6', 'LK04'),
('KH15', N'Vũ Minh Trí', '0909876543', N'Nam', '1999-4-12', 'LK05'),
('KH16', N'Nguyễn Anh Mai', '0943210765', N'Nữ', '1997-12-25', 'LK06'),
('KH17', N'Phạm Văn Nam', '0987654321', N'Nam', '2000-8-3', 'LK07'),
('KH18', N'Trần Thị Thảo', '0909876543', N'Nữ', '1998-10-20', 'LK08'),
('KH19', N'Đinh Văn Hùng', '0976543210', N'Nam', '2001-9-15', 'LK09'),
('KH20', N'Emma Johnson', '0945678901', N'Nữ', '1997-7-8', 'LK10');

--Bàn
insert into Ban(MaBan, TrangThai, SucChua) values
('BN01', N'Trống', 4),
('BN02', N'Trống', 4),
('BN03', N'Trống', 6),
('BN04', N'Đã Đặt', 2),
('BN05', N'Trống', 4),
('BN06', N'Trống', 2),
('BN07', N'Đã Đặt', 8),
('BN08', N'Trống', 4),
('BN09', N'Đã Đặt', 6),
('BN10', N'Trống', 2),
('BN11', N'Trống', 4),
('BN12', N'Trống', 4),
('BN13', N'Đã Đặt', 6),
('BN14', N'Đã Đặt', 8),
('BN15', N'Trống', 2),
('BN16', N'Trống', 4),
('BN17', N'Trống', 4),
('BN18', N'Đã Đặt', 6),
('BN19', N'Trống', 2),
('BN20', N'Đã Đặt', 4);

--Phục Vụ
insert into PhucVu(MaBan, MaNV) values
('BN01', 'NV04'),
('BN02', 'NV05'),
('BN03', 'NV09'),
('BN04', 'NV10'),
('BN05', 'NV14'),
('BN06', 'NV15'),
('BN07', 'NV19'),
('BN08', 'NV04'),
('BN09', 'NV05'),
('BN10', 'NV09'),
('BN11', 'NV10'),
('BN12', 'NV14'),
('BN13', 'NV15'),
('BN14', 'NV19'),
('BN15', 'NV04'),
('BN16', 'NV05'),
('BN17', 'NV09'),
('BN18', 'NV10'),
('BN19', 'NV14'),
('BN20', 'NV15');

--Đặt Bàn
insert into DatBan(MaKH, MaBan, ThoiGianDat) values
('KH01', 'BN01', '2023-08-03'),
('KH02', 'BN02', '2023-08-03'),
('KH03', 'BN03', '2023-08-03'),
('KH04', 'BN04', '2023-08-03'),
('KH05', 'BN05', '2023-08-03'),
('KH06', 'BN06', '2023-08-03'),
('KH07', 'BN07', '2023-08-03'),
('KH08', 'BN08', '2023-08-03'),
('KH09', 'BN09', '2023-08-03'),
('KH10', 'BN10', '2023-08-03'),
('KH11', 'BN11', '2023-08-03'),
('KH12', 'BN12', '2023-08-03'),
('KH13', 'BN13', '2023-08-03'),
('KH14', 'BN14', '2023-08-04'),
('KH15', 'BN15', '2023-08-04'),
('KH16', 'BN16', '2023-08-04'),
('KH17', 'BN17', '2023-08-04'),
('KH18', 'BN18', '2023-08-04'),
('KH19', 'BN19', '2023-08-04'),
('KH20', 'BN20', '2023-08-04');

insert into LoaiMonAn(MaLoai, TenLoai) values
('LM01', N'Món Xào'),
('LM02', N'Món Nướng'),
('LM03', N'Món Hấp'),
('LM04', N'Món Chiên'),
('LM05', N'Món Luộc'),
('LM06', N'Món Lẩu'),
('LM07', N'Món Salad'),
('LM08', N'Món Súp'),
('LM09', N'Món Nước'),
('LM10', N'Món Tráng Miệng'),
('LM11', N'Món Tôm'),
('LM12', N'Món Cá'),
('LM13', N'Món Bò'),
('LM14', N'Món Lợn'),
('LM15', N'Món Gà'),
('LM16', N'Món Gỏi'),
('LM17', N'Món Mì'),
('LM18', N'Món Phở'),
('LM19', N'Món Bánh'),
('LM20', N'Món Pizza');

insert into MonAn(MaMonAn, TenMonAn, MaLoai, SoLuong) values
('MA01', N'Sườn Xào Chua Ngọt', 'LM01', 100),
('MA02', N'Gà Nướng', 'LM02', 100),
('MA03', N'Tôm Hấp', 'LM03', 100),
('MA04', N'Khoai Tây Chiên', 'LM04', 100),
('MA05', N'Cá Hấp', 'LM05', 100),
('MA06', N'Lẩu Hải Sản', 'LM06', 100),
('MA07', N'Salad Rau Trộn', 'LM07', 100),
('MA08', N'Súp Hành Tây', 'LM08', 100),
('MA09', N'Nước Cam Ép', 'LM09', 100),
('MA10', N'Kem Dâu', 'LM10', 100),
('MA11', N'Tôm Chiên Tỏi', 'LM11', 100),
('MA12', N'Cá Kho', 'LM12', 100),
('MA13', N'Bò Kho', 'LM13', 100),
('MA14', N'Lợn Xào Mắm', 'LM14', 100),
('MA15', N'Gà Hấp', 'LM15', 100),
('MA16', N'Gỏi Gà', 'LM16', 100),
('MA17', N'Mì Quảng', 'LM17', 100),
('MA18', N'Phở Bò', 'LM18', 100),
('MA19', N'Bánh Mỳ Pate', 'LM19', 100),
('MA20', N'Pizza Hải Sản', 'LM20', 100);

--Đơn Hàng
insert into DonHang(MaDH, TongTien, NgayTao, HinhThucTT, MaBan, MaNV, MaKH) values
('DH01', 110500, '2023-8-3', N'Chuyển Khoản', 'BN01', 'NV04', 'KH01'),
('DH02', 520000, '2023-8-4', N'Tiền Mặt', 'BN02', 'NV05', 'KH02'),
('DH03', 150000, '2023-8-5', N'Chuyển Khoản', 'BN03', 'NV09', 'KH03'),
('DH04', 350000, '2023-8-6', N'Chuyển Khoản', 'BN04', 'NV10', 'KH04'),
('DH05', 250000, '2023-8-7', N'Tiền Mặt', 'BN05', 'NV14', 'KH05'),
('DH06', 180000, '2023-8-8', N'Chuyển Khoản', 'BN06', 'NV15', 'KH06'),
('DH07', 420000, '2023-8-9', N'Tiền Mặt', 'BN07', 'NV19', 'KH07'),
('DH08', 310000, '2023-8-10', N'Chuyển Khoản', 'BN08', 'NV04', 'KH08'),
('DH09', 290000, '2023-8-11', N'Tiền Mặt', 'BN09', 'NV05', 'KH09'),
('DH10', 360000, '2023-8-12', N'Tiền Mặt', 'BN10', 'NV09', 'KH10'),
('DH11', 280000, '2023-8-13', N'Chuyển Khoản', 'BN11', 'NV10', 'KH11'),
('DH12', 240000, '2023-8-14', N'Tiền Mặt', 'BN12', 'NV14', 'KH12'),
('DH13', 190000, '2023-8-15', N'Tiền Mặt', 'BN13', 'NV15', 'KH13'),
('DH14', 400000, '2023-8-16', N'Chuyển Khoản', 'BN14', 'NV19', 'KH14'),
('DH15', 290000, '2023-8-17', N'Tiền Mặt', 'BN15', 'NV04', 'KH15'),
('DH16', 380000, '2023-8-18', N'Chuyển Khoản', 'BN16', 'NV05', 'KH16'),
('DH17', 210000, '2023-8-19', N'Chuyển Khoản', 'BN17', 'NV09', 'KH17'),
('DH18', 320000, '2023-8-20', N'Tiền Mặt', 'BN18', 'NV10', 'KH18'),
('DH19', 270000, '2023-8-21', N'Tiền Mặt', 'BN19', 'NV14', 'KH19'),
('DH20', 390000, '2023-8-22', N'Chuyển Khoản', 'BN20', 'NV15', 'KH20');

--Chi Tiết Đơn Hàng
insert into ChiTietDonHang(MaDH, MaMonAn, GiaBanRa, SoLuong) values
('DH01', 'MA01', 130000, 2),
('DH02', 'MA02', 520000, 2),
('DH03', 'MA03', 90000, 3),
('DH04', 'MA04', 70000, 5),
('DH05', 'MA05', 140000, 2),
('DH06', 'MA06', 110000, 3),
('DH07', 'MA07', 80000, 4),
('DH08', 'MA08', 75000, 4),
('DH09', 'MA09', 90000, 3),
('DH10', 'MA10', 70000, 5),
('DH11', 'MA11', 140000, 2),
('DH12', 'MA12', 110000, 3),
('DH13', 'MA13', 80000, 4),
('DH14', 'MA14', 75000, 4),
('DH15', 'MA15', 90000, 3),
('DH16', 'MA16', 70000, 5),
('DH17', 'MA17', 140000, 2),
('DH18', 'MA18', 110000, 3),
('DH19', 'MA19', 80000, 4),
('DH20', 'MA20', 75000, 4);

--Biến Động Giá
insert into BienDongGia(MaBDG, GiaMonAn, NgayCapNhat, MaMonAn) values
('BD01', 60000, '2023-5-1', 'MA01'),
('BD02', 65000, '2023-8-1', 'MA01'),
('BD03', 260000, '2023-8-1', 'MA02'),
('BD04', 30000, '2023-8-1', 'MA02'),
('BD05', 58000, '2023-8-1', 'MA03'),
('BD06', 60000, '2023-8-1', 'MA03'),
('BD07', 50000, '2023-8-1', 'MA04'),
('BD08', 52000, '2023-8-1', 'MA04'),
('BD09', 120000, '2023-8-1', 'MA05'),
('BD10', 125000, '2023-8-1', 'MA05'),
('BD11', 90000, '2023-8-1', 'MA06'),
('BD12', 95000, '2023-8-1', 'MA06'),
('BD13', 70000, '2023-8-1', 'MA07'),
('BD14', 75000, '2023-8-1', 'MA07'),
('BD15', 60000, '2023-8-1', 'MA08'),
('BD16', 65000, '2023-8-1', 'MA08'),
('BD17', 40000, '2023-8-1', 'MA09'),
('BD18', 45000, '2023-8-1', 'MA09'),
('BD19', 70000, '2023-8-1', 'MA10'),
('BD20', 75000, '2023-8-1', 'MA10');

--Nhà Cung Cấp
insert into NhaCungCap(MaNCC, TenNCC, SDT, DiaChi, Email, LoaiSPCungCap) values
('CC01', N'Nhà Cung Cấp 1', '0935661222', N'749 Huỳnh Tấn Phát', 'ncc1@gmail.com', N'Thịt'),
('CC02', N'Nhà Cung Cấp 2', '0947829999', N'13 Nguyễn Thị Thập', 'ncc2@gmail.com', N'Gia Vị'),
('CC03', N'Nhà Cung Cấp 3', '0988111122', N'29 Lê Đại Hành', 'ncc3@gmail.com', N'Rau Củ'),
('CC04', N'Nhà Cung Cấp 4', '0912345678', N'17 Trần Hưng Đạo', 'ncc4@gmail.com', N'Hải Sản'),
('CC05', N'Nhà Cung Cấp 5', '0977654321', N'9 Hoàng Sa', 'ncc5@gmail.com', N'Đồ Uống'),
('CC06', N'Nhà Cung Cấp 6', '0965432109', N'31 Nguyễn Văn Cừ', 'ncc6@gmail.com', N'Bánh Kẹo'),
('CC07', N'Nhà Cung Cấp 7', '0989098765', N'41 Đinh Tiên Hoàng', 'ncc7@gmail.com', N'Trái Cây'),
('CC08', N'Nhà Cung Cấp 8', '0934543210', N'7 Lê Lợi', 'ncc8@gmail.com', N'Đồ Khô'),
('CC09', N'Nhà Cung Cấp 9', '0912309876', N'5 Nguyễn Thị Minh Khai', 'ncc9@gmail.com', N'Đồ Lạnh'),
('CC10', N'Nhà Cung Cấp 10', '0943567890', N'21 Tôn Đức Thắng', 'ncc10@gmail.com', N'Đồ Ăn Nhanh');

--Nhà Sản Xuất
insert into NhaSanXuat(MaNSX, TenNSX, SDT, DiaChi, Email, LoaiSPSanXuat) values
('SX01', N'Nhà Sản Xuất 1', '0912287777', N'20 Thành Thái', 'nsx1@gmail.com', N'Thịt'),
('SX02', N'Nhà Sản Xuất 2', '0937732222', N'88 Phan Xích Long', 'nsx2@gmail.com', N'Gia Vị'),
('SX03', N'Nhà Sản Xuất 3', '0977444333', N'45 Nguyễn Hữu Thọ', 'nsx3@gmail.com', N'Rau Củ'),
('SX04', N'Nhà Sản Xuất 4', '0944555666', N'63 Lê Duẩn', 'nsx4@gmail.com', N'Hải Sản'),
('SX05', N'Nhà Sản Xuất 5', '0916777888', N'52 Hoàng Hoa Thám', 'nsx5@gmail.com', N'Đồ Uống'),
('SX06', N'Nhà Sản Xuất 6', '0909888999', N'8 Phan Chu Trinh', 'nsx6@gmail.com', N'Bánh Kẹo'),
('SX07', N'Nhà Sản Xuất 7', '0966111222', N'17 Lê Lợi', 'nsx7@gmail.com', N'Trái Cây'),
('SX08', N'Nhà Sản Xuất 8', '0988222333', N'37 Trần Phú', 'nsx8@gmail.com', N'Đồ Khô'),
('SX09', N'Nhà Sản Xuất 9', '0944333444', N'61 Nguyễn Thị Minh Khai', 'nsx9@gmail.com', N'Đồ Lạnh'),
('SX10', N'Nhà Sản Xuất 10', '0977555666', N'19 Tôn Đức Thắng', 'nsx10@gmail.com', N'Đồ Ăn Nhanh');

--Xuất Xứ Nguyên Liệu
insert into XuatXuNL(MaXuatXu, DiaDiem) values
('XX01', N'Việt Nam'),
('XX02', N'Nhật Bản'),
('XX03', N'Hàn Quốc'),
('XX04', N'Ý'),
('XX05', N'Mỹ'),
('XX06', N'Pháp'),
('XX07', N'Anh'),
('XX08', N'Thái Lan'),
('XX09', N'Indonesia'),
('XX10', N'Malaysia'),
('XX11', N'Trung Quốc'),
('XX12', N'Brazil'),
('XX13', N'Argentina'),
('XX14', N'Úc'),
('XX15', N'Canada'),
('XX16', N'Nga'),
('XX17', N'Dức'),
('XX18', N'Tây Ban Nha'),
('XX19', N'New Zealand'),
('XX20', N'Switzerland');

--Nguyên Liệu
insert into NguyenLieu(MaNL, NgaySX, TenNL, HSD, TongSL, DVT, MaNCC, MaXuatXu, MaNSX) values
('NL01', '2023-7-25', N'Sườn Heo', '2023-8-25', 5000, 'gram', 'CC01', 'XX01', 'SX01'),
('NL02', '2023-7-25', N'Nước Mắm', '2024-7-25', 500, 'gram', 'CC02', 'XX01', 'SX02'),
('NL03', '2023-7-25', N'Muối', '2024-7-25', 200, 'gram', 'CC02', 'XX02', 'SX02'),
('NL04', '2023-7-25', N'Gà', '2023-8-25', 10, 'con', 'CC01', 'XX01', 'SX01'),
('NL05', '2023-7-25', N'Măng Tây', '2023-8-25', 500, 'gram', 'CC03', 'XX01', 'SX03'),
('NL06', '2023-7-25', N'Mỳ Chính', '2024-7-25', 200, 'gram', 'CC02', 'XX02', 'SX02'),
('NL07', '2023-7-25', N'Cá Basa', '2023-8-25', 20, 'con', 'CC04', 'XX01', 'SX04'),
('NL08', '2023-7-25', N'Đường', '2024-7-25', 500, 'gram', 'CC02', 'XX02', 'SX02'),
('NL09', '2023-7-25', N'Tôm', '2023-8-25', 5, 'con', 'CC01', 'XX01', 'SX01'),
('NL10', '2023-7-25', N'Thịt Bò', '2024-7-25', 1000, 'gram', 'CC05', 'XX01', 'SX05'),
('NL11', '2023-7-25', N'Bột Cacao', '2023-8-25', 300, 'gram', 'CC06', 'XX02', 'SX06'),
('NL12', '2023-7-25', N'Bơ', '2024-7-25', 200, 'gram', 'CC03', 'XX01', 'SX03'),
('NL13', '2023-7-25', N'Măng', '2023-8-25', 400, 'gram', 'CC07', 'XX01', 'SX07'),
('NL14', '2023-7-25', N'Chanh', '2024-7-25', 100, 'trái', 'CC08', 'XX02', 'SX08'),
('NL15', '2023-7-25', N'Hành Tây', '2023-8-25', 300, 'gram', 'CC03', 'XX01', 'SX03'),
('NL16', '2023-7-25', N'Cá Hồi', '2024-7-25', 30, 'con', 'CC09', 'XX02', 'SX09'),
('NL17', '2023-7-25', N'Nấm', '2023-8-25', 500, 'gram', 'CC10', 'XX01', 'SX10'),
('NL18', '2023-7-25', N'Khoai Tây', '2024-7-25', 15, 'gram', 'CC09', 'XX02', 'SX09'),
('NL19', '2023-7-25', N'Xà Lách', '2023-8-25', 200, 'gram', 'CC06', 'XX01', 'SX06'),
('NL20', '2023-7-25', N'Ớt', '2024-7-25', 100, 'gram', 'CC10', 'XX02', 'SX10');

--Chế Biến
insert into CheBien(MaMonAn, MaNL, NgayCB, ThoiGianCB, LuongHaoHut) values
('MA01', 'NL01', '2023-8-1', 60, 500),
('MA01', 'NL02', '2023-8-1', 60, 20),
('MA01', 'NL03', '2023-8-1', 60, 10),
('MA02', 'NL04', '2023-8-1', 90, 1),
('MA02', 'NL02', '2023-8-1', 90, 20),
('MA02', 'NL03', '2023-8-1', 90, 10),
('MA03', 'NL05', '2023-8-1', 30, 300),
('MA03', 'NL02', '2023-8-1', 30, 10),
('MA03', 'NL09', '2023-8-1', 30, 5),
('MA04', 'NL03', '2023-8-1', 120, 50),
('MA04', 'NL18', '2023-8-1', 120, 5),
('MA05', 'NL07', '2023-8-1', 120, 5),
('MA05', 'NL03', '2023-8-1', 45, 1),
('MA06', 'NL09', '2023-8-1', 45, 10),
('MA06', 'NL15', '2023-8-1', 45, 5),
('MA06', 'NL16', '2023-8-1', 60, 100),
('MA07', 'NL19', '2023-8-1', 60, 5),
('MA07', 'NL20', '2023-8-1', 60, 5),
('MA08', 'NL15', '2023-8-1', 90, 100),
('MA08', 'NL18', '2023-8-1', 90, 5);

--Phiếu Nhập
insert into PhieuNhap(MaPN, NgayNhap, TongTien, MaNV) values
('PN03', '2023-7-26', 100000, 'NV06'),
('PN04', '2023-7-26', 450000, 'NV07'),
('PN05', '2023-7-27', 120000, 'NV08'),
('PN06', '2023-7-27', 230000, 'NV09'),
('PN07', '2023-7-28', 80000, 'NV10'),
('PN08', '2023-7-28', 320000, 'NV11'),
('PN09', '2023-7-29', 200000, 'NV12'),
('PN10', '2023-7-29', 670000, 'NV13'),
('PN11', '2023-7-30', 150000, 'NV14'),
('PN12', '2023-7-30', 290000, 'NV15'),
('PN13', '2023-7-31', 180000, 'NV16'),
('PN14', '2023-7-31', 390000, 'NV17'),
('PN15', '2023-8-1', 220000, 'NV18'),
('PN16', '2023-8-1', 350000, 'NV19'),
('PN17', '2023-8-2', 120000, 'NV20'),
('PN18', '2023-8-2', 270000, 'NV06'),
('PN19', '2023-8-3', 210000, 'NV07'),
('PN20', '2023-8-3', 420000, 'NV08');

--Chi Tiết Phiếu Nhập
insert into ChiTietPhieuNhap(MaPN, MaNL, GiaNhapVao, SoLuong) values
('PN03', 'NL02', 50000, 200),
('PN03', 'NL05', 70000, 150),
('PN04', 'NL03', 100000, 100),
('PN04', 'NL06', 50000, 50),
('PN05', 'NL04', 80000, 50),
('PN05', 'NL07', 60000, 80),
('PN06', 'NL09', 150000, 2),
('PN06', 'NL08', 30000, 10),
('PN07', 'NL01', 50000, 100),
('PN07', 'NL10', 200000, 1),
('PN08', 'NL03', 90000, 90),
('PN08', 'NL11', 70000, 120),
('PN09', 'NL02', 50000, 50),
('PN09', 'NL12', 40000, 100),
('PN10', 'NL06', 60000, 30),
('PN10', 'NL13', 30000, 100),
('PN11', 'NL04', 75000, 40),
('PN11', 'NL14', 50000, 50),
('PN12', 'NL09', 140000, 2),
('PN12', 'NL15', 60000, 70),
('PN13', 'NL01', 60000, 80),
('PN13', 'NL16', 250000, 2),
('PN14', 'NL06', 55000, 20),
('PN14', 'NL17', 40000, 60),
('PN15', 'NL03', 80000, 100),
('PN15', 'NL18', 45000, 80),
('PN16', 'NL02', 55000, 100),
('PN16', 'NL19', 80000, 3),
('PN17', 'NL04', 70000, 30),
('PN17', 'NL20', 60000, 5),
('PN18', 'NL05', 90000, 60),
('PN18', 'NL10', 180000, 1),
('PN19', 'NL06', 50000, 50),
('PN19', 'NL11', 65000, 80),
('PN20', 'NL03', 85000, 90),
('PN20', 'NL12', 38000, 120);

select * from LoaiNV
select * from NhanVien
select * from LoaiKH
select * from KhachHang
select * from Ban
select * from PhucVu
select * from DatBan
select * from LoaiMonAn
select * from MonAn
select * from DonHang
select * from ChiTietDonHang
select * from BienDongGia
select * from NhaCungCap
select * from NhaSanXuat
select * from XuatXuNL
select * from NguyenLieu
select * from CheBien
select * from PhieuNhap
select * from ChiTietPhieuNhap

--Store procedure lấy danh sách loại nhân viên
GO
CREATE PROCEDURE GetLoaiNhanVien
AS
BEGIN
    SELECT * FROM LoaiNV;
END;
EXEC GetLoaiNhanVien
--Store procedure lấy danh sách nhân viên
GO
CREATE PROCEDURE GetNhanVien
AS
BEGIN
    SELECT * FROM NhanVien;
END;
EXEC GetNhanVien
--Store procedure lấy danh sách loại khách hàng
GO
CREATE PROCEDURE GetLoaiKhachHang
AS
BEGIN
    SELECT * FROM LoaiKH;
END;
EXEC GetLoaiKhachHang
--Store procedure lấy danh sách khách hàng
GO
CREATE PROCEDURE GetKhachHang
AS
BEGIN
    SELECT * FROM KhachHang;
END;
EXEC GetKhachHang
--Store procedure lấy danh sách bàn
GO
CREATE PROCEDURE GetBan
AS
BEGIN
    SELECT * FROM Ban;
END;
EXEC GetBan
--Store procedure lấy danh sách loại món ăn
GO
CREATE PROCEDURE GetLoaiMonAn
AS
BEGIN
    SELECT * FROM LoaiMonAn;
END;
EXEC GetLoaiMonAn
--Store procedure lấy danh sách món ăn
GO
CREATE PROCEDURE GetMonAn
AS
BEGIN
    SELECT * FROM MonAn;
END;
EXEC GetMonAn
--Store procedure lấy danh sách đơn hàng
GO
CREATE PROCEDURE GetDonHang
AS
BEGIN
    SELECT * FROM DonHang;
END;
EXEC GetDonHang
--Store procedure lấy danh sách nhà cung cấp
GO
CREATE PROCEDURE GetNhaCungCap
AS
BEGIN
    SELECT * FROM NhaCungCap;
END;
EXEC GetNhaCungCap
--Store procedure lấy danh sách nhà sản xuất
GO
CREATE PROCEDURE GetNhaSanXuat
AS
BEGIN
    SELECT * FROM NhaSanXuat;
END;
EXEC GetNhaSanXuat
--Store procedure lấy danh sách xuất xứ nguyên liệu
GO
CREATE PROCEDURE GetXuatXuNL
AS
BEGIN
    SELECT * FROM XuatXuNL;
END;
EXEC GetXuatXuNL
--Store procedure lấy danh sách nguyên liệu
GO
CREATE PROCEDURE GetNguyenLieu
AS
BEGIN
    SELECT * FROM NguyenLieu;
END;
EXEC GetNguyenLieu
--Store procedure lấy danh sách phiếu nhập
GO
CREATE PROCEDURE GetPhieuNhap
AS
BEGIN
    SELECT * FROM PhieuNhap;
END;
EXEC GetPhieuNhap

GO
CREATE PROCEDURE DatMonAn
(
    @MaKH char(4),
    @MaBan char(4),
	@MaNV char(4),
    @MaMonAn char(4),
    @SoLuong int
)
--Store procedure đặt món ăn
AS
BEGIN
    -- Kiểm tra xem khách hàng và bàn có tồn tại không
    IF NOT EXISTS (SELECT * FROM KhachHang WHERE MaKH = @MaKH)
    BEGIN
        PRINT 'Khách hàng không tồn tại.'
        RETURN
    END
    
    IF NOT EXISTS (SELECT * FROM Ban WHERE MaBan = @MaBan)
    BEGIN
        PRINT 'Bàn không tồn tại.'
        RETURN
    END
    
    -- Kiểm tra xem món ăn có tồn tại không
    IF NOT EXISTS (SELECT * FROM MonAn WHERE MaMonAn = @MaMonAn)
    BEGIN
        PRINT 'Món ăn không tồn tại.'
        RETURN
    END
    
    -- Kiểm tra số lượng món ăn đặt phải lớn hơn 0
    IF @SoLuong <= 0
    BEGIN
        PRINT 'Số lượng món ăn phải lớn hơn 0.'
        RETURN
    END
    
    -- Kiểm tra số lượng món ăn trong kho có đủ để đặt không
    DECLARE @SoLuongTrongKho int
    SELECT @SoLuongTrongKho = SoLuong FROM MonAn WHERE MaMonAn = @MaMonAn
    
    IF @SoLuongTrongKho < @SoLuong
    BEGIN
        PRINT 'Số lượng món ăn trong kho không đủ để đặt.'
        RETURN
    END
    
    -- Thêm đơn hàng
    DECLARE @MaDH char(4)
    SET @MaDH = 'DH'
    
    INSERT INTO DonHang (MaDH, TongTien, NgayTao, HinhThucTT, MaBan, MaNV, MaKH)
    VALUES (@MaDH, 0, GETDATE(), N'Chuyển Khoản', @MaBan, @MaNV, @MaKH)
    
    -- Thêm chi tiết đơn hàng
    INSERT INTO ChiTietDonHang (MaDH, MaMonAn, GiaBanRa, SoLuong)
    VALUES (@MaDH, @MaMonAn, (SELECT GiaMonAn FROM BienDongGia WHERE MaMonAn = @MaMonAn AND NgayCapNhat = (SELECT MAX(NgayCapNhat) FROM BienDongGia WHERE MaMonAn = @MaMonAn)), @SoLuong)
    
    -- Cập nhật tổng tiền của đơn hàng
    UPDATE DonHang
    SET TongTien = (SELECT SUM(GiaBanRa * SoLuong) FROM ChiTietDonHang WHERE MaDH = @MaDH)
    WHERE MaDH = @MaDH
    
    -- Giảm số lượng món ăn trong kho
    UPDATE MonAn
    SET SoLuong = SoLuong - @SoLuong
    WHERE MaMonAn = @MaMonAn
    
    PRINT 'Đặt món ăn thành công.'
    RETURN
END
EXEC DatMonAn 'KH01', 'BN01','NV04', 'MA01', 2;
select * from DonHang
--Store procedure lấy danh sách top 3 khách hàng mua nhiều tiền nhất
GO
CREATE PROCEDURE GetTop3Mua
AS
BEGIN
    SELECT TOP 3 KH.MaKH, KH.HoTen, SUM(DH.TongTien) AS TongTienMua
    FROM KhachHang KH, DONHANG DH
    WHERE KH.MaKH = DH.MaKH
    GROUP BY KH.MaKH, KH.HoTen
    ORDER BY TongTienMua DESC;
END;
EXEC GetTop3Mua;

--Trigger Tổng Số Lượng Nguyên Liệu Phải Lớn Hơn 0
GO
CREATE TRIGGER tr_TongSLNL
ON NguyenLieu
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @sl int
	SELECT @sl=TongSL from inserted
    IF @sl<=0
    BEGIN
        RAISERROR ('Số lượng nguyên liệu phải lớn hơn 0', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
insert into NguyenLieu values ('NL21', '2023-7-25', N'Thiên', '2024-7-25', 0, 'gram', 'CC10', 'XX02', 'SX10');
--Trigger trên bảng Biến động giá, giá nhập vào phải lớn hơn 0
GO
CREATE TRIGGER tr_BDG
ON BienDongGia
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @gia int
	SELECT @gia=GiaMonAn from inserted
    BEGIN
        RAISERROR ('GiaMonAn phải lớn hơn 0.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;