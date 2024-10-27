-- Membuat database apotek
CREATE DATABASE apotek;

-- Menggunakan database apotek
USE apotek;

SHOW TABLES;

SELECT * FROM obat;

SELECT * FROM obat
WHERE MATCH (nama, deskripsi)
AGAINST('flu' IN NATURAL LANGUAGE MODE);

DESCRIBE obat;

-- Tabel obat untuk menyimpan data obat
CREATE TABLE obat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    harga DECIMAL(10, 2) NOT NULL,
    stok INT NOT NULL,
    kadaluarsa DATE NOT NULL
);

UPDATE obat
SET kode_penjual = "AD"
WHERE id IN(4);

ALTER TABLE obat
DROP INDEX nama_2;

ALTER TABLE obat
	ADD FULLTEXT (nama, deskripsi);

SHOW CREATE TABLE obat;

INSERT INTO obat (nama, kategori, deskripsi, harga, stok, kadaluarsa)
VALUES 	("Vitmol", "dalam", "3x", 12000, 223, "2027-03-15");
        
UPDATE obat
SET deskripsi = "salep untuk flu"
WHERE ID = 5;


-- Tabel penjualan untuk menyimpan data penjualan
CREATE TABLE penjualan (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_obat VARCHAR(100) NOT NULL,
    jumlah INT NOT NULL,
    total_penjualan DECIMAL(10, 2) NOT NULL,
    tanggal_penjualan DATE NOT NULL
);

CREATE TABLE wishlist (
	id_wish INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_obat INT NOT NULL,
    deskripsi TEXT,
    CONSTRAINT fk_wishlist_product
		FOREIGN KEY (id_obat_wish) REFERENCES obat(id_obat)
) ENGINE = InnoDB;

SELECT * FROM wishlist;

DELETE FROM obat WHERE id_obat = 5;

SELECT * FROM wishlist JOIN obat ON (wishlist.id_obat = obat.id_obat);

SELECT  w.id_wish AS "Id wishlist",
		o.id_obat AS "Id obat",
		o.nama_obat AS "Nama obat", 
        w.deskripsi AS "Deskripsi"
FROM wishlist AS w
JOIN obat AS o on (w.id_obat = o.id_obat);

INSERT INTO wishlist (id_obat, deskripsi)
VALUES (6, "obat untuk jaga jaga jika flu");

SHOW CREATE TABLE wishlist;

CREATE TABLE kategori (
	id_ktg INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    kategori VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

INSERT INTO kategori (kategori) 
VALUES ('analgesik'), ('antipiretik'),
('antibiotik'), ('antivirus'),('antijamur');

UPDATE obat
SET id_ktg_o = 4
WHERE id_obat IN(6);

ALTER TABLE obat 
MODIFY COLUMN id_ktg_o INT AFTER nama_obat;

ALTER TABLE obat
ADD CONSTRAINT fk_obat_kategori
FOREIGN KEY (id_ktg_o) REFERENCES kategori(id_ktg);

SELECT 	o.id_obat AS "Id Obat"
		, o.nama_obat as "Nama Obat"
        ,k.kategori AS "Kategori"
        , o.stok  AS "Stok Tersedia"
FROM obat AS o
JOIN kategori AS k ON (k.id_ktg = o.id_ktg_o);






