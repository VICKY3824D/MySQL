SHOW DATABASES;

use belajar_mysql;

SELECT * FROM skor_mhs;

SELECT * FROM matkul;

SHOW TABLES;

DESCRIBE skor_mhs;

SHOW CREATE TABLE skor_mhs;

INSERT INTO matkul (subject_id, subject_name, lecturer)
VALUES 	(11, "Alpro","Faizah"),
		(12, "PPK","Firma"),
		(13, "PTIIK","Ganjar"),
        (14, "PDE","Syarif");
        
SELECT * FROM matkul;

ALTER TABLE matkul
	ADD COLUMN kelamin ENUM("L","P")
		AFTER lecturer;

UPDATE skor_mhs
SET gender = "L"
WHERE name = "Jojon";

UPDATE skor_mhs
SET grade = 0
WHERE name = "Jojon";

INSERT INTO skor_mhs (student_id, name,gender, score, subject_id)
VALUES  ( 13, "Haria","P", 67, 12);

SELECT * FROM skor_mhs WHERE score > 80;

SELECT student_id, name, score 
FROM skor_mhs
WHERE score > 88;

ALTER TABLE skor_mhs
	ADD COLUMN kelamin ENUM("L","P")
		AFTER name;
        
UPDATE skor_mhs
SET kelamin = "L"
WHERE name = "Andre";

DELETE 
FROM alamat
WHERE student_id = 2;

SELECT 	s.waktu_dibuat	AS Timestap,
		s.score_id 		AS "ID Skor",
        s.student_id	AS "ID Siswa",
        s.name 			AS Nama,
        s.kelamin 		AS Gender,
        s.score			AS Nilai,
        s.subject_id 	AS "ID Matkul",
        s.grade			AS MUTU
        
FROM skor_mhs AS s;

SELECT 	name, kelamin, score
		FROM skor_mhs
		WHERE (kelamin = "P" OR student_id = 1 OR student_id = 4) AND score < 88;

SELECT 	name, kelamin, score
		FROM skor_mhs
        WHERE score NOT IN(77,87,0);

SELECT name, kelamin, score
FROM skor_mhs
WHERE name NOT LIKE '%e%';

UPDATE skor_mhs
SET grade = 0
WHERE grade IS NULL;

SELECT * 
    FROM skor_mhs
    WHERE score NOT BETWEEN 50 AND 80;

ALTER TABLE skor_mhs
    RENAME COLUMN waktu_dibuat TO timestap,
    RENAME COLUMN kelamin TO gender;
    
SELECT * 
	FROM skor_mhs
    ORDER BY score ASC;
    
SELECT * 
FROM skor_mhs
WHERE score > 50
ORDER BY score DESC
LIMIT 3, 2;

SELECT distinct gender FROM skor_mhs;

ALTER TABLE matkul
MODIFY subject_id INT NOT NULL AUTO_INCREMENT;

SELECT name, score * 10 as 'ratusan'
FROM skor_mhs
WHERE score * 10 > 500
ORDER BY ratusan ASC 
LIMIT 2,2;

SELECT score_id,name,
		UPPER(name) as "Upper Name",
		LENGTH(name) as "Length of Name"
FROM skor_mhs;

SELECT  timestap, score_id, name,
    EXTRACT(MONTH FROM timestap) as Bulan,
    EXTRACT(DAY FROM timestap) as Tanggal
FROM skor_mhs;

SELECT score_id, name, MONTH(timestap), DAY(timestap) 
FROM skor_mhs;

SELECT score_id, name,
		score,
        IF(score <= 50, "Mendho",
        IF(score <= 70, "Goblok", "Pinter")) AS "Utek e"
FROM skor_mhs;

SELECT name, 
		CASE gender
			WHEN "L" THEN "Kakung"
            WHEN "P" THEN "Putri"
            END AS "Jawa pride"
FROM skor_mhs;

UPDATE skor_mhs
SET score = 20
WHERE name = "Ani";

SELECT name, score,
		IF(score < 50, "Wedok an goblok", 
        IF (score < 80, "B aja", "Cewe Pinter")) AS "Utek"
FROM skor_mhs
WHERE gender = "P";

SELECT score_id, name, IFNULL(grade, '0')
FROM skor_mhs;
    
SELECT  AVG(score) AS "rataan kelas" FROM skor_mhs;
SELECT AVG(score) AS "banyak nilai"
FROM skor_mhs
WHERE gender = "P";

SELECT AVG(score) AS rataan, gender
FROM skor_mhs
GROUP BY gender
HAVING rataan < 70;

SELECT MAX(score) AS total, subject_id
FROM skor_mhs
GROUP BY subject_id
HAVING total > 80;

ALTER TABLE matkul
ADD CONSTRAINT email_unique UNIQUE (email);

ALTER TABLE matkul
	MODIFY COLUMN email VARCHAR(100)
		AFTER lecturer;

CREATE TABLE alamat(
	student_id INT NOT NULL AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY(student_id),
    UNIQUE KEY email_unique (email)
) ENGINE = InnoDB;

DESCRIBE alamat;

SELECT * FROM alamat;

INSERT INTO alamat (full_name, address, email)
VALUE ("Reo Kodok", "Pule", "andi@gmail.com");








    

