CREATE DATABASE IF NOT EXISTS jewelry_store_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE jewelry_store_db;

CREATE TABLE thuong_hieu (
    id_thuong_hieu INT AUTO_INCREMENT PRIMARY KEY,
    ten_thuong_hieu VARCHAR(255) NOT NULL UNIQUE,
    mo_ta TEXT,
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ngay_cap_nhat TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE loai_san_pham (
    id_loai_san_pham INT AUTO_INCREMENT PRIMARY KEY,
    ma_loai_sp VARCHAR(50) UNIQUE,
    ten_loai_sp VARCHAR(255) NOT NULL UNIQUE,
    trang_thai BOOLEAN DEFAULT TRUE, 
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ngay_cap_nhat TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE san_pham (
    id_san_pham INT AUTO_INCREMENT PRIMARY KEY,
    ma_san_pham VARCHAR(100) NOT NULL UNIQUE,
    ten_san_pham VARCHAR(255) NOT NULL,
    gia_san_pham DECIMAL(10,2) NOT NULL, 
    mo_ta TEXT,
    id_thuong_hieu INT,
    id_loai_san_pham INT,
    khoi_luong DECIMAL(10, 2),
    trang_thai_chung BOOLEAN DEFAULT TRUE,
    url_anh_dai_dien VARCHAR(255),
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ngay_cap_nhat TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_thuong_hieu) REFERENCES thuong_hieu(id_thuong_hieu) ON DELETE SET NULL,
    FOREIGN KEY (id_loai_san_pham) REFERENCES loai_san_pham(id_loai_san_pham) ON DELETE SET NULL 
);


CREATE TABLE anh_san_pham (
    id_anh_san_pham INT AUTO_INCREMENT PRIMARY KEY,
    id_san_pham INT, -- Nếu ảnh chung cho sản phẩm chính
    url_anh VARCHAR(255) NOT NULL,
    mo_ta_anh VARCHAR(255),
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_san_pham) REFERENCES san_pham(id_san_pham) ON DELETE CASCADE 
);


