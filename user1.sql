START TRANSACTION;
 
SELECT * FROM guestbooks;

UPDATE guestbooks 
SET title = 'Crypto Currency' 
WHERE id IN(5);

COMMIT;

-- manual locking
SELECT * FROM skor_mhs WHERE score_id = 9 FOR UPDATE;
SELECT * FROM skor_mhs WHERE score_id = 8 FOR UPDATE;

UPDATE skor_mhs
SET score = score + 5
WHERE score_id = 9;

-- LOCK TABLE READ
LOCK TABLE skor_mhs READ;


SELECT * FROM skor_mhs;

-- LOCK TABLE WRITE
LOCK TABLE skor_mhs WRITE;

UPDATE skor_mhs
SET grade = 2
WHERE score_id = 10;

UNLOCK TABLE;

-- locking instance 
LOCK INSTANCE FOR BACKUP;

-- tidak bisa (lock instance)
ALTER TABLE skor_mhs
ADD COLUMN grade VARCHAR(100) AFTER subject_id;




 