-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 24, 2026 lúc 06:20 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cellphones_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventory`
--

CREATE TABLE `inventory` (
  `id` bigint(20) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `inventory`
--

INSERT INTO `inventory` (`id`, `stock_quantity`, `product_id`, `store_id`) VALUES
(1, 50, 2, 1),
(2, 50, 3, 1),
(3, 50, 4, 1),
(4, 50, 5, 1),
(5, 50, 6, 1),
(8, 25, 106, 14),
(9, 25, 105, 14),
(10, 25, 104, 14),
(11, 25, 103, 14),
(12, 25, 102, 14),
(15, 15, 23, 6),
(16, 15, 37, 6),
(17, 15, 27, 6),
(18, 15, 63, 6),
(19, 15, 71, 6),
(22, 2, 23, 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `product_code`, `name`, `category`, `description`, `price`) VALUES
(2, 'IP16PM-256-WH', 'iPhone 16 Pro Max 256GB White', 'Điện thoại', 'Khung Titan trắng, Camera 48MP', 34490000),
(3, 'IP16PM-512-TI', 'iPhone 16 Pro Max 512GB Desert', 'Điện thoại', 'Màu vàng sa mạc, quay 4K120fps', 39990000),
(4, 'IP16P-128-BK', 'iPhone 16 Pro 128GB Black', 'Điện thoại', 'Chip A18 Pro, màn hình 6.3 inch', 28490000),
(5, 'IP16P-256-WH', 'iPhone 16 Pro 256GB White', 'Điện thoại', 'Cấu hình mạnh, nhỏ gọn chuyên nghiệp', 31490000),
(6, 'IP16-128-PN', 'iPhone 16 128GB Pink', 'Điện thoại', 'Chip A18, nút Action, Dynamic Island', 21990000),
(7, 'IP16-128-TE', 'iPhone 16 128GB Teal', 'Điện thoại', 'Màu xanh mòng két, camera dọc', 21990000),
(8, 'IP15-128-BK', 'iPhone 15 128GB Black', 'Điện thoại', 'Cổng USB-C, màn hình OLED', 19490000),
(9, 'IP13-128-WH', 'iPhone 13 128GB White', 'Điện thoại', 'Pin bền, hiệu năng ổn định giá tốt', 13490000),
(10, 'SS-S24U-256', 'Samsung Galaxy S24 Ultra 256GB', 'Điện thoại', 'Galaxy AI, Bút S-Pen, Snap 8 Gen 3', 27990000),
(11, 'SS-S24U-512', 'Samsung Galaxy S24 Ultra 512GB', 'Điện thoại', 'Zoom quang học 10x, khung Titan', 31490000),
(12, 'SS-ZFLD6-256', 'Samsung Galaxy Z Fold6 256GB', 'Điện thoại', 'Màn hình gập lớn, tối ưu làm việc', 41990000),
(13, 'SS-ZFLIP6-256', 'Samsung Galaxy Z Flip6 256GB', 'Điện thoại', 'Thiết kế thời trang, nhỏ gọn bỏ túi', 26490000),
(14, 'SS-A55-128', 'Samsung Galaxy A55 5G 128GB', 'Điện thoại', 'Chống nước IP67, thiết kế kim loại', 9490000),
(15, 'SS-A35-128', 'Samsung Galaxy A35 5G 128GB', 'Điện thoại', 'Màn hình 120Hz, pin 5000mAh', 7690000),
(16, 'SS-M54-256', 'Samsung Galaxy M54 5G', 'Điện thoại', 'Pin khủng 6000mAh, màn Super AMOLED', 8900000),
(17, 'XI-14ULTRA-BK', 'Xiaomi 14 Ultra 512GB', 'Điện thoại', 'Cụm camera Leica 1 inch cao cấp', 29490000),
(18, 'XI-14T-PRO', 'Xiaomi 14T Pro 12/512GB', 'Điện thoại', 'Sạc nhanh 120W, màn hình AI 144Hz', 15990000),
(19, 'XI-REDMI-13', 'Redmi Note 13 8/128GB', 'Điện thoại', 'Camera 108MP, viền mỏng', 4290000),
(20, 'XI-POCO-X6P', 'POCO X6 Pro 5G', 'Điện thoại', 'Chip Dimensity 8300-Ultra siêu mạnh', 8990000),
(21, 'OP-RENO12P', 'Oppo Reno12 Pro 5G', 'Điện thoại', 'Chuyên gia chân dung AI, màu bạc', 16200000),
(22, 'OP-RENO12-F', 'Oppo Reno12 F 5G', 'Điện thoại', 'Thiết kế vân kim cương, camera tròn', 8990000),
(23, 'OP-A60-8-128', 'Oppo A60 8/128GB', 'Điện thoại', 'Chống va đập chuẩn quân đội', 5490000),
(24, 'VIVO-V30P-BK', 'Vivo V30 Pro 5G Black', 'Điện thoại', 'Ống kính Zeiss, đèn Aura Light', 14290000),
(25, 'VIVO-Y100-BL', 'Vivo Y100 Blue', 'Điện thoại', 'Sạc 80W, thiết kế kim cương xanh', 7190000),
(26, 'RE-12PRO-GL', 'Realme 12 Pro+ Gold', 'Điện thoại', 'Camera tiềm vọng, mặt lưng da', 11500000),
(27, 'IPAD-M4-11-BK', 'iPad Pro M4 11 inch 256GB', 'Tablet', 'Màn hình Tandem OLED cực sáng', 28290000),
(28, 'IPAD-M4-13-BK', 'iPad Pro M4 13 inch 256GB', 'Tablet', 'Chip M4, siêu mỏng 5.1mm', 37490000),
(29, 'IPAD-AIR6-11-BL', 'iPad Air 6 M2 11 inch Blue', 'Tablet', 'Hiệu năng tiệm cận dòng Pro', 16490000),
(30, 'IPAD-GEN10-WH', 'iPad Gen 10 64GB Silver', 'Tablet', 'Thiết kế mới, cổng sạc USB-C', 9190000),
(31, 'IPAD-MINI6-GY', 'iPad Mini 6 64GB Gray', 'Tablet', 'Nhỏ gọn, hỗ trợ Apple Pencil 2', 11990000),
(32, 'SS-TAB-S9U-GY', 'Samsung Galaxy Tab S9 Ultra', 'Tablet', 'Màn hình 14.6 inch, có kèm bút', 25990000),
(33, 'SS-TAB-S9FE-GR', 'Samsung Galaxy Tab S9 FE Green', 'Tablet', 'Kháng nước IP68, màu xanh mint', 8500000),
(34, 'SS-TAB-A9-LTE', 'Samsung Galaxy Tab A9 4G', 'Tablet', 'Máy tính bảng giá rẻ nghe gọi được', 3990000),
(35, 'XIA-PAD6S-PRO', 'Xiaomi Pad 6S Pro 12.4', 'Tablet', 'Màn hình 3K, tần số quét 144Hz', 13990000),
(36, 'LENOVO-M11-BK', 'Lenovo Tab M11 kèm bút', 'Tablet', 'Hỗ trợ học tập, viết vẽ mượt mà', 5490000),
(37, 'MBP-M4-14-16', 'MacBook Pro 14 M4 16/512GB', 'Laptop', 'Màn hình Liquid Retina XDR', 41890000),
(38, 'MBP-M4-14-24', 'MacBook Pro 14 M4 24/512GB', 'Laptop', 'RAM lớn cho lập trình, đồ họa', 46890000),
(39, 'MBP-M4-16-16', 'MacBook Pro 16 M4 16/512GB', 'Laptop', 'Màn hình 16 inch lớn, pin trâu', 59990000),
(40, 'MBA-M3-13-8', 'MacBook Air 13 M3 8/256GB', 'Laptop', 'Mỏng nhẹ, không quạt, pin 18h', 26500000),
(41, 'MBA-M3-13-16', 'MacBook Air 13 M3 16/256GB', 'Laptop', 'Bản nâng cấp RAM chạy đa nhiệm', 31500000),
(42, 'MBA-M2-13-8', 'MacBook Air 13 M2 8/256GB', 'Laptop', 'Thiết kế mới, giá thành hợp lý', 22900000),
(43, 'ASUS-VIV-S14-S', 'Asus Vivobook S 14 OLED Silver', 'Laptop', 'Chip AI Core Ultra 5, 120Hz', 23490000),
(44, 'ASUS-TUF-A15-G', 'Asus TUF Gaming A15 Black', 'Laptop', 'Ryzen 7, RTX 4050, 144Hz', 24200000),
(45, 'ASUS-ROG-G16-B', 'ROG Strix G16 2024 Black', 'Laptop', 'Core i9-14900HX, RTX 4060', 42500000),
(46, 'ACER-NITRO-V15', 'Acer Nitro V 15 ANV15', 'Laptop', 'RTX 4050, thiết kế Gaming mới', 21290000),
(47, 'ACER-SW-GO-14', 'Acer Swift Go 14 OLED', 'Laptop', 'Chuẩn Intel Evo, vỏ nhôm sang trọng', 18990000),
(48, 'ACER-ASP-5-BK', 'Acer Aspire 5 A515 Black', 'Laptop', 'Core i5 Gen 13, văn phòng tốt', 14500000),
(49, 'DELL-INS-3530-S', 'Dell Inspiron 15 3530 Silver', 'Laptop', 'Intel Core i5-1335U, bền bỉ', 15690000),
(50, 'DELL-XPS-13-BK', 'Dell XPS 13 9340 Black', 'Laptop', 'Đỉnh cao thiết kế, Core Ultra 7', 42000000),
(51, 'DELL-VOS-3430', 'Dell Vostro 3430 Gray', 'Laptop', 'Nhỏ gọn 14 inch, bảo mật vân tay', 16200000),
(52, 'HP-VIC-16-BK', 'HP Victus 16 2024 Black', 'Laptop', 'RTX 4050, màn hình 16.1 inch', 23500000),
(53, 'HP-PAV-14-SL', 'HP Pavilion 14 Silver', 'Laptop', 'Vỏ nhôm, loa B&O, màn hình IPS', 16200000),
(54, 'HP-ENV-X360-S', 'HP Envy x360 2-in-1', 'Laptop', 'Cảm ứng xoay gập, kèm bút', 22500000),
(55, 'MSI-MOD-15-GY', 'MSI Modern 15 B13 Gray', 'Laptop', 'Core i5-1335U, mỏng nhẹ 1.7kg', 13990000),
(56, 'MSI-CYB-15-BK', 'MSI Cyborg 15 A12V', 'Laptop', 'RTX 4050, phím LED xanh', 17990000),
(57, 'LENOVO-LOQ-15', 'Lenovo LOQ 15IAX9 Black', 'Laptop', 'RTX 3050, tản nhiệt cực tốt', 19490000),
(58, 'LENOVO-LEG-5-G', 'Lenovo Legion 5 16IRX9', 'Laptop', 'RTX 4060, màn hình 2K 165Hz', 35900000),
(59, 'LENOVO-IDE-3-S', 'Lenovo Ideapad Slim 3', 'Laptop', 'Core i3 Gen 12, giá sinh viên', 10490000),
(60, 'LG-GRAM-14-WH', 'LG Gram 2024 14 inch White', 'Laptop', 'Siêu nhẹ 990g, pin dùng cả ngày', 29990000),
(61, 'GIGA-G5-MF-BK', 'Gigabyte G5 MF 2024', 'Laptop', 'RTX 4050, hiệu năng đồ họa cao', 18290000),
(62, 'MON-LG-24MP400', 'Màn hình LG 24\" FHD IPS', 'Màn hình', 'Tấm nền IPS, 75Hz, chống chói', 2990000),
(63, 'MON-LG-27MP400', 'Màn hình LG 27\" FHD IPS', 'Màn hình', 'Viền mỏng, hiển thị sắc nét', 3290000),
(64, 'MON-DELL-U2424', 'Dell Ultrasharp U2424H', 'Màn hình', '100% sRGB, chuyên đồ họa', 5890000),
(65, 'MON-DELL-P2422', 'Dell P2422H 24 inch', 'Màn hình', 'Chân đế công thái học xoay dọc', 4250000),
(66, 'MON-SAM-G5-27', 'Samsung Odyssey G5 27\"', 'Màn hình', 'Cong 1000R, 2K, 144Hz Gaming', 6490000),
(67, 'MON-ASUS-VG249', 'Asus TUF Gaming VG249Q', 'Màn hình', '144Hz, 1ms chuyên game FPS', 3890000),
(68, 'PC-CPS-GAM-G01', 'PC CPS Gaming G01', 'PC', 'i5-12400F, RAM 16G, GTX 1650', 12500000),
(69, 'PC-CPS-GAM-G02', 'PC CPS Gaming G02', 'PC', 'i5-13400F, RTX 4060, 16G RAM', 22500000),
(70, 'PC-CPS-OFF-V01', 'PC CPS Office V1', 'PC', 'i3-12100, 8GB RAM, SSD 256', 6990000),
(71, 'PC-CPS-OFF-V02', 'PC CPS Office V2', 'PC', 'i5-12400, 16GB RAM, SSD 500', 9500000),
(72, 'RAM-COR-16G-D4', 'RAM Corsair Vengeance 16G', 'Linh kiện', 'DDR4 3200MHz, tản nhiệt nhôm', 1150000),
(73, 'SSD-SAM-980-1T', 'SSD Samsung 980 Pro 1TB', 'Linh kiện', 'NVMe Gen 4, tốc độ 7000MB/s', 2850000),
(74, 'VGA-ASUS-4060', 'ASUS Dual RTX 4060 8G', 'Linh kiện', 'Hiệu năng mạnh, 2 fan mát mẻ', 8890000),
(75, 'CASE-NZXT-H5-B', 'Case NZXT H5 Flow Black', 'Linh kiện', 'Mặt lưới thoáng khí, tối giản', 2350000),
(76, 'PSU-COR-650-B', 'Nguồn Corsair CV650', 'Linh kiện', '650W, 80 Plus Bronze ổn định', 1450000),
(77, 'MAIN-MSI-B760', 'MSI Pro B760M-P', 'Linh kiện', 'Hỗ trợ Intel Gen 12/13/14', 2990000),
(78, 'KEY-LOGI-K120', 'Bàn phím Logitech K120', 'Phụ kiện', 'Phím văn phòng bền bỉ, chống nước', 250000),
(79, 'MOU-LOGI-M185', 'Chuột Logitech M185', 'Phụ kiện', 'Chuột không dây nhỏ gọn, pin lâu', 290000),
(80, 'AIR-PRO-2-C', 'Apple AirPods Pro 2 USB-C', 'Âm thanh', 'Chống ồn chủ động ANC, chip H2', 5790000),
(81, 'AIR-4-ANC', 'Apple AirPods 4 ANC', 'Âm thanh', 'Chống ồn trên dòng tai nghe mở', 4490000),
(82, 'SONY-XM5-BK', 'Sony WH-1000XM5 Black', 'Âm thanh', 'Chống ồn tốt nhất thế giới', 7290000),
(83, 'SONY-WF-XM5', 'Sony WF-1000XM5 TWS', 'Âm thanh', 'Tai nghe in-ear cao cấp, âm hay', 5990000),
(84, 'JBL-FLIP-6-BK', 'JBL Flip 6 Black', 'Âm thanh', 'Loa bluetooth chống nước, bass mạnh', 2650000),
(85, 'MAR-STAN-3-CR', 'Marshall Stanmore III Cream', 'Âm thanh', 'Loa decor vintage, âm chi tiết', 8890000),
(86, 'MAR-EMB-2-BK', 'Marshall Emberton II Black', 'Âm thanh', 'Loa nhỏ gọn pin 30h, kháng bụi', 3990000),
(87, 'MIC-GO-U2-BK', 'Mic Gochek Ultra Plus U2', 'Mic thu âm', 'Thu âm không dây cho 2 người', 1950000),
(88, 'MIC-SHURE-MV7', 'Shure MV7 Podcast Mic', 'Mic thu âm', 'Kết nối USB/XLR, app lọc tiếng', 7990000),
(89, 'MIC-BOYA-M1', 'Boya BY-M1 cài áo', 'Mic thu âm', 'Dây dài 6m, dùng cho đt/máy ảnh', 240000),
(90, 'MIC-DJI-MIC2', 'DJI Mic 2 (1TX + 1RX)', 'Mic thu âm', 'Ghi âm 32-bit float, lọc ồn AI', 5290000),
(91, 'MIC-SARAM-B2', 'Saramonic Blink 500 B2', 'Mic thu âm', 'Hệ thống mic không dây 2 người', 3150000),
(92, 'TV-SAM-65Q70', 'Samsung QLED 65 inch 4K', 'TV', '120Hz, tối ưu chơi Game console', 16990000),
(93, 'TV-LG-55C3-OL', 'LG OLED C3 55 inch', 'TV', 'Màu đen tuyệt đối, Cinema HDR', 27500000),
(94, 'TV-XIA-A55-PR', 'Xiaomi TV A Pro 55 inch', 'TV', 'Google TV, khung kim loại', 8190000),
(95, 'MAY-LOC-XIA-4', 'Máy lọc không khí Xiaomi 4', 'Điện máy', 'Lọc bụi mịn PM2.5, khử mùi', 3190000),
(96, 'ROBOT-DR-L10S', 'Dreame L10s Ultra', 'Điện máy', 'Tự giặt giẻ, tự đổ rác, sấy khô', 15900000),
(97, 'MAY-HUT-DYS-V8', 'Dyson V8 Slim Fluffy', 'Điện máy', 'Máy hút bụi cầm tay không dây', 8900000),
(98, 'NOI-CHIEN-L&L', 'Nồi chiên Lock&Lock 5.5L', 'Điện máy', 'Công nghệ đối lưu nhiệt 360', 1750000),
(99, 'CAM-DJI-PK3-C', 'DJI Osmo Pocket 3 Combo', 'Quay chụp', 'Cảm biến 1 inch, màn xoay, phụ kiện', 15490000),
(100, 'CAM-INSTA-X4', 'Insta360 X4 8K', 'Quay chụp', 'Camera hành động quay 360 độ', 13490000),
(101, 'CAM-GOPRO-13', 'GoPro Hero 13 Black', 'Quay chụp', 'Chống rung HyperSmooth 6.0', 11490000),
(102, 'CAM-SONY-ZV12', 'Sony ZV-1 II Vlog', 'Quay chụp', 'Máy ảnh chuyên Vlog, lấy nét mắt', 18290000),
(103, 'GIMBAL-OM6-GY', 'DJI Osmo Mobile 6 Gray', 'Phụ kiện', 'Chống rung 3 trục cho điện thoại', 3090000),
(104, 'CAM-IMOU-A22', 'Camera Imou Ranger 2 2MP', 'Quay chụp', 'Camera an ninh xoay 360 độ', 520000),
(105, 'CAM-70MAI-A500', 'Camera 70mai A500S GPS', 'Quay chụp', 'Cam hành trình quay 2.7K nét', 1590000),
(106, 'THE-128G-EXT', 'Thẻ nhớ SanDisk 128G 190MB/s', 'Phụ kiện', 'Chuyên dụng quay phim 4K', 420000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `stores`
--

INSERT INTO `stores` (`id`, `address`, `latitude`, `longitude`, `name`) VALUES
(1, '117 Thái Hà, P. Trung Liệt, Q. Đống Đa, Hà Nội', 21.0108633, 105.8222226, 'CellphoneS Thái Hà 1'),
(2, '306 Cầu Giấy, P. Dịch Vọng, Q. Cầu Giấy, Hà Nội', 21.035261, 105.7913715, 'CellphoneS Cầu Giấy'),
(3, '543 Đ. Nguyễn Trãi, P, Thanh Xuân, Hà Nội, Việt Nam', 20.986144, 105.7934941, 'CellphoneS Nguyễn Trãi 1'),
(4, '21 P. Thái Hà, Trung Liệt, Đống Đa, Hà Nội ', 21.0107284, 105.8194602, 'CellphoneS Thái Hà 2'),
(5, '126 Đ. Hồ Tùng Mậu, Mai Dịch, Cầu Giấy, Hà Nội 100000, Việt Nam', 21.0374036, 105.7670465, 'CellphoneS Hồ Tùng Mậu 1'),
(6, '160 Nguyễn Khánh Toàn, P. Quan Hoa, Q. Cầu Giấy, Hà Nội', 21.0388599, 105.7954441, 'CellphoneS Nguyễn Khánh Toàn'),
(7, '546 Trương Định, P. Tân Mai, Q. Hoàng Mai, Hà Nội', 20.9839268, 105.8433119, 'CellphoneS Trương Định'),
(8, '280 Đ. Nguyễn Văn Cừ, Ngọc Lâm, Long Biên, Hà Nội 100000, Việt Nam', 21.0447127, 105.871627, 'CellphoneS Nguyễn Văn Cừ'),
(10, '360 Đường P. Xã Đàn, Phương Liên, Đống Đa, Hà Nội, Việt Nam', 21.0144185, 105.8317927, 'CellphoneS Xã Đàn'),
(11, '267 Đ. Quang Trung, P. Quang Trung, Hà Đông, Hà Nội 100000, Việt Nam', 20.9668935, 105.7352161, 'CellphoneS Hà Đông'),
(12, '87 Đ. Phùng Hưng, P. Phúc La, Hà Đông, Hà Nội 260000, Việt Nam', 20.9668935, 105.7352161, 'CellphoneS Phùng Hưng'),
(13, '124-126-128 Đ. Lạc Long Quân, Bưởi, Tây Hồ, Hà Nội 100000, Việt Nam', 21.0511688, 105.8056379, 'CellphoneS Lạc Long Quân'),
(14, '282 P. Minh Khai, Mai Động, Hai Bà Trưng, Hà Nội 100000, Việt Nam', 20.9952867, 105.8573345, 'CellphoneS Minh Khai');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKq2yge7ebtfuvwufr6lwfwqy9l` (`product_id`),
  ADD KEY `FK5risd3b54r1toplhk8xgfib57` (`store_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT cho bảng `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `FK5risd3b54r1toplhk8xgfib57` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  ADD CONSTRAINT `FKq2yge7ebtfuvwufr6lwfwqy9l` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
