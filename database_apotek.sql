-- Membuat database apotek
CREATE DATABASE apotek;

-- Transaction dulu sebelum memodifikasi/insert tabel

START TRANSACTION;

ROLLBACK;

COMMIT;

-- transaction

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

INSERT INTO obat (nama_obat,  deskripsi, harga_obat, stok, kode_penjual, kadaluarsa)
VALUES 	("plupinol",  "plupinol untuk sakit pinggang", 21000, 142,"AA", "2029-11-15");
        
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
VALUES ('antiseptik');

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

-- untuk tabel penjualan  
CREATE TABLE penjualan (
	id_order INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    total INT NOT NULL,
    tanggal TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)ENGINE = InnoDB;

ALTER TABLE penjualan
MODIFY COLUMN id_order INT NOT NULL AUTO_INCREMENT;

DESCRIBE penjualan;

-- untuk tabel relasi anntara penjualan dengan obat
CREATE TABLE detail_penjualan (
	id_obat INT NOT NULL,
    id_order INT NOT NULL,
    harga INT NOT NULL,
    jumlah INT NOT NULL,
    PRIMARY KEY (id_obat, id_order)
)ENGINE = InnoDB;

SHOW CREATE TABLE detail_penjualan;
SHOW CREATE TABLE penjualan;

ALTER TABLE detail_penjualan
ADD CONSTRAINT fk_detail_obat
FOREIGN KEY (id_obat) REFERENCES obat(id_obat);

ALTER TABLE detail_penjualan
ADD CONSTRAINT fk_detail_penjualan_penjualan
FOREIGN KEY (id_order) REFERENCES penjualan(id_order);

INSERT INTO penjualan(total) VALUES (60000);

SELECT * FROM penjualan;
SELECT * FROM detail_penjualan;

INSERT INTO detail_penjualan(id_obat, id_order, harga, jumlah)
VALUES (2, 4, 12000, 5);

SELECT 	o.nama_obat AS "Nama obat",
		o.harga_obat AS "Harga Satuan",
        d.jumlah AS "Jumlah",
        (o.harga_obat * d.jumlah) AS "total harga",
        p.tanggal AS "Tanggal beli"
FROM detail_penjualan AS d
JOIN penjualan AS p ON(d.id_order = p.id_order)
JOIN obat AS o ON(d.id_obat = o.id_obat);

SELECT SUM(tot)
FROM(SELECT 
        (obat.harga_obat * detail_penjualan.jumlah) as tot
		FROM detail_penjualan 
		JOIN penjualan  ON(detail_penjualan.id_order = penjualan.id_order)
		JOIN obat ON(detail_penjualan.id_obat = obat.id_obat)
) AS omzet;

SELECT MAX(total)
FROM(SELECT total
	FROM penjualan
) AS terlaris;

SELECT MAX(harga_obat)
FROM (
	SELECT harga_obat 
    FROM obat
		INNER JOIN wishlist
			ON(wishlist.id_obat = obat.id_obat)
) AS cp;





 






