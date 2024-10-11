SHOW DATABASES;

use belajar_mysql;

SELECT * FROM skor_mhs;

SELECT * FROM matkul;

SHOW TABLES;

DESC skor_mhs;

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

UPDATE matkul
SET kelamin = "L"
WHERE subject_name = "Mattek";

INSERT INTO skor_mhs (score_id, student_id, name, score, subject_id)
VALUES (7, 4, "Andre", 89, 11);

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
FROM matkul
WHERE subject_id = 15;

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

        




    

